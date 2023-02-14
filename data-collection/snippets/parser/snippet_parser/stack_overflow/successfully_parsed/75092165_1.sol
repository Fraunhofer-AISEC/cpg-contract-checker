if (msg.value < winningBid) {  
            pendingReturns[product.buyer] += msg.value;  
            auctionWinner = msg.sender;  
            winningBid = msg.value;
            emit ReverseBidding(product.buyer, msg.value);  
}
