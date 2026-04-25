# 2:1 Multiplexer - Dataflow Modeling

This repository contains the implementation and verification of a 2-to-1 Multiplexer (MUX) using Verilog Dataflow modeling.

## 🛠 Design Overview
The 2:1 MUX selects between two data inputs based on a single control signal. This project focuses on gate-level abstraction using continuous assignment.

### Logic Implementation
The design uses the standard Boolean equation for a 2:1 MUX:
**Out = (A & ~Sel) | (B & Sel)**

* **Inputs:** `a`, `b`, `sel`
* **Output:** `out`

## 📊 Simulation & Results
The design was verified using a testbench that cycles through all 8 binary combinations of the input signals.

### 1. Terminal Output (Truth Table)
The terminal output confirms that the logic matches the expected truth table for every combination of `sel`, `a`, and `b`.

![Terminal Verification](terminal_output.png)

### 2. GTKWave Waveform
The waveform visualization shows the signal transitions over time.

![2:1 MUX Simulation Waveform](output.png)

* **0ns - 40ns (Sel = 0):** Output follows `a`.
* **40ns - 80ns (Sel = 1):** Output follows `b`.

## 🚀 How to Run
To reproduce these results:

1. Compile: `iverilog -o mux_sim mux_2to1_df.v tb_mux_2to1.v`
2. Run: `vvp mux_sim`
3. View Waveform: `gtkwave mux_2to1_df_sim.vcd`