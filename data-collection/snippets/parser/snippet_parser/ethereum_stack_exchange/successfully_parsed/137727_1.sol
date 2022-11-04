
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ContractA {
    using SafeMath for uint256;

    IERC20 immutable private _token;
    mapping(address => uint256) private _balance;

    constructor(address token) {
        require(token != address(0x0));
        _token = IERC20(token);
    }

    function addToContract(uint256 amount) public {
        _token.transferFrom(msg.sender, address(this), amount);
        _balance[msg.sender].add(amount);
    }

    function withdrawFromContract(uint256 amount) public {
        require(_balance[msg.sender] >= amount, "Insufficient Stake");
        _token.transfer(msg.sender, amount);
        _balance[msg.sender].sub(amount);
    }
}

