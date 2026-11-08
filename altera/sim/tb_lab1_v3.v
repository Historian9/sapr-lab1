// Тестбенч: подаёт 16 тактов (2 периода) и сверяет Y с заданной последовательностью
`timescale 1ns/1ps
module tb_lab1_v3;
reg C = 1'b1;               // кнопка не нажата -> 1
wire [2:0] Y;
integer i, errors = 0;
integer y_val;
integer seq [0:7];

lab1_v3_top dut (.C(C), .Y(Y));

function integer decode(input [2:0] y);
	case (y)
		3'b001: decode = 1;
		3'b010: decode = 2;
		3'b100: decode = 3;
		default: decode = -1;
	endcase
endfunction

task press;                 // нажатие и отпускание кнопки (фронт 0->1 при отпускании)
	begin
		#50 C = 1'b0;
		#50 C = 1'b1;
		#1;
	end
endtask

initial begin
	$dumpfile("lab1_v3.vcd");
	$dumpvars(0, tb_lab1_v3);
	seq[0]=2; seq[1]=2; seq[2]=1; seq[3]=3; seq[4]=2; seq[5]=3; seq[6]=1; seq[7]=3;

	// В момент 0 переход C: x->1 симулятор считает фронтом. На плате его нет,
	// поэтому задаём состояние после включения питания явно.
	#10 dut.b2v_inst.Q = 4'b0000;
	#1;
	$display(" такт | Q[3:0] | Y[2:0] | y | ожид.");
	for (i = 0; i < 16; i = i + 1) begin
		y_val = decode(Y);
		$display(" %4d |  %b  |  %b   | %0d |  %0d    %s", i, dut.Q, Y, y_val, seq[i%8],
		         (y_val == seq[i%8]) ? "OK " : "ERR");
		if (y_val != seq[i%8]) errors = errors + 1;
		press;
	end

	// проверка самокоррекции: недопустимое состояние 0101 -> 0000
	dut.b2v_inst.Q = 4'b0101; #1;
	press;
	if (dut.Q !== 4'b0000) begin
		$display("Самокоррекция: ОШИБКА, Q=%b", dut.Q); errors = errors + 1;
	end else
		$display("Самокоррекция: 0101 -> %b OK", dut.Q);

	if (errors == 0) $display("ТЕСТ ПРОЙДЕН");
	else             $display("ТЕСТ НЕ ПРОЙДЕН, ошибок: %0d", errors);
	$finish;
end
endmodule
