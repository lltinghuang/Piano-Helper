`define silence   32'd50000000
`define c2  32'd66   // C2
`define f2  32'd88   // F2
`define g2  32'd98   // G2
`define a2  32'd110  // A2
`define b2  32'd124   // B2

`define c4  32'd262   // C4
`define d4  32'd294   // D4
`define e4  32'd330   // E4
`define f4  32'd350   // F4
`define g4  32'd392   // G4
`define a4  32'd440   // A4
`define b4  32'd494   // B4

`define c3  `c4/2   
`define d3  `d4/2
`define e3  `e4/2
`define f3  `f4/2
`define g3  `g4/2
`define a3  `a4/2
`define b3  `b4/2

`define c5 `c4*2
`define d5 `d4*2
`define e5 `e4*2
`define f5 `f4*2
`define g5 `g4*2
`define a5 `a4*2
`define b5 `b4*2

module lab7(clk,
            rst,        // BTNC: active high reset
            _play,      // SW0: Play/Pause
            _start,     // SW1: Start/Exit
            _mute,      // SW14: Mute
            _mode,      // SW15: Mode
            _volUP,     // BTNU: Vol up
            _volDOWN,   // BTND: Vol down
            PS2_DATA,   // Keyboard I/O
            PS2_CLK,    // Keyboard I/O
            _led,       // LED: [15:9] key & [4:0] volume
            audio_mclk, // master clock
            audio_lrck, // left-right clock
            audio_sck,  // serial clock
            audio_sdin, // serial audio data input
            DISPLAY,    // 7-seg
            DIGIT);     // 7-seg
    
    // I/O declaration
    input clk;
    input rst;
    input _play, _start, _mute, _mode;
    input _volUP, _volDOWN;
    inout PS2_DATA;
    inout PS2_CLK;
    output reg [15:0] _led;
    output audio_mclk;
    output audio_lrck;
    output audio_sck;
    output audio_sdin;
    output [6:0] DISPLAY;
    output [3:0] DIGIT;
    
    // Internal Signal
    wire [15:0] audio_in_left, audio_in_right;
    
    wire [11:0] ibeatNum;               // Beat counter
    wire [11:0] game_ibeatNum;
    wire [11:0] pass_ibeatNum; 
    wire song_isend;

    wire [31:0] freqL, freqR;           // Raw frequency, produced by music module
    reg [31:0] show_tone, next_show_tone;               // frequency, produced by keyboard
    wire [31:0] pass_tone;              // for seven segment to show
    reg [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3
    reg [21:0] freq_out, next_freq_out;
    wire [21:0] Fout_L, Fout_R;
    wire [2:0] _volume_pass;
    reg [2:0] _volume = 3'd3, next_volume;
    
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    reg [4:0] key_num;

    wire _gamestart;
    wire [6:0] scoreNum;
    reg [6:0] score = 7'd0, next_score;
    
    // clkDiv22
    wire clkDiv22;
    clock_divider #(.n(22)) clock_22(.clk(clk), .clk_div(clkDiv22));    // for audio
    
    //button
    wire de_vol_up, VOLUP;
    wire de_vol_down, VOLDOWN;
    debounce d1(.pb_debounced(de_vol_up), .pb(_volUP), .clk(clk));
    debounce d2(.pb_debounced(de_vol_down), .pb(_volDOWN), .clk(clk));
    onepulse o1(.signal(de_vol_up), .clk(clk), .op(VOLUP));
    onepulse o2(.signal(de_vol_down), .clk(clk), .op(VOLDOWN));
    
    // Player Control
    // [in]  reset, clock, _play, and _mode
    // [out] beat number
    player_control #(.LEN(512)) playerCtrl_00 (
    .clk(clkDiv22),
    .reset(rst),
    ._play(_play),
    ._gamestart(_gamestart),
    ._mode(_mode),
    .ibeat(ibeatNum), 
    .game_ibeat(game_ibeatNum),
    .song_end(song_isend)
    );
    
    assign pass_ibeatNum = (_gamestart) ? game_ibeatNum : ibeatNum;
    // Music module
    // [in]  beat number and en
    // [out] left & right raw frequency
    music_example music_00 (
    .ibeatNum(pass_ibeatNum),
    .en(_play),
    .game(_gamestart),
    .toneL(freqL),
    .toneR(freqR)
    );
    
    // freq_outL, freq_outR (demonstrate song)
    // Note gen makes no sound, if freq_out = 50000000 / `silence = 1
    always @(*) begin
        freq_outL = 50000000 / freqL;
        freq_outR = 50000000 / freqR;
    end
    
    // Note generation
    // [in]  processed frequency
    // [out] audio wave signal (using square wave here)
    assign _volume_pass = (_mute == 1'b1) ? 3'd0: _volume;
    assign Fout_L       = (_mode) ? freq_outL : freq_out;
    assign Fout_R       = (_mode) ? freq_outR : freq_out;

    note_gen noteGen_00(
    .clk(clk),
    .rst(rst),
    .volume(_volume_pass),
    .note_div_left(Fout_L),
    .note_div_right(Fout_R),
    .audio_left(audio_in_left),     // left sound audio
    .audio_right(audio_in_right)    // right sound audio
    );
    
    // Speaker controller
    speaker_control sc(
    .clk(clk),
    .rst(rst),
    .audio_in_left(audio_in_left),      // left channel audio data input
    .audio_in_right(audio_in_right),    // right channel audio data input
    .audio_mclk(audio_mclk),            // master clock
    .audio_lrck(audio_lrck),            // left-right clock
    .audio_sck(audio_sck),              // serial clock
    .audio_sdin(audio_sdin)             // serial audio data input
    );
    
    assign _gamestart = (_mode == 0) && (_start);
    assign pass_tone = (_mode || _gamestart) ? freqR : show_tone;
    assign scoreNum = score;

    //Seven segment
    SevenSegment s0(
    .display(DISPLAY),
    .digit(DIGIT),
    .nums(pass_tone),
    .scores(scoreNum),
    .gameStart(_gamestart),
    .rst(rst),
    .clk(clk)
    );

    //keyboard
    KeyboardDecoder key_de (
    .key_down(key_down),
    .last_change(last_change),
    .key_valid(been_ready),
    .PS2_DATA(PS2_DATA),
    .PS2_CLK(PS2_CLK),
    .rst(RST),
    .clk(clk)
    );
    
    always @(*) begin
        case (last_change)
            9'b0_0001_0101: key_num = 5'd1; //C5
            9'b0_0001_1101: key_num = 5'd2; //D5
            9'b0_0010_0100: key_num = 5'd3; //E5
            9'b0_0010_1101: key_num = 5'd4; //F5
            9'b0_0010_1100: key_num = 5'd5; //G5
            9'b0_0011_0101: key_num = 5'd6; //A5
            9'b0_0011_1100: key_num = 5'd7; //B5

            9'b0_0001_1100: key_num = 5'd8; //C4
            9'b0_0001_1011: key_num = 5'd9; //D4
            9'b0_0010_0011: key_num = 5'd10; //E4
            9'b0_0010_1011: key_num = 5'd11; //F4
            9'b0_0011_0100: key_num = 5'd12; //G4
            9'b0_0011_0011: key_num = 5'd13; //A4
            9'b0_0011_1011: key_num = 5'd14; //B4

            9'b0_0001_1010: key_num = 5'd15; //C3
            9'b0_0010_0010: key_num = 5'd16; //D3
            9'b0_0010_0001: key_num = 5'd17; //E3
            9'b0_0010_1010: key_num = 5'd18; //F3
            9'b0_0011_0010: key_num = 5'd19; //G3
            9'b0_0011_0001: key_num = 5'd20; //A3
            9'b0_0011_1010: key_num = 5'd21; //B3

            default: key_num        = 5'd0;
        endcase
    end

    always @(*) begin
        if (been_ready && key_down[last_change] && _mode==1'b0 && song_isend==1'b0) begin
            case (key_num)
                1: begin
                    next_show_tone = (`c4*2);
                    next_freq_out = 50000000 / (`c4*2);
                end
                2: begin
                    next_show_tone = (`d4*2);
                    next_freq_out = 50000000 / (`d4*2);
                end
                3: begin
                    next_show_tone = (`e4*2);
                    next_freq_out = 50000000 / (`e4*2);
                end
                4: begin
                    next_show_tone = (`f4*2);
                    next_freq_out = 50000000 / (`f4*2);
                end
                5: begin
                    next_show_tone = (`g4*2);
                    next_freq_out = 50000000 / (`g4*2);
                end
                6: begin
                    next_show_tone = (`a4*2);
                    next_freq_out = 50000000 / (`a4*2);
                end
                7: begin
                    next_show_tone = (`b4*2);
                    next_freq_out = 50000000 / (`b4*2);
                end
                8: begin
                    next_show_tone = `c4;
                    next_freq_out = 50000000 / `c4;
                end
                9: begin
                    next_show_tone = `d4;
                    next_freq_out = 50000000 / `d4;
                end
                10: begin
                    next_show_tone = `e4;
                    next_freq_out = 50000000 / `e4;
                end
                11: begin
                    next_show_tone = `f4;
                    next_freq_out = 50000000 / `f4;
                end
                12: begin
                    next_show_tone = `g4;
                    next_freq_out = 50000000 / `g4;
                end
                13: begin
                    next_show_tone = `a4;
                    next_freq_out = 50000000 / `a4;
                end
                14: begin
                    next_show_tone = `b4;
                    next_freq_out = 50000000 / `b4;
                end
                15: begin                        
                    next_show_tone = (`c4/2);
                    next_freq_out = 50000000 / (`c4/2);
                end
                16: begin
                    next_show_tone = (`d4/2);
                    next_freq_out = 50000000 / (`d4/2);
                end
                17: begin
                    next_show_tone = (`e4/2);
                    next_freq_out = 50000000 / (`e4/2);
                    end
                18: begin
                    next_show_tone = (`f4/2);
                    next_freq_out = 50000000 / (`f4/2);
                end
                19: begin
                    next_show_tone = (`g4/2);
                    next_freq_out = 50000000 / (`g4/2);
                end
                20: begin
                    next_show_tone = (`a4/2);
                    next_freq_out = 50000000 / (`a4/2);
                end
                21: begin
                    next_show_tone = (`b4/2);
                    next_freq_out = 50000000 / (`b4/2);
                end

                default: begin
                    next_show_tone = `silence;
                    next_freq_out = 32'd1;
                end
            endcase
     
        end else if (been_ready && key_down[last_change]==1'b0 && _mode==1'b0) begin
            next_show_tone = `silence;
            next_freq_out = 32'd1;
        end else begin
            next_show_tone = show_tone;
            next_freq_out = freq_out;
        end
    end
   
    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            show_tone <= `silence;
            freq_out <= 32'd1;
        end else begin
            show_tone <= next_show_tone;
            freq_out <= next_freq_out;
        end
    end

    always@(*)begin
	    next_score = score;
		
        if( been_ready &&  key_down[last_change] && _gamestart && song_isend==1'b0)begin 
            case (last_change)
                9'b0_0001_0101: next_score = (freqR == `c5) ? score + 1 : score;
                9'b0_0001_1101: next_score = (freqR == `d5) ? score + 1 : score;
                9'b0_0010_0100: next_score = (freqR == `e5) ? score + 1 : score;
                9'b0_0010_1101: next_score = (freqR == `f5) ? score + 1 : score;
                9'b0_0010_1100: next_score = (freqR == `g5) ? score + 1 : score;
                9'b0_0011_0101: next_score = (freqR == `a5) ? score + 1 : score;
                9'b0_0011_1100: next_score = (freqR == `b5) ? score + 1 : score;

                9'b0_0001_1100: next_score = (freqR == `c4) ? score + 1 : score;
                9'b0_0001_1011: next_score = (freqR == `d4) ? score + 1 : score;
                9'b0_0010_0011: next_score = (freqR == `e4) ? score + 1 : score;
                9'b0_0010_1011: next_score = (freqR == `f4) ? score + 1 : score;
                9'b0_0011_0100: next_score = (freqR == `g4) ? score + 1 : score;
                9'b0_0011_0011: next_score = (freqR == `a4) ? score + 1 : score;
                9'b0_0011_1011: next_score = (freqR == `b4) ? score + 1 : score;

                9'b0_0001_1010: next_score = (freqR == `c3) ? score + 1 : score;
                9'b0_0010_0010: next_score = (freqR == `d3) ? score + 1 : score;
                9'b0_0010_0001: next_score = (freqR == `e3) ? score + 1 : score;
                9'b0_0010_1010: next_score = (freqR == `f3) ? score + 1 : score;
                9'b0_0011_0010: next_score = (freqR == `g3) ? score + 1 : score;
                9'b0_0011_0001: next_score = (freqR == `a3) ? score + 1 : score;
                9'b0_0011_1010: next_score = (freqR == `b3) ? score + 1 : score;

                default: next_score = score;
            endcase    
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) score <= 6'd0;
        else if (_gamestart) score <= next_score;
        else score <= 6'd0;
    end

    //LED
    always @(*) begin
        if (_mute) _led[4:0] = 5'b00000;
        else if (_volume == 3'd1) _led[4:0] = 5'b00001;
        else if (_volume == 3'd2) _led[4:0] = 5'b00011;
        else if (_volume == 3'd3) _led[4:0] = 5'b00111;
        else if (_volume == 3'd4) _led[4:0] = 5'b01111;
        else _led[4:0] = 5'b11111;

        _led[8:5] = 4'b0000;
    end

    always @(*) begin
        if (_gamestart) begin
            if (song_isend) begin
                _led[15:9] = 7'b111_1111;
            end else begin
                case(freqR) 
                    `c3, `c4, `c5: _led[15:9] = 7'b100_0000;
                    `d3, `d4, `d5: _led[15:9] = 7'b010_0000;
                    `e3, `e4, `e5: _led[15:9] = 7'b001_0000;
                    `f3, `f4, `f5: _led[15:9] = 7'b000_1000;
                    `g3, `g4, `g5: _led[15:9] = 7'b000_0100;
                    `a3, `a4, `a5: _led[15:9] = 7'b000_0010;
                    `b3, `b4, `b5: _led[15:9] = 7'b000_0001;

                    default: _led[15:9] = 7'b000_0000;
                endcase
            end
        end else begin
            _led[15:9] = 7'b000_0000;
        end
    end

    
    //volume control
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            _volume <= 3'd3;
        end else begin
            _volume <= next_volume;
        end
    end
    always @(*) begin
        if (VOLUP) begin
            next_volume = (_volume < 3'd5) ? _volume + 3'd1 : _volume;
        end else if (VOLDOWN) begin
            next_volume = (_volume > 3'd1) ? _volume - 3'd1 : _volume;
        end else begin
            next_volume = _volume;
        end
    end
 
endmodule
    
    module SevenSegment(
        output reg [6:0] display,
        output reg [3:0] digit,
        input wire [31:0] nums,
        input wire [6:0] scores,
        input wire gameStart,
        input wire rst,
        input wire clk
        );
        
        reg [15:0] clk_divider;
        reg [4:0] display_num;
        reg [4:0] key;
        reg [4:0] octave;
        
        always @ (posedge clk, posedge rst) begin
            if (rst) begin
                clk_divider <= 15'b0;
                end else begin
                clk_divider <= clk_divider + 15'b1;
            end
        end
        
        always @ (posedge clk_divider[15], posedge rst) begin
            if (rst) begin
                display_num <= 5'b0000;
                digit <= 4'b1111;
            end else begin
                case (digit)
                    4'b1110 : begin
                        display_num <= key;
                        digit <= 4'b1101;
                    end
                    4'b1101 : begin
                        if (gameStart) display_num <= scores%10;
                        else display_num <= 5'd17;

                        digit <= 4'b1011;
                    end
                    4'b1011 : begin
                        if (gameStart) display_num <= scores/10;
                        else display_num <= 5'd17;

                        digit <= 4'b0111;
                    end
                    4'b0111 : begin
                        display_num <= octave;
                        digit <= 4'b1110;
                    end
                    default : begin
                        display_num <= 0;
                        digit <= 4'b1110;
                    end
                endcase
            end
        end
        
        always @(*) begin
            case (nums)
                `c3, `c4, `c5: key = 10;
                `d3, `d4, `d5: key = 11;
                `e3, `e4, `e5: key = 12;
                `f3, `f4, `f5: key = 13;
                `g3, `g4, `g5: key = 14;
                `a3, `a4, `a5: key = 15;
                `b3, `b4, `b5: key = 16;

                default: key = 17;
            endcase
        end

        always @(*) begin
            case (nums) 
                `c3, `d3, `e3, `f3, `g3, `a3, `b3: octave = 3;
                `c4, `d4, `e4, `f4, `g4, `a4, `b4: octave = 4;
                `c5, `d5, `e5, `f5, `g5, `a5, `b5: octave = 5;
                default: octave = 17;
            endcase
        end
        
        always @(*) begin
            case (display_num)
                //number 0-9
                5'd0: display = 7'b100_0000;
                5'd1: display = 7'b111_1001;
                5'd2: display = 7'b010_0100;
                5'd3: display = 7'b011_0000;
                5'd4: display = 7'b001_1001;
                5'd5: display = 7'b001_0010;
                5'd6: display = 7'b000_0010;
                5'd7: display = 7'b111_1000;
                5'd8: display = 7'b000_0000;
                5'd9: display = 7'b001_0000;

                //note
                5'd10: display = 7'b100_0110; //c
                5'd11: display = 7'b010_0001; //d
                5'd12: display = 7'b000_0110; //e
                5'd13: display = 7'b000_1110; //f
                5'd14: display = 7'b001_0000; //g
                5'd15: display = 7'b000_1000; //a
                5'd16: display = 7'b000_0011; //b
                
                default: display = 7'b011_1111;
            endcase
        end
    endmodule





