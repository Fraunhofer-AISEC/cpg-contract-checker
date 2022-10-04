pragma solidity ^0.4.24;

import "./SafeMath.sol";
import "./ERC20.sol";

contract TokenLocker {
    using SafeMath for uint256;

    address public creator;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor(address _creator, address _owner) public payable {
        creator = _creator;
        owner = _owner;
    }

    function() payable public {
        emit Received(msg.sender, msg.value);
    }

    function unlock() public returns(bool) {
        uint256 balance = address(this).balance;
        require(balance > 0, "No token available !");

        owner.transfer(balance);

        emit Unlock(owner, balance);

        return true;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    event Received(address from, uint256 amount);
    event Unlock(address to, uint256 amount);
}
