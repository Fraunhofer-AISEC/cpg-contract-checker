pragma solidity ^0.4.18;

contract SupportPay4 {

    function() public payable {

    }

    function deposit() public payable {

    }

    function withdraw() public {
        msg.sender.transfer(getBalance());
    }

    function withdraw2(address addr) public {
        addr.transfer(getBalance());
    }

    function getBalance() public constant returns(uint256) {
        return address(this).balance;
    }
}
