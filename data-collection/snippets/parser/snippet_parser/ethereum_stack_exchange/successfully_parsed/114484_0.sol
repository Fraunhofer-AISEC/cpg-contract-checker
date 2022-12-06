
pragma solidity 0.7.4;
pragma experimental ABIEncoderV2;

contract Leger {

    address owner;

    constructor(){
        owner = msg.sender;
    }

    function getBalance() public view returns (uint256) {
        return owner.balance;
    }
    

}

