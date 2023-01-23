
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";



contract Staking is Ownable, ReentrancyGuard {
  using SafeERC20 for IERC20;

  

  IERC20 public rewardToken;
  IERC20 public stakingToken;

  struct UserInfo {
    uint256 amount;
    uint256 depositTime;
    uint256 lockDays;
  }

  mapping(address => UserInfo[]) public userinfos; 

  event Stake(address indexed user, uint256 amount);
  event Unstake(address indexed user, uint256 amount);
  event ClaimReward(address indexed user, uint256 reward);
  event Distribute(address indexed user, uint256 reward);

  constructor() {
    stakingToken = IERC20(0x9bD6e72cB0c7e58a0fF30B603aFcCcc5b08941DD);
    rewardToken = IERC20(0x9bD6e72cB0c7e58a0fF30B603aFcCcc5b08941DD);
  }

  function stake(uint256 _amount, uint256 _lockDays) external nonReentrant {
    require(_amount > 0, "Cannot stake 0");
    stakingToken.safeTransferFrom(msg.sender, address(this), _amount);
    userinfos[msg.sender].push(UserInfo(_amount, block.timestamp, _lockDays));

    emit Stake(msg.sender, _amount);
  }

  function unstakeById(uint256 _id) external nonReentrant {
    require(_id < userinfos[msg.sender].length, "id is not valid");
    uint256 deposittedTime = userinfos[msg.sender][_id].depositTime;
    uint256 lockPeriod = userinfos[msg.sender][_id].lockDays;
    require(block.timestamp >= (deposittedTime + lockPeriod * 1 days), "Locking period");
    uint256 depositted = userinfos[msg.sender][_id].amount;
    stakingToken.safeTransfer(msg.sender, depositted);
    uint256 reward = (depositted * 5) / 365;
    rewardToken.safeTransfer(msg.sender, reward);
  }

  function unstakeAll() external nonReentrant {
    uint256 length = userinfos[msg.sender].length;
    for (uint256 _id = 0; _id < length; _id++) {
      uint256 deposittedTime = userinfos[msg.sender][_id].depositTime;
      uint256 lockPeriod = userinfos[msg.sender][_id].lockDays;
      if (block.timestamp >= (deposittedTime + lockPeriod * 1 days)) {
        uint256 depositted = userinfos[msg.sender][_id].amount;
        if (depositted >= 0) {
          stakingToken.safeTransfer(msg.sender, depositted);
          uint256 reward = (depositted * 5) / 365;
          rewardToken.safeTransfer(msg.sender, reward);
        }
      }
    }
  }

  function getDepositLength(address _address) external view returns (uint256) {
    return userinfos[_address].length;
  }

  function getDepositAmountById(address _address, uint256 _id) external view returns (uint256) {
    return userinfos[_address][_id].amount;
  }

  function checkLockedPeriod(address _address) external view returns (bool) {
    uint256 length = userinfos[_address].length;
    for (uint256 _id = 0; _id < length; _id++) {
      uint256 deposittedTime = userinfos[_address][_id].depositTime;
      uint256 lockPeriod = userinfos[_address][_id].lockDays;
      if (block.timestamp >= (deposittedTime + lockPeriod * 1 days)) {
        uint256 depositted = userinfos[_address][_id].amount;
        if (depositted >= 0) {
          return true;
        }
      }
    }
    return false;
  }
}

