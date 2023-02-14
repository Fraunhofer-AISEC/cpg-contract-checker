

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Context.sol";

pragma solidity ^0.8.0;

contract MyContract is ERC1155, Ownable {


string public name;
string public symbol;

constructor() ERC1155("https://bafybeic3s5lnqldp2poeoyilwhxf672huzqvjk4imd2effxxbjpycnir6a.ipfs.dweb.link/{id}.json") {
    
    _mint(msg.sender, 0, 1, "");
    _mint(msg.sender, 1, 1, "");
    _mint(msg.sender, 2, 1, "");
    _mint(msg.sender, 3, 1, "");
    _mint(msg.sender, 4, 1, "");

    name = "Live NFT test";
    symbol = "LFTT";

    super;
}

function uri(uint256 tokenId) override public view returns(string memory){
    return(
        string(abi.encodePacked(
            "https://bafybeic3s5lnqldp2poeoyilwhxf672huzqvjk4imd2effxxbjpycnir6a.ipfs.dweb.link/",
            Strings.toString(tokenId),
            ".json"
        ))
    );
}
}