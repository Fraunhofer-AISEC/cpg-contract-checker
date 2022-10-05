pragma solidity ^0.4.24;
import "./Claimable.sol";

contract MyTestContract is Claimable {
    uint256 public id;
    function set(uint256 _id) external onlyOwner {id = _id;}
}
