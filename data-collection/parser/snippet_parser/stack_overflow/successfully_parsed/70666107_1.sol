
pragma solidity ^0.7.0;

import "../openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";
import "../openzeppelin-contracts/contracts/utils/Address.sol";
import "../openzeppelin-contracts/contracts/utils/Counters.sol";
import "./ERC20Token.sol";

contract NFTtoken is ERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
   
    bytes32[] candidates = [bytes32('Rama'), bytes32('Nick'), bytes32('Jose')];
    ERC20Token ERC20TokenContract = new ERC20Token(1000, 1, candidates); 
    

    address payable public owner;
    mapping(bytes4 => bool) supportedInterfaces;

    mapping(uint256 => address) tokenOwners; 
    mapping(address => uint256) balances; 
    mapping(uint256 => address) allowance; 
    mapping(address => mapping(address => bool)) operators; 
   
    uint8 public decimals;

    uint256[] public allValidTokenIds;
    mapping(uint256 => uint256) private allValidTokenIndex;
    string[] public allNFTNames;

    struct NFT {
        
        string name;
        address creator;
    }

    mapping(address => NFT) public nftInfo;


    constructor() ERC721("NC NFT example", "NCNFT") {
        owner = msg.sender;
        decimals = 0;
    }


    function mint(string calldata nftName) external payable {
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);

        nftInfo[msg.sender].name = nftName;
        nftInfo[msg.sender].creator = msg.sender;

        allValidTokenIndex[newItemId] = allValidTokenIds.length;
        allValidTokenIds.push(newItemId);
        _tokenIds.increment();
    }

    function transferNFT(address from, address to, uint256 tokenId)  public returns (bool){
        transferFrom(from, to, tokenId);
        ERC20TokenContract.transferFrom(to, nftInfo[from].creator, 10); 

    }

    function allNFTs() public view returns (uint256[] memory) {
        return allValidTokenIds;
    }
}

