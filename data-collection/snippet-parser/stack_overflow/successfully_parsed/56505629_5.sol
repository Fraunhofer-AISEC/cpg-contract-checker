contract MyToken is StandaloneERC20 {
    function initialize(
        address owner, 
        address minter, 
        address[] memory pausers
    ) public initializer {
        address[] memory minters = new address[](1);
        minters[0] = minter;
        StandaloneERC20.initialize("MyToken", "MTK", uint8(18), minters, pausers);
    }
}
