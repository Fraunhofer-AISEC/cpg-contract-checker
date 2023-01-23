
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract lktoken1155 is ERC1155 {
    uint256 public constant Token1Index = 1;
    uint256 public constant Token2Index = 2;
    uint256 public constant Token3Index = 3;

    constructor() ERC1155("https://ipfs.io/ipfs/bafkreicbpwho6rklhm7j2wd5ltrbjowc6xtdlzv33tf4xu72ofmlba3isq") {
        _mint(msg.sender, Token1Index, 1, "");
        _mint(msg.sender, Token2Index, 1, "");
        _mint(msg.sender, Token3Index, 1, "");
    }

    function GenerateToken(address to, uint256 id, uint256 amount, bytes memory data) public virtual
    {
        _mint(to, id, amount, data);
    }

    function uri(uint256 _tokenid) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/bafybeieylamp3dpfk4q7jgmllqig42xa6xx5t5ydu5zfyjegdpccwanyie/",
                Strings.toString(_tokenid),".json"
            )
        );
    }
}
