pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool);
}

contract ABC{
    
    function enter() public payable {
    
    IERC20 token = IERC20(`0x123`); 
    require(token.transferFrom(msg.sender, address(this), .01 ether));
}


}
