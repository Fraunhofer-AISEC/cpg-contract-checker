contract Assem {
    uint256 public count;
    function callData() public pure returns(bytes4) {
        assembly {
            calldatacopy(0x0, 0, 4)
            return (0x0, 4)
        }
    }
}
