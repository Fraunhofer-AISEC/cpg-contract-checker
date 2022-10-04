


function MultiSig(address[] _owners, uint _required)
    public
    validRequirement(_owners.length, _required)
{
    for (uint i=0; i<_owners.length; i++) {
        if (isOwner[_owners[i]] || _owners[i] == 0) throw;
        isOwner[_owners[i]] = true;
    }
    isMultiSigWallet = true;
    owners = _owners;
    required = _required;
}





function submitTransaction(address destination, uint value, bytes data)
    public
    returns (uint transactionId)
{
    transactionId = addTransaction(destination, value, data);
    confirmTransaction(transactionId);
}



function confirmTransaction(uint transactionId)
    public
    ownerExists(msg.sender)
    transactionExists(transactionId)
    notConfirmed(transactionId, msg.sender)
{
    confirmations[transactionId][msg.sender] = true;
    Confirmation(msg.sender, transactionId);
    executeTransaction(transactionId);
}



function revokeConfirmation(uint transactionId)
    public
    ownerExists(msg.sender)
    confirmed(transactionId, msg.sender)
    notExecuted(transactionId)
{
    confirmations[transactionId][msg.sender] = false;
    Revocation(msg.sender, transactionId);
}




function isConfirmed(uint transactionId)
    public
    constant
    returns (bool)
{
    uint count = 0;
    for (uint i=0; i<owners.length; i++) {
        if (confirmations[transactionId][owners[i]])
            count += 1;
        if (count == required)
            transfer(_from,_to,_value);
    }
}
