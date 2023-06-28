contract Escrow {

address owner;
uint public _counter; 

struct Deposit {
    uint256 depositAmount;
    address buyer;
    address seller;
}

constructor() payable {
owner = msg.sender;
}

mapping(uint => Deposit) public ids; 

event DepositMade(address depositor, uint depositAmount);

function deposit(address _seller) public payable {

    require(msg.value > 0, "error"); 

    Deposit storage _deposit = ids[_counter]; 

    _deposit.depositAmount = msg.value; 

    _deposit.buyer = msg.sender;
    
    _deposit.seller = _seller; 

    _counter++; 

    emit DepositMade(msg.sender, msg.value);
}

function releaseDeposit(uint256 id) public {

    require (msg.sender == ids[id].buyer, "Only maker of the deposit can release deposit.");

    payable(ids[id].seller).transfer(ids[id].depositAmount);
}

}
