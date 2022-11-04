



function purchaseCard(uint _id) public {
    User storage user = users[msg.sender];
    if (!checkExistedUser(msg.sender)) {
        user.exist = true;
        user.numberOfCards = 0;
    }
    Purchase storage purchase = user.purchase[user.numberOfCards];
    purchase.card = cards[_id];
    purchase.purchaseDate = block.timestamp;
    user.numberOfCards++;
}




