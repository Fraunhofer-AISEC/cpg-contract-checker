pragma solidity ^0.5.11;

contract B {
    A a_contract_instance;
    constructor(address _a_contract_address) public {
        a_contract_instance = A(_a_contract_address);
    }
    
    function callToContractA() public payable {
        a_contract_instance.updateLastFundSentToContract.value(msg.value)();
    }
    
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }
}

interface A {
    function updateLastFundSentToContract () external payable;
}
