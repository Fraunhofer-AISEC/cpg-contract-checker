function checkIfPairExists(address _token1, address _token2) internal returns(uint, bool) {
    for (uint index = 0; index < tokenPairs.length; index++) {
        if (tokenPairs[index].token1 == _token1 && tokenPairs[index].token2 == _token2) {
            return (index, true);
        }
        else if (tokenPairs[index].token2 == _token1 && tokenPairs[index].token1 == _token2) {
            return (index, true);
        } else {
            return (0, false);
        }
    }

}
