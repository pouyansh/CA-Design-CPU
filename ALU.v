module ALU(Data_out,carry_out,sign,zero,equal,overflow,Data1,Data2,operation,shift_amount,carry_in);
	
	output[15:0] Data_out;
	output carry_out,sign,zero,overflow,equal;
	input [15:0] Data1,Data2;
	input[2:0] operation;
	input[3:0] shift_amount;
	input carry_in;
	
	reg[15:0] Data_out;
	reg carry_out,sign,zero,overflow,equal;

	always @(Data1,Data2,operation,shift_amount,carry_in)
	begin
		carry_out =1'b0;
		sign =1'b0;
		zero=1'b0;
		overflow=1'b0;
		equal=1'b0;

		case(operation)
			3'b000: Data_out = ~(Data1 & Data2);
			3'b011: begin
					{carry_out, Data_out} = Data1 + Data2 + carry_in;
					overflow = (Data1[15] & Data2[15] & ~Data_out[15]) | (~Data1[15] & ~Data2[15] & Data_out[15]);
				end
			3'b100:begin
					{carry_out, Data_out} = Data1 - Data2;
					overflow = (Data1[15] & ~Data2[15] & ~Data_out[15]) | (~Data1[15] & Data2[15] & Data_out[15]);
				end
			3'b001: begin
					Data_out = Data1 >> shift_amount;
					overflow = (Data1[15] & ~Data_out[15]) | (~Data1[15] & Data_out[15]);
				end
			3'b010: begin
					Data_out = Data1 << shift_amount;
					overflow = (Data1[15] & ~Data_out[15]) | (~Data1[15] & Data_out[15]);
				end
			
			3'b101: begin
					Data_out = Data1;
					equal = (Data1 == Data2) ? 1'b1 :1'b0;
				end
			3'b110: Data_out = (Data1 < Data2) ? Data2 :Data1;	
			3'b111: Data_out = Data1;
		endcase
		
		zero = ~|Data_out;
		sign = Data_out[15];
	end

endmodule

