# RISC-V Single-Core Processor

> Because sometimes buying a processor is too easy — so I built one from scratch in Verilog.

A single-cycle **RISC-V RV32I** processor implemented in Verilog.  
Designed to demonstrate the fundamental concepts of processor architecture — from instruction fetch to write-back — in a clean, modular HDL implementation.

---

## 🚀 Features
- Implements the **RV32I** base integer instruction set
- **Single-cycle architecture**: one instruction executed per clock cycle
- Modular design: ALU, Control Unit, Register File, Memory units, and supporting modules
- Verified using dedicated **testbenches** for each core component and the top-level design

---

## 🧠 Architecture Overview
The CPU follows the classic single-cycle datapath:

1. **Instruction Fetch** – Retrieve the instruction from memory  
2. **Decode** – Interpret the instruction and identify required operations  
3. **Execute** – Perform arithmetic, logic, or address calculation via the ALU  
4. **Memory Access** – Load or store data if required  
5. **Write Back** – Save results to the register file  

This flow is completed within **a single clock cycle**.

---

## 🎯 Future Enhancements
- Extend to a **5-stage pipelined architecture** for improved throughput
- Implement the **RV32M** extension for multiplication/division support
- Synthesize and deploy on FPGA hardware for real-world testing
