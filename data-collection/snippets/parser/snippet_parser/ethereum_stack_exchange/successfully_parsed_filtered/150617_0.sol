
pragma solidity ^0.8.9;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract TokenSwap {
    
    address public owner;
    IERC20 public usdtToken;
    IERC20 public xToken;

    event Swap(address indexed user, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    constructor(address _usdtTokenAddress, address _gbrTokenAddress) {
        owner = msg.sender;
        usdtToken = IERC20(_usdtTokenAddress);
        gbrToken = IERC20(_gbrTokenAddress);
    }

    function swap(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        require(usdtToken.balanceOf(msg.sender) >= _amount, "Insufficient balance of USDT on your wallet");

        require(usdtToken.transferFrom(msg.sender, address(this), _amount), "Failed to transfer USDT tokens to contract");

        uint256 gbrAmount = _amount * 10000000; 
        require(gbrAmount / 10000000 == _amount, "SafeMath: multiplication overflow");

        require(gbrToken.transfer(msg.sender, gbrAmount), "Failed to transfer GBR tokens to user");

        emit Swap(msg.sender, _amount);
    }

    function withdrawTokens(address _tokenAddress, address _to, uint256 _amount) external onlyOwner {
        IERC20 token = IERC20(_tokenAddress);
        require(token.transfer(_to, _amount), "Failed to transfer tokens");
    }

    function setOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    function getGBRTokenBalance() external view returns (uint256) {
        return gbrToken.balanceOf(address(this));
    }
}
