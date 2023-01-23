address constant contractOwner = '0x123'

function withdrawOwner() external {
    require(msg.sender == contractOwner); 
    require(agreementDay + 30 days <= block.timestamp); 
    require(deposits[seller] > 0); 
    uint256 amount = deposits[seller]; 
    deposits[seller] = 0;
    payable(contractOwner).transfer(amount); 
}
