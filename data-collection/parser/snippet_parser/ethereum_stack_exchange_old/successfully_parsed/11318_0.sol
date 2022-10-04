pragma solidity ^0.4.6;
contract Magger {  
    function getOrderMag(int256 input) constant returns (int256){
        int counter=0;
        int temp = input;
        while((temp/10)>1){
            temp = temp/10;
            counter++;
        }
        return counter;
    }
}
