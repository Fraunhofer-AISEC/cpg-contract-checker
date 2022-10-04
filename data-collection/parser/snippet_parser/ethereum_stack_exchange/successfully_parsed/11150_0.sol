contract UnitCounter {
    mapping (address => uint256) public UnitsFrom;
    uint256 public TotalUnits;

    function submitUnits(uint256 Units) {
        UnitsFrom[msg.sender] = Units;
        TotalUnits += Units;
    }
}
