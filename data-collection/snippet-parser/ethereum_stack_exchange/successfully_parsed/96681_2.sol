pragma solidity >=0.4.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


contract ContractA is Ownable, ReentrancyGuard {
    using SafeMath for uint256;

    constructor () public {
    }

}