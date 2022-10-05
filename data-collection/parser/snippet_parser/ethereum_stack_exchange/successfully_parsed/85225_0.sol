    pragma solidity ^0.5.0;

interface ERC20TokenInterface {
    function totalSupply() external view returns (uint);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint256);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract Stake{
    
    
    mapping(address => uint256) stakeAmount;
    
    address tokenAddress = 0x3a13Cb36dAd5d083449729Ea9dE53d68121a2c02;
    string tokens = "no";

    
    function stakeCoin(uint256 _amount) public {
        ERC20TokenInterface token = ERC20TokenInterface(tokenAddress);
        token.approve(address(this), _amount);
        token.transferFrom(msg.sender,address(this), _amount);
    }
    
    function stake1(uint256 _amount) public {
        ERC20TokenInterface token = ERC20TokenInterface(tokenAddress);
        token.transferFrom(msg.sender,address(this),_amount);
    }
    
    function tokenBalance() view public returns(uint256){
        ERC20TokenInterface token = ERC20TokenInterface(tokenAddress);
        return token.balanceOf(address(this));
    }
    
    function supply() view public returns(uint256){
        ERC20TokenInterface token = ERC20TokenInterface(tokenAddress);
        return token.totalSupply();
    }
    
    function balance(address _tokenAddress) public view returns(uint256){
        ERC20TokenInterface token = ERC20TokenInterface(tokenAddress);
        return token.balanceOf(_tokenAddress);
    }
    
}
