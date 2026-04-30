# FLIP FLOPS
## SR Flip Flop
    Initially implemented SR Flip FLOP.
    file location:-
    .
    └── flip_flops/
        ├── sr_flip_flop.v      # SR Flip-Flop RTL
        ├── tb_sr_flip_flop.v   # Self-checking Testbench
        └── sr_ff_20ns.vcd      # Simulation Waveforms
    equation: Qnext= S + R&#773 . Q
    
    Truth Table:-

    | n_rst | S | R | Q | implies   | 
    |   1   | 1 | 0 | 1 | set(q=1)  |
    |   1   | 0 | 0 | Q | hold      |
    |   1   | 0 | 1 | 0 | reset(q=0)|
    |   1   | 1 | 1 | x | invalid   | 

    Verification & Simulation:-
    The design was verified using Icarus Verilog and GTKWave on a Linux environment.
    
    Simulation Parameters
        1.Clock Period: 20 ns (50 MHz).
        2.Simulation Time: 85 ns total.
    Waveform Analysis:
        1.Set: Output q transitions to high exactly at the 30 ns rising clock edge when s=1.
        2.Reset: Output q transitions to low at the 50 ns rising edge when r=1.
        3.Invalid State: When both s and r are driven high at 75 ns, the waveform correctly shows red hatching (X), representing an unknown/invalid state in hardware.

    How to Run:-
        1. **Compile**: `iverilog -o sr_sim.vvp sr_flip_flop.v tb_sr_flip_flop.v`
        2. Execute: vvp sr_sim.vvp`
        3. **View Waves**: `gtkwave sr_flip_flop_sim.vcd`
    output:
        ![Terminal Output](sr_flip_flop_terminal_output.png)
        ![GTKWave Output](sr_flip_flop_output.png)


    Next:- D flip flop
## D-Flip Flop
