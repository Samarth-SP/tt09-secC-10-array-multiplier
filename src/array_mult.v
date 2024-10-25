`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 04:43:24 PM
// Design Name: 
// Module Name: array_mult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module array_mult_structural(
    input [3:0] m,
    input [3:0] q,
    output [7:0] p
    );
    wire hsig1, hsig2, hsig3, hsig4, hsig5, hsig6, hsig7, hsig8, hsig9;
    wire vsig1, vsig2, vsig3, vsig4, vsig5, vsig6;
    wire dsig1, dsig2;
    //layer1
    and(p[0], q[0], m[0]);
    //layer2
    fadder layer2_1(m[1]&q[0], m[0]&q[1], 1'b0, p[1], hsig1);
    fadder layer2_2(m[2]&q[0], m[1]&q[1], hsig1, vsig1, hsig2);
    fadder layer2_3(m[3]&q[0], m[2]&q[1], hsig2, vsig2, hsig3);
    fadder layer2_4(m[3]&q[1], 1'b0, hsig3, vsig3, dsig1);
    //layer3
    fadder layer3_1(m[0]&q[2], vsig1, 1'b0, p[2], hsig4);
    fadder layer3_2(m[1]&q[2], vsig2, hsig4, vsig4, hsig5);
    fadder layer3_3(m[2]&q[2], vsig3, hsig5, vsig5, hsig6);
    fadder layer3_4(m[3]&q[2], dsig1, hsig6, vsig6, dsig2);
    //layer4
    fadder layer4_1(m[0]&q[3], vsig4, 1'b0, p[3], hsig7);
    fadder layer4_2(m[1]&q[3], vsig5, hsig7, p[4], hsig8);
    fadder layer4_3(m[2]&q[3], vsig6, hsig8, p[5], hsig9);
    fadder layer4_4(m[3]&q[3], dsig2, hsig9, p[6], p[7]);
    
endmodule
module fadder(
    input x,
    input y,
    input carry_in,
    output z,
    output carry_out
);
    wire int_sig1, int_sig2, int_sig3, int_sig4, int_sig5, int_sig6, int_sig7, int_sig8;
    assign int_sig1 = x & ~y;
    assign int_sig2 = ~x & y;
    assign int_sig3 = int_sig1 | int_sig2;
    assign int_sig4 = int_sig3 & ~carry_in;
    assign int_sig5 = ~int_sig3 & carry_in;
    assign z = int_sig4 | int_sig5;
    
    assign int_sig6 = x & y;
    assign int_sig7 = y & carry_in;
    assign int_sig8 = carry_in & x;
    assign carry_out = int_sig6 | int_sig7 | int_sig8;
endmodule

