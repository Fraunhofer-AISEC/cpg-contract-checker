
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is Ownable{
   IERC20 MyToken;

  constructor(address _contractAddress){
    MyToken= IERC20(_contractAddress);
  }

   function withdraw(address _to) public onlyOwner  {
        
        uint256 balance = MyToken.balanceOf(address(this));
        
        if(balance > 0){
          MyToken.transfer(_to, balance);    
        }                  
    }
}
