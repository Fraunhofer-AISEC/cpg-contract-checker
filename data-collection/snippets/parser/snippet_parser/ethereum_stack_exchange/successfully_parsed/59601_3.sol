pragma solidity 0.4.25;

contract Counter {

    struct UserStruct {
        uint balance;
        uint counter;
    }

    mapping(address => UserStruct) public userStructs;

    function deposit() public payable returns(bool success) {
        require(msg.value > 0);
        userStructs[msg.sender].balance += msg.value;
        userStructs[msg.sender].counter ++;
        return true;
    }
}
