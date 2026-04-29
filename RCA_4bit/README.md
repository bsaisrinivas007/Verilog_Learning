 ## 4-Bit Ripple Carry Adder (RCA)


A Verilog implementation of a 4-bit Ripple Carry Adder. This project demonstrates modular RTL design, hierarchy, and automated self-checking verification using a golden reference model.


## 📌 Project Overview

The Ripple Carry Adder (RCA) is a combinational circuit that performs binary addition of two 4-bit numbers. It is built by chaining 1-bit Full Adders, where the carry output of each stage "ripples" as the carry input for the next significant bit.


## 📂 Directory Structure

```text

.

├── full_adder/

│ └── full_adder.v # 1-bit Full Adder primitive (Required)

├── RCA_4bit/

│ ├── rca_4bit.v # Top-level structural module

│ ├── tb_rca_4bit.v # Self-checking testbench

│ └── README.md # Documentation
```
## Design Details
Modularization: Reuses a 1-bit full_adder as the base component.
Hierarchy: The rca_4bit module instantiates four full_adder blocks (fa0 to fa3).  

Carry Propagation: Internal wires (c1, c2, c3) are used to propagate the carry bit from the LSB to the MSB.  

File Dependency: The top-level module uses the `include directive to pull in the Full Adder definition from the parent directory.

1-bit full adder file is used in this code. if you want to run this code, download full_adder project entirely and save it in the same directory as current project or just download full_adder.v and modify first line of tb_rca_4bit.v with the current path i.e: "`include "../RCA_4bit/full_adder.v" . I have named this folder as RCA_4bit . 

## Verification method

The project features a Self-Checking Testbench (tb_ripple_carry_adder) to ensure logic accuracy:  

    Exhaustive Testing: Iterates through 256 combinations (all 16 values of A multiplied by all 16 values of B).  

     Uses a reference (expected = A + B + Cin) for validation.  

     Comparison: Employs the case-equality operator (===) to compare the concatenated actual result {Cout, Sum} against the golden reference, detecting any X (unknown) or Z (high impedance) states.  

    Automated Logging: Prints a "PASS" or "FAIL" status for every test vector directly to the terminal.
## How to Run

1. **Compile**: `iverilog -o rca_sim.vvp rca_4bit.v tb_rca_4bit.v`

2. **Execute**: `vvp rca_sim.vvp`

3. **View Waves**: `gtkwave rca_test.vcd`


