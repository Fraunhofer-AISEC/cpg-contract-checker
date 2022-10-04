
pragma solidity ^0.8.4;

interface IBEP20 {
    function totalSupply() external view returns (uint256);
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
    function name() external view returns (string memory);
    function getOwner() external view returns (address);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address _owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool); 
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool); 
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract SimpleDeposit {
    function simpledeposit(address _tokenIn, uint256 _amountsIn) external {
        IBEP20(_tokenIn).approve(address(this), _amountsIn);
        IBEP20(_tokenIn).transferFrom(msg.sender, address(this), _amountsIn);
    }
}
