function removeClaim(uint256 _claimId) public returns (bool success) {
    require(msg.sender == owner || msg.sender == claims[_claimId].issuer);

    
    IdentityContractLib.Claim storage claim = claims[_claimId];
    emit ClaimRemoved(_claimId, claim.topic, claim.scheme, claim.issuer, claim.signature, claim.data, claim.uri);
    burnedSignatures[claim.signature] = true; 

    
    uint256[] storage array = topics2ClaimIds[claim.topic];
    uint32 positionInArray = 0;
    while(_claimId != array[positionInArray]) {
        positionInArray++;
    }

    for(uint32 i = positionInArray; i < array.length - 1; i++) {
        array[i] = array[i+1];
    }

    array.length = array.length - 1;

    
    claim.topic = 0;
    claim.scheme = 0;
    claim.issuer = address(0);
    claim.signature = "";
    claim.data = "";
    claim.uri = "";

    return true;
}
