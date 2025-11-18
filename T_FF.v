module T_FF (
    input clk, rst, T,
    output Q
);

wire D_in;

assign D_in = Q ^ T;
D_FF d_ff_instance (
    .clk(clk),
    .rst(rst),
    .D(D_in),
    .Q(Q)
);

endmodule