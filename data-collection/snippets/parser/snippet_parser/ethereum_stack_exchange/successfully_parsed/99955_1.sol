
contract Bank {
    mapping(address => uint256) internal customers;
    uint8 internal customerCount;

    function deposit() public payable {
        require(msg.value > 0, "No money provided.");
        require(customers[msg.sender] > 0 || customerCount < 2,
                "Bank already has two customers.");
        customers[msg.sender] += msg.value;
        if(customers[msg.sender] == msg.value) {
            customerCount++;
        }
    }

    function balance() public view returns (uint256) {
        return customers[msg.sender];
    }
}



contract BankTests is TestContract {
    uint64 public initialBalance = 3 ether;

    
    function test() public payable {
        TestBank bank = new TestBank();
        TestActor customer1 = new TestActor{value: 1 ether}();
        TestActor customer2 = new TestActor{value: 1 ether}();
        TestActor customer3 = new TestActor{value: 1 ether}();

        switchToActor(bank, customer1);
        Assert.equal(bank.balance(), 0, "1a failed");
        bank.deposit{value: 0.5 ether}();
        Assert.equal(bank.balance(), 0.5 ether, "1b failed");
        bank.deposit{value: 0.25 ether}();
        Assert.equal(bank.balance(), 0.75 ether, "1c failed");

        switchToActor(bank, customer2);
        Assert.equal(bank.balance(), 0, "2a failed");
        bank.deposit{value: 0.1 ether}();
        Assert.equal(bank.balance(), 0.1 ether, "2b failed");

        switchToActor(bank, customer3);
        try bank.deposit{value: 0.5 ether}() {
            Assert.equal(true, false, "3a failed");
        } catch Error(string memory reason) {
            Assert.equal(
                reason,
                "Bank already has two customers.",
                "3b failed"
            );
        } catch {
            Assert.equal(true, false, "3c failed");
        }

        resetActor(bank);
        Assert.equal(address(customer1).balance, 0.25 ether, "4a failed");
        Assert.equal(address(customer2).balance, 0.9 ether, "4b failed");
        Assert.equal(address(customer3).balance, 1 ether, "4c failed");
    }
}


contract TestContract {
    function switchToActor(TestBank bank, TestActor actor) internal {
        bank.switchToActor{value: address(this).balance}(actor);
    }

    function resetActor(TestBank bank) internal {
        bank.resetActor{value: address(this).balance}();
    }

    receive() external payable {} 
}


contract TestActor {
    constructor() payable {}

    function sendAllMoneyTo(address payable recipient) public {
        recipient.transfer(address(this).balance);
    }

    receive() external payable {} 
}


contract TestBank is Bank {
    address payable private currentActualCustomerAddr;

    function switchToActor(TestActor actualCustomer) public payable {
        resetActor();
        address payable proxyCustomerAddr = payable(msg.sender);
        address payable actualCustomerAddr = payable(address(actualCustomer));
        customers[proxyCustomerAddr] = customers[actualCustomerAddr];
        actualCustomer.sendAllMoneyTo(proxyCustomerAddr);
        currentActualCustomerAddr = actualCustomerAddr;
    }

    function resetActor() public payable {
        address payable proxyCustomerAddr = payable(msg.sender);
        if(currentActualCustomerAddr != address(0)) {
            customers[currentActualCustomerAddr] = customers[proxyCustomerAddr];
            currentActualCustomerAddr.transfer(msg.value);
        }
        currentActualCustomerAddr = payable(address(0));
    }
}
