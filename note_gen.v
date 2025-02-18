module note_gen(
    clk, // clock from crystal
    rst, // active high reset
    volume, 
    note_div_left, // div for note generation
    note_div_right,
    audio_left,
    audio_right
);

    // I/O declaration
    input clk; // clock from crystal
    input rst; // active low reset
    input [2:0] volume;
    input [21:0] note_div_left, note_div_right; // div for note generation
    output [15:0] audio_left, audio_right;

    // Declare internal signals
    reg [21:0] clk_cnt_next, clk_cnt;
    reg [21:0] clk_cnt_next_2, clk_cnt_2;
    reg b_clk, b_clk_next;
    reg c_clk, c_clk_next;
    reg [15:0] A1, A2; //amplitude

    // Note frequency generation
    // clk_cnt, clk_cnt_2, b_clk, c_clk
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            begin
                clk_cnt <= 22'd0;
                clk_cnt_2 <= 22'd0;
                b_clk <= 1'b0;
                c_clk <= 1'b0;
            end
        else
            begin
                clk_cnt <= clk_cnt_next;
                clk_cnt_2 <= clk_cnt_next_2;
                b_clk <= b_clk_next;
                c_clk <= c_clk_next;
            end
    end
    // clk_cnt_next, b_clk_next
    always @* begin
        if (clk_cnt == note_div_left)
            begin
                clk_cnt_next = 22'd0;
                b_clk_next = ~b_clk;
            end
        else
            begin
                clk_cnt_next = clk_cnt + 1'b1;
                b_clk_next = b_clk;
            end
    end
    // clk_cnt_next_2, c_clk_next
    always @* begin
        if (clk_cnt_2 == note_div_right)
            begin
                clk_cnt_next_2 = 22'd0;
                c_clk_next = ~c_clk;
            end
        else
            begin
                clk_cnt_next_2 = clk_cnt_2 + 1'b1;
                c_clk_next = c_clk;
            end
    end
    always @* begin
        if (volume == 3'd0) begin
            A1 = 16'h0000;
            A2 = 16'h0000;
        end else if (volume == 3'd1) begin
            A1 = 16'hF000;
            A2 = 16'h1000;
        end else if (volume == 3'd2) begin
            A1 = 16'hE000; //-2^13
            A2 = 16'h2000; // 2^13
        end else if (volume == 3'd3) begin
            A1 = 16'hD000;
            A2 = 16'h3000;
        end else if (volume == 3'd4) begin
            A1 = 16'hC000; //-2^14
            A2 = 16'h4000; // 2^14
        end else begin
            A1 = 16'hB000;
            A2 = 16'h5000;
        end
    end
    // Volume is controlled here
    assign audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                (b_clk == 1'b0) ? A1 : A2;
    assign audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                (c_clk == 1'b0) ? A1 : A2;
endmodule