function Reveal()override public view returns (string memory) {
    require(ERC20Token(0xB0Bd09D....).balanceOf(msg.sender) >= 1 wei, "Error");
     return 'Thank you for collecting  an ERC20Token, the instructions will be sent out shortly';
}
