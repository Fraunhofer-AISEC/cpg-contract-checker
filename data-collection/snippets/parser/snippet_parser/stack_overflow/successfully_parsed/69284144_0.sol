pragma solidity ^0.8.0;

contract Test {

    uint counter = 0;


    function add() public payable {
        counter += msg.value;
    }


    function getCounter() public view returns(uint){
        return counter;
    }

}
