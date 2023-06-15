/* módulo Increment16 */

`ifndef _Increment16_
`define _Increment16_
`include "Adder16.v"

module Increment16(out, in);
    input [15:0] in ;
    output [15:0] out ;
    wire carry;

    // Descrição de conexões internas do módulo

    Adder16 Adder16_1(out, carry, in, 16'b0000000000000001);

endmodule

`endif