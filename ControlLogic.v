module ControlLogic(	INCPC,LDAR,LDACC,LDDR,Start,IncSCBar,LDIR1,LDIR2,LDIMM,CLRSC,LDTR,LDPC,
							B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,
							ALU0,ALU1,ALU2,ALU3,ALU4,ALU5,ALU6,ALU7,
							regselect1,regselect2, 
							WEnable,rnw,Eout,DecSP,INCSP,
							D0,D1,D2,D3,D4,D5,D6,D7,S0,S1,S2,S3,S4,S5,
							A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,
							IR1,IR2,Ready,equal,sign,zero,
							T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,
							Jtmp, Ktmp, tmp);
							
							
input D0,D1,D2,D3,D4,D5,D6,D7; //REG INSTS
input S0,S1,S2,S3,S4,S5; //IMM INSTS
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13; //MEM INSTS
input[15:0] IR1, IR2;
input Ready, equal, sign, zero;
input T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15, tmp; //SC

output wire INCPC, LDAR, LDACC, LDDR, Start, IncSCBar, LDIR1, LDIR2, LDIMM, CLRSC, LDTR, LDPC;
output wire B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10; //BUS
output wire ALU0, ALU1, ALU2, ALU3, ALU4, ALU5, ALU6, ALU7;
output wire regselect1, regselect2; // BARAYE ENTEKHAB KARDANE REG2
output wire WEnable, rnw, Eout, DecSP,INCSP, Jtmp, Ktmp;



assign B0  = T2 & Ready || T5 & Ready & IR1[15] || T6 & D3 & Ready || T9 & D3 & Ready ||
				 T10 & A4 & Ready || T8 & A5 & Ready || T7 & A6 || T10 & A7 & Ready || T9 & A10||
				 T9 & A11 & Ready || T9 & A12 & Ready;
assign B1  = T8 & S0 || T8 & S1 || T8 & S2 || T7 & S3 || T8 & S4 || T8 & S5;
assign B2  = T10 & A0 & equal || T10 & A1 & ~sign || T9 & A2 || T9 & A3 || T7 & A13;
assign B3  = T0 || T3 & IR1[15] || T11 & A2|| T11 & A3 || T7 & A10 & ~sign || T7 & A11 & sign ||
				 T7 & A12 & zero;
assign B5  = T7 & D1 || T8 & D2 || T11 & D3|| T7 & D4 || T8 & D5 || T11 & D5 || T13 & D5 ||
				 T7 & D6 & ~tmp || T6 & D7 || T10 & S0|| T10 & S1|| T10 & S2|| T11 & S2 || T15 & S2 ||
				 T8 & D6 || T10 & D6;
assign B8  = T9 & D5 || T13 & S2|| T12 & A2 & Ready || T12 & A3 & Ready || T9 & A9;
assign B9  = T7 & S5 || T10 & A2 & equal || T10 & A3 & ~sign || T8 & A4 || T8 & A7  || T7 & A8;
assign B10 = T4 & D1 || T5 & D1 || T5 & D2 || T6 & D2 || T4 & D3 || T7 & D3 || T4 & D4 ||
				 T5 & D4 || T4 & D5 || T7 & D5 || T4 & D6 || T4 & D7 || T7 & S0 || T7 & S1 ||
				 T7 & S2 || T12 & S2|| T7 & S4 || T7 & S4 || T7 & A0 || T8 & A0 || T7 & A1 ||
				 T8 & A1 || T7 & A2 || T8 & A2 || T7 & A3 || T8 & A3 || T7 & A6 || T8 & A8 || T7 & A9 ||
				 T8 & A9;

assign LDIR1 = T2 & Ready || T9 & A10 & Ready || T9 & A11 & Ready || T9 & A12 & Ready;
assign LDIR2 = T5 & Ready & IR1[15] ;
assign LDPC  = T10 & A0 & equal || T10 & A1 & ~sign || T12 & A2 & Ready || T12 & A3 & Ready ||
					T10 & A4 & Ready || T7 & A13;
assign LDAR  = T0 || T3 & IR1[15] || T6 & IR1[15] & IR1[14] || T4 & D3 || T7 & D3 || T7 & S4||
					T7 & S4 || T7 & S5 || T10 & A2 & equal || T10 & A3 & ~sign || T8 & A4 ||
					T8 & A7 || T7 & A8 || T7 & A10 & ~sign || T7 & A11 & sign || T7 & A12 & zero;
assign LDDR  = T4 & D1 || T5 & D1 || T5 & D2 || T6 & D2 || T6 & D3 & Ready || 
					  T9 & D3 & Ready  || T4 & D4 || T5 & D4 || T4 & D5 || T7 & D5 || T9 & D5 ||
					T11 & D5|| T4 & D6 || T4 & D7 || T7 & S0 || T8 & S0 || T7 & S1 || T8 & S1 ||
					T7 & S2 || T8 & S2 || T10 & S2|| T12 & S2|| T13 & S2|| T7 & A0 || T8 & A0 || T7 & A1 ||
					T8 & A1 || T7 & A2 || T8 & A2 || T7 & A3 || T8 & A3 || T8 & D6;
