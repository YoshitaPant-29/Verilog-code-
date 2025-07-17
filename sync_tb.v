module testbench;

reg clk;
reg reset_n;
wire [7:0] count;

// Instantiate the synchronous counter
sync_reset_counter uut (
    .clk(clk),
    .reset_n(reset_n),
    .count(count)
);

// Clock generator: 10ns period
always #5 clk = ~clk;

// Display values every positive edge of clk
always @(posedge clk) begin
    $display("Time=%0t ns | reset_n=%b | count=%0d", $time, reset_n, count);
end

initial begin
    $dumpfile("dump.vcd"); // For waveform
    $dumpvars(0, testbench);

    clk = 0;
    reset_n = 0;

    #15;           // Hold reset low for 15ns
    reset_n = 1;   // Release reset

    #100;          // Run for more time to see count increment
    $finish;
end

endmodule
