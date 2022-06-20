contract token {
    mapping (address => uint256) public voteWeight;
    uint public numberOfDelegationRounds;

    function balanceOf(address member) constant returns (uint256 balance) {
        if (numberOfDelegationRounds < 3)
            return 0;
        else
            return this.voteWeight(member);
    }
}
