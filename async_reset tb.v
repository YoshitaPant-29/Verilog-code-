module testbench;

reg clk;
reg reset_n;
wire [7:0] count;

// Instantiate the asynchronous counter
async_reset_counter uut (
    .clk(clk),
    .reset_n(reset_n),
    .count(count)
);

// Generate a clock: 10ns period
always #5 clk = ~clk;

// Display values every clock edge
always @(posedge clk) begin
    $display("Time=%0t ns | reset_n=%b | count=%0d", $time, reset_n, count);
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    clk = 0;
    reset_n = 0;  // start with reset active

    #10;
    reset_n = 1;  // release reset

    #40;
    reset_n = 0;  // assert reset again
    #10;
    reset_n = 1;  // release reset

    #60;
    $finish;
end

endmodule
