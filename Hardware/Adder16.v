/* módulo Adder16 */

`ifndef _Adder16_
`define _Adder16_

`include "HalfAdder.v"
`include "FullAdder.v"
module Adder16(sum, overflow, a, b);
    input [15:0] a, b ;
    output [15:0] sum ;
    output overflow;
    wire [15:0] carry;

    // Descrição de conexões internas do módulo

    HalfAdder HalfAdder1(sum[0],carry[0], a[0], b[0] );

    FullAdder FullAdder1(sum[1],carry[1], a[1], b[1], carry[0]);
    FullAdder FullAdder2(sum[2],carry[2], a[2], b[2], carry[1]);
    FullAdder FullAdder3(sum[3],carry[3], a[3], b[3], carry[2]);
    FullAdder FullAdder4(sum[4],carry[4], a[4], b[4], carry[3]);
    FullAdder FullAdder5(sum[5],carry[5], a[5], b[5], carry[4]);
    FullAdder FullAdder6(sum[6],carry[6], a[6], b[6], carry[5]);
    FullAdder FullAdder7(sum[7],carry[7], a[7], b[7], carry[6]);
    FullAdder FullAdder8(sum[8],carry[8], a[8], b[8], carry[7]);
    FullAdder FullAdder9(sum[9],carry[9], a[9], b[9], carry[8]);
    FullAdder FullAdder10(sum[10],carry[10], a[10], b[10], carry[9]);
    FullAdder FullAdder11(sum[11],carry[11], a[11], b[11], carry[10]);
    FullAdder FullAdder12(sum[12],carry[12], a[12], b[12], carry[11]);
    FullAdder FullAdder13(sum[13],carry[13], a[13], b[13], carry[12]);
    FullAdder FullAdder14(sum[14],carry[14], a[14], b[14], carry[13]);
    FullAdder FullAdder15(sum[15],overflow, a[15], b[15], carry[14]);
endmodule

`endif