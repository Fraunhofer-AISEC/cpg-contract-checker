pragma solidity ^0.4.10;

contract Real
{
    function Do() public constant returns (uint256) { return 12345; }
}

contract Blank
{
    function () public { }
}


contract Client
{
    function Run() public constant returns (uint256 result1, uint256 result2)
    {
        Real real = Real(0xd64dE830995C7407b09CF96EC59f76701D4DBcF9); 
        result1 = real.Do();

        Real blank = Real(0x068c8D804Fab87B3d2cF3f02914eF2bE6b199436); 
        result2 = blank.Do();
    }
}




