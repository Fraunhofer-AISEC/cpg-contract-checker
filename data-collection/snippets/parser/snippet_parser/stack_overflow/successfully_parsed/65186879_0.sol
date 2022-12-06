

pragma solidity ^0.6.0;

import "@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/SafeERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

contract StakingContract is ERC20Upgradeable, OwnableUpgradeable, ReentrancyGuardUpgradeable {
    using SafeMathUpgradeable for uint256;
    using AddressUpgradeable for address;
    using SafeERC20Upgradeable for IERC20Upgradeable;
    
    event TokensStaked(address _tokenStaker, uint256 _amount, uint256 unlockTime);
    event TokenUnstaked(address _tokenStaker, uint256 _amount);
    
    
    bool private locked;
    
    
    uint256 public totalStaked;
    
    mapping (address => uint256) public stakeBalances;
    mapping(address => uint256) private timestamp;
    
    function initialize(uint256 initialSupply)  public  initializer {
        __ERC20_init("MyToken", "TKN");
        _mint(owner(), initialSupply);
    }
    
    function stakeTokens(address token, uint amount) external {
        stakeBalances[msg.sender] = stakeBalances[msg.sender].add(amount);
        timestamp[msg.sender] = block.timestamp.add(30 days);
        require(IERC20Upgradeable(token).allowance(msg.sender, address(this)) >= amount, "Check the token allowance");
        require(IERC20Upgradeable(token).transferFrom(msg.sender, address(this), amount), "Transfer failed!");
        totalStaked = totalStaked.add(amount);
        
        emit TokensStaked(msg.sender, amount, timestamp[msg.sender]);
    }
    
    function unstakeTokens(address token, uint256 amount) external nonReentrant() {
        require(amount <= stakeBalances[msg.sender], "Sorry! You don't have sufficient stake balance.");
        require(block.timestamp >= timestamp[msg.sender], "Sorry! you cannot withdraw tokens before your stake time.");
        stakeBalances[msg.sender] = stakeBalances[msg.sender].sub(amount);
        require(IERC20Upgradeable(token).transfer(msg.sender, amount));
        totalStaked = totalStaked.sub(amount);
        
        emit TokenUnstaked(msg.sender, amount);
    }
    
    function ownerWithdraw(address token) external onlyOwner() nonReentrant() {
        require(IERC20Upgradeable(token).transfer(owner(), totalStaked), "Transfer Failed!");
        uint256 ownerStakedBalance = stakeBalances[msg.sender];
        stakeBalances[msg.sender] = stakeBalances[msg.sender].sub(ownerStakedBalance);
        totalStaked = totalStaked.sub(totalStaked);
    }
}
