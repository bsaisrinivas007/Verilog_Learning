# 1-bit Full Adder Design & Verification

This folder contains the Verilog implementation and testbench for a **1-bit Full Adder**. Unlike a Half Adder, this design includes a Carry-In ($C_{in}$) input, allowing it to be cascaded for multi-bit addition.

## 🛠 Design Specifications
- **Modeling Style:** Dataflow Modeling (Gate-Level)
- **Inputs:** `a`, `b`, `cin` (1-bit each)
- **Outputs:** `sum`, `cout` (1-bit each)

### Boolean Equations
- **Sum:** $A \oplus B \oplus C_{in}$
- **Carry-Out:** $(A \cdot B) + (C_{in} \cdot (A \oplus B))$

## 📊 Truth Table
| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## 🚀 Verification Environment
The design was verified using **Icarus Verilog** for simulation and **GTKWave** for waveform analysis on **Ubuntu 24.04**.

### Simulation Steps
1. **Compilation:**
   ```bash
   iverilog -o full_adder_sim full_adder.v tb_full_adder.v
2. Run: `vvp full_adder_sim`
3. View: `gtkwave full_adder_sim.vcd`