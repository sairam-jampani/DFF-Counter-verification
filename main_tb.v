`timescale 1ns/1ps

module main_tb;

reg clk;
reg rst;
reg d;

wire q;
wire [3:0] count;

main DUT(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .count(count)
);

always #5 clk = ~clk;

reg [3:0] prev_count = 4'b0000;

initial
begin

    clk = 0;
    rst = 1;
    d = 0;

    // Apply reset
    #12;
    rst = 0;

    // Test DFF
    d = 1;

    @(posedge clk);
    #1;

    if(q == 1'b1)
        $display("PASS: DFF captured input");
    else
        $display("FAIL: DFF capture failed");

    // Test Counter Increment
    prev_count = count;

    @(posedge clk);
    #1;

    if(count == prev_count + 1)
        $display("PASS: Counter incremented correctly");
    else
        $display("FAIL: Counter incremented incorrectly");

    // Test Reset
    rst = 1;

    @(posedge clk);
    #1;

    if(count == 4'b0000)
        $display("PASS: Counter reset correctly");
    else
        $display("FAIL: Counter reset failed");

    $display("Simulation Completed");

    #10;
    $finish;

end

endmodule
