/* módulo DMux4Way16 */

`ifndef _DMux4Way16_
`define _DMux4Way16_
`include "DMux16.v"


module DMux4Way16(out1, out2, out3, out4, in, sel);
    input [15:0] in ;
    input [1:0] sel;
    output [15:0] out1, out2, out3, out4;
    wire [15:0] w1, w2;

    // Descrição de conexões internas do módulo

    DMux16 DMux1(w1,w2, in, sel[1]);
    DMux16 DMux2(out1,out2, w1, sel[0]);
    DMux16 DMux3(out3,out4, w2, sel[0]);

endmodule

`endif