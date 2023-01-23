contract B is A {
 function stake(
        address _userAddress,
        uint256 _amount
    ) internal override updateRewards {}
}
