# Piano Helper 

## Overview
This project implements an FPGA-based **Piano Helper**, designed to help users practice playing the piano. It features **two main modes**:  
1. **DEMONSTRATE Mode**: Plays a pre-written song to familiarize the user with the melody.  
2. **PLAY Mode**: Allows users to play piano notes using a keyboard and includes a helper game for practicing preset songs.

The system utilizes the **Pmod I2S2 audio peripheral**, **keyboard input**, and **7-segment display** to enhance the user experience.

---

## Features
✅ **FPGA-based Music Player**  
- Supports **two-track songs** (melody & accompaniment).  
- Volume control with **5 levels** and mute function.  
- **Pause and Resume** functionality.  
- Displays **current pitch** on the 7-segment display.  

✅ **PLAY Mode - Piano**  
- Users can **play piano notes** using a keyboard.  
- Supports **multiple octaves** with frequency doubling.  
- LED indicators show pressed keys.  

✅ **PLAY Mode - Helper Game**  
- A **game mode** where users follow LED prompts to press the correct keys.  
- Scores increase when the correct key is played.  
- Score displayed on the **7-segment display** (maximum score: **99**).  
- Game automatically ends when the song finishes.  

---

## Hardware Components
- 🎹 **Basys3 FPGA Board**  
- 🔊 **Pmod I2S2 (Audio Peripheral)**  
- ⌨ **Keyboard (PS/2 Interface)**  
- 💡 **LED Indicators**  
- 🖥 **7-Segment Display**  

---

## Usage Instructions

### 1. Setup the FPGA Board
- Connect **Pmod I2S2** to **Pmod JB (1~6)**.  
- Ensure keyboard is connected via **PS/2 port**.  

### 2. Control Inputs
| Control | Function |
|---------|----------|
| **BtnC** | Reset (Restores volume & song position) |
| **BtnU / BtnD** | Volume Up/Down |
| **SW 0** | Play/Pause (DEMONSTRATE Mode) |
| **SW 1** | Start/Exit (Helper Game Mode) |
| **SW 14** | Mute/Unmute |
| **SW 15** | Mode Selection (PLAY / DEMONSTRATE) |

### 3. Compile and Upload
- Use **Xilinx Vivado** to synthesize and deploy the Verilog code.  
- Generate the **bitstream file** before running the system.  

---

## Demo Videos
-  **[DEMONSTRATE Mode](https://drive.google.com/file/d/1fbK7VP5CQd9UiO8GVM3RbkbPEZgwtIvU/view?usp=drive_link)**
- **[PLAY Mode – Piano](https://drive.google.com/file/d/1sfUgPyAfgKDwnTOFgm_LtpILw3IJyjnC/view?usp=drive_link)**
-  **[PLAY Mode – Helper Game](https://drive.google.com/file/d/1FN5l7aK-tUZ0Fyf6gFYr0syz9oRKjI6U/view?usp=drive_link)**  

---

