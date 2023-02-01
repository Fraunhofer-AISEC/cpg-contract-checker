pragma solidity ^0.8.0;

contract MyContract {

    function fundContract() external payable {

    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function transferAmount(address payable _recipient) external payable {
        _recipient.transfer(msg.value);
    }

    function callAmount(address payable _recipient) external payable {
        (bool success,  bytes memory data) = _recipient.call{value:msg.value}("");
        require(success, "Transaction Failed!");

    }

}
