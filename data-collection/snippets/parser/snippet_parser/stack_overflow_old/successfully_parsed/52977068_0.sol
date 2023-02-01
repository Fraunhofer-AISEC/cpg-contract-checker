pragma solidity ^0.4.24;

contract DataContract {

    address public owner;
    uint public index = 0;
    string[] public data;

    
    constructor() public {
        owner = msg.sender;
    }

    function putData(string _d) public {
        data[index] = _d;
        index = index + 1;
    }

}
