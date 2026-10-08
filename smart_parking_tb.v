`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 11:09:27
// Design Name: 
// Module Name: smart_parking_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module smart_parking_tb;

    reg vehicle_detected;
    reg ev_detected;
    reg slot_available;

    wire parking_occupied;
    wire charging_enable;

    // Connect the design under test
    smart_parking uut (
        .vehicle_detected(vehicle_detected),
        .ev_detected(ev_detected),
        .slot_available(slot_available),
        .parking_occupied(parking_occupied),
        .charging_enable(charging_enable)
    );

    initial begin

        // Case 1: No vehicle
        vehicle_detected = 0;
        ev_detected = 0;
        slot_available = 1;
        #100;

        // Case 2: Normal vehicle enters
        vehicle_detected = 1;
        ev_detected = 0;
        slot_available = 1;
        #100;

        // Case 3: EV enters and slot is available
        vehicle_detected = 1;
        ev_detected = 1;
        slot_available = 1;
        #100;

        // Case 4: EV enters but charging slot is unavailable
        vehicle_detected = 1;
        ev_detected = 1;
        slot_available = 0;
        #100;

        // Case 5: Vehicle leaves
        vehicle_detected = 0;
        ev_detected = 0;
        slot_available = 1;
        #100;

        $finish;
    end

endmodule