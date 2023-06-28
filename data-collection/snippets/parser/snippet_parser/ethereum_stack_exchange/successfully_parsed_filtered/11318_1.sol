pragma solidity ^0.4.6;
contract Magger {  

    function getOrderMag(int256 input) constant returns (int256){
        int counter=0;
        if (input<0){
            input=input*-1;
        }
            while((input/10)>=1){
                input = input/10;
                counter++;
            }

        return counter;
}
}
