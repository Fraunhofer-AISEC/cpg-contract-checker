pragma solidity ^0.5.0;

contract ShoeStore {
    function () external payable {

    }

    function getBalance() public view returns (uint) {
        return msg.sender.balance;
    }
}

contract StorePurchase {

    ShoeStore private _instance;

    function Store() public {
        _instance = new ShoeStore();
    }

    function getBalance() public view returns (uint) {
        return msg.sender.balance;
    }

    function sendEther() public payable {
        require(msg.sender.balance > 100);
        address(_instance).transfer(2);
    }

    function () external payable {

    }
}