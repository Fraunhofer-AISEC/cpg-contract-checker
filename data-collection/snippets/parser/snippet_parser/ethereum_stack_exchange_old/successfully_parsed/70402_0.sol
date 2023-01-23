pragma solidity ^0.5.0;

contract Test{
    event Here(uint256 indexed a);
    uint256 public a;

    function add() public returns (uint256){
        a += 1;
        emit Here(a);
        return a;
    }
}
