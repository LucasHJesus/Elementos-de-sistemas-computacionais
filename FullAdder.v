/* módulo FullAdder */

`ifndef _FullAdder_
`define _FullAdder_
`include "HalfAdder.v"

module FullAdder(sum, cout, a, b, cin);
    input a, b, cin;
    output cout, sum ;
    wire sum1,carry1, sum2, carry2;

    // Descrição de conexões internas do módulo

    HalfAdder HalfAdder1(sum1, carry1, a, b);
    HalfAdder HalfAdder2(sum, carry2, sum1, cin);
    or or1(cout, carry1, carry2);

endmodule

`endif