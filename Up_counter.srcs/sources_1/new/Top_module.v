`timescale 1ns / 1ps


module Top_module(
    input i_clk,
    input i_reset,
    input i_en,
    output [3:0] o_digit,
    output [7:0] o_fndfont
    );


    wire w_clock_50000, w_clock_5000000;
    wire [1:0] w_counter;
    wire [13:0] w_value;
    wire [3:0] w_out;
    wire [3:0] w_1000,w_100,w_10,w_1;


    Clock_divider Clock_divider(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clock_50000)
    );

    Counter_FND Counter_FND(
        .i_clk(w_clock_50000),
        .i_reset(i_reset),
        .o_counter(w_counter)
    );

    decoder_FND decoder_FND(
        .i_digitSelect(w_counter),
        .i_en(i_en),
        .o_digit(o_digit)
    );


    Clock_divider_MUX Clock_divider_MUX(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clock_5000000)
    );

    Counter_data counter_data(
        .i_clk(w_clock_5000000),
        .i_reset(i_reset),
        .o_counter(w_value)
    );

    digit_divider digit_divider(
        .i_value(w_value),
        .o_1000(w_1000),
        .o_100(w_100),
        .o_10(w_10),
        .o_1(w_1)
    );

    Mux_4x1 Mux_4x1(
        .i_1000(w_1000),
        .i_100(w_100),
        .i_10(w_10),
        .i_1(w_1),
        .i_select(w_counter),
        .o_out(w_out)
    );

    BCDtoFND_Decoder BCDtoFND_Decoder(
        .i_value(w_out),
        .i_en(i_en),
        .o_font(o_fndfont)
    );






endmodule
