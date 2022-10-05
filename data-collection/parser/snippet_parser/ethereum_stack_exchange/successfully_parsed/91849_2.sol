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

    function returnState() external view returns (string memory) {
        State temp = state;
        if (temp == State.ForSale) return "ForSale";
        if (temp == State.SellerDelisted) return "SellerDelisted";
        if (temp == State.BuyerCancelled) return "BuyerCancelled";
        if (temp == State.BidPlaced) return "BidPlaced";
        if (temp == State.DepositMade) return "DepositMade";
        if (temp == State.InDispute) return "InDispute";
        if (temp == State.Complete) return "Complete";
        return "";
    }
}
