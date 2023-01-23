contract BankTests {
    function test() public {
        Bank bank = new Bank(); 
        TestActor customer1 = new TestActor{value: 1 ether}(); 
        TestActor customer2 = new TestActor{value: 1 ether}(); 
        TestActor customer3 = new TestActor{value: 1 ether}(); 

        switchToActor(bank, customer1); 
        Assert.equal(bank.balance(), 0);
        bank.deposit{value: 0.5 ether}();
        Assert.equal(bank.balance(), 0.5 ether);
        bank.deposit{value: 0.25 ether}();
        Assert.equal(bank.balance(), 0.75 ether);

        switchToActor(bank, customer2); 
        Assert.equal(bank.balance(), 0);
        bank.deposit{value: 0.1 ether}();
        Assert.equal(bank.balance(), 0.1 ether);

        switchToActor(bank, customer3); 
        try bank.deposit{value: 0.5 ether}() {
            Assert.equal(true, false); 
        } catch Error(string memory reason) {
            Assert.equal(reason, "Bank already has two customers.");
        } catch {
            Assert.equal(true, false); 
        }

        resetActor(); 
        Assert.equal(address(customer1).balance, 0.25 ether);
        Assert.equal(address(customer2).balance, 0.9 ether);
        Assert.equal(address(customer3).balance, 1 ether);
    }
}
