function distribute(address to, uint256 token, uint256 gasMoney) payable onlyAuthorized returns (bool sucess) { 
    createToken(to, token); 
    to.transfer(gasMoney); 
    currentContractBalance -= gasMoney; 
    return true; 
}
