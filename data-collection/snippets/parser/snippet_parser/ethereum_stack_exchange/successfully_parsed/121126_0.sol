 mapping(uint256 => Nft) public nftMapping;

 struct Nft {

        
        uint256 id;
        
        address tokenAddress;
        
        
        
        uint tokenId;
        
        
        
        
        uint tokenStandard;
        
        uint256 likes;
        
        uint256 dislikes;
        
        
        
        
        
        
        
        int256 netlikes;
        
        uint256 milestone;
        
        
        mapping(address => bool) usersLiked;
        
        
        mapping(address => bool) usersDisliked;
        
        uint256 timeStamp;
    }


    
    event NftDisliked(uint256 nftId, address disliker, uint timeStamp);
    
    function dislikeNft(uint256 _nftId) public {
    
         Nft storage n = nftMapping[_nftId];
    
        if (n.usersDisliked[msg.sender] == true) revert alreadyDisliked();
    
        if (n.usersLiked[msg.sender] == true) {
            n.usersLiked[msg.sender] == false;
            n.likes--;
            n.netlikes--;
           
        }
    
        
        
        n.usersDisliked[msg.sender] = true;
        n.dislikes++;
        n.netlikes--;
        emit NftDisliked(_nftId, msg.sender, block.timestamp);
    
    }
