`timescale 1ns / 1ps

module FND_Select_Decoder(
    input [1:0] i_digitSelect,
    input i_en,
    output [3:0] o_digit
    );
    // always 문은 나는 계속 입력을 바라보고 있다.
    // always @(입력값) --> @ = 바라보고있다.
    // always @(입력값) begin{          // if와 else는 항상 always안에서 사용할 수 있다.
    //     if (i_en) begin     
    //         o_digit = 4'b1111;       // i_en이 1이면 4'b1111을 넣어라.
    //     end
    //     else begin                   // 그렇지 않으면, i_en = 0이면 case문을 실행하라
    //          case (i_digitSelect)    
    //             2'h0 : o_digit = 4'b1110;
    //             2'h1 : o_digit = 4'b1101;
    //             2'h2 : o_digit = 4'b1011;
    //             2'h3 : o_digit = 4'b0111;
    //         endcase
    //     end
    // }
    reg [3:0] r_digit;      //reg는 메모리기능이다.

    assign o_digit = r_digit;       //o_digit에다가 r_digit를 연결해줬다.

    always @(i_digitSelect or i_en) begin
        if (i_en) begin     // i_en은 0이나 1일 것이다. enable핀이니까 enable이 low일 때 동작한다.
            r_digit = 4'b1111;      //register에다가 값을 넣곘다.
        end
        else begin  // bigin end 는 c언어의 중괄호와 같다.
            case (i_digitSelect)
                2'h0 : r_digit = 4'b1110;  // 4'h0 = 4bit짜리 16진수 0, 8.hc0무엇인가?
                2'h1 : r_digit = 4'b1101;
                2'h2 : r_digit = 4'b1011;
                2'h3 : r_digit = 4'b0111;
            endcase
        end
    end
endmodule
