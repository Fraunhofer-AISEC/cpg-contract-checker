pragma solidity ^0.8;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumberConsumer is VRFConsumerBase {

bytes32 internal keyHash;
uint256 internal fee;
string public characterNameForMinting;

struct Character {
    uint256 strength;
    uint256 dexterity;
    uint256 constitution;
    uint256 intelligence;
    uint256 wisdom;
    uint256 charisma;
    uint256 experience;
    string name;
}

Character[] public characters;


constructor() 
    VRFConsumerBase(
        0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, 
        0x01BE23585060835E02B77ef475b0Cc51aA1e0709  
    )
{
    keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
    fee = 0.1 * 10 ** 18; 
}

function requestNewRandomCharacter(
    string memory name
) public returns (bytes32) {
    require(
        LINK.balanceOf(address(this)) >= fee,
        "Not enough LINK - fill contract with faucet"
    );
    characterNameForMinting = string(abi.encodePacked(name, "_before"));
    bytes32 requestId = requestRandomness(keyHash, fee);
    characterNameForMinting = string(abi.encodePacked(name, "_after"));
    return requestId;
}

function fulfillRandomness(bytes32 requestId, uint256 randomNumber)
    internal
    override
{
    uint256 strength = (randomNumber % 100);
    uint256 dexterity = ((randomNumber % 10000) / 100 );
    uint256 constitution = ((randomNumber % 1000000) / 10000 );
    uint256 intelligence = ((randomNumber % 100000000) / 1000000 );
    uint256 wisdom = ((randomNumber % 10000000000) / 100000000 );
    uint256 charisma = ((randomNumber % 1000000000000) / 10000000000);
    uint256 experience = 0;

    characters.push(
        Character(
            strength,
            dexterity,
            constitution,
            intelligence,
            wisdom,
            charisma,
            experience,
            characterNameForMinting
        )
    );
}
}