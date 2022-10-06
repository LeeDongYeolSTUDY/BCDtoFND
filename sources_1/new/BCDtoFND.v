`timescale 1ns / 1ps

module BCDtoFND(
    input [1:0] i_digitSelect,
    input [3:0] i_value,
    input i_en,
    output [3:0] o_digit,
    output [3:0] o_fndFont
    );

    FND_Select_Decoder digitDecoder(
        .i_digitSelect(i_digitSelect),
        .i_en(i_en),
        .o_digit(o_digit)
    );

    BCDtoFND_Decoder BCDtoFNDDecoder(
        .i_value(i_value),
        .i_en(i_en),
        .o_font(o_fndFont)
    );

endmodule
