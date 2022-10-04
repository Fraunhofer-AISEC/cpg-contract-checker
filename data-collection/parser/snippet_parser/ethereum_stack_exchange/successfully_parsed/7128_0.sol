
contract Wallet {

    event Deposit(address from, uint value);
    event Withdraw(address to, uint value);

    address owner;

    function Wallet() {
        owner = msg.sender;
    }

    
    function withdraw(address _to, uint _value) {
        if(msg.sender != owner) {
            throw;
        }

        Withdraw(_to, _value);

        _to.send(_value);
    }


    
    function() {
        
        if (msg.value > 0) {
            Deposit(msg.sender, msg.value);
        }
    }

}
