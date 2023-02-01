 function calculateBNBReward(address ofAddress) public view returns (uint256) {
    uint256 totalSupply = uint256(totalFee)
    .sub(_gonBalances(address(0)))
    .sub(_gonBalances(0x000000000000000000000000000000000000dEaD)) 
    .sub(_gonBalances(address(pair)));
    

    return Utils.calculateBNBReward(
        totalFee,
        _gonBalances(address(ofAddress)),
        address(this).balance,
        totalSupply,
        ofAddress
    );
}
