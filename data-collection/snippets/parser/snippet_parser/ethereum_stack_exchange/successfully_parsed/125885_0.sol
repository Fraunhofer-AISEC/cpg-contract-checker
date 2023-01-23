
pragma solidity >=0.4.21 <0.9.0;

import '@openzeppelin-contracts/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin-contracts/contracts/finance/PaymentSplitter.sol';

contract BALANCE is ERC721 {
    event NftBought(address _seller, address _buyer, uint256 _price);

    mapping (uint256 => uint256) public tokenIdToPrice;
    uint public nextTokenId;
      address public admin;

    constructor() ERC721('Balance', 'BALANCE') {
          admin = msg.sender;
    }
    
      function mint(address to) external {
    require(msg.sender == admin, 'only admin');
    if(nextTokenId < 2){_safeMint(to, nextTokenId);
    nextTokenId++;
    }
  } 
    
              function _baseURI() internal view override returns (string memory) {
    return 'https://.herokuapp.com/';
  }

    function allowBuy(uint256 _tokenId, uint256 _price) external {
        require(msg.sender == ownerOf(_tokenId), 'Not owner of this token');
        require(_price > 0, 'Price zero');
        tokenIdToPrice[_tokenId] = _price;
    }

    function disallowBuy(uint256 _tokenId) external {
        require(msg.sender == ownerOf(_tokenId), 'Not owner of this token');
        tokenIdToPrice[_tokenId] = 0;
    }
    
    function buy(uint256 _tokenId) external payable {
        uint256 price = tokenIdToPrice[_tokenId];
        require(price > 0, 'This token is not for sale');
        require(msg.value == price, 'Incorrect value');
        
        address seller = ownerOf(_tokenId);
        _transfer(seller, msg.sender, _tokenId);
        tokenIdToPrice[_tokenId] = 0; 
        payable(seller).transfer(msg.value); 

        emit NftBought(seller, msg.sender, msg.value);
    }
}

