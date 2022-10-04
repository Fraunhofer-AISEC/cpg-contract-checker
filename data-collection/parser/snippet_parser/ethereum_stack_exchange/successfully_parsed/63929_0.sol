pragma solidity 0.5.1;

contract test { 
    uint256 public a;
    uint256 public b;
    uint256 public c;

    function nestedSum (uint256 d) public
    {
        a = (b = (c = d + 3) + 12) + 22;
    }
}
