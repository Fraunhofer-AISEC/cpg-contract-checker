contract C {
    function _make_payable(address x) internal pure returns (address payable) {
        return (address payable(uint160(x)));
    }
}
