    import "Bank";
contract FundManager {

    address owner;
    Bank bank;

    function init(address bank) returns (bool){
        owner = tx.origin;
        bank = Bank(bank);
        return true;
    }


    function deposit(uint value) returns (bool res) {

        bool success = bank.deposit(tx.origin,value);
        return success;
    }


    function withdraw(uint amount) returns (bool res) {

        bool success = bank.withdraw(msg.sender, amount);
        return success;
    }

}
