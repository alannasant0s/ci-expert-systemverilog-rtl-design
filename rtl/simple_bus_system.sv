
// recebe o clock para distribuir
interface simple_bus_if (input logic clk);
    logic       valid; // avisa se tem dado novo
    logic [7:0] data;  // fio de dados de 8 bits

    // Forçam as direções corretas para não dar curto-circuito lógico
    modport tx (output valid, output data, input clk); // ponta do Tx
    modport rx (input  valid, input  data, input clk); // ponta do Rx
endinterface


module transmissor (simple_bus_if.tx bus);
    
    always_ff @(posedge bus.clk) begin
        bus.valid <= 1'b1;     // valida
        bus.data  <= 8'hAA;    // envia o valor hexadecimal AA (10101010)
    end

endmodule


module receptor (simple_bus_if.rx bus);
    
    logic [7:0] memoria_interna;

    always_ff @(posedge bus.clk) begin
        if (bus.valid) begin // Só guarda o dado se o transmissor avisar que é válido
            memoria_interna <= bus.data;
        end
    end

endmodule


module top_system (
    input logic clk_externo
);

    // criando a interface instanciada e ligando o clock nela
    simple_bus_if meu_cabo (.clk(clk_externo));

    // instanciando os módulos e plugando o cabo neles
    transmissor tx_inst (.bus(meu_cabo));
    receptor    rx_inst (.bus(meu_cabo));

endmodule