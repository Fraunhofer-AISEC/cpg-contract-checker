
pragma solidity ^0.5.17;


import "@openzeppelin/contracts@2.5.1/token/ERC721/ERC721Full.sol";

contract DevExchange {
    ERC721Full public token;

    mapping(uint => uint) orderBook;

    event TokenListed(
        uint indexed _tokenId,
        uint indexed _price
    );
    
    event TokenSold(
        uint indexed _tokenId,
        uint indexed _price
    );

    constructor(address _tokenAddress) public {
        token = ERC721Full(_tokenAddress);
    }

    function listToken(uint _tokenId, uint _price) public {
        address owner = token.ownerOf(_tokenId);
        require(owner == msg.sender, "caller is not owner");
        require(token.isApprovedForAll(owner, address(this)));

        orderBook[_tokenId] = _price;
        emit TokenListed(_tokenId, _price);
    }
    
    
    
        
    
    
        
    
    
        
    
    
    
    
    function listingPrice(uint _tokenId) public view returns (uint) {
        return orderBook[_tokenId];
    }
        
    function validBuyOrder(uint _tokenId, uint _askPrice) private view returns (bool) {
        require(orderBook[_tokenId] > 0);
        return (_askPrice >= orderBook[_tokenId]);   
    }    
    
    function markTokenAsSold(uint _tokenId) private {
        orderBook[_tokenId] = 0;
    }
}

