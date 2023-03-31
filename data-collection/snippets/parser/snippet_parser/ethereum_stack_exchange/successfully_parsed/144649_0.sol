
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";



contract MyToken is ERC1155, Ownable {
    uint256 public constant Michelangelo = 0; 
    uint256 public constant Raffaello = 1;
    uint256 public constant Donatello = 2;
    uint256 public constant Splinter = 3;
    address public tokenOwner;
    uint256 gasRequired;
    address payable receiver;
    address payable owner;
    address payable _to;

    mapping(uint256 => string) private _uris;
    mapping(uint256 => uint256) private tokenIdToPayment;

    constructor()
        ERC1155(
            "ipfs/QmSAG4uLay8LxXNBgMTuLj42D65412cozk32KAmHeLNpD8/metadata.json"
        )
    {
        _mint(msg.sender, Michelangelo, 2, ""); 
        _mint(msg.sender, Raffaello, 4, "");
        _mint(msg.sender, Donatello, 3, "");
        _mint(msg.sender, Splinter, 1, "");
    }

    
    function mint(uint256 tokenId, uint256 amount) public onlyOwner {
        

        if (tokenId == 0) {
            
            _mint(msg.sender, 0, amount, "");
        } else if (tokenId == 1) {
            
            _mint(msg.sender, 1, amount, "");
        } else if (tokenId == 2) {
            
            _mint(msg.sender, 2, amount, "");
        } else if (tokenId == 3) {
            
            _mint(msg.sender, 3, amount, "");
        }
    }

    
    function uri(uint256 tokenId) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "ipfs/QmSAG4uLay8LxXNBgMTuLj42D65412cozk32KAmHeLNpD8/metadata.json"
                )
            );
    }

    

    function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
        
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice"); 
        _uris[tokenId] = uri;
    }

    function transferOO(address _to, uint256 _tokenId) public onlyOwner {
        require(tokenOwner == msg.sender, "Token not owned by sender");

        tokenOwner = _to;
    }

    function transferFAll(address _to, uint256 _tokenId) public {
        require(tokenOwner == msg.sender, "Token not owned by sender");
        tokenOwner = _to;
    }
}
