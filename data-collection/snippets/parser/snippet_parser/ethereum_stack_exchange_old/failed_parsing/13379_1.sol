contract MyContract{
    address owner = msg.sender;


function func(address newOwnerAddress) returns (address newOwner){
     if (msg.sender != owner) {throw;}
    
}

}

contract newContract{
    MyContract myContract = MyContract(0x08271...);

    function bid(uint amt, address _newOwner) returns(bool success){
        if (amt > ...){
        myContract.func(_newOwner)
    }
    }
}
