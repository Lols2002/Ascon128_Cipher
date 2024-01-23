<h1>ASCON128 Cipher</h1> 

The ASCON128 Cipher is a lightweight authenticated cipher that uses a key size of 128 bits, and block sizes of 64 bits.

<h2>Prequisites : </h2>
<ul>
  <li> To compile this project, you need to have a Verilog compiler on your OS (ModelSim, Icarus Verilog,..) </li>
</ul>

<h2>Description : </h2>

This project is complete and allows to cipher the value of a plain text of size 256 bits.

All the source files for this project are in the /SRC directory, the testbench files are in the SRC/BENCH directory and the source files are in the SRC/RTL directory. We use two libraries to facilitate the compilation and execution of these files, LIB_RTL and LIB_BENCH.

For more info on the logic of implementation of this cipher, I encourage you to take a look at the NIST paper that describes the cipher in detail along with it's mathematical proof.
