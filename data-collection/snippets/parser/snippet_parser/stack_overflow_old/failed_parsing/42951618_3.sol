function newShareholder() returns (address shareholderContract) {
    Shareholder shareholder  new Shareholder(); 
    shareholder[msg.sender] = shareholder; 
    return shareholder;
}
