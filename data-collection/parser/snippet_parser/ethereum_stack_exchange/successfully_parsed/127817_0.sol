
pragma solidity 0.8.1;

contract Crowdfund {
    uint fundLimit = 3 ether;
    bool contractOpen = true;

    function donate() external payable { 
        require(contractOpen, "Contract has stopped recieving funds");
        require(address(this).balance + msg.value <= fundLimit, "Can't send specified amount");
    }
}
