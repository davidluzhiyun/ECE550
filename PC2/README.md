# PC1
Name: David Lu

NetID: zl303

addsub-base

For this project checkpoint, I have implemented a basic ALU that adds two 32 bit 2's compliment integers together when opcode is  00000 and subtract the latter number from the former when opcode is 00001.

For implementing the opcode, I used a 32:1 mux for 32-bit inputs. To build it, I went from a 2:1 mux using ternary ternary operator, to a 4:1 mux, to a 16:1 mux to a 32:1 mux using the method we practiced in the summer short course.

The adder/subtractor's add-subtract digit is connected to the last digit of the opcode. I followed the design on page 53 of slides 03. The 32-bit adder I used was the 32-bit Carry Select Adder described on page 49 modified to have overflow included. The CSA is build from 3 16-bit RCAs built from full adders. the RCAs have overflower detection implemented according to page 26. The RCA is built from full adders implemented using the design in recitation 2. 

Due two how Quartus handles testing, there are a lot of duplicate files. The ALU folder contains the submitted versions for the assignments. The testbenches for each part are in there respective folder

The zip contains the composed project so far without the testbench

# Complete ALU
SLL and SRA are implemented according to the slides. 

For less than, I mainly test if the subtraction is negative. After examining possible overflow cases, I found that this isn't sufficient when A is negative and B is possitive, which could overflow and give a seeminly positive result even though A < B. Therefore I test for ((A-B) < 0 || (A < 0 && B >= 0)) && !(A >= 0 && B < 0). To achieve this, I look at the first bit for each number.

For NotEqual, I test if A-B is 0 without overflow. I achieve this by iteratively or-ing together each bit of the result, then pass it through an or gate with the overflow bit