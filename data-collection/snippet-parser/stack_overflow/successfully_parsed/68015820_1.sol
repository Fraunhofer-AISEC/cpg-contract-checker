contract PointB {
    address PointA = 0x9a6120275387Dc5Aa5dab0D87aeeee5894A3411B;

    function retrieve() public view returns (uint256) {
        uint256 PointA = PointA.call(bytes4(sha3("retrieve()")));
        return PointA;
    }
}
