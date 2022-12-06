    function _DoubleDown() public payable requireHandActive(true) requirePlayerActive(true) {
    require(msg.value == betAmount[msg.sender]);
    require(playerCards[msg.sender].length == 2);
    require(isSplit[msg.sender] == false);
    uint newCard = randgen();
    playerCards[msg.sender].push(newCard);
    betAmount[msg.sender] += msg.value;
    uint handPower1 = card2PowerConverter(playerCards[msg.sender]);
    if (handPower1 > 21) { 
                processHandEnd(false);
            }
    else {
        isPlayerActive[msg.sender] = false;
        checkGameState();
        }
}

function processHandEnd(bool _win) internal { 
    if (_win == false) {
        }
    else if (_win == true) {
        uint winAmount = betAmount[msg.sender] * 2;
        msg.sender.transfer(winAmount);
        payoutAmount[msg.sender]=winAmount;
    }
    gamestatus[msg.sender] = 5;
    isActive[msg.sender] = false;
    broadcastHand();
}
