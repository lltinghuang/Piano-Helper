module player_control (
	input clk, 
	input reset, 
	input _play, 
    input _gamestart,
	input _mode, 
	output reg [11:0] ibeat,
    output reg [11:0] game_ibeat,
    output reg song_end
);
	parameter LEN = 4095;
    
    reg [11:0] next_ibeat;
    reg [11:0] next_game_ibeat;
    reg next_song_end;
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			ibeat <= 0;
            game_ibeat <= 0;
            song_end <= 0;
        end else begin
            ibeat <= next_ibeat;
            game_ibeat <= next_game_ibeat;
            song_end <= next_song_end;
        end

	end

    always @* begin
		if (_mode && _play) begin
			next_ibeat = (ibeat + 1 < LEN) ? (ibeat + 1) : 0;
        end else begin
            next_ibeat = ibeat;
        end
    end

    always @* begin
        if (_gamestart) begin
            if (game_ibeat + 1 < LEN) begin
                next_game_ibeat = game_ibeat + 1;
                next_song_end = 0;
            end else begin
                next_game_ibeat = LEN - 1;
                next_song_end = 1;
            end
        end else begin
            next_game_ibeat = 0;
            next_song_end = 0;
        end
    end
    
endmodule