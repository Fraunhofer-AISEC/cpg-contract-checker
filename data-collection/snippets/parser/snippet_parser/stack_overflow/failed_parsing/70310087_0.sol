thatguyintech@albert chainrunners % npx hardhat compile
Compiling 5 files with 0.8.4
Warning: Unused local variable.
   --> contracts/ChainRunnersBaseRenderer.sol:232:124:
    |
232 |  ... kenPalettes, uint8 numTokenLayers, string[NUM_LAYERS] memory traitTypes) = getTokenData(_dna);
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: Contract code size exceeds 24576 bytes (a limit introduced in Spurious Dragon). This contract may not be deployable on mainnet. Consider enabling the optimizer (with a low "runs" value!), turning off revert strings, or using libraries.
  --> contracts/ChainRunnersBaseRenderer.sol:48:1:
   |
48 | contract ChainRunnersBaseRenderer is Ownable, ReentrancyGuard {
   | ^ (Relevant source part starts here and spans across multiple lines).
