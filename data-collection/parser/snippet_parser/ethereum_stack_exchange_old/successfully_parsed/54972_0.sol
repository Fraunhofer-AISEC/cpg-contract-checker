    function IsUserDone(address user) private view returns(bool){
    for(uint256 i = 0; i < DoneCustomers.length; i++)
    {
        if(DoneCustomers[i] == user)
            return true;
    }
    return false;
}

function IsUserPending(address user) private view returns(bool){
    for(uint256 i = 0; i < PendingCustomers.length; i++)
    {
        if(PendingCustomers[i] == user)
            return true;
    }
    return false;
}

function TransferData(address dude) public {
    require(msg.sender == owner);
    require(IsUserPending(dude));

    for(uint256 i = 0; i < PendingCustomers.length; i++)
    {
        if(PendingCustomers[i] == dude){
            delete PendingCustomers[i];
            owner.transfer(total_price);
            AddDoneCustomers(dude);
        }
    }
}
