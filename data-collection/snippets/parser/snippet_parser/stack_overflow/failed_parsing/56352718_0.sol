contract A {
    ERC20 token = ERC20(0x...);
    B b = B(0x...);

    function helpMeBuyService() external {

        token.approve(b, 1000); 
        b.BuyService(msg.sender); 
    }
}
