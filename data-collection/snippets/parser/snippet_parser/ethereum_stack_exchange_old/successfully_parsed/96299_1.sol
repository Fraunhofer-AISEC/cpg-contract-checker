contract MyContractForTest is MyContract {
    function getOuter(uint _idx) public view returns (Outer memory) {
        return mapped[_idx];
    }
}
