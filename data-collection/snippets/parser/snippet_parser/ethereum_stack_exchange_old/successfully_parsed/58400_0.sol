pragma solidity ^0.4.19;


contract CharacterEveryDay {

event CharacterSelected(uint8 _character, uint64[256] characterVotes, uint64 day);

uint64[256] public characterVotes;

uint8 public winningCharacter;
uint64 public day; 
uint256 public winningCharacterVotes;
uint256 public timeOfLastVote;

mapping (uint256 => bool) addressVotedToday;

constructor (uint8 _character) public {
    day = 0;
    winningCharacterVotes = 0;
    timeOfLastVote = now;
    voteForCharacter(_character);
}

modifier onlyCharacter(uint256 _character) {
    require(_character < 256);
    _;
}

function voteForCharacter(uint256 _character) public onlyCharacter(_character) {
    if ((now - timeOfLastVote) > 1 days) {
        selectCharacter(winningCharacter);
    }

    uint256 todaysAddressHash = uint(keccak256(abi.encodePacked(day, msg.sender)));
    require(addressVotedToday[todaysAddressHash] == false);

    characterVotes[_character]++;
    if (characterVotes[_character] > winningCharacterVotes) {
        winningCharacter = uint8(_character);
        winningCharacterVotes = characterVotes[_character];
    }
    addressVotedToday[todaysAddressHash] = true;
    timeOfLastVote = now;
}

function getCharacterVotes() external view returns (uint64[256]) {
    return characterVotes;
}

function selectCharacter (uint8 _winningCharacter) private {
    day += uint64((now - timeOfLastVote) / 1 days);
    emit CharacterSelected(_winningCharacter, characterVotes, day);
    delete characterVotes;
    delete winningCharacter;
    delete winningCharacterVotes;
}
}
