# D-Flip Flop & Counter Design with Assertion Verification

<p align="left">
  <img src="https://img.shields.io/badge/Design&Verification-Verilog-blue.svg" alt="Design Language">
  
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado%202020.1-orange.svg" alt="Tool">
  <img src="https://img.shields.io/badge/Design%20Flow-Front--End-brightgreen.svg" alt="Flow">
</p>

---

## 📖 Project Description
This project implements a foundational digital Counter built upon D-Flip Flops (DFF). The core hardware modules are designed in **Verilog HDL**, while the verification environment utilizes advanced **SystemVerilog Assertions (SVA)**. Assertions are critical in modern verification flows to continuously monitor temporal behaviors and immediately flag illegal states. This repository demonstrates how to bind assertions to a design to automatically verify reset sequences, enable toggles, and sequential counting logic.

---

## ⚙️ Target Hardware & Device Specifications

* **Target FPGA Device:** `xc7a100tcsg324-1`

| Component | Nomenclature | Technical Meaning |
| :--- | :--- | :--- |
| **`xc7a`** | Family Architecture | **Xilinx Artix-7 Series** (Optimized for low power and high performance). |
| **`100t`** | Logic Capacity | **100K Logic Cells** (~101,440 logic cells). |
| **`csg324`** | Package Type | **Chip Scale BGA (CSG) Package with 324 Pins**. |
| **`-1`** | Speed Grade | **Speed Grade -1** (Standard performance grade). |

---

## 🚀 Features
The design incorporates synchronous logic and enabling controls, monitored by temporal assertions:

| Signal / Flag | Functionality |
| :--- | :--- |
| `clk` | **Global Clock:** Synchronizes all DFF state transitions. |
| `rst` | **Active-High Reset:** Initializes the counter and flip-flops to zero. |
| `en` | **Enable:** Allows the counter to increment on the positive clock edge when asserted. |
| `d` / `q` | **DFF I/O:** The data input and latched output for individual flip-flop instances. |
| `count` | **Counter Output:** The multi-bit output bus displaying the current state of the counter. |

---

## 📂 Project Files & Design Hierarchy

The design follows a structural hierarchy where the top-level counter instantiates individual DFF modules.

```text
📁 rtl/
 ├── counter_top.v       # Top-level Counter Design
 └── dff.v               # Base D-Flip Flop Module (Instantiated in Top)
📁 sim/
 └── counter_tb.sv       # SystemVerilog Testbench with Assertions (SVA)
