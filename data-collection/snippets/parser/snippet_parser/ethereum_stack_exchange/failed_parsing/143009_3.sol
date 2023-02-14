Counters.Counter private _tokenIdTracker;
........
function _mintMultiple(uint256 numberOfTokens) private {
   for(uint256 i; i < numberOfTokens; i++){
       _tokenIdTracker.increment();
       uint256 newTokenID = _tokenIdTracker.current();
       _safeMint(msg.sender, newTokenID);
    }
}
