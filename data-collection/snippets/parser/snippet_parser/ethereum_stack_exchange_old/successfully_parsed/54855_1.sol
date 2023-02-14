pragma solidity ^0.4.24;

contract Ownable {
    address public owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

pragma solidity ^0.4.24;
import "./Ownable.sol";

contract MyContract is Ownable {
    mapping (address => bool) public wallets;
    function addWallet(address wallet) external onlyOwner {
        wallets[wallet] = true;
    }
}
