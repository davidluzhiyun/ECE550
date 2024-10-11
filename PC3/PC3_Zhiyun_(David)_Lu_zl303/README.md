# Regfile
Name: David Lu

NetID: zl303

For this project checkpoint, I have implemented a basic register file with 32 32-bit registers, two read port and one write port. The design is based on the 4 8-bit register file provided. Each register is built from 32 DFFEs. Register0 has its reset set to 1 so that it always contains 0 regardless of writing attempts. For the 5-to-32 decoders used, I build a design with large and gates from the truth table instead of making it from smaller decoders. This is to decrease the delay of the decoder and make the regfile more performant speed-wise.