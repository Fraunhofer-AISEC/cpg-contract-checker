pragma experimental ABIEncoderV2;

contract myContract{

    struct FutureOperation {
        uint256 date;
        uint256 price;
        uint256 amount;
        string name;
    }

    string[] futureOperations;

    function getAllFutureOperations() public view returns (string[] memory) {
        return futureOperations;
    }

} 
