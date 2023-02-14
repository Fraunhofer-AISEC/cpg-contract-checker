pragma solidity >0.4.99 <0.6.0;

import "./SafeMath.sol";

contract PiggyBank {

using SafeMath for uint256;

struct Box {
    address owner;
    uint256 targetFigure;
    uint256 balance;
}

mapping (address =>  mapping (uint16 => Box)) public myBoxes;

event Deposit (
    address indexed _from,
    uint16 indexed _to,
    uint256 indexed _amount
);

event Withdraw (
    uint16 indexed _whichBox,
    address indexed _to,
    uint256 indexed _amount
);

function createBox(uint16 _boxid, uint _targetFigure) public {
    myBoxes[msg.sender][_boxid].owner = msg.sender;
    myBoxes[msg.sender][_boxid].targetFigure = _targetFigure;
    myBoxes[msg.sender][_boxid].balance = 0;
}

function getBoxInfo(uint16 _boxid) onlyOwner(_boxid) public view returns (uint256, uint256) {
    return (myBoxes[msg.sender][_boxid].targetFigure, myBoxes[msg.sender][_boxid].balance);
}

function deposit(uint16 _boxid,uint256 _amount) onlyOwner(_boxid) public payable {
    require(msg.value == _amount);
    myBoxes[msg.sender][_boxid].balance = myBoxes[msg.sender][_boxid].balance.add(msg.value);
    emit Deposit(msg.sender,_boxid, _amount);
}

function withdraw(uint16 _boxid) onlyOwner(_boxid) public payable {
    require(myBoxes[msg.sender][_boxid].targetFigure <= myBoxes[msg.sender][_boxid].balance);
    uint amount = myBoxes[msg.sender][_boxid].balance;
    myBoxes[msg.sender][_boxid].balance = 0 ;
    msg.sender.transfer(amount);
    breakBox(_boxid); 
    emit Withdraw (_boxid, msg.sender, amount);
}

function checkBalance() view public returns (uint){
    return(msg.sender.balance);
}

function breakBox(uint16 _boxid) public {
    delete myBoxes[msg.sender][_boxid];
}

 modifier onlyOwner(uint16 _boxid) {
   require(msg.sender == myBoxes[msg.sender][_boxid].owner);
    _;
}
}
