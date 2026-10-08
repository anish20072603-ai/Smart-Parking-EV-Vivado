module smart_parking (
    input  vehicle_detected,
    input  ev_detected,
    input  slot_available,
    output parking_occupied,
    output charging_enable
);

    assign parking_occupied = vehicle_detected;

    assign charging_enable = vehicle_detected & ev_detected & slot_available;

endmodule