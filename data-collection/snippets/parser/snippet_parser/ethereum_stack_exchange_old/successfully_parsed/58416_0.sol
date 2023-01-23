pragma solidity ^0.4.24;

contract changeSomVal{
    address owner;
    bool test;    
    event showBool(bool showBool);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if(msg.sender == owner)
            _;
    }

    function () public payable{
        emit showBool(test);
    }

    function changeBoolTrue () public onlyOwner { 
            test = true;
            emit showBool(test);
    }

    function changeBoolFalse () public onlyOwner {
            test = false;
            emit showBool(test);
    }
}
