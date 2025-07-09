# Modelling and simulation of helio-crane

This repository contains MATLAB scripts and Simulink models developed for the modeling, analysis, optimization, and validation of a **helio-crane system** — a laboratory model simulating a semi-helicopter mechanism.

The primary objectives of the project are:
- To build a robust **nonlinear mathematical model**,
- Optimize model parameters using experimental data,
- Analyze both static and dynamic characteristics,
- Derive **linearized models** around selected operating points,
- And validate the model using **real-world response data**.

---

## 🧠 Project Objectives

1. **Nonlinear Dynamic Modeling**  
   The helio-crane's dynamics were modeled using **Lagrange's equations**, incorporating:
   - Inertia
   - Damping
   - Gravity
   - External disturbances

2. **Static Characteristic Analysis**  
   Investigated the steady-state output vs. input voltage to identify:
   - Nonlinearities (e.g., dead zones)
   - Saturation zones

3. **Parameter Optimization**  
   Employed MATLAB’s `fminsearch` to minimize the error 

4. **Model Linearization**  
   Used MATLAB’s `linmod` to linearize the nonlinear model (`modelX2.slx`) at different operating points (e.g., DT = 5 and DT = 6).

5. **Validation with Random Excitations**  
   Final model evaluation was conducted using **random signal inputs**, comparing the model's output to the real device's response using:
   - **Sum of squared errors** (`J_kon`)
   - **Theil index** (forecast accuracy)

---

## 📁 Repository Structure

### MATLAB Scripts (`.m`)

| Script | Description |
|--------|-------------|
| `Linear.m` | Linearizes `modelX2.slx`, compares linear and nonlinear responses. |
| `NelinearniModel.m` | Simulates the nonlinear model `modelX.slx` with hardcoded parameters. |
| `Optimizacija.m` | Main optimization script using `fminsearch` and `objectiveFunction.m`. |
| `objectiveFunction.m` | Objective function for dynamic model parameter optimization. |
| `Primerjava.m` | Compares nonlinear model vs. real device using `realnasim.mat` and `modelrez.mat`. |
| `TestRealneNaprave.m` | Simulates `RealniSistem.slx` to get real response to a step input. |
| `zag.m` | Generates excitation signal and saves response to `signali.mat`. |
| `zag_vred.m` | Final evaluation script: compares model vs. real data under random excitation. |
| `Theil_tic.m` | Computes Theil Index between model output and real response. |

### Simulink Models (`.slx`)

| Model | Purpose |
|-------|---------|
| `modelX.slx` | Main nonlinear dynamic model. |
| `modelX2.slx` | Version used for linearization. |
| `TekmaModel.slx` | Used in dynamic optimization. |
| `StatKarakteristika.slx` | Plots steady-state voltage-to-angle curve. |
| `RealniSistem.slx` | Simulates the real system behavior. |
| `LinearniModeliDT.slx` | For comparing linearized model behavior. |
| `odziv.slx` | Simulates device response under predefined excitation. |
| `vrednotenje.slx` | Evaluates your model against random input signals. |

### Data Files

| File | Description |
|------|-------------|
| `signali.mat` | Input/output data from the real system (used in optimization & validation). |
| `StaticnaNaprave.mat` | Real static characteristic data. |
| `modelrez.mat` | Nonlinear model simulation results. |
| `realnasim.mat` | Measured real system responses. |


---

## ✅ Running the Project

### 1. Generate Real System Data (Optional)

```matlab
zag; % Generates 'signali.mat'
```

### 2. Test Model on Random Inputs (Final Validation)

Before running, ensure the block in `vrednotenje.slx` is replaced with your model (e.g., `TekmaModel.slx`).

Then run:

```matlab
zag_vred;
```

---

## 📊 Example Results

From the final evaluation (random signal testing), the model produced:

```
J_kon =
    2.6933

Theilov_indeks =
    0.0137
```

These values indicate **excellent model accuracy**:
- **J_kon** reflects the total squared error between real and simulated outputs.
- **Theil index** close to 0 implies strong predictive performance.

📌 Visuals are available in `Tekma.png`.
![Model vs. Real Signal](Tekma.png)

---

## ✅ Conclusion

- The developed **nonlinear model** successfully simulates both static and dynamic behavior of the helio-crane system.
- After **parameter optimization**, the model showed **high fidelity** to real-world behavior.
- Linear models derived around fixed operating points allow simpler control design while retaining acceptable accuracy within small variations.
- Future improvements can target **friction modeling** for better transient and low-input performance.

---

**Authors**: David Blazheski, Teodora Trajkova, Ivana Kerkez  
**Institution**: Faculty of Electrical Engineering  
**Program**: I year MAG – Control systems and computer engineering 
**Course**: Modeling Methods
