// Верхний уровень в текстовом виде (аналог схемы lab1_v3.bdf).
// Используется для моделирования; в Quartus верхний уровень - схема lab1_v3.bdf
//   C -> johnson4 -> Q[3:0] -> rsp -> Y[2:0]
module lab1_v3_top
(
	C, Y
);
input C;            // KEY[3]  (PIN_T21)
output [2:0] Y;     // Y[0] -> LEDG[1], Y[1] -> LEDG[2], Y[2] -> LEDG[3]

wire [3:0] Q;

johnson4 b2v_inst  (.C(C), .Q(Q));
rsp      b2v_inst1 (.Q(Q), .Y(Y));
endmodule
