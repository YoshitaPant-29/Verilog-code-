module sync_reset_counter (
    input wire clk,         // Clock input
    input wire reset_n,     // Active-low synchronous reset
    output reg [7:0] count  // 8-bit counter output
);

always @(posedge clk) begin
    if (!reset_n)           // Synchronous reset
        count <= 8'b0;      
    else
        count <= count + 1; // Increment counter
end

endmodule
