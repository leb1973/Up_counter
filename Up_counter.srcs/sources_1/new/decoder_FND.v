`timescale 1ns / 1ps



module decoder_FND(
    input [1:0] i_digitSelect,
    input i_en,
    output [3:0] o_digit
    );

    reg [3:0] r_digit;  
    assign o_digit = r_digit;

    always @(i_digitSelect,i_en) begin  // 나는 입력을 계속 바라보고 있다
        if (i_en) begin
            r_digit = 4'b1111;
        end
        else begin 
            case (i_digitSelect)
                2'h0 : r_digit = 4'b1110;
                2'h1 : r_digit = 4'b1101;
                2'h2 : r_digit = 4'b1011;
                2'h3 : r_digit = 4'b0111;
            endcase    // case를 끝내려면 endcase 사용
        end
    end
endmodule
