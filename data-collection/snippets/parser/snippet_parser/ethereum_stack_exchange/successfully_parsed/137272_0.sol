


pragma solidity ^0.8.0;

interface IGatekeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}
contract Building  {
  IGatekeeperOne gatekeeperOne = IGatekeeperOne(0x6AdE211c87Fe3E6C1e074EFbf7C0a58BDDCbdEB1);
  event Failed(bytes reason, uint256 gas);
  function attack() public {
    uint256 initialGas = 80000;
      gatekeeperOne.enter{gas: initialGas}('0x001');
  }
}

