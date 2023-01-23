
pragma solidity ^0.8.16 ;
contract logic
{
    uint a ;
    uint g ;
    modifier check(uint  c)
    {
        require( c == 7 , 'wrong');
        _;
    }

    function reolace( uint  b) public  check(  uint h)
    {           
                 a = b ;
    }
}
