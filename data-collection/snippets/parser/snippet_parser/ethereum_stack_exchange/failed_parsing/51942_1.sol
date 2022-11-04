import "./KeyValueStorage.sol";
contract GlobalGeneric {
    KeyValueStorage globalS;
    constructor(KeyValueStorage storage_) public {
        globalS = storage_;
    }
    function claimInterests(address _memberAddr, bytes32 _identifier) public returns (bool success) {
        require(now > globalS.refreshTime[_memberAddr][_identifier] + 90 days);
        .....
    }
....
}
