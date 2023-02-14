contract A {

uint public u;
event abc(address);

constructor() payable{
    u=100;
}

function () payable{
    emit abc(msg.sender);
    u = 25;
}

function setu(uint i) {
    u = i;
}

function getBalance() view returns(uint){
    return address(this).balance;    
}
}