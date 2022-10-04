

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


 contract NFT is ERC721URIStorage,Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address payable public _owner;
    mapping(address => uint[]) public addressToTokenArray;
    mapping(uint256 => bool) public forSale;
    mapping(uint256 => uint256) public tokenIdToPrice;
    event Minting(address _owner, uint256 _tokenId, uint256 _price);
    event Purchase(address _seller, address _buyer, uint256 _price);
    event Remove(uint256 _tokenId, uint[] beforeBuy, uint[] afterBuy);

    constructor() ERC721("TeddyBear", "TEDDY") {
    }

    function mint(string memory _tokenURI, uint256 _price) public onlyOwner returns (bool)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        tokenIdToPrice[newItemId] = _price;
        if(addressToTokenArray[msg.sender].length !=1){
            addressToTokenArray[msg.sender].push(newItemId);
        }else{
            addressToTokenArray[msg.sender] = [newItemId];
        }
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        emit Minting(msg.sender, newItemId, _price);
        return true;
    }

    
    function sell(uint256 _tokenId, uint256 _price) external { 
        require(msg.sender == ownerOf(_tokenId), 'Not owner of this token');
        require(_price > 0, 'Price zero');
        tokenIdToPrice[_tokenId] = _price;
        forSale[_tokenId] = true;
    }

    
    function stopSell(uint256 _tokenId) external {
        require(msg.sender == ownerOf(_tokenId), 'Not owner of this token');
        forSale[_tokenId] = false;
    }

    
    

    
    
    
    
    
    

    function buy(uint256 _tokenId, uint256 sendAmount) external payable {
        uint256 price = tokenIdToPrice[_tokenId];
        bool isOnSale = forSale[_tokenId];
        require(isOnSale, 'This token is not for sale');
        require(sendAmount == price, 'Incorrect value');
        address seller = ownerOf(_tokenId);
        require(seller == ownerOf(_tokenId), 'Seller and Owner is not same');
        
        
        
        
        
        
        
        
        addressToTokenArray[msg.sender] = [_tokenId];
        safeTransferFrom(seller, msg.sender, _tokenId);
        forSale[_tokenId] = true;
        payable(seller).transfer(sendAmount); 
        emit Purchase(seller, msg.sender, sendAmount);
    }

    function getPrice(uint256 _tokenId) public view returns (uint256){
        uint256 price = tokenIdToPrice[_tokenId];
        return price;
    }

    function isSale(uint256 _tokenId) public view returns (bool){
        bool isOnSale = forSale[_tokenId];
        return isOnSale;
    }

    
    function getMyTokenId() public view returns (uint[] memory){
        uint[] memory myTokens = addressToTokenArray[msg.sender];
        return myTokens;
    }
}
