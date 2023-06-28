mapping (address=>address) lendersToContracts;    
function lenderRegister(uint256 _rentedStorage) public isNewLender returns (bool) {
    lendersToContracts[msg.sender] = new LenderRegistration(Admin, _rentedStorage, Token, msg.sender);
    lenderIndex++;
    return true;
}
