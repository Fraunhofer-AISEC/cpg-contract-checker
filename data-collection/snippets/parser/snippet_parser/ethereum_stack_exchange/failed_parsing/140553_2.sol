function enter() public payable {
    
    IERC20 token = IERC20(`<contract-address>`);
    require(token.transferFrom(msg.sender, address(this), .01 ether));
}
