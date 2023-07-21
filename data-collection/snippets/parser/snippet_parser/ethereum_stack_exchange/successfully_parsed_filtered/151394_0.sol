interface contractB {
 function called() external returns(uint);
}

contract contractA {
 function callContractB(address addressOfContractB) view external {
   uint res = contractB(addressOfContractB).called();
 }
}
