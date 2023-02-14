function setRec (uint id, string name, string senderaddress, string reciveraddress, string scheduletime, string scheduledate, uint time) public {
     uint index = records[id].push(Record(name, senderaddress, reciveraddress, scheduletime, scheduledate, time =now));
     
     
     recordIndex[id][now] = index;
}
