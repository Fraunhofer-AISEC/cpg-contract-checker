function setInitialOwner(address _to, uint256 _tokenId) public
    onlyOwner
    tokensRemainingToAssign
    tenKLimit (_tokenId)
    yesZeroAddressOwner (_tokenId) 
    notSelfSend (_to, _tokenId) {

        tokenIdToOwner[_tokenId] = _to;
        balanceOfAddress[_to] = balanceOfAddress[_to].add(1);
        emit Assign(_to, _tokenId);

        tokenIndexArray.push(_tokenId);

        uint256 length = balanceOf(msg.sender);
        ownedTokensIndexMapping[_tokenId] = length;
        addressToTokenIdByIndex[msg.sender][length] = _tokenId;

        nextTokenIdToAssign = nextTokenFunc(nextTokenIdToAssign);
       hypeKillsTokensRemainingToAssign = tokensRemainingToAssign.sub(1);
        }
