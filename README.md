# Candy-Crush-Game-in-Assembly-Language
This repository contains a Candy Crush game implemented in assembly language. The game is inspired by the popular mobile puzzle game, where players match colorful candies to achieve high scores and complete levels.

# Game Features
* Colorful and engaging graphics.
* Multiple levels with increasing difficulty.
* Score tracking to keep track of player performance.
* Special candies with unique abilities.
* Interactive gameplay with user input.
# Requirements
To run and play the Candy Crush game, you'll need the following:

* DOSBox: An x86 emulator with DOS for running assembly language programs.
* MASM (Microsoft Macro Assembler): An assembler for x86 processors.
# Getting Started
To get started with the Candy Crush game, follow these steps:

Mount the project directory in DOSBox. For example, if your project is located in the candy-crush-assembly directory:

bash
Copy code
mount C /path/to/candy-crush-assembly
Change to the mounted directory:

bash
Copy code
C:
cd candy-crush-assembly
Assemble the source code using MASM:

bash
Copy code
masm candy_crush.asm;
Link the object file using the Microsoft Linker (LINK):

bash
Copy code
link candy_crush.obj;
Run the game:

bash
Copy code
candy_crush.exe
Enjoy playing the Candy Crush game!

# Contributing
Contributions to the Candy Crush game are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.
