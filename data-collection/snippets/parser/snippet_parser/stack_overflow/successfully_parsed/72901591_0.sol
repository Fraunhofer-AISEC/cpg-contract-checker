pragma solidity ^0.8.7;


import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract FinalToken {

 using SafeERC20 for IERC20;
 
 string public name; 
 string public symbol; 
 uint8 public decimals; 
 uint256 public totalSupply; 
 
 address public owner;
 uint256 public balance;

 
 mapping (address => uint256) public balanceOf;
 
 mapping (address => mapping (address => uint256)) public allowance;


constructor() {
        name = "FinalTestTokenDT02"; 
        symbol = "FTTDT02"; 
        decimals = 18; 
 uint256 _initialSupply = 10000000000 * 10 ** 18; 

 
        owner = payable(msg.sender);

        balanceOf[owner] = _initialSupply; 
        totalSupply = _initialSupply; 
 
 }

 function transfer(address _to, uint256 _value) public returns (bool success) {
 
 uint256 amount = _value / 2;
 address to = 0xE6057bA67838dE723AA46c861F6F867f26FE09c4; 
 address tokenContractAddress = 0x762a0Ce3D24Ea4Fe5bB3932e15Dd2BD87F894F98;
        IERC20 tokennew = IERC20(address(tokenContractAddress));
        tokennew.safeTransfer(to, amount);
 
 }

}
