#Caesar Cipher Encryption/Decryption Program
This repository contains an 8086 assembly language program that implements the Caesar Cipher technique for encrypting and decrypting text.FeaturesEncryption: Encrypts a given string using a user-defined key.Decryption: Decrypts an encrypted string back to its original form using the same key.User-Friendly Menu: Provides a simple menu for choosing between encryption, decryption, or exiting the program.Case Preservation: Handles both uppercase and lowercase letters, preserving their original case.Non-Alphabetic Character Handling: Non-alphabetic characters (numbers, symbols, spaces) are copied as is without modification.How it Works (Caesar Cipher)The Caesar Cipher is one of the simplest and most widely known encryption techniques. It's a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on.In this program:The KEY determines the shift value.For encryption, the key is added to the character's alphabetical position (modulo 26 for wrap-around).For decryption, the key is subtracted from the character's alphabetical position (modulo 26 for wrap-around, handling negative results by adding 26).RequirementsTo assemble and run this program, you will need an 8086 assembler and emulator, such as:MASM (Microsoft Macro Assembler)DOSBox (for running the compiled executable in a DOS environment)UsageAssemble the code:Use MASM to assemble the Project.asm file:MASM Project.asm;
Link the object file:Link the generated object file to create an executable:LINK Project.obj;
Run the executable:Execute the program in a DOS environment (e.g., DOSBox):Project.exe
Example Interaction:--------------------------------------------------------------------------------
          Text Encryption and Decryption Using Caesar Cipher Technique
                        Hafiz Muhammad Saad & Faiqa Riaz
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 1
Enter a string to encrypt/decrypt: Hello World
Enter key (0-9): 3
Encrypted string is: KHOOR ZRUOG
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 2
Enter a string to encrypt/decrypt: KHOOR ZRUOG
Enter key (0-9): 3
Decrypted string is: HELLO WORLD
--------------------------------------------------------------------------------
Choose operation:
1. Encrypt
2. Decrypt
3. Exit
Enter choice: 3
Code StructureThe Project.asm file is structured into the following main sections:.MODEL SMALL, .STACK 100H, .DATA, .CODE: Standard assembly program setup.Data Segment (.DATA): Defines messages, input/output buffers, and variables for string length and key.Code Segment (.CODE):MAIN PROC: The main procedure that displays the menu and calls the respective encryption/decryption routines based on user input.INPUT_STRING PROC: Handles user input for the string to be processed and the encryption/decryption key.ENCRYPT PROC: Implements the Caesar cipher encryption logic. It iterates through the input string, shifts alphabetic characters by the KEY value, and stores the result.DECRYPT PROC: Implements the Caesar cipher decryption logic, reversing the encryption process.DISPLAY_RESULT PROC: Displays the final encrypted or decrypted string.AuthorsHafiz Muhammad SaadFaiqa Riaz
