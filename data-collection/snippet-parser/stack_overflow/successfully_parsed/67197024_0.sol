
pragma solidity ^0.6.6;


contract Dai {
    function balanceOf(address owner) external view returns(uint) {}
    function totalSupply() external view returns (uint256){}
    function transfer(address recipient, uint256 amount) external returns (bool){}
    function allowance(address owner, address spender) external view returns (uint256){}
    function approve(address spender, uint256 amount) external returns (bool){}
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){}
}
