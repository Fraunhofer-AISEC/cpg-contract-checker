pragma solidity ^0.6.0;

contract SplitPot {
  address payable[] beneficiaries = [
    0x498898b3F52DAba1bB304a4b4D2EA31a111484B1,
    0xAcb19c763EB67ea757Efd8Cd8b6ecceb28F1284B,
    0xD5d3f3650C4DdE7B8034671129443A596Ce8ed57
  ];

  receive() external payable {
    uint individualAmount = msg.value / beneficiaries.length;

    for (uint i = 0; i < beneficiaries.length; i++) {
      beneficiaries[i].transfer(individualAmount);
    }
  }
}
