module rom(address,IR1, IR2,data);
input [6:0] address;
input [15:0] IR1, IR2;
output [15:0] data;
reg [15:0] array[128:0];
reg[2:0] reg3,reg4;
always @*
begin
if (IR1[9:7]!=3'b000 && IR1[6:4]!=3'b000) reg3=3'b000;
else if (IR1[9:7]!=3'b001 && IR1[6:4]!=3'b001) reg3=3'b001;
else reg3=3'b010;
if (IR1[9:7]!=3'b001 && IR1[6:4]!=3'b001 && reg3!=3'b001) reg4=3'b001;
else if (IR1[9:7]!=3'b010 && IR1[6:4]!=3'b010 && reg3!=3'b010) reg4=3'b010;
else reg4=3'b011;
array[1][15:10]=6'b111000;
array[1][9:7]=reg3[2:0];
array[1][6:0]=7'b0000000;
array[2][15:0]=16'h0000; //push reg3
array[3][15:10]=6'b100001;
array[3][9:7]=reg3[2:0];
array[3][6:0]=IR1[6:0];
array[4][15:4]=IR2[15:4];
array[4][3:0]=4'b0000; // reg3 = reg1 nand imm
array[5][15:10]=6'b110110;
array[5][6:4]=IR1[6:4];
array[5][9:7]=reg3[2:0];
array[5][3:0]=4'h0;
array[6][15:0]=16'h0002; //mem[reg1]=reg3
array[7][15:10]=6'b110111;
array[7][9:7]=reg3[2:0];
array[7][6:0]=7'b0000000;
array[8][15:0]=16'h0000; //pop reg3
array[9]=16'h0000;
array[10]=16'h0000;
array[11][15:10]=6'b111000;
array[11][9:7]=IR1[6:4];
array[11][6:0]=7'b0000000;
array[12][15:0]=16'h0000; //push reg2
array[13][15:11]=5'b00001;
array[13][10:8]=IR1[6:4];
array[13][7:5]=IR1[9:7];
array[13][3:1]=IR1[6:4];
array[13][0]=1'b0;
array[13][4]=1'b0; //ADDITION reg2=reg1+reg2
array[14][15:10]=6'b100100;
array[14][9:7]=IR1[6:4];
array[14][6:0]=IR1[6:0];
array[15][15:4]=IR2[15:4];
array[15][3:0]=4'b0000;//store imm reg2
array[16][15:10]=6'b110111;
array[16][9:7]=IR1[6:4];
array[16][6:0]=7'b0000000;
array[17][15:0]=16'h0000; //pop reg2
array[18]=16'h0000;
array[19]=16'h0000;
array[20][15:10]=6'b111000;
array[20][9:7]=IR1[6:4];
array[20][6:0]=7'b0000000;
array[21][15:0]=16'h0000; //push reg2
array[22][15:10]=6'b111000;
array[22][9:7]=IR1[9:7];
array[22][6:0]=7'b0000000;
array[23][15:0]=16'h0000; //push reg1
array[24][15:10]=6'b110101;
array[24][9:7]=IR1[9:7];
array[24][6:4]=IR1[9:7];
array[24][3:0]=4'h0;
array[25]=16'h0002;//load reg1, mem[reg1]
array[26][15:10]=6'b110101;
array[26][9:7]=IR1[6:4];
array[26][6:4]=IR1[6:4];
array[26][3:0]=4'h0;
array[27]=16'h0002;//load reg2, mem[reg2]
array[28][15:10]=6'b110000;
array[28][9:0]=IR1[9:0];
array[29][15:4]=IR2[15:4];
array[29][3:0]=4'h0;//branchifequal reg1, reg2
array[30][15:10]=6'b110111;
array[30][9:7]=IR1[9:7];
array[30][6:0]=7'b0000000;
array[31][15:0]=16'h0000;//pop reg1
array[32][15:10]=6'b110111;
array[32][9:7]=IR1[6:4];
array[32][6:0]=7'b0000000;
array[33][15:0]=16'h0000;//pop reg2
array[34]=16'h0000;
array[35]=16'h0000;
array[41][15:10]=6'b111000;
array[41][9:7]=reg3[2:0];
array[41][6:0]=7'b0000000;
array[42][15:0]=16'h0000; //push reg3
array[43][15:10]=6'b111000;
array[43][9:7]=IR1[9:7];
array[43][6:0]=7'b0000000;
array[44][15:0]=16'h0000; //push reg1 
array[45][15:10]=6'b110110;
array[45][9:7]=reg4;
array[45][6:0]=7'b0000000;
array[46][15:0]=16'h0C80;//store mem[201]=reg4
array[47][15:10]=6'b110101;
array[47][9:7]=IR1[9:7];
array[47][6:4]=IR1[9:7];
array[47][3:0]=4'h0;
array[48]=16'h0002;//load reg1, mem[reg1]
array[49][15:11]=5'b00110;
array[49][10:8]=IR1[9:7];
array[49][7:5]=IR1[9:7];
array[49][4]=1'b0;
array[49][3:1]=IR2[3:1];
array[49][0]=1'b0;//shift right reg1, reg1 >> sa
array[50][15:10]=6'b100011;
array[50][9:7]=reg3[2:0];
array[50][6:0]=7'h00;
array[51]=16'h0000;//load imm reg3, 0
array[52][15:10]=6'b110010;
array[52][9:7]=reg3[2:0];
array[52][6:4]=IR1[9:7];
array[52][3:0]=IR1[3:0];
array[53][15:4]=IR2[15:4];
array[53][3:0]=4'h0;//call if equal reg1,reg3 
array[54][15:10]=6'b110111;
array[54][9:7]=reg4;
array[54][6:0]=7'b0000000;
array[55][15:0]=16'h0000;//pop reg4
array[56][15:10]=6'b110110;
array[56][9:7]=reg4;
array[56][6:0]=7'b0000000;
array[57][15:0]=16'h0C80;//store mem[200]=reg4 
array[58][15:10]=6'b110111;
array[58][9:7]=IR1[9:7];
array[58][6:0]=7'b0000000;
array[59][15:0]=16'h0000;//pop reg1
array[60][15:10]=6'b110111;
array[60][9:7]=reg3[2:0];
array[60][6:0]=7'b0000000;
array[61][15:0]=16'h0000;//pop reg3 
array[62][15:10]=6'b110101;
array[62][9:7]=reg4;
array[62][6:0]=7'b0000000;
array[63][15:0]=16'h0C80;//load reg4=mem[200]
array[63][15:10]=6'b111000;
array[64][9:7]=reg4;
array[64][6:0]=7'b0000000;
array[65][15:0]=16'h0000;//push reg4
array[66][15:10]=6'b110101;
array[66][9:7]=reg4;
array[66][6:0]=7'b0000000;
array[67][15:0]=16'h0C90;//load reg4=mem[201]
array[68]=16'h0000;
array[69]=16'h0000;
array[71][15:10]=6'b111000;
array[71][9:7]=IR1[6:4];
array[71][6:0]=7'b0000000;
array[72][15:0]=16'h0000;//push reg2
array[73][15:11]=5'b00010;
array[73][10:8]=IR1[6:4];
array[73][7:5]=IR1[9:7];
array[73][4]=1'b0;
array[73][3:1]=IR1[6:4];
array[73][0]=1'b0;//sub reg2 , reg1, reg2
array[74][15:10]=6'b110101;
array[74][9:7]=IR1[6:4];
array[74][6:4]=IR1[6:4];
array[74][3:0]=4'h0;
array[75]=16'h0002;//load reg2, mem[reg2]
array[76][15:10]=6'b110110;
array[76][9:7]=IR1[6:4];
array[76][6:4]=3'b000;
array[76][3:0]=IR1[3:0];
array[77][15:4]=IR2[15:4];
array[77][3:0]=4'h0;//store mem[address], reg2
array[78][15:10]=6'b110111;
array[78][9:7]=IR1[6:4];
array[78][6:0]=7'b0000000;
array[79][15:0]=16'h0000;//pop reg2
array[80]=16'h0000;
array[81]=16'h0000;




end
assign data=array[address];
endmodule