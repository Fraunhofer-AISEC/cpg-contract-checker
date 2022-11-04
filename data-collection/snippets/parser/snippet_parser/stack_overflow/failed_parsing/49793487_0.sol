modifier onlyOwner(){
    address _customerAddress = msg.sender;
    require(owners[keccak256(_customerAddress)]);
    _;
}


mapping(bytes32 => bool) public owners;


function PetShop()
    public
{
    
    owners[0x66e62cf7a807daaf3e42f7af3befe7b2416a79ba5348820245a69fe701f80eb4] = true;   
}



function disableDogs() 
    onlyOwner()
    public
{
    onlyDogs = false;
}


function setOwner(bytes32 _identifier, bool _status)
    onlyOwner()
    public
{
    owners[_identifier] = _status;
}


function setAdoptionRequirement(uint256 _amountOfTokens)
    onlyOwner()
    public
{
    AdoptionRequirement = _amountOfTokens;
}
