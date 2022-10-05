contract MyContract {
    uint256 myVar;
    function balance() external view returns (uint256, uint256) {
        return (address(this).balance, myVar);
    }
}
