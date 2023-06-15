/* módulo DMux16 */

`ifndef _DMux16_
`define _DMux16_
`include "DMux.v"

module DMux16(a,b,in,sel);
    input [15:0] in ;
    input sel;
    output [15:0] a, b ;

    // Descrição de conexões internas do módulo

    DMux DMux0( a[0], b[0] , in[0] , sel);
    DMux DMux1( a[1], b[1] , in[1] , sel);    
    DMux DMux2( a[2], b[2] , in[2] , sel);    
    DMux DMux3( a[3], b[3] , in[3] , sel);    
    DMux DMux4( a[4], b[4] , in[4] , sel);    
    DMux DMux5( a[5], b[5] , in[5] , sel);    
    DMux DMux6( a[6], b[6] , in[6] , sel);    
    DMux DMux7( a[7], b[7] , in[7] , sel);    
    DMux DMux8( a[8], b[8] , in[8] , sel);    
    DMux DMux9( a[9], b[9] , in[9] , sel);    
    DMux DMux10( a[10], b[10] , in[10] , sel);
    DMux DMux11( a[11], b[11] , in[11] , sel);
    DMux DMux12( a[12], b[12] , in[12] , sel);
    DMux DMux13( a[13], b[13] , in[13] , sel);
    DMux DMux14( a[14], b[14] , in[14] , sel);
    DMux DMux15( a[15], b[15] , in[15] , sel);

endmodule

`endif