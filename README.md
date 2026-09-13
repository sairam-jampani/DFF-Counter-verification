# D-Flip Flop & Counter Design with Assertion Verification

<p align="left">
  <img src="https://img.shields.io/badge/Design-Verilog-blue.svg" alt="Design Language">
  <img src="https://img.shields.io/badge/Verification-Verilog-blueviolet.svg" alt="Verification Language">
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado%202020.1-orange.svg" alt="Tool">
  <img src="https://img.shields.io/badge/Design%20Flow-Front--End-brightgreen.svg" alt="Flow">
</p>

---

## 📖 Design Description

### D Flip-Flop
The D Flip-Flop captures the input data (D) on every positive edge of the clock and stores it at the output (Q).

### 4-Bit Counter
The counter increments its value on every positive clock edge and resets to zero when reset is asserted.

### Verification Strategy
The verification testbench performs:
* D Flip-Flop functionality check
* Counter increment verification
* Counter reset verification
* Automated pass/fail reporting

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

## 📂 Project Structure

The project structure is organized as follows:

```text
VLSI-Project-03-DFF-Counter-Verification
|
├── dff.v
├── counter.v
├── top.v
├── top_tb.v
├── screenshots
│   ├── project_structure.png
│   ├── rtl_design.png
│   ├── testbench.png
│   ├── waveform.png
│   └── pass_report.png
|
└── README.md
