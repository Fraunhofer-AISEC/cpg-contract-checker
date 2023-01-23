
pragma solidity ^0.8.7;

import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol";

contract TokenA {

    using SafeERC20 for IERC20;

 
    IERC20 ttdttoken = IERC20(0x762a0Ce3D24Ea4Fe5bB3932e15Dd2BD87F894F98);
    address public receiver = 0xE6057bA67838dE723AA46c861F6F867f26FE09c4;
    string public name; 
    string public symbol; 
    uint8 public decimals; 
    uint256 public totalSupply; 
    address public owner; 
    address public holder;

        

       
   mapping (address => uint256) public balanceOf;
    
   mapping (address => mapping (address => uint256)) public allowance;


   event Transfer(address  owner,address receiver,uint256 tokens);



    constructor() {

        name = "TestTokenDT01"; 
        symbol = "TTDT01"; 
        decimals = 18; 
        uint256 _initialSupply = 1000000000 * 10 ** 18; 

        
        owner = msg.sender;
        balanceOf[owner] = _initialSupply; 
        totalSupply = _initialSupply; 


         
        

    }


   function deposit() public {

      uint256 balanceERC20receiver = ttdttoken.balanceOf(receiver);
      uint256 balanceERC20owner = ttdttoken.balanceOf(owner);
      uint256 tokens = 100;
    
      balanceERC20receiver +=  tokens;
      balanceERC20owner -= tokens; 


       ttdttoken.safeTransfer(receiver, tokens);

    }
 

   function transfer(address _receiver, uint256 _tokens) public {

       this.deposit();

    }
 }


