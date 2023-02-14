pragma solidity ^0.4.17;

contract Experment2 {
uint public creationTime = now;
struct Record {
  
   
   string name;
   string senderaddress;
   string reciveraddress;
   string scheduletime;
   string scheduledate;
  
   uint time;
}
mapping (uint => Record[]) records;


function setRec (uint id, string name, string senderaddress, string reciveraddress, string scheduletime, string scheduledate, uint time) public {
     records[id].push(Record(name, senderaddress, reciveraddress, scheduletime, scheduledate, time =now));
}

function getrec(uint id , uint index) constant returns(string, string, string, string, string, uint){ {
    var a = records[id][index].name;
    var b = records[id][index].senderaddress;
    var c = records[id][index].reciveraddress;
    var d = records[id][index].scheduletime;
    var e = records[id][index].scheduledate;
    var f = records[id][index].time;

}
return(a,b,c,d,e,f);
}


function get_last_ten(uint id) constant returns (uint[10]){
    
    uint[10] memory lastItem2;
    for(uint i=0;i<10;i++){
        if(records[id].length>i){
          
            lastItem2[i] = records[id][records[id].length-i-1].time;
        }
    }
    return (lastItem2);
}
}
