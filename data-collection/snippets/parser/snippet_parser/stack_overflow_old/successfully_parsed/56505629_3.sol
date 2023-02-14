contract MyToken is StandaloneERC20 {

    function initialize(
        address owner,
        address minter,
        address[] memory pausers
    ) public initializer {

        StandaloneERC20.initialize("MyToken", "MTK", uint8(18), [minter], pausers);
    }
}