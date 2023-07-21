function uri(uint256 _tokenId) override public pure returns (string memory) {
     return string(
          abi.encodePacked("https://token-cdn-domain/",Strings.toString(_tokenId),".json")
     );
}
