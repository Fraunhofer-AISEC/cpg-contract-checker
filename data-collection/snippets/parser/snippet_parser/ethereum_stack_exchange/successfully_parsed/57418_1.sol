contract Caller {
     uint public myVariable = 6;
     uint public testVar = 88;

     function delegatecallExample(address _contract, uint newVar) public {
         _contract.delegatecall(bytes4(keccak256("updateMyVariable(uint256)")), newVar);
     }

}
