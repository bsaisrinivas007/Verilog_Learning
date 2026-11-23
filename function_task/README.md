# Verilog Function & Task Demonstration (`xor_reg`)

A minimal, self-checking Verilog project demonstrating the practical difference between **functions** (zero-time combinational logic/reference models) and **tasks** (time-consuming, clock-synchronized testbench procedures) using a 4-bit registered XOR design.

---

## Project Structure

```text
function_task/
├── xor_reg.v       # Synthesizable 4-bit registered XOR module (DUT)
├── tb_xor_reg.v    # Self-checking testbench using a function & task
├── .gitignore      # Git ignore rules for simulation artifacts
└── README.md       # Project documentation
```

---

## Concepts Covered

| Construct | Purpose in This Project | Timing Behavior |
| :--- | :--- | :--- |
| **`function` (`expected_xor`)** | Acts as a golden reference model to compute `x ^ y`. | Executes in **0 ns** (cannot contain `#`, `@`, or `wait`). |
| **`task` (`apply_and_check`)** | Drives test vectors on `@(posedge clk)`, waits for the registered output, and verifies `y_dut` against `expected_xor`. | Consumes **simulation time** across clock edges. |

---

## Prerequisites

* **Icarus Verilog (`iverilog` & `vvp`)** – for compiling and running the simulation
* **GTKWave** – for viewing `.vcd` waveform dumps

Install on Ubuntu/Debian:
```bash
sudo apt update && sudo apt install -y iverilog gtkwave
```

---

## How to Run

### 1. Compile the Design and Testbench
```bash
iverilog -o func xor_reg.v tb_xor_reg.v
```

### 2. Run the Simulation
```bash
vvp func
```

#### Expected Console Output
```text
[PASS] t=36000  | 1010 ^ 1100 = 0110
[PASS] t=56000  | 0101 ^ 0101 = 0000
[PASS] t=76000  | 1111 ^ 0011 = 1100
tb_xor_reg.v:76: $finish called at 96000 (1ps)
```
*(Note: With `` `timescale 1ns / 1ps ``, `$time` reports in picoseconds, so `36000` equals `36 ns`.)*

### 3. View Waveforms in GTKWave (Optional)
Ensure `$dumpfile("xor_wave.vcd");` and `$dumpvars(0, tb_xor_reg);` are included in the `initial` block of `tb_xor_reg.v`, re-run `iverilog` and `vvp`, then launch GTKWave:
```bash
gtkwave xor_wave.vcd
```
---

## License

This project is open-source and free to use for learning and reference.