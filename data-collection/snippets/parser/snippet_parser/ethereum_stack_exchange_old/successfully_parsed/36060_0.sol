pragma solidity ^0.4.4;

contract MetaCoin {
    uint256 public totalSupply;

    function MetaCoin() {
        totalSupply = 1000;
    }

    function addOne() public returns (uint256 newTotalSupply)
    {
        totalSupply = totalSupply + 1;
        return totalSupply;
    }
}
