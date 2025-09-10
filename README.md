# 8-bit ALU (Arithmetic Logic Unit) in Verilog

## 📌 Project Overview
This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog HDL.  
The ALU performs a variety of arithmetic and logical operations on two 8-bit inputs (`a`, `b`) based on a 4-bit opcode.  

It also generates status **flags** to indicate conditions such as **carry, parity, zero, and sign**.

---

## ⚙️ Features
- **Arithmetic Operations**
  - Addition
  - Subtraction
  - Increment
  - Decrement
  - Two’s Complement

- **Logical Operations**
  - AND
  - OR
  - XOR
  - NOT
  - NAND
  - NOR
  - XNOR

- **Shift and Rotate**
  - Left Shift
  - Right Shift
  - Rotate Right

- **Comparison**
  - Compare two numbers (sets flags, no output will be stored)

---

## 🔑 Opcode Table

| Opcode | Operation       | Description                        |
|--------|----------------|------------------------------------|
| 0000   | ADD            | a + b                            |
| 0001   | SUB            | a - b                            |
| 0010   | AND            | a & b                            |
| 0011   | XOR            | a ^ b                            |
| 0100   | OR             | a | b                           |
| 0101   | NOT            | ~a                               |
| 0110   | SHIFT RIGHT    | a >> 1                           |
| 0111   | SHIFT LEFT     | a << 1                           |
| 1000   | INCREMENT      | a + 1                            |
| 1001   | DECREMENT      | a - 1                            |
| 1010   | NAND           | ~(a & b)                         |
| 1011   | NOR            | ~(a \| b)                        |
| 1100   | XNOR           | ~(a ^ b)                         |
| 1101   | COMPARE        | Compare `a` and `b` (flags only)   |
| 1110   | TWO'S COMP     | Two’s complement of `a`            |
| 1111   | ROTATE RIGHT   | Rotate right by 1 bit              |

---

## 🚩 Flag Descriptions
The ALU outputs a **4-bit flag register**:

| Flag Bit | Name   | Description                               |
|----------|--------|-------------------------------------------|
| `flag[0]` | Carry  | Carry (or borrow) indicator              |
| `flag[1]` | Parity | 1 if even parity in result               |
| `flag[2]` | Zero   | 1 if result is `0`                       |
| `flag[3]` | Sign   | 1 if result is negative (MSB = 1)        |

---
