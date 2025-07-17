module async_reset_counter (
    input clk,            // Clock input
    input reset_n,        // Active-low asynchronous reset
    output reg [7:0] count  // 8-bit counter output
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        count <= 8'b0;
    else
        count <= count + 1;
end

endmodule
