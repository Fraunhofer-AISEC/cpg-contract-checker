function addItem(bytes name, uint16 iid, bytes code, uint val) {        
    var itemnew = item(name, iid ,code, val);
    
    itemList[code] = itemnew;
    itemArray.push(itemnew);
    itemCount++;
}
