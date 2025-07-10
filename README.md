# Caesar Cipher Encryption/Decryption Program

This repository contains an 8086 assembly language program that implements the Caesar Cipher technique for encrypting and decrypting text.

![Encryption](https://github.com/itzsaad09/Text-Encryption-and-Decryption/blob/d5711cbb8d3d14befe7eca627c5b1a563d316d43/Encryption.png)<br/><br/>
![Decryption](https://github.com/itzsaad09/Text-Encryption-and-Decryption/blob/d5711cbb8d3d14befe7eca627c5b1a563d316d43/Decryption.png)<br/><br/>

## Features
- **Encryption:** Encrypts a given string using a user-defined key.
- **Decryption:** Decrypts an encrypted string back to its original form using the same key.
- **User-Friendly Menu:** Provides a simple menu for choosing between encryption, decryption, or exiting the program.
- **Case Preservation:** Handles both uppercase and lowercase letters, preserving their original case.
- **Non-Alphabetic Character Handling:** Non-alphabetic characters (numbers, symbols, spaces) are copied as is without modification.

## How it Works (Caesar Cipher)
The Caesar Cipher is one of the simplest and most widely known encryption techniques. It's a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a right shift of 3, A would be replaced by D, B would become E, and so on.

In this program:
- The KEY determines the shift value.
- For encryption, the key is added to the character's alphabetical position (modulo 26 for wrap-around).
- For decryption, the key is subtracted from the character's alphabetical position (modulo 26 for wrap-around, handling negative results by adding 26).

## Requirements
- EMU 8086
- MASM (Microsoft Macro Assembler)
- DOSBox (for running the compiled executable in a DOS environment)

## Example Interaction
--------------------------------------------------------------------------------
          Text Encryption and Decryption Using Caesar Cipher Technique
                        Hafiz Muhammad Saad & Faiqa Riaz
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 1 <br/>
Enter a string to encrypt/decrypt: Hello World <br/>
Enter key (0-9): 3 <br/>
Encrypted string is: KHOOR ZRUOG
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 2 <br/>
Enter a string to encrypt/decrypt: KHOOR ZRUOG <br/>
Enter key (0-9): 3 <br/>
Decrypted string is: HELLO WORLD
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 3

## Code Structure
The Project.asm file is structured into the following main sections:
1. .MODEL SMALL, .STACK 100H, .DATA, .CODE: Standard assembly program setup.
2. **Data Segment (.DATA):** Defines messages, input/output buffers, and variables for string length and key.
3. **Code Segment (.CODE):**
   - **MAIN PROC:** The main procedure that displays the menu and calls the respective encryption/decryption routines based on user input.
   - **INPUT_STRING PROC:** Handles user input for the string to be processed and the encryption/decryption key.
   - **ENCRYPT PROC:** Implements the Caesar cipher encryption logic. It iterates through the input string, shifts alphabetic characters by the KEY value, and stores the result.
   - **DECRYPT PROC:** Implements the Caesar cipher decryption logic, reversing the encryption process.
   - **DISPLAY_RESULT PROC:** Displays the final encrypted or decrypted string.

## Authors
👤 **Hafiz Muhammad Saad**

* Github: [@itzsaad09](https://github.com/itzsaad09)
* LinkedIn: [@itzsaad09](https://linkedin.com/in/itzsaad09)

👤 **Faiqa Riaz**

* Github: [@faiqariaz23](https://github.com/faiqariaz23)
* LinkedIn: [@faiqa-riaz](https://www.linkedin.com/in/faiqa-riaz-9a9717300/)

## Show your support

Give a ⭐️ if this project helped you!
