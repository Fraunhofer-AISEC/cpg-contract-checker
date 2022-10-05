pragma solidity ^0.4.23;

contract YourContractName {

    constructor(){
    }

    function processData(uint num) public pure returns (bool) {

        uint _number = num;
        if(num == _number) {
            return true;
        } else {
            return false;
        }
    }
}
