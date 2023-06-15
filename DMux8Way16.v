/* módulo DMux8Way16 */

`ifndef _DMux8Way16_
`define _DMux8Way16_
`include "DMux4Way16.v"

module DMux8Way16(out1, out2, out3, out4, out5, out6, out7, out8, in, sel);
    input [15:0] in;
    input [2:0]  sel;
    output [15:0] out1, out2, out3, out4, out5, out6, out7, out8 ;
    wire [15:0] w1, w2;

    // Descrição de conexões internas do módulo

    DMux16 DMux1(w1,w2,in,sel[2]);
    DMux4Way16 DMux2(out1,out2,out3,out4, w1, sel[1:0]);
    DMux4Way16 DMux3(out5,out6,out7,out8, w2, sel[1:0]);
    

endmodule

`endif