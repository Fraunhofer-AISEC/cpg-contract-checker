pragma solidity ^0.8.0;

contract Counter {
    uint public number;
    string public name;

    constructor(string memory input_name, uint input_number){
        name = input_name;
        number = input_number;
    }

    function add () public {
        number ++;
    }

    function subtract() public {
        number --;
    }

    function update_name(string memory update) public {
        name = update;
    }
}