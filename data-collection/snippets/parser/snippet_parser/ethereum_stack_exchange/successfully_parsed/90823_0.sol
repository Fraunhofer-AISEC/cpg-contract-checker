contract TokenMkt {
    struct TokenInfo {
        address payable owner;
        uint256 price;
    }

    ERC721 nftToken;

    
    mapping (uint256 => TokenInfo) forSale;

    uint256 constant COMMISION_FEE = 2; 

    
    function putOnSale(uint256 tokenId, uint256 price) public {

        
        TokenInfo storage ti = forSale[tokenId]
        ti.owner = msg.sender;
        ti.price = price;

        
        nftToken.safeTransferFrom(owner, address(this), tokenId);
    }

    
    function buyToken(uint256 tokenId) public payable {

        
        TokenInfo storage ti = forSale[tokenId]

        
        require(msg.value >= ti.price, "Not enough ether");

        
        nftToken.safeTransferFrom(address(this), msg.sender, tokenId);

        address payable owner = ti.owner;
        uint256 fee = ti.price * COMMISION_FEE / 100;
        
        walletFee.transfer(fee); 

        owner.transfer(ti.price - fee); 

        
        msg.sender.transfer(msg.value - ti.price);
    }
}