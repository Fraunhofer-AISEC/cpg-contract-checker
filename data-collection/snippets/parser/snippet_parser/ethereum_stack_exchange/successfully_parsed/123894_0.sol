
pragma solidity ^0.8.7;

contract Test  {
    uint256[] s_array = [1,2,3,4,5,6,7,7,8,8,8,8,8,8,8,8,8,8,8];

    function doStuff() public{
        uint256[] memory array = s_array;
    }
}
