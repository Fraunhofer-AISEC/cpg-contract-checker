function viewTokensOwned(address _contractAddress) public view returns(uint256[] memory){
        require(trustedContracts [_contractAddress], "Not a trusted contract");

        uint256 n = 0;

        for(uint256 i = 1; i < 3333; i++) {
            
            if(iSkull(_contractAddress).ownerOf(i) == msg.sender) {
                n++;
            }
            else {
            continue;
            }
        }
        
        uint256[] memory _tokensOwned = new uint256[](n);

        for(uint256 i = 1; i < 3333; i++) {
            if(iSkull(_contractAddress).ownerOf(i) == msg.sender) {
                _tokensOwned[i];
            }
            else {
            continue;
            }

        return _tokensOwned;
        }
}