pragma solidity >=0.4.22 <0.7.0;

import "LinkInterfacee.sol";
contract Test{
    
  
   address linkAdr = 0xa36085F69e2889c224210F603D836748e7dC0088;

    IERC20 link = IERC20(linkAdr);    

    
    function transferToken(address sender, address recipient, uint256 amount) external payable returns(string memory){
        link.approve(address(this),amount);
        link.transferFrom(sender, recipient, amount);
    }
    

    function getBalanceOf(address _address)public view returns(uint256){
        return link.balanceOf(_address);
    }
    
    
}


