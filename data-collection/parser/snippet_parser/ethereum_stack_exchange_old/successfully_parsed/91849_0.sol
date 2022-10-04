enum State { ForSale, SellerDelisted, BuyerCancelled, BidPlaced, DepositMade, InDispute, Complete }
State public state;

function returnState() view external returns (State) {
    return state;
}
