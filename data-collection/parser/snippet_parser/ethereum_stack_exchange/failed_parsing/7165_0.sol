contract Bank {
    [Bank contract details]

    function setOwner(address newOwner) returns (bool res) {
        if (owner != 0x0 && msg.sender != owner){
            return false;
        }
        owner = newOwner;
        return true;
    }
}

contract FundManager {

    address bank;

    
    function FundManager(){
        owner = msg.sender;
        bank = new Bank();
        Bank(bank).setOwner(address(this));
    }
}
