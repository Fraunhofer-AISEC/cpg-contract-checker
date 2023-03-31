
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Presale {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    IERC20 public token;
    address payable public owner;
    address payable public wallet;
    uint256 public totalTokens;
    uint256 public tokensSold;
    uint256 public tokenPrice;
    uint256 public minimumGoal;
    uint256 public startTime;
    uint256 public endTime;
    bool public presaleEnded;
    mapping(address => uint256) public balances;

    constructor(
        IERC20 _token,
        address payable _owner,
        address payable _wallet,
        uint256 _totalTokens,
        uint256 _tokenPrice,
        uint256 _minimumGoal,
        uint256 _startTime,
        uint256 _endTime
    ) {
        token = _token;
        owner = _owner;
        wallet = _wallet;
        totalTokens = _totalTokens;
        tokenPrice = _tokenPrice;
        minimumGoal = _minimumGoal;
        startTime = _startTime;
        endTime = _endTime;
    }

    function startPresale() external {
        require(msg.sender == owner, "Access denied");
        require(block.timestamp < startTime, "Presale already started");

        startTime = block.timestamp;
    }

    function endPresale() external {
        require(msg.sender == owner,
        "Access denied");
        require(!presaleEnded, "Presale already ended");

        presaleEnded = true;
        endTime = block.timestamp;
    }

    function setPrice(uint256 _tokenPrice) external {
        require(msg.sender == owner, "Access denied");
        require(block.timestamp < startTime, "Presale already started");

        tokenPrice = _tokenPrice;
    }
}
