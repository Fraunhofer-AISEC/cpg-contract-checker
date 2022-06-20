contract MyContract {
    struct MyStruct {
        bytes32 name;
        mapping (address => uint256) balances;
    }

    Result[] public results;
}
