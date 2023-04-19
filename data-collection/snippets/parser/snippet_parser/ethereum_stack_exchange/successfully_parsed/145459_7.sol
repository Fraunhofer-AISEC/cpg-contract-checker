contract EmitWinner {
    address hoetokenAddress = 0xA56AfB65Df413F36f9c753c2e8E56249a44AB812;
    address bucketAddress = 0x873289a1aD6Cf024B927bd13bd183B264d274c68;
    ERC20 erc20 = ERC20(hoetokenAddress);

    constructor() {}

    function drop(address tokenOwner, uint256 _amount) external {
        
        bool success = erc20.transferFrom(tokenOwner, address(this), _amount);
        require(success, "Transaction Failed");

        
        erc20.approve(bucketAddress, _amount);

        
        Bucket(bucketAddress).drop(hoetokenAddress, _amount);
    }
}
