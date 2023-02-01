function enter() public payable {
    
    IERC20 token = IERC20(`0x123`); 
    require(token.transferFrom(msg.sender, address(this), .01 ether));
}
