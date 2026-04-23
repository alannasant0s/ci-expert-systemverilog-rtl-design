module mux_2x1 (
    input logic a,
    input logic b,
    input logic sel,
    output logic y
);
    // Lê-se: "sel é igual a 0? Se sim, y = a, se não, y = b
    assign y = (sel == 1'b0) ? a:b;
            
endmodule