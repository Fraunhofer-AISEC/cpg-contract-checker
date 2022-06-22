
pragma solidity >=0.8.0 <0.9.0;

contract simple
{
    uint public a = 3;

    constructor()
    {
      a = 16; 
    }

    function changeData() public
    {
      a = 16;
    }

}
