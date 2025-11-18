module D_FF (
    input clk, rst, D,
    output reg Q
);

// State update on positive clock edge or positive reset edge
always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 1'b0;
    end else begin
        Q <= D;
    end
end

endmodule