contract B {

uint public a;
A ac;

function(){
    a= 20;
}
constructor() payable {
    a=10;
}

function send(A b){
    b.call.gas(210000).value(100 wei)();    
} 

function getBalance() view returns(uint){
    return address(this).balance;    
}
}