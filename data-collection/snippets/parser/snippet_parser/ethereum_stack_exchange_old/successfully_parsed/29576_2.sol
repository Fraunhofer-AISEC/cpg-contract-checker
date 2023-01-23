contract A {
    
    function deposit(uint _amount) public {
        doDeposit(msg.sender, _amount);
    }
    
    function doDeposit(address _sender) public {
    }
}

contract TestA {
    address constant senderA = "0xA00...";
    address constant senderB = "0xB00...";
    function testDeposit() {
        A a = A(DeployedAddresses.A());
        a.doDeposit(senderA, 10000); 
        a.doDeposit(senderB, 10000); 
    }
}
