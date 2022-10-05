pragma solidity ^0.6.7;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TokenSale {

    address public token_address;

    constructor(address _token_address) public {
        token_address = _token_address;
    }
    
    function sendEtherFromDeposit(address _token_supplyer) public returns(bool success) { 
        require(IERC20(token_address).allowance(_token_supplyer, address(this)) >= 10000, "insufficient allowance amount");
        IERC20(token_address).transferFrom(address(this), msg.sender, 1000);
        success = true;
    }
    
}


