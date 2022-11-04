pragma solidity ^0.8.3;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PS is ERC721URIStorage {
    uint8 public counter=0;
    address payable[] public team;
    uint256[] public shares;
    uint256 basePrice=1000000000000000;
    
    constructor() ERC721("Project Snooze", "SHP")  {
        team=[
            payable(0x85F407ad0d51900d0F9A0a0dcBc13d7Ab15315C4),    
            payable(0xDE5Debf6dd2a839088c02eAe3837Da4bC167C46e),
            payable(0x892fA83481E4b3dDE0Fcc349336d8460801bD7e3),
            payable(0xca028E9BF547b172Bc70085bCd56DA21562d13fb),
            payable(0x259AC567f6C03DE50fbbF7540501C5e1042D1C3F),
            payable(0xAA21774eCdfb34765545bA86667Be04d5331c938),
            payable(0x2653E8Da3D9Eb397362FEEF66a5266D778792BDF)
        ];
        shares=[22,22,22,22,4,4,4];
    }
    
    function dividends()public payable{
        uint256 total = address(this).balance;
        for (uint256 i = 0; i < team.length; i++) {
            team[i].transfer((total * (shares[i] * 100)) / 10000);
        } 
    }

    function createToken(string memory tokenURI) public payable returns (uint) {
        require(counter<7778, "No more");
        require(msg.value>=basePrice,"Minimum token price is 0.07777 ETH.");
        counter+=1;
        _mint(msg.sender, counter);
        _setTokenURI(counter, tokenURI);
        return counter;
    }
}
