
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Test is ERC721 {
    uint[] private Info;
    
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "You aren't the owner!");
        _;
    }

    
    constructor(uint[] memory _Info, uint[] memory _SecondInfo) ERC721("TESTToken", "TST") {
        
        owner = msg.sender;
        SetInfo(_Info);
        SetSecondInfo(_SecondInfo);
    } 

    function SetInfo(uint[] memory data) private onlyOwner {
        Info = new uint[](data.length);
        for(uint i = 0; i < data.length;i++){
            Info[i] = data[i];
        }
    }

    function SetSecondInfo(uint[] memory data) private onlyOwner {
        
    }
}
