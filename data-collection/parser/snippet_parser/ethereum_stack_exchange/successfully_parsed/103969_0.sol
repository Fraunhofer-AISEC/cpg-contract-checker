pragma solidity ^0.8.0;

contract MyContract {

    uint[] myArray;

    function myFunc() external returns(uint[] memory){

        for(uint i=0; i<10; i++){
            myArray[i] = i*2;
        }
    
        return myArray;
    }

}
