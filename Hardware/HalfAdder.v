/* módulo HalfAdder */

`ifndef _HalfAdder_
`define _HalfAdder_

module HalfAdder(sum, carry, a, b);
    input a, b;
    output sum, carry;

// Descrição de conexões internas do módulo

    xor xor0(sum, a, b);
    and and0(carry, a, b);
endmodule

`endif