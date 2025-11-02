# Exercise 11 – FIR Filter Types (I–IV)

This exercise plots the **Magnitude**, **Phase**, and **Zero (Pole–Zero)** diagrams for four different FIR filter types (Type I–IV).  
It helps to understand how **symmetry** and **filter length** affect the FIR type and its **linear-phase** behavior.

---

## Filters Used

| Filter | Type | Description | Impulse Response |
|:-------|:------|:-------------|:----------------|
| FIR1 | Type I | Even length, symmetric | [1 2 3 4 4 3 2 1] |
| FIR2 | Type II | Odd length, symmetric | [1 2 3 4 3 2 1] |
| FIR3 | Type III | Even length, antisymmetric | [-1 -2 -3 -4 3 3 2 1] |
| FIR4 | Type IV | Odd length, antisymmetric | [-1 -2 -3 0 3 2 1] |

---

## How to Run

1. Open MATLAB.  
2. Go to the folder that contains this file and the script.  
3. Run the script:
   ```matlab ep11```
4. It will generate one figure named: ```exercise11_results.png```
