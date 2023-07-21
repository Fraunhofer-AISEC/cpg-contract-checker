
pragma solidity ^0.8;
contract Project {
 
struct Card { uint256 id; string title; string about; string skills; }

event CardCreated(uint256 indexed id, string title, string about, string skills);

mapping(uint256 => Card) private cards;
uint256 private cardCount;

function createCard(string memory title, string memory about, string memory skills) public {
    cardCount++;
    cards[cardCount] = Card(cardCount, title, about, skills);
    emit CardCreated(cardCount, title, about, skills);
}

function getCard(uint256 id) public view returns (Card memory) {
    return cards[id];
}
}
