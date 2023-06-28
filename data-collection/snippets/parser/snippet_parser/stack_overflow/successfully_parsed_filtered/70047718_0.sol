function getValues(address _token) external {
       
        MyToken token = MyToken(0xd9145CCE52D386f254917e481eB44e9943F39138);
        token.approve(address(this),10);
                   
}
function transfer(address _token) external {
      MyToken token = MyToken(0xd9145CCE52D386f254917e481eB44e9943F39138);
    token.transferFrom(msg.sender,address(this),10);
}
