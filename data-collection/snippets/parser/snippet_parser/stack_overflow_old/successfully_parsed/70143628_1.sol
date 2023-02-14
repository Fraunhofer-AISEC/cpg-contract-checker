
pragma solidity 0.7.4;
pragma experimental ABIEncoderV2;

contract Leger {

    address payable owner;

    constructor(){
        owner = msg.sender;
    }

    function transfer(address payable _recipient) public payable {
        
        bool success = _recipient.send(1);
        require(success, "Transfer failed.");
    }


    function getBalance() public view returns (uint256) {
        return owner.balance;
    }
    

}

