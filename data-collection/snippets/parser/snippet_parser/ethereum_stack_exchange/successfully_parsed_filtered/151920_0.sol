

pragma solidity >= 0.8.2 < 0.9.0;

import "./CardPacking.sol";

contract CardGenerator is CardPacking{
    
    mapping (uint => address) cardIdToOwner; 
    mapping (address => uint) ownerCardCount;

    function canCardsBeMade() internal view returns (bool) {

        if (cards.length >= 99999999) {
            return false;
        } else {
            return true;
        }
    }

    function randomCardIdGenerator() internal view returns (uint) {

        uint rand = (block.timestamp + cards.length) % cardModulus;  
        return rand;

    }

    function doesCardExist(uint _cardNum) internal view returns (bool){

        for (uint i; i < cards.length; i++){

            if (cards[i] >> 216 == _cardNum){
                return true;
            }

        }

        return false;
    }

    function uniqueCardGenerator() internal view returns (uint randNum){
        bool cardCreated = false;

        while (cardCreated == false) {

            randNum = randomCardIdGenerator();

            if (doesCardExist(randNum) == true){
                continue;
            } else {
                cardCreated = true;
            }
        }        
    }

    function createCard() external payable {

        require(msg.value == 10000 wei); 

        uint cardNum = uniqueCardGenerator();
        cards.push(generateCardUint(cardNum, msg.sender, uint48(block.timestamp),1));
    
        uint id = cards.length - 1; 
        cardIdToOwner[id] = msg.sender;   
        ownerCardCount[msg.sender]++;        
    }
}

