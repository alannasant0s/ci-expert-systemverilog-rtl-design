module safe_alarm (
    input  logic door_open,
    input  logic sys_active,
    output logic alarm_trigger
);
assign alarm_trigger = door_open & sys_active;

endmodule