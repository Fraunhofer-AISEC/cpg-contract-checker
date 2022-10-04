pragma solidity ^0.5.11;

contract B {
    A a_contract_instance;
    constructor(address _a_contract_address) public {
        a_contract_instance = A(_a_contract_address);
    }
    
    function updateSomeVariableContractA(uint256 _someVariable) public{
        a_contract_instance.updateSomeVariable(_someVariable);
    }
    
    function getSomeVariableContractA() public view returns(uint256) {
        return a_contract_instance.getSomeVariable();
    }
}

interface A {
    function updateSomeVariable (uint256 _someVariable) external;
    function getSomeVariable() view external returns (uint256);
}
