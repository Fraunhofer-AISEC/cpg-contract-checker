
    function getLoanId(address _tokenContract, uint256 _tokenId) public pure returns (uint256) {
      return uint256(keccak256(abi.encode(address(_tokenContract), _tokenId)));
    }
