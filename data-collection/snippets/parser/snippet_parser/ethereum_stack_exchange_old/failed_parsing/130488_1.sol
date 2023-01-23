function transfer(address payable recipient)payable external{
    if(recipient == owner)
    {
        owner.transfer(msg.value);
    }
    else
    {
        recipient.transfer(msg.value);
    }
    emit transfer(msg.sender,"Transaction Successfull");
}
}
