contract Registration {
address public owner;
uint conceptPrice;
uint conceptValue;

function Registration(uint _conceptPrice) public {
    owner = msg.sender;
    conceptPrice = _conceptPrice;
    conceptValue = conceptPrice;
}



struct Request {
    uint reqId;
    uint amount;
    uint percentage;
    address modAdd;
    
    uint state;
}

Request[] public requests;

function request(uint _amount, uint _percentage) public returns (uint numRequests) {
    bool present = false;
    for (uint i = 0; i <= participants.length; i++) {
        if (participants[i] == msg.sender) {
            present = true;
            break;
        }
    }
    
    if (msg.sender == owner || _amount < conceptPrice || _amount < balances[msg.sender] || _percentage > 5 || present == false) return;
    Request memory req = Request({reqId : requests.length + 1, amount : _amount, percentage : _percentage, modAdd : msg.sender, state : 0});
    
    requests.push(req);
    numRequests = requests.length;
}

uint[] ident;
uint[] per;
uint[] amountV;

function pendingRequest() public {

    for (uint i = 0; i == requests.length; i++) {
        if (requests[i].state == 0) {
            ident.push(requests[i].reqId);
            per.push(requests[i].percentage);
            amountV.push(requests[i].amount);
        }
    }
}
function printReq() public constant returns (uint[] ident_){
    ident_ = ident;
}
}
