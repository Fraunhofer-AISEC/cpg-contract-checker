
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ECommerce {
    IERC20 token;
    address private owner;

    constructor() public {
        token = IERC20(0xeD24FC36d5Ee211Ea25A80239Fb8C4Cfd80f12Ee);
        
       
        owner = msg.sender;
    }
    
    
    modifier OnlyOwner() {
        require(msg.sender == owner);
        _;
    }

  
   function GetUserTokenBalance() public view returns(uint256){ 
       return token.balanceOf(msg.sender);
   }
   
   
   function Approvetokens(uint256 _tokenamount) public returns(bool){
       token.approve(address(this), _tokenamount);
       return true;
   }
   
   
   function GetAllowance() public view returns(uint256){
       return token.allowance(msg.sender, address(this));
   }
   
   function AcceptPayment(uint256 _tokenamount) public returns(bool) {
       require(_tokenamount > GetAllowance(), "Please approve tokens before transferring");
       token.transfer(address(this), _tokenamount);
       return true;
   }
   
   
   function GetContractTokenBalance() public OnlyOwner view returns(uint256){
       return token.balanceOf(address(this));
   }
   
}
