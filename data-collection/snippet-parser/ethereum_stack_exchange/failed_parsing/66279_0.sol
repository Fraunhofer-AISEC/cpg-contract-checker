
function unlockMessage(string name) public payable returns (bool) {
^------^  
pragma solidity ^0.4.25;

contract TrojanSecret {

uint memberCount;

string public name;
string public symbol;

mapping (string => address) Trojans;
mapping (string => string) secrets;
mapping (string => address[]) access;
mapping (string => uint) balance;
uint amount_for_unlock;



constructor() public{
        name   = "Secrets"; 
        symbol = "S" ;
        amount_for_unlock = 1 ether;

}

function registerTrojan(string name) public returns(bool){
    if( Trojans[name] == address(0))  
    {
        memberCount ++;
        Trojans[name] = msg.sender;
        return True;
    } else {
        return false;
    }
}
function unregisterTrojan(string name) public {
    require( Trojans[name] != address(0));
    Trojans[name] = address(0);
    memberCount --;
}
function setSecret(string name,string message) public {
   require (Trojans[name] != address(0)&& Trojans[name] == msg.sender);
   secrets[name] = message;
}
function getSecret(string name) public view returns(string){
    require( Trojans[name] != address(0));
    bool flag = false;

    for(uint i = 0; i < access[name].length;i++)
    {
        if(access[name][i] == msg.sender){
            flag = true;
            break;

        }
    }
     if(flag){
         return secrets[name];
     }
     return "message is locked";
}

}
function unlockMessage(string name) public payable returns (bool) {
    require( Trojans[name] != address(0));
    if(msg.value == amount_for_unlock){

        balance[Trojans[name]] += msg.value;
        Trojans[name].transfer(msg.value);
        access[name].push(msg.sender);

        return true;
    } 
    else{
        return false;

    }    
}
