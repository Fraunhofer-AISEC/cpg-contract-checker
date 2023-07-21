pragma solidity ^0.8.9;


import "@openzeppelin/contracts@4.8.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@4.8.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";



contract Cloudy is ERC1155, Ownable, ERC1155Supply {

    uint256 constant SleepyPinkDragon = 1;
    uint256 constant ThickCloud = 2;
    uint256 constant BlackHairPelicanCloud = 3;
    uint256 constant Superhuman = 4;
    uint256 constant Rattle = 5;

    mapping (uint256 => string) private _uris;

    constructor() ERC1155("https://arweave.net/sJa3zzrBzb2ejG_96_dzv_Jt9IdTdLNMbquxwa0Q/clo.json")
    {
        
     _mint(msg.sender, SleepyPinkDragon, 22, "");
     _mint(msg.sender, ThickCloud, 5, "");
     _mint(msg.sender, BlackHairPelicanCloud, 5, "");
     _mint(msg.sender, Superhuman, 3, "");
     _mint(msg.sender, Rattle, 3, "");
    }


  function uri(uint256 _tokenId) override public pure returns (string memory) {
        return string(abi.encodePacked("https://arweave.net/sJa3zzrBzb2ejG_96_dzv_Jt9IdTdLNMbquxwa0Q/clo", Strings.toString(_tokenId),".json"));
    }


    function setURI(string memory newuri) external onlyOwner {
        _setURI(newuri);
    }


    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
