//Sample contract with an if statement which saves results to a state variable

pragma solidity ^0.8.1;

contract sampleContract {

    uint public x;

    function numbers(uint _x) public {
        if (_x < 25 ) {
            x = 0;
        } else if (_x < 50 ) {
            x = 1;
        }
        else {
            x = 2;
        }
    }
}

//or


//Added return statements
contract SampleContract {

    uint public x;

    function numbers(uint _x) public returns(uint){
        if (_x < 25 ) {
            x = 0;
            return x;
        } else if (_x < 50 ) {
            x = 1;
            return x;
        }
        else {
            x = 2;
            return x;
        }
    }
}