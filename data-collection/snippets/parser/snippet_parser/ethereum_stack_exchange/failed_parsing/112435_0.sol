pragma solidity 0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0-solc-0.7/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    constructor () ERC20("", "") {
        _mint(msg.sender, 40000000 * (10 ** uint256(decimals())));


contract MasterChef is Ownable, {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using SafeERC20 for Token;
    }
