pragma solidity ^0.4.18;

contract SupportPay4 {

    function() public payable {

    }

    function deposit() public payable {

    }

    function withdraw() public {
        msg.sender.transfer(getBalance());
    }

    function withdraw2() public {
        msg.sender.transfer(address(this).balance);
    }

    function getBalance() public constant returns(uint256) {
        return address(this).balance;
    }
}
