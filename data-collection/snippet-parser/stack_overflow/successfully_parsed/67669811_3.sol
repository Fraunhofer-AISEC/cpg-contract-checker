function enter() public payable {
    IERC20 token = IERC20(address(0x123)); 
    require(token.transferFrom(msg.sender, address(this), .01 ether));

    players.push(msg.sender);
}
