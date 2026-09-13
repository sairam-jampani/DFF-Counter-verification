# D-Flip Flop & Counter Design with Assertion Verification

<p align="left">
  <img src="https://img.shields.io/badge/Design-Verilog-blue.svg" alt="Design Language">
  <img src="https://img.shields.io/badge/Verification-SystemVerilog%20(SVA)-blueviolet.svg" alt="Verification Language">
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

**Directory Structure:**
> 📁 `rtl/`
>  ├── `counter_top.v` (Top-level Counter Design)
>  └── `dff.v` (Base D-Flip Flop Module)
>
> 📁 `sim/`
>  └── `counter_tb.sv` (SystemVerilog Testbench with SVA)

**Design Hierarchy Structure:**
* `counter_top`
  * `dff_inst_0` (LSB Flip-Flop)
  * `dff_inst_1`
  * `dff_inst_2`
  * `dff_inst_3` (MSB Flip-Flop)

---

## 🛠️ Tools Used
* **Verilog HDL** (Design)
* **SystemVerilog Assertions - SVA** (Verification)
* **Xilinx Vivado 2020.1**
* **Behavioral Simulation** (Vivado XSim)

---

## 🔄 Design & Verification Flow
1. **Design Code (RTL):** Development of the structural counter using instantiated Verilog DFF modules.
2. **Testbench Code (SVA):** Creation of a robust SystemVerilog testbench defining temporal assertions (e.g., `assert property (@(posedge clk) en |=> count == $past(count) + 1)`).
3. **RTL Synthesis & Schematic:** Compiling the RTL code in Xilinx Vivado to generate a hardware schematic showing flip-flop allocation.
4. **Simulation Waveform:** Executing the testbench to visually and automatically verify sequential transitions.

---

## 🧪 Simulation Results

The testbench systematically applies scenarios while SVAs run concurrently in the background:

| Test Scenario | SVA Rule Checked | Verification Status |
| :--- | :--- | :--- |
| **System Reset** | If `rst == 1`, then `count == 0` on the next clock. | Pass |
| **Normal Count** | If `en == 1`, then `count` increments by 1. | Pass |
| **Hold State** | If `en == 0`, then `count` remains unchanged. | Pass |
| **Overflow Roll-over** | If `count == MAX`, then next `count == 0`. | Pass |

**All assertions and corner cases were successfully verified through behavioral simulation.**

### RTL Schematic
![RTL Schematic](schematic.png)

*> Displays the elaborated design showing the DFF instances wired to create the counter logic.*

### Waveform Analysis
![Simulation Waveform](waveform.png)

**Understanding the Waveform:**
The simulation waveform visually confirms the sequential logic and timing. 
* **`clk`:** The driving clock for the DFFs.
* **`rst` & `en`:** Control signals dictating initialization and counting states.
* **`count`:** The resulting bus value incrementing predictably.

*Example:* As shown in the simulation, when `en` is pulled low, the `count` bus immediately holds its previous value across multiple clock cycles, perfectly satisfying the written assertion rules.

### TCL Console Output
![TCL Console Output](tcl_console.png)

**Understanding the TCL Console & Assertions:**
The Vivado TCL console is crucial for Assertion-Based Verification. It captures the real-time execution logs of the SystemVerilog assertions.
* **Automated Checking:** Instead of manually tracing waveforms, the TCL console prints explicit **Pass/Fail** messages generated by the SVA `assert property` blocks.
* **Error Catching:** If an illegal state occurs (e.g., the counter fails to increment when `en` is high), the console immediately throws an assertion violation error, pinpointing the exact simulation time of the failure.

---

## 🎯 Learning Objectives
* Implementing structural digital logic using module instantiation in Verilog.
* Understanding sequential design elements, specifically D-Flip Flops and synchronous counters.
* Writing and binding **SystemVerilog Assertions (SVA)** to monitor concurrent temporal behavior.
* Utilizing the Vivado TCL console to track automated pass/fail verification metrics.

---

## 📫 Connect with Me
- **GitHub:** [github.com/sairam-jampani](https://github.com/sairam-jampani)
- **LinkedIn:** [linkedin.com/in/sai-ram-jampani04](https://www.linkedin.com/in/sai-ram-jampani04/)

<br>

⭐ *If you found this project useful, consider giving it a star.*
