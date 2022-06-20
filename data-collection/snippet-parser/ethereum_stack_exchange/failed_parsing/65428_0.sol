pragma solidity 0.5.7;

contract A_bin {
  bytes internal constant A_bytecode = abi.encodePacked(
    uint8 (0x60), uint8 (0x60), uint8 (0x60), uint8 (0x40),
    uint8 (0x52), uint8 (0x60), uint8 (0x40), uint8 (0x80),
    uint8 (0x51), uint8 (0x90), uint8 (0x81), ...);
}
