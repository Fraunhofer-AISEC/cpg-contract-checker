function getrec(uint id , uint time) constant returns(string, string, string, string, string, uint){ {
    var a = records[id][time].name;
    var b = records[id][time].senderaddress;
    var c = records[id][time].reciveraddress;
    var d = records[id][time].scheduletime;
    var e = records[id][time].scheduledate;
    var f = records[id][time].time;

}
return(a,b,c,d,e,f);
}
