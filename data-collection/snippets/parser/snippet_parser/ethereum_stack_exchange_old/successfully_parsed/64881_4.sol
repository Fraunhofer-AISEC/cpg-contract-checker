function delegatedCalculation(uint firstNumber, uint secondNumber) public {
        (bool status,) = c2.delegatecall(abi.encodePacked(bytes4(keccak256("calculate(uint256,uint256)")), firstNumber, secondNumber));
}
