function getrec(uint id , uint time) view returns (string, string, string, string, string, uint) {
    uint index = recordIndex[id][time];
    
    require(index > 0, "invalid time");
    index -= 1;
    string a = records[id][index].name;
    string b = records[id][index].senderaddress;
    string c = records[id][index].reciveraddress;
    string d = records[id][index].scheduletime;
    string e = records[id][index].scheduledate;
    uint f = records[id][index].time;

    return (a, b, c, d, e, f);
}
