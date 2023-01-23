pragma solidity ^0.4.23;


contract Mortal{

    address owner;

    string ownerInfo = "Contract Owner name XYZ";

    constructor () public {
        owner = msg.sender;
    }

    function kill () public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }

    function ownerInfo() public view returns (string) {
        return ownerInfo;
    }

}


contract Test is Mortal {

    string message = "Hello World!";

    constructor () public {
    }

    function getMessage() public view returns (string){
        return message;
    }
}
