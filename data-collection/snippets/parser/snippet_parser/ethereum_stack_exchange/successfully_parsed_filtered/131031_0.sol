abstract contract ERC20 is IERC20 {
    
    mapping(address => uint256) public override balanceOf;
}
