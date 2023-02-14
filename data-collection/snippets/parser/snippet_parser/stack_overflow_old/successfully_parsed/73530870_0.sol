function showRemainingDate(uint _id) public view returns(uint) {
    for (uint i = 0; i < users[msg.sender].numberOfCards; i++) {
        if (users[msg.sender].purchase[i].card.id == cards[_id].id) {
            return 30*86400 - (block.timestamp - users[msg.sender].purchase[i].purchaseDate);
        }
    }
    return 0;
}

function checkPurchase(uint _id) public view returns (bool) {
    for (uint i = 0; i < users[msg.sender].numberOfCards; i++) {
        if (users[msg.sender].purchase[i].card.id == cards[_id].id) {
            return true;
        }
    }
    return false;
}
