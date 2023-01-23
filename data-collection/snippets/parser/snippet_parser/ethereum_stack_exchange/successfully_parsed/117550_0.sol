pragma solidity 0.8.0;


interface ERC20 {
function totalSupply() external view returns (uint);
function balanceOf(address tokenOwner) external view returns (uint balance);
function allowance(address tokenOwner, address spender) external view returns (uint remaining);
function transfer(address to, uint tokens) external returns (bool success);
function approve(address spender, uint tokens) external returns (bool success);
function transferFrom(address from, address to, uint tokens) external returns (bool success);

function symbol() external view returns (string memory);
function name() external view returns (string memory);
function decimals() external view returns (uint8);

event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
} 

contract ERC20Interaction {
    ERC20 ercToken;

    constructor(address tokenAddress) {
        require(tokenAddress != address(0));
        ercToken = ERC20(tokenAddress);
    }

    function getSenderBalance() external view returns (uint) {
        uint senderBalance = ercToken.balanceOf(msg.sender);
        return senderBalance;
    }
    
    function interactWithToken() external {
        
    }
}
