/* módulo Not16 */

`ifndef _Not16_
`define _Not16_

module Not16(out, a);
    input [15:0] a ;
    output [15:0] out ;

    // Descrição de conexões internas do módulo
    not not0(out[0], a[0]);
    not not1(out[1], a[1]);
    not not2(out[2], a[2]);
    not not3(out[3], a[3]);
    not not4(out[4], a[4]);
    not not5(out[5], a[5]);
    not not6(out[6], a[6]);
    not not7(out[7], a[7]);
    not not8(out[8], a[8]);
    not not9(out[9], a[9]);
    not not10(out[10], a[10]);
    not not11(out[11], a[11]);
    not not12(out[12], a[12]);
    not not13(out[13], a[13]);
    not not14(out[14], a[14]);
    not not15(out[15], a[15]);

endmodule

`endif