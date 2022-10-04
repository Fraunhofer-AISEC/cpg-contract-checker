uint256 cardsRemaining;
mapping(uint256 => uint256) movedCards;

constructor(...) {
    [...]
    cardsRemaining = N;
}



function getRandom(uint256 k) private returns uint256 {
    [...]
}

function cardAt(uint256 i) private returns uint256 {
    if (movedCards[i]) {
        return movedCards[i];
    } else {
        return i;
    }
}


function draw() public returns uint256 {
    require(cardsRemaining > 0, "All cards drawn");
    
    
    uint256 i = getRandom(cardsRemaining);

    
    uint256 outCard = cardAt(i);

    
    movedCards[i] = cardAt(cardsRemaining - 1);
    movedCards[cardsRemaining - 1] = 0;
    cardsRemaining -= 1;

    return outCard;
}
