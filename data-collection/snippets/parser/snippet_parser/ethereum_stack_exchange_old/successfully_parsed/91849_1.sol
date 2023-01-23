contract MyContract {
    enum State {
        ForSale,
        SellerDelisted,
        BuyerCancelled,
        BidPlaced,
        DepositMade,
        InDispute,
        Complete
    }

    State public state;
    mapping(State => string) public states;

    constructor() public {
        states[State.ForSale] = "ForSale";
        states[State.SellerDelisted] = "SellerDelisted";
        states[State.BuyerCancelled] = "BuyerCancelled";
        states[State.BidPlaced] = "BidPlaced";
        states[State.DepositMade] = "DepositMade";
        states[State.InDispute] = "InDispute";
        states[State.Complete] = "Complete";
    }

    function returnState() external view returns (string memory) {
        return states[state];
    }
}
