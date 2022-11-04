pragma solidity ^0.5.0;

contract Arraytest{

    uint8[] public array ;

    constructor() public{
        for(uint8 counter=0; counter<2; counter++)
        {
            array.push(counter);
        }
    }

    event MESSAGE(uint _message);

    function reduceLength() public returns (uint8[] memory) {


            array.length--;
            emit MESSAGE(array.length);
            return array;



        
        

        

        

        

        

        

        

}

}
