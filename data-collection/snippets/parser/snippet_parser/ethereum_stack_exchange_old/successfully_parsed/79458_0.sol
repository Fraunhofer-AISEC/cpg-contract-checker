interface Test {
    function airDropMultiple(
        address[] calldata recipients,
        uint[] calldata tokenAmount
    )
        external
        returns (bool);
}
