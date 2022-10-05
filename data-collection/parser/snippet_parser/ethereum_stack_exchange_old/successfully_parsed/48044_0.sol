pragma solidity ^0.4.19;

contract ContractSendTo {

    function deposit() public payable {

    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }
}

contract ContractSendFrom {
    ContractSendTo contractSendTo;
    constructor(address sendTo) public {
        contractSendTo = ContractSendTo(sendTo);
    }

    function depositToSendTo() public payable {
        contractSendTo.deposit.value(msg.value);   
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }
}
