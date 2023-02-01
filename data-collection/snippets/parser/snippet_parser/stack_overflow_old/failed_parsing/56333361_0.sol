contract {
    struct FutureOperation is Ownable {
        uint256 date;
        uint256 price;
        uint256 amount;
        string name;
    }

    FutureOperation[] futureOperations;

    

    function getAllFutureOperations() public onlyOwner returns (FutureOperation[]) {
        return futureOperations;
    }
}
