contract LimitedOwner is Ownable
{
    OriginalContract public ownedTokenContract;
    
    
    function burn(uint256 _amount) onlyOwner
    {
        ownedTokenContract.burn(_amount);
    }
    function mint(address _address, uint256 _amount) onlyOwner
    {
        ownedTokenContract.mint(_address, _amount);
    }
    
    
    
}
