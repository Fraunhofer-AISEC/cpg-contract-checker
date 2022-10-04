modifier onlyOwner
    {
        require(msg.sender == owner);
        _;
    }

function newDebitObject(address _contentCreator, uint _amountInWei, string _name, uint _debitFrequency) onlyOwner returns (bool success)    
{
        if (debitObjectID[_contentCreator] != 0) return false;
        return true;
}
