
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SampleContract {
    IERC20 public LinkToken;
    address public LinkAddress = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;  

    constructor() {
        LinkToken = IERC20(LinkAddress); 
    }

    
    function approveAmount() public { 
        LinkToken.approve(address(this), 123);
    }

    
    function getAllowance() public view returns(uint256) {
        return LinkToken.allowance(address(this), msg.sender);
    }
}
