
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Monkeys is ERC1155, Ownable {
    uint256 public constant CC1 = 0;
    uint256 public constant CC2 = 1;

    mapping (uint256 => string) private _uris;

    constructor() public ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, CC1, 1000, "");
        _mint(msg.sender, CC2, 1000, "");
    }

    function uri(uint256 tokenId) override public view returns (string memory) {
        return(_uris[tokenId]);
    }
    
    function setTokenUri(uint256 id, string memory url) public onlyOwner {
        require(bytes(_uris[id]).length == 0, "Cannot set uri twice"); 
        _uris[id] = url; 
    }

    function transfer(address from, address to, uint256 id, uint256 amount, bytes memory data) public {
        safeTransferFrom(from, to, id, amount, data);
    }

    function isApproved(address user) public view virtual returns (bool) {
        return isApprovedForAll(owner(), user);
    }

    function getMyToken(address to, uint256 id) public {
        transfer(owner(), to, id, 1, 'test');
    }
}
