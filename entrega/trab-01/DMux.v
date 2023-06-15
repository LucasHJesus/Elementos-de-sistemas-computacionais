/* módulo DMux */

`ifndef _DMux_
`define _DMux_

module DMux(a, b, in, sel);
    input in, sel ;
    output a, b ;
    wire w1;

    // Descrição de conexões internas do módulo

    and and0(b, in, sel);
    not not0(w1, sel);
    and and1(a, w1, in);

endmodule

`endif