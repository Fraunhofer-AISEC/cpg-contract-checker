    uint public numNfts;


    
    
    mapping(address => uint256[]) public ownerToNftIndices;


    
    
    mapping(uint256 => Nft) public nftMapping;
    

    
    struct Nft {
        uint256 id;
        

        address tokenAddress;
        
        
        
        uint tokenId;
       
        uint256 timeStamp;
    }
