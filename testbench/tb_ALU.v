/* testbench para Adder16 */
/* ordem de portas: out, zr, ng, x, y, zx, nx, zy, ny, f, no */
/* input [15:0] x; input [15:0] y; */
/* input zx, nx, zy, ny, f, no; */
/* output [15:0] out; output zr, ng; */

`include "ALU.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_ALU;
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;

    ALU alu0(out, zr, ng, x, y, zx, nx, zy, ny, f, no);

    initial
    begin
        $dumpfile("tb_ALU.vcd");
        $dumpvars(0, tb_ALU);

        x = 16'h1248; y = 16'h137F; zx = 1; nx = 0; zy = 1; ny = 0; f = 1; no = 0; #1; // 0
        `assert(out, 16'h0) `assert(zr, 1'b1) `assert(ng, 1'b0)

        x = 16'h1248; y = 16'h137F; zx = 1; nx = 1; zy = 1; ny = 1; f = 1; no = 1; #1; // 1
        `assert(out, 16'h1) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'h1248; y = 16'h137F; zx = 1; nx = 1; zy = 1; ny = 0; f = 1; no = 0; #1; // -1
        `assert(out, 16'hFFFF) `assert(zr, 1'b0) `assert(ng, 1'b1)

        x = 16'h1248; y = 16'h137F; zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 0; #1; // x
        `assert(out, 16'h1248) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'h1248; y = 16'h137F; zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 0; #1; // y
        `assert(out, 16'h137F) `assert(zr, 1'b0) `assert(ng, 1'b0)

        x = 16'h1248; y = 16'h137F; zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 1; #1; // !x
        `assert(out, 16'hEDB7) `assert(zr, 1'b0) `assert(ng, 1'b1)
        x = 16'h1248; y = 16'h137F; zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 1; #1; // !y
        `assert(out, 16'hEC80) `assert(zr, 1'b0) `assert(ng, 1'b1)

        x = 16'hFACA; y = 16'h7AFA; zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 1; #1; // -x
        `assert(out, 16'h0536) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'hFACA; y = 16'h7AFA; zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 1; #1; // -y
        `assert(out, 16'h8506) `assert(zr, 1'b0) `assert(ng, 1'b1)

        x = 16'hFACA; y = 16'h7AFA; zx = 0; nx = 1; zy = 1; ny = 1; f = 1; no = 1; #1; // x+1
        `assert(out, 16'hFACB) `assert(zr, 1'b0) `assert(ng, 1'b1)
        x = 16'hFACA; y = 16'h7AFA; zx = 1; nx = 1; zy = 0; ny = 1; f = 1; no = 1; #1; // y+1
        `assert(out, 16'h7AFB) `assert(zr, 1'b0) `assert(ng, 1'b0)

        x = 16'hFACA; y = 16'h7AFA; zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 0; #1; // x-1
        `assert(out, 16'hFAC9) `assert(zr, 1'b0) `assert(ng, 1'b1)
        x = 16'hFACA; y = 16'h7AFA; zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 0; #1; // y-1
        `assert(out, 16'h7AF9) `assert(zr, 1'b0) `assert(ng, 1'b0)

        x = 16'd42; y = 16'd129; zx = 0; nx = 0; zy = 0; ny = 0; f = 1; no = 0; #1; // x+y
        `assert(out, 16'h00AB) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'd42; y = 16'd129; zx = 0; nx = 1; zy = 0; ny = 0; f = 1; no = 1; #1; // x-y
        `assert(out, 16'hFFA9) `assert(zr, 1'b0) `assert(ng, 1'b1)
        x = 16'd42; y = 16'd129; zx = 0; nx = 0; zy = 0; ny = 1; f = 1; no = 1; #1; // y-x
        `assert(out, 16'h0057) `assert(zr, 1'b0) `assert(ng, 1'b0)

        x = 16'h3333; y = 16'h5555; zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0; #1; // x&y
        `assert(out, 16'h1111) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'h3333; y = 16'h5555; zx = 0; nx = 1; zy = 0; ny = 1; f = 0; no = 1; #1; // x|y
        `assert(out, 16'h7777) `assert(zr, 1'b0) `assert(ng, 1'b0)
        x = 16'hFFFF; y = 16'h0000; zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0; #1; // x&y
        `assert(out, 16'h0000) `assert(zr, 1'b1) `assert(ng, 1'b0)
    end

endmodule
