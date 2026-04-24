# Half Adder - Verilog Design & Verification

This project implements a basic 1-bit Half Adder in Verilog. 

## Tools Used
* **Language:** Verilog
* **Simulator:** Icarus Verilog
* **Waveform Viewer:** GTKWave
* **OS:** Ubuntu 24.04

## Verification
The design was verified using a testbench (`tb_half_adder.v`) that checks all binary combinations (00, 01, 10, 11).

## How to Simulate
1. Compile: `iverilog -o ha_sim half_adder.v tb_half_adder.v`
2. Run: `vvp ha_sim`
3. View: `gtkwave half_adder_sim.vcd`