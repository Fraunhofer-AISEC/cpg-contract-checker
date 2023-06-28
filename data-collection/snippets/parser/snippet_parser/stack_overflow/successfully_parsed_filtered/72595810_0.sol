

pragma solidity >=0.7.0 <0.9.0;


contract Reward {

 uint public Holdercount = 0;
 uint public totalsupply = 1000000000 * 10 **18;
 string public name = "Reward";
 string public symbol = "RW";
 uint public decimals = 18;
 address public creater;
 uint public tax = 10;
 uint public createdtime;

 struct Holder {
 address Holderaddress;
 uint Balance;
 uint Number;
 uint Purchasetime;
 bool Boughtbefore;
 }

event Transfer(address indexed from, address indexed to, uint value);
event reward(address receiver, uint amount);

mapping(address => Holder) public Holders ;
address[] public holderlist;

constructor() {
Holdercount += 1;
Holder memory newholder = Holder(msg.sender,totalsupply,Holdercount,block.timestamp,true);
Holders[msg.sender] = newholder;
creater = Holders[msg.sender].Holderaddress;
createdtime = block.timestamp;
holderlist[0] = msg.sender;
}


function transfer(address to, uint value) public returns(bool) {
    require (value >= 10000, 'minimum transfer amount 10000');
    require(Holders[msg.sender].Balance >= value, 'balance too low');
    uint transferamount = value - ((value*tax)/100);
    if(Holders[to].Boughtbefore){
    Holders[to].Balance += transferamount;
    Holders[msg.sender].Balance -= value;}
    if(!Holders[to].Boughtbefore){
    Holder memory Newholder = Holder(msg.sender,transferamount,Holdercount,block.timestamp,true);
    Holders[to] = Newholder;
    Holders[msg.sender].Balance -= value; 
    holderlist.push(to);
    }
    if(Holders[msg.sender].Balance == 0){
        removefromlist(Holders[msg.sender].Number);
        delete Holders[msg.sender];
        Holdercount -= 1;

    }
    emit Transfer(msg.sender, to, value);
    distribute(transferamount);
    return true;
    }



function distribute(uint _charge) internal{
require(Holdercount >1, "unable to distribute");
uint _reward = _charge/Holdercount;
for(uint i=0; i<Holdercount; i++){
    Holders[holderlist[i]].Balance += _reward;
    emit reward(Holders[holderlist[i]].Holderaddress, _reward);
}
}

function removefromlist (uint index) internal {
for (uint i = index; i < holderlist.length; i++){
holderlist[i] = holderlist[i +1];
}
holderlist.pop();
}

function balancecheck(address checkaddress) public returns (uint){
    return Holders[checkaddress].Balance;
}
}
