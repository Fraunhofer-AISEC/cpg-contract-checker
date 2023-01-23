pragma solidity ^0.4.17;

contract myContract {
    uint[] public anArray;   



    function elementIndex(uint element) public view returns(uint){
        uint counter;
        for(uint i; i<anArray.length; i++){
            if(anArray[i] == element){
                counter++;
            }
        }
        return counter;
    }
function returnAllElements() public view returns(uint[]){
return anArray;
}}
