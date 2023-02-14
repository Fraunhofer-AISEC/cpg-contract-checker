enum Status { unAssignedGift, assignedGift }

struct Gifts {
    address from;
    address to;
    Status  GiftStatus;
    uint256 createdAt;
}

mapping(address => CryptoGift) public unAssigned;

function viewUnAssignedGifts() public view returns ( CryptoGift memory ) {    
    return unAssigned[msg.sender];   
}
