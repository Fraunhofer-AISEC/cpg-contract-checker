pragma solidity ^0.6.2;

import "@opengsn/gsn/contracts/BaseRelayRecipient.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract MyContract is BaseRelayRecipient{
    constructor(address _trustedForwarder) public {
        trustedForwarder = _trustedForwarder;
    }
    
    
    function transfertip(address to_, uint256 amount_) public {
        address contract_ = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;
    
      ERC20Interface =  IERC20(contract_);
      ERC20Interface.transfer(to_, amount_);
    
    
    }
    
   
    function versionRecipient() external view override returns (string memory) {
        return "1";
    }
}
