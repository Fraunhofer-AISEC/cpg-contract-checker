
function getUser(address _address) public view returns(string memory, uint, bool) {
    User memory getM = addressToUser[_address];
    return(getM.username,getM.contributionBalance,getM.verified);
}
