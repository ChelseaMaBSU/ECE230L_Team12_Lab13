module top (
    input btnU, btnC,
    output [6:0] led
);

wire Q_ripple_state0, Q_ripple_stage1, Q_ripple_state2;
parameter T_HIGH = 1'b1;

wire [2:0] Q_mod;
wire [2:0] D_mod;
wire [2:0] S_mod;
wire Cout_mod;
wire RST_COND;

wire D_out_toggle;

assign led[0] = Q_ripple_stage0;
assign led[1] = Q_ripple_stage1;
assign led[2] = Q_ripple_stage2;

assign led[3] = Q_mod[0];
assign led[4] = Q_mod[1];
assign led[5] = Q_mod[2];

wire Q_out_toggle;
assign led[6] = Q_out_toggle;

T_FF tff_0 (
    .clk(btnC),
    .rst(btnU),
    .T(T_HIGH),
    .Q(Q_ripple_stage0)
);

T_FF tff_1 (
    .clk(Q_ripple_stage0),
    .rst(btnU),
    .T(T_HIGH),
    .Q(Q_ripple_stage1)
);

T_FF tff_2 (
    .clk(Q_ripple_stage1),
    .rst(btnU),
    .T(T_HIGH),
    .Q(Q_ripple_stage2)
);

assign RST_COND = Q_mod[2] & (~Q_mod[1]) & Q_mod[0];

Full_Adder_1bit fa_0 (
    .A(Q_mod[0]),
    .B(1'b0),
    .Cin(1'b1),
    .Sum(S_mod[0]),
    .Cout(Cout_mod_1)
);

Full_Adder_1bit fa_1 (
    .A(Q_mod[1]),
    .B(1'b0),
    .Cin(Cout_mod_1),
    .Sum(S_mod[1]),
    .Cout(Cout_mod_2)
);

Full_Adder_1bit fa_2 (
    .A(Q_mod[2]),
    .B(1'b0),
    .Cin(Cout_mod_2),
    .Sum(S_mod[2]),
    .Cout(Cout_mod)
);

assign D_mod[0] = RST_COND ? 1'b0 : S_mod[0];
assign D_mod[1] = RST_COND ? 1'b0 : S_mod[1];
assign D_mod[2] = RST_COND ? 1'b0 : S_mod[2];

D_FF dff_0 (
    .clk(btnC),
    .rst(btnU),
    .D(D_mod[0]),
    .Q(Q_mod[0])
);

D_FF dff_1 (
    .clk(btnC),
    .rst(btnU),
    .D(D_mod[1]),
    .Q(Q_mod[1])
);

D_FF dff_2 (
    .clk(btnC),
    .rst(btnU),
    .D(D_mod[2]),
    .Q(Q_mod[2])
);

assign D_out_toggle = RST_COND ? (~Q_out_toggle) : Q_out_toggle;

D_FF dff_out (
    .clk(btnC),
    .rst(btnU),
    .D(D_out_toggle),
    .Q(Q_out_toggle)
);

endmodule