 function getLevels(uint256 _tokenId) public returns (string memory) {
        level++;
       
        tokenToFeatures[_tokenId] = Features({_level: level})
        return level.toString();
    }
    
    function getStrength(uint256 _tokenId) public returns(string memory){
        strength++;
        tokenIdToFeatures[_tokenId] = Features({_strength: strength});
    }
