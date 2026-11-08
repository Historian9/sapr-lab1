#!/bin/sh
# Функциональное моделирование в Icarus Verilog
cd "$(dirname "$0")"
iverilog -g2005 -o tb_lab1_v3.vvp tb_lab1_v3.v ../lab1_v3_top.v ../johnson4.v ../rsp.v && vvp -n tb_lab1_v3.vvp
