
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./BlueGem.sol";

contract GoblinNFT is ERC721 {

    BlueGem blueGem = BlueGem(0xd9145CCE52D386f254917e481eB44e9943F39138);

    enum Rarity { Common, Uncommon, Rare, Epic }

    address public owner;

    event NewGoblin(Rarity rarity, uint8 bags, uint32 readyTime, uint tokenId);

    uint counterA;

    uint tokenIdDigits = 16;
    uint tokenIdModulus = 10 ** tokenIdDigits;
    uint cooldownTime = 1 days;

    struct Goblin {
        Rarity rarity;
        uint8 bags;
        uint32 readyTime;
        uint tokenId;
        uint price;
        uint contractStartDate;
        uint contractDurationInDays;
        bool selling;
    }

    Goblin[] public goblins;

    mapping (uint => address) public goblinToOwner;
    mapping (address => uint) ownerGoblinCount;

    mapping (address => bool) ownerApprovedToken;

    uint goblinCount;

    constructor() ERC721("Goblin", "GBL") { owner = msg.sender;}

}
