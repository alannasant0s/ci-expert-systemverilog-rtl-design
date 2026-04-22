module safe_alarm (
    input door_open,
    input sys_active,
    output alarm_trigger
);
    
assign alarm_trigger = door_open & sys_active;

endmodule