
pragma solidity >=0.7.0 <0.9.0;

import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';

contract ArtWorkMinter is ERC721URIStorage{

  mapping(uint256 => address) idToOwner;
  mapping(address => uint256[]) userTokenList;
  mapping(uint256 => uint256) tokenPriceList;

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  constructor() ERC721("MyNFT", "MNFT") {}

    function mint_art_work(address receiver, string memory tokenURI, uint price) external {
    _tokenIds.increment();

    uint256 newNftTokenId = _tokenIds.current();
    _mint(receiver, newNftTokenId);
    _setTokenURI(newNftTokenId, tokenURI);

    userTokenList[receiver].push(newNftTokenId);
    idToOwner[newNftTokenId] = receiver;
    tokenPriceList[newNftTokenId] = price;
  }

  function my_total_tokens(address receiver) external view returns (uint256){
    return userTokenList[receiver].length;
  }

  function get_my_nft_tokens(address receiver) external view returns (uint256[] memory){
    return userTokenList[receiver];
  }

  function get_token_details(uint token_id) external view returns (string memory){
    return tokenURI(token_id);
  }

  function _transfer_token(address from_address, address to_address, uint token_id) internal{
    
    idToOwner[token_id] = to_address;
    
    for(uint i = 0; i<userTokenList[from_address].length-1; i++){
      if(userTokenList[from_address][i] == token_id){
        userTokenList[from_address][i] = userTokenList[from_address][userTokenList[from_address].length - 1];
        userTokenList[from_address].pop();
        break;
      }
    }
    
    userTokenList[to_address].push(token_id);
  }

  function transfer_token(address from_address, address to_address, uint token_id) external{
    
    require(ownerOf(token_id) == msg.sender, "NOT OWNER");
    
    approve(to_address, token_id);
    
    safeTransferFrom(from_address, to_address, token_id);

    _transfer_token(from_address, to_address, token_id);
  }

  function buy_token(uint token_id) external payable{
    require(msg.value >= tokenPriceList[token_id]);
    
    approve(msg.sender, token_id);
    
    address token_owner = ownerOf(token_id);
    safeTransferFrom(token_owner, msg.sender, token_id);
    _transfer_token(token_owner, msg.sender, token_id);
    
    payable(token_owner).transfer(msg.value);
  }
}
