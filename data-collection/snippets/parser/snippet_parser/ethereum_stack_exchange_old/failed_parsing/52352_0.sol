using SafeMath for uint256;
using SafeMath32 for uint32;
using SafeMath16 for uint16;


struct BetterForA {
    address whosBetting;
    uint betAmount;
    
    string whichTeam;
    
}

BetterForA[] public bettersForA;

mapping (uint => address) whosBetsAreThese;
mapping (address => uint) countTheseBetters;

modifier hasntBet(uint _betAmount) {
    for (uint i = 0; i <= bettersForA.length; i++) {
        if (bettersForA[i].whosBetting == msg.sender) {
            updateBet(_betAmount, i); 
        } 
    }
    _;
}

function updateBet(uint _betAmount, uint _index) internal returns(uint) { 
    bettersForA[_index].betAmount += _betAmount;
    return bettersForA[_index].betAmount;
}

function iBetA(uint _betAmount) public payable hasntBet(_betAmount) {
    require(_betAmount == msg.value);
    address _better = msg.sender;
    _betAmount = msg.value;

    uint id = bettersForA.push(BetterForA(_better, _betAmount, 'A')) - 1;
    whosBetsAreThese[id] = msg.sender;
    countTheseBetters[msg.sender] = id;
}


}
