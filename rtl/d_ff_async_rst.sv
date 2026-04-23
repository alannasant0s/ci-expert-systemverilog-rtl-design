module d_ff_async_rst (
    input logic clk,
    input logic rst_n, // '_n' indica que o reset é ativo em zero(baixo)
    input logic d,
    output logic q
);

always_ff @(posedge clk or negedge rst_n) begin : flip_flop_d
        if (!rst_n) begin
            q <= 1'b0;

        end else begin
            q <= d;
        end
    end
endmodule 