contract MyContract {
    address owner;
    modifier getModified (address owner) {
        if (msg.sender != owner) throw;
        _;
    }

    function func(address newOwnerAddress) getModified(owner) returns (address newOwner) {
        
    }
}

contract newContract {
    MyContract myContract = MyContract(0x08271...);

    function bid(uint amt, address _oldOwner, address _newOwner) returns(bool success) {
        if (amt > ...) {
            myContract.func(_newOwner,{getModified:_oldOwner})
        }
    }
}
