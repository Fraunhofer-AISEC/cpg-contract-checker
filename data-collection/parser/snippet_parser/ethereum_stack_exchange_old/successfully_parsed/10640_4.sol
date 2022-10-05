pragma solidity ^0.4.0;

contract ItemListContract {
    struct item {
        bytes iname;
        uint16 itemid;
        bytes icode;
        uint ivalue;
    }

    uint itemCount;
    mapping(bytes => item) itemList;
    item[] itemArray;

    function ItemListContract() {
        log0('hi');
    }

    function addItem(bytes name, uint16 iid, bytes code, uint val) {        
        var itemnew = item(name, iid ,code, val);
        
        itemList[code] = itemnew;
        itemArray.push(itemnew);
        itemCount++;
    }

    function countItemList() constant returns (uint count) {     
        return itemCount;
    }

    function removeItem(bytes code) {
        delete itemList[code];
        itemCount--;
    }

    function getItem(bytes code) constant returns (bytes iname, uint val) {   
        return (itemList[code].iname, itemList[code].ivalue);
    }
}
