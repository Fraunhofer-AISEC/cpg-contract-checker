
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract MyToken is ERC1155, Ownable {
        uint256 public constant Poloy = 1;
        uint256 public constant Leafy = 2;

        mapping (uint256 => uint256) public tokenSupply;

    constructor()
        ERC1155("https://ipfs.io/ipfs/3bz4r7c6q3fjmt2uoicyibx2nhf7q6gtsdgze277wzlnadbvfme/{id}.json") {}


    function uri(uint256 _tokenId) override public pure returns (string memory){
        return string(
            abi.encodePacked(
            "https://ipfs.io/ipfs/bafybeid3bz4r7c6q3fjmt2uoicyibx2nhf7q6gtsdgze277wzlnadbvfme/",
            Strings.toString(_tokenId),
            ".json"
        )
        );
    } 

    
        function mintPoloy() public{
        require(balanceOf(msg.sender,Poloy) == 0,"you already have a polo ");
        require(balanceOf(msg.sender,Leafy) == 0,"you already have a token cheaty cheater ");
        _mint(msg.sender, Poloy, 1, "0x000");
}

    
        function mintLeafy() public {
        require(balanceOf(msg.sender,Leafy) == 0,"you already have a leaf ");
        require(balanceOf(msg.sender,Poloy) == 0,"you already have a token cheaty cheater ");
        _mint(msg.sender, Leafy, 1, "0x000");
}


function totalSupply(uint256 id) public view returns (uint256) {
    return tokenSupply[id];
  }   

}
