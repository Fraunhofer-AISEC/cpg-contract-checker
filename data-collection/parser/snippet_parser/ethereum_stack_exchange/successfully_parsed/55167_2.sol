pragma solidity ^0.4.23;

contract xyzToken {
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    function xyzToken (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
}
