uint _extraSupplyForGivingAway = 1e27; 

function totalSupply() public view override returns(uint totalSupply){ 
    totalSupply = super.totalSupply() + _extraSupplyForGivingAway);
    return (totalSupply);
}