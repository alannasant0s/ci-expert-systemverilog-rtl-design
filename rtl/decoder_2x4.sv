module decoder_2x4 (
    input logic [1:0] in_code,
    output logic [3:0] out_sel
);

    always_comb begin : logic_decoder
        case (in_code)
            2'b00: out_sel = 4'b0001;
            2'b01: out_sel = 4'b0010;
            2'b10: out_sel = 4'b0100;
            2'b11: out_sel = 4'b1000;
            default: out_sel = 4'b0000; 
        endcase
    end

endmodule