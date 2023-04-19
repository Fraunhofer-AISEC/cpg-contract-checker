contract Storage {
    uint256 number;

    function incP(uint256 i) public {
        number = number + i;
    }

    function incE(uint256 i) external {
        number = number + i;
    }
}
