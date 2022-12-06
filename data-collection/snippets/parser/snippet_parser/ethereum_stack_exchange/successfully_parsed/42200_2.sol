contract A {
    uint tokens = 10;
    
    address allowedBurnerAddress = 0x1234;

    
    function burn(uint amount) public {
        require(msg.sender == allowedBurnerAddress);
        tokens -= amount;
    }
}

contract B {
    
    address burnContract = 0x0987;

    
    function PerformBurn() public {
        

        A original = A(burnContract);
        original.burn(5);
    }
}
