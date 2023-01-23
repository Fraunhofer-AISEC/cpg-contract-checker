function unbond(address payable wallet, bytes32 specifier, uint quantity) internal{

    bondage = BondageInterface(coord.getContract("BONDAGE")); 
    uint issued = bondage.getDotsIssued(address(this), specifier);

    currentCost = CurrentCostInterface(coord.getContract("CURRENT_COST")); 
    uint reserveCost = currentCost._costOfNDots(address(this), specifier, issued + 1 - quantity, quantity - 1);
    FactoryTokenInterface tok = FactoryTokenInterface(curves[specifier]);

    
    bondage.unbond(address(this), specifier, quantity);
    
    tok.burnFrom(wallet, quantity);
    
    wallet.transfer(reserveCost * adapterRate);
} 
