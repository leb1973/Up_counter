`timescale 1ns / 1ps



module Mux_4x1( 
    input [3:0] i_1000,i_100,i_10,i_1,
    input [1:0] i_select,
    output [3:0] o_out
    );

    reg [3:0] r_out;
    assign o_out = r_out;

    always @(i_select) begin
        case(i_select)
            2'b00 : r_out = i_1;
            2'b01 : r_out = i_10;
            2'b10 : r_out = i_100;
            2'b11 : r_out = i_1000;
        endcase
    end

endmodule
