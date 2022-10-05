pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract meatFarm {

    mapping(address => uint256[]) public stakingBalance;
    mapping(address => bool) public isStaking;
    mapping(address => uint256) public startTime;
    mapping(address => uint256) public meatBalance;

    string public name = "MeatFarm";

    IERC721 public cdnoToken;
    IERC20 public meatToken;

    event Stake(address indexed from, uint256 indexed);
    event Unstake(address indexed from, uint256 indexed);
    event YieldWithdraw(address indexed to, uint256 amount);

    constructor(
        IERC721 _cdnoToken,
        IERC20 _meatToken
        ) {
            cdnoToken = _cdnoToken;
            meatToken = _meatToken;
        }
}
