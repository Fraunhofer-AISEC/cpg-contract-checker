struct Gambler {
    uint token;
    uint encRandomNumber;
    bool exist;
    address gamblerAdd;
    address issuer;
}

mapping (int =>  Gambler) public gamblers;
uint public currentNumofGamblers=0;

function joinLottery (uint _token, uint _RandomNumber,
    address _issuer){
    Gambler newGambler = gamblers[int(currentNumofGamblers)]; 
    newGambler.token = _token;
    newGambler.encRandomNumber = _encRandomNumber;
    newGambler.exist = true;
    newGambler.gamblerAdd = msg.sender;
    newGambler.issuer = _issuer;
    currentNumofGamblers++;
    winningNumber = RandomNumber; 
}
