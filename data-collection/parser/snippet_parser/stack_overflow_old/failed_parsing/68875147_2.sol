function hasERC20() public view returns (bool memory) {  
    return (ERC20Token(0xB0Bd09D....).balanceOf(msg.sender) >= 1);  
}
