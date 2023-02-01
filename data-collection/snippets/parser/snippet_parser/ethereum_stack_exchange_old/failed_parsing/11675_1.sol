function withdrawAmount(uint amount) returns(bool success) {
    if(msg.sender is owed that much or more) ...
}

function amountAuthorized() constant returns(uint amountAuthorized) {
    return authorized[msg.sender];
}
