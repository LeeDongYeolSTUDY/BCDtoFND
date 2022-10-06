`timescale 1ns / 1ps

module BCDtoFND_Decoder(
    input [3:0] i_value,
    input i_en,
    output [7:0] o_font
    );

    reg [7:0] r_font;
    assign o_font = r_font;

    always @(i_value or i_en) begin
        if (i_en) begin
            r_font = 8'hff;
        end
        else begin
            r_font = 8'hff;     //이걸 추가해서 default값을 만들어주면 원치않는 래치가 안생긴다.
            case (i_value)
                4'h0 : r_font = 8'hc0;  //0
                4'h1 : r_font = 8'hf9;  //1
                4'h2 : r_font = 8'ha4;  //2
                4'h3 : r_font = 8'hb0;  //3
                4'h4 : r_font = 8'h99;  //4
                4'h5 : r_font = 8'h92;  //5
                4'h6 : r_font = 8'h82;  //6
                4'h7 : r_font = 8'hf8;  //7
                4'h8 : r_font = 8'h80;  //8
                4'h9 : r_font = 8'h90;  //9
                4'ha : r_font = 8'h7f;  //dot
                // default : r_font = 8'hff;
            endcase
        end
    end
endmodule
