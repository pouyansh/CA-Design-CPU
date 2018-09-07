module mem(clk,reset,address,data_in,data_out,rwn,start,ready,address_test1,address_test2,address_test3,data_test1,data_test2,data_test3);
input clk,reset,start,rwn;
input [8:0] address,address_test1,address_test2,address_test3;
output [15:0] data_test1,data_test2,data_test3;
output ready;
input [15:0] data_in;
output reg [15:0] data_out;
reg [15:0] array[511:0],data_t;
reg state;
reg [8:0] ad_t;
reg [1:0] counter;
reg rwn_t;
assign ready=~state;
assign data_test1=array[address_test1];
assign data_test2=array[address_test2];
assign data_test3=array[address_test3];
always @(posedge clk or posedge reset)
begin
if(reset)
begin
array[1] <= 16'b1000_1100_0000_0000;
array[2] <= 16'b0000_0000_1010_0000; 
//array[3] <= 16'b1010_0000_1000_0000;
//array[4] <= 16'b1111_1111_1100_0001;  
array[3] <= 16'b1000_1101_0000_0000;
array[4] <= 16'b0000_0001_1011_0000;
array[5] <= 16'b1010_1101_0000_0000;
array[6] <= 16'b0000_0000_1101_0111; 
//array[6] <= 16'b0000_0000_0000_0000;
//array[5] <= 16'b1011_0001_0000_0000;
//array[6] <= 16'b0000_0000_1101_1101;
array[9] <= 16'b0000_0000_0000_0000; 
array[10] <= 16'b0000_0000_0000_0000;
array[11] <= 16'b0000_0000_0000_0000; 
array[12] <= 16'b0000_0000_0000_0000;
array[13] <= 16'b0000_0000_0000_0000;
array[14] <= 16'b0000_0000_0000_0000;
array[15] <= 16'b0000_0000_0000_0000; 	
array[16] <= 16'b0000_0000_0000_0000;
array[17] <= 16'b0000_0000_0001_0000;
array[18] <= 16'b0000_0000_0000_0000;
array[19] <= 16'b0000_0000_0000_0000;
array[20] <= 16'b0000_0000_0000_0000;
array[21] <= 16'b0000_0000_0000_0000;
array[22] <= 16'b0000_0000_0000_0000;
array[23] <= 16'b0000_0000_0000_0000;
array[24] <= 16'b0000_0000_0000_0000;
array[25] <= 16'b0000_0000_0000_0000;
array[26] <= 16'b0000_0000_0000_0011;
array[27] <= 16'b0000_0000_0000_0011;
array[28] <= 16'b0000_0000_0000_0000;
array[29] <= 16'b0000_0000_0000_0000;
array[30] <= 16'b0000_0000_0000_0000;
array[497] <= 16'b0000_0000_0000_0000;
array[498] <= 16'b0000_0000_0000_0000;
array[499] <= 16'b0000_0000_0000_0000;
array[500] <= 16'b0000_0000_0000_0000;
array[501] <= 16'b0000_0000_0000_0000;
array[502] <= 16'b0000_0000_0000_0000;
array[503] <= 16'b0000_0000_0000_0000;
array[504] <= 16'b0000_0000_0000_0000;
array[505] <= 16'b0000_0000_0000_0000;
array[506] <= 16'b0000_0000_0000_0000;
array[507] <= 16'b0000_0000_0000_0000;
array[508] <= 16'b0000_0000_0000_0000;
array[509] <= 16'b0000_0000_0000_0000;
array[510] <= 16'b0000_0000_0000_0000;
array[511] <= 16'b0000_0000_0000_0000;
state=0;
end
else if(start & ~state)
begin
if ( address > 30 && address < 497 )
ad_t=30;
else 
ad_t=address;
rwn_t=rwn;
data_t=data_in;
counter=address[1:0];
state=1;
end
else if(|counter && state)
counter=counter-1;
else if(state)
begin
if(rwn_t)
data_out=array[ad_t];
else
array[ad_t]=data_t;
state=0;
end
end
endmodule
