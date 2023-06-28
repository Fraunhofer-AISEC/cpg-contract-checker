 function multiSendFixedEth(address payable[] memory recipients, uint256 amount,string memory description) public payable {
    
    require(recipients.length > 0," Please input an Address ");
    require(amount > 0, " Amount Must Be Greater Than 0 ");
    require(Owner == msg.sender, " You are not authorised to call this function ");
    
    uint256 length = recipients.length;
    
    for(uint256 i=0;i<length;i++) {
        recipients[i].transfer(amount);
        addresses.push(recipients[i]); 
    }

    numOfAddy = addresses.length;

    transactions.push(Transaction(msg.sender, numOfAddy , amount , description, block.timestamp));

    emit Transfer(msg.sender, numOfAddy , amount , block.timestamp);
}  
