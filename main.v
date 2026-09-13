module main(
    input clk,
    input rst,
    input d,
    output q,
    output [3:0] count
);

dff U1(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

counter U2(
    .clk(clk),
    .rst(rst),
    .count(count)
);

endmodule
