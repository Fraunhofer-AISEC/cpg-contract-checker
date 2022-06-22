contract TestA {
    address constant senderA = "0xA00...";
    address constant senderB = "0xB00...";
    function testMint() {
        
        A a = new A(this);
        
        a.mint(senderA, 10000);
        
        a.doApprove(senderA, this, 1000);
        
        a.transferFrom(senderA, senderB, 1000);
    }
}
