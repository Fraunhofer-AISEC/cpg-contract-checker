import "./KeyValueStorage.sol";
contract GlobalGeneric is KeyValueStorage {

    function claimInterests(address _memberAddr, bytes32 _identifier) public view returns (bool success) {
        require(now > refreshTime[_memberAddr][_identifier] + 90 days);
        return true;
    }

}
