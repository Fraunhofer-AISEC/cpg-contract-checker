function winNft (uint winningNft ) internal  returns(uint  [] memory){
    for(uint i=0; i < winningNft; i++){
        uint256 winningId =  block.timestamp % ((tokens.length-1) - min + 1) + min;
        collectId.push(tokens[winningId]);
       _transferFrom(address(masterWallet),msg.sender,tokens[winningId]);

        tokens[winningId]=tokens[tokens.length-1];
        tokens.pop();
    }
    findLength=collectId.length;
     return collectId;
    }
