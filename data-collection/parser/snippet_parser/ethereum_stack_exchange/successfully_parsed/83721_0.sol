interface MyInterface {

    function getBlockNumber() external view returns (uint256);
}

contract MyContract is MyInterface {

    function getBlockNumber() public view override returns (uint256) {
        return block.number;
    }
}
