# 🚁 Modeling and Simulation of Helio-Crane

This repository contains MATLAB scripts and Simulink models for the **modeling, analysis, optimization, and validation of a helio-crane system** — a laboratory model that simulates a semi-helicopter mechanism.

---

## 🎯 Project Objectives

The primary goals of this project include:

- Building a robust **nonlinear mathematical model** using Lagrangian mechanics
- Optimizing parameters using **real-world experimental data**
- Analyzing **static and dynamic characteristics**
- Deriving **linearized models** at chosen operating points
- Validating the final model using **actual device responses**

---

## 🧠 Methodology Overview

1. **Nonlinear Dynamic Modeling**  
   Developed using **Lagrange’s equations**, accounting for:
   - Inertia  
   - Damping  
   - Gravitational forces  
   - External disturbances  

2. **Static Characteristic Analysis**  
   Investigated the steady-state input-output behavior to identify:
   - Dead zones  
   - Saturation behavior  

3. **Parameter Optimization**  
   Used MATLAB’s `fminsearch` and an objective function to minimize simulation error.

4. **Model Linearization**  
   Applied MATLAB’s `linmod` to linearize the nonlinear model around operating points (e.g., DT = 5 and DT = 6).

5. **Validation via Random Excitation**  
   Compared model output to actual system responses using:
   - **Sum of squared errors** (`J_kon`)  
   - **Theil index** (forecast accuracy)

---

## 📁 Repository Structure

### `Helikopter/` – Core Models and Scripts

#### MATLAB Scripts

| Script | Description |
|--------|-------------|
| `Linear.m` | Linearizes `modelX2.slx`, compares linear vs. nonlinear responses. |
| `NelinearniModel.m` | Simulates the nonlinear model `modelX.slx` with predefined parameters. |
| `Optimizacija.m` | Main optimization script using `fminsearch`. |
| `objectiveFunction.m` | Objective function used in optimization. |
| `Primerjava.m` | Compares nonlinear model response with real system (`realnasim.mat`, `modelrez.mat`). |
| `TestRealneNaprave.m` | Simulates the real system (`RealniSistem.slx`) for step input. |

#### Simulink Models

| Model | Purpose |
|-------|---------|
| `modelX.slx` | Main nonlinear dynamic model. |
| `modelX2.slx` | Model used for linearization. |
| `StatKarakteristika.slx` | Plots static characteristic (voltage vs. angle). |
| `RealniSistem.slx` | Simulates behavior of the actual system. |
| `LinearniModeliDT.slx` | Compares linearized model behaviors. |

#### Data Files

| File | Description |
|------|-------------|
| `modelrez.mat` | Output from nonlinear model simulation. |
| `realnasim.mat` | Recorded real system output data. |

---

### `Heliocrane_Tekma/` – Final Evaluation and Testing

| File | Description |
|------|-------------|
| `preberi me.txt` | Folder-specific notes (Slovenian: "read me"). |
| `odziv.slx` | Simulates real system response under a predefined excitation. |
| `signali.mat` | Contains input/output signals from the real device. |
| `tekmamodel.slx` | Model used in final comparison. |
| `vrednotenje.slx` | Evaluates model vs. real system using random signals. |
| `zag.m` | Generates random excitation signals and saves `signali.mat`. |
| `zag_vred.m` | Final script to validate model against recorded responses. |
| `theil_tic.m` | Computes Theil index between simulation and real data. |
| `Tekma.png` | Plot comparing model vs. real signal (used in results section). |

---

## 🚀 Running the Project

### 1. (Optional) Generate Real System Data

To generate new input/output data for validation:

```matlab
zag; % Saves 'signali.mat'
````

### 2. Perform Final Model Validation

Before running the validation:

* Open `vrednotenje.slx`
* Replace the model block with your model (e.g., `tekmamodel.slx`)

Then run:

```matlab
zag_vred;
```

---

## 📊 Example Results

From the final model evaluation using random excitation signals:

```matlab
J_kon =
    2.6933

Theilov_indeks =
    0.0137
```

These values indicate **excellent model accuracy**:

* **`J_kon`**: Total squared error between simulated and actual response
* **Theil index**: Forecasting accuracy — values near 0 indicate high predictive precision

📌 Visuals are available on the next plot:

(Heliocrane - Tekma/Tekma.png)

---

## ✅ Conclusion

* The developed **nonlinear model** effectively captures the dynamics of the helio-crane system.
* **Optimization** led to a model that closely matches real-world behavior.
* **Linearized models** offer useful simplifications for control design within small variations.
* Future work can include **friction modeling** to improve performance during transients and low inputs.

---

**Authors**: David Blazheski, Teodora Trajkova, Ivana Kerkez
**Institution**: Faculty of Electrical Engineering, University of Ljubljana  
**Program**: 1st Year MSc – Control Systems and Computer Engineering
**Course**: Modeling Methods



