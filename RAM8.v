/* módulo RAM8 */

`ifndef _RAM8_
`define RAM8

`include "DMux8Way16.v"
`include "Mux8Way16.v"
`include "Register16.v"
`include "DMux8Way.v"

module RAM8(out, in, addr, write, clk);

    input [15:0] in;
    input [2:0] addr;
    input write, clk;
    output [15:0] out;
    wire [15:0] w_in1, w_in2, w_in3, w_in4, w_in5, w_in6, w_in7, w_in8; 
    wire [15:0] w_out1, w_out2, w_out3, w_out4, w_out5, w_out6, w_out7, w_out8;
    wire w_DMux1, w_DMux2, w_DMux3, w_DMux4, w_DMux5, w_DMux6, w_DMux7, w_DMux8;

    // Descrição de conexões internas do módulo

    DMux8Way DMux1 (w_DMux1, w_DMux2, w_DMux3, w_DMux4, w_DMux5, w_DMux6, w_DMux7, w_DMux8, write, addr);

    Register16 register1 (w_out1, in, w_DMux1, clk);
    Register16 register2 (w_out2, in, w_DMux2, clk);
    Register16 register3 (w_out3, in, w_DMux3, clk);
    Register16 register4 (w_out4, in, w_DMux4, clk);
    Register16 register5 (w_out5, in, w_DMux5, clk);
    Register16 register6 (w_out6, in, w_DMux6, clk);
    Register16 register7 (w_out7, in, w_DMux7, clk);
    Register16 register8 (w_out8, in, w_DMux8, clk);


    Mux8Way16 Mux (out, w_out1, w_out2, w_out3, w_out4, w_out5, w_out6, w_out7, w_out8, addr);

endmodule

`endif