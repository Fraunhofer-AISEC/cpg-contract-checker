pragma solidity ^0.4.0;

contract myContract
{
    struct abc {
        uint8[] m;
        uint a ;
    }

    function myFucn() returns(bool)
    {
        abc storage b;   
        abc memory a;
        delete a;
        delete b; 
        return true;
    }
}
