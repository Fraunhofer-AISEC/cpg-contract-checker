uint[] public indexRef;
function checkUpkeep(bytes memory )
    public
    view
    override
    returns (bool upKeepNeeded, bytes memory performData)
{
    bool go = false;
    for(int i = 0; i < int(autoResolveQ.length) ;i++){
        address nft = autoResolveQ[uint256(i)].nft;
        uint256 tokenId = autoResolveQ[uint256(i)].tokenId;
        if(!_onAuction(nft, tokenId))
            go = true;
    } 
    upKeepNeeded = (go);
    performData = bytes(''); 
}
event PerformedUPKEEP();
function performUpkeep(bytes calldata ) external override {
    
    
    
    
    
    for(int i = 0; int(i) < int(autoResolveQ.length); i++){
        address nft = autoResolveQ[uint256(i)].nft;
        uint256 tokenId = autoResolveQ[uint256(i)].tokenId;
        if(!_onAuction(nft, tokenId)){
            indexRef.push(uint(i));  
        }
    }
    for(int i = 0; i < int(indexRef.length); i++){
        uint idx = indexRef[uint(i)];
        Auction storage auc = autoResolveQ[idx]; 
        _End(auc.nft, auc.tokenId);
        autoResolveQ[idx] = autoResolveQ[autoResolveQ.length-1];
        autoResolveQ.pop();
        indexRef[idx] = indexRef[indexRef.length-1];
        indexRef.pop();
    }
    
    emit PerformedUPKEEP(); 
}