assign LDACC = T5 & D1 || T6 & D1 || T6 & D2 || T7 & D2 || T7 & D3 || T10 & D3 || T5 & D5 ||
					T6 & D4 || T5 & D5 || T6 & D5 || T8 & D5 || T9 & D5 || T10 & D5 || T12 &D5 ||
					T5 & D6 || T6 & D6 || T5 & D7 || T8 & S0 || T9 & S0 || T8 & S1 || T9 & S1  || T8 & S2 ||
					T9 & S2 || T10 & S2|| T10 & S2|| T11 & S2|| T13 & S2|| T14 & S2 || T8 & A0 ||
					T9 & A0 || T8 & A1 || T9 & A1 || T8 & A2 || T9 & A2 || T8 & A3  || T9 & A3 || 
					T9 & D6;
assign LDIMM = T6 & IR1[15] & ~IR1[14] ; 
assign LDTR  = T8 & D5 || T11 & S2|| T9 & A2 || T9 & A3 || T7 & A9;
  
assign INCPC = T0 || T3 & IR1[15] || T7 & A10 & ~sign || T10 & A10 & IR1[15] || T7 & A11 & sign ||
					T10 & A11 & IR1[15] || T7 & A12 & zero || T10 & A12 * IR1[15]; 
assign IncSCBar = T1 || T2 & ~Ready || T4 & IR1[15] || T5 & IR1[15] & ~Ready|| T5 & D3 || 
						T6 & D3 & ~Ready|| T8 & D3 || T9 & D3 & ~Ready || T8 & S4 || T9 & S4 & ~Ready ||
						T8 & S5 || T9 & S5 & ~Ready|| T11 & A2 || T12 & A2 & ~Ready || T11 & A3 ||
						T12 & A3 & ~Ready||T9 & A4 || T10 & A4 & ~Ready || T7 & A5 || T8 & A5 & ~Ready||
						T7 & A6 || T8 & A6 & ~Ready|| T9 & A7  || T10 & A7 & ~Ready || T8 & A8 ||
						T9 & A8 & ~Ready || T8 & A10 || T9 & A10 & ~Ready || T8 & A11 || T9 & A11 & ~Ready||
						T8 & A12 || T9 & A12 & ~Ready; 
assign CLRSC = T4 & D0 || T7 & D1 || T8 & D2 || T11 & D3 || T7 & D4 || T13 & D5 || T7 & D6 & ~tmp ||
					T6 & D7 || T10 & S0|| T10 & S1|| T15 & S2 || T7 & S3 || T9 & S4 & Ready ||
					  T9 & S5 & Ready  || T10 & A0|| T10 & A1 || T10 & A2 & ~equal || T12 & A2 & Ready||
					T10 & A3 & sign || T12 & A3 & Ready || T10 & A4 & Ready || T8 & A5 & Ready || 
					T7 & A13 || T8 & A6 & Ready || T10 & A7 & Ready || T9 & A8 & Ready || T9 & A9||
					T7 & A10 & sign || T10 & A10 || T7 & A11 & ~sign || T10 & A11 || T10 & A12 || T7 & A12 & ~zero
					|| T10 & D6 || IR1[15] & IR2[0] & T7;
assign regselect1 = T4 & ~IR1[15] || T6 & D2;
assign regselect2 = T7 & IR1[15] & ~S4 & ~A6 & ~A9|| T12 & S2 || T8 & A9;
assign WEnable = T7 & D1 & ~IR2[0] || T8 & D2 || T11 & D3 || T7 & D4 & ~IR2[0] || T13 & D5 || T7 & D6 & ~tmp || T6 & D7 ||
					  T10 & S0|| T10 & S1|| T15 & S2 || T7 & S3 & ~IR2[0] || T8 & A5 & Ready || T10 & A7 & Ready||
					  T8 & A9 || T9 & A9 || T10 & D6;
assign Start = T1 || T4 & IR1[15] || T5 & D3 || T8 & D3 || T8 & S4 || T8 & S5 || T11 & A2 ||
					T11 & A3 || T9 & A4|| T7 & A5 || T7 & A6 || T9 & A7 || T8 & A8 || T8 & A10|| T8 & A10 ||
					T8 & A12;
assign Eout = T8 & D3; 
assign rnw = T8 & S4 || T8 & S5 || T11 & A2 || T11 & A3 || T7 & A6 || T8 & A8;
assign DecSP = T7 & S5 || T10 & A2 & equal || T10 & A3 & ~sign || T7 & A8;
assign INCSP = T7 & A4 || T7 & A7;

assign ALU0 = T6 & D4 || T6 & D5 || T9 & D5 || T10 & D5 || T12 & D5 || T9 & S1 || T9 & S2 ||
				  T10 & S2|| T13 & S2|| T14 & S2|| T6 & D6 & sign || T9 & D6;
assign ALU1 = T6 & D6 & ~sign || T7 & D6 & tmp;
assign ALU2 = T5 & D7;
assign ALU3 = T6 & D1 || T10 & D3|| T9 & S0;
assign ALU4 = T7 & D2 || T9 & A1 || T9 & A3;
assign ALU5 = T9 & A0 || T9 & A2;
assign ALU7 = T5 & D1 || T6 & D2 || T7 & D3 || T5 & D4 || T5 & D5 || T8 & D5 || T8 & S0 ||
				  T8 & S1 || T8 & S2 || T11 & S2|| T8 & A0 || T8 & A1 || T8 & A2 || T8 & A3 || T5 & D6;
				  

assign Jtmp = T6 & D6 & sign;
assign Ktmp = T0;

endmodule 