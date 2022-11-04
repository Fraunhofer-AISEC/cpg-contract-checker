
pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; 
    uint constant total_supply =7777;
    
    constructor() ERC721("MyNFT", "MNFT") public {}
    
    struct Cards{
        uint supply;
        string description;
        uint card_id;
    }
    
    Cards[] public card;
    mapping(uint =>Cards)public allCards;
    
    function createCard(uint _supply, string memory _desc) public returns(uint){
        assert(_supply<total_supply);
        _tokenIds.increment();
        uint256 newNftTokenId = _tokenIds.current();
        card = Cards({supply:_supply, description:_desc,card_id:newNftTokenId});
        allCards[newNftTokenId-1]=card;
        Cards[newNftTokenId-1].push(card);
        
    }
    
    function mintToken( uint _s, string memory _d,  string memory _tokenURI) public onlyOwner
    {
        uint newid=createCard(_s, _d);
        address _address = msg.sender;
        _safeMint(_address, newid);
        _setTokenURI(newid, _tokenURI);
        
    }
}
