contract checkBalanceOf {
    mapping (address => uint) public  balanceOf;
    function balanceOf() public returns (uint256) {
        address  ERC20Address = targetInterface(0x18895B2a605CdAb301482d8F96E59FaDc17964C3);
        return ERC20Address.balanceOf(bankAddress);
    }
}