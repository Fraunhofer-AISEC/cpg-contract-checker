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

contract ItemListCallerContract {

     ItemListContract itemListContract;

     function ItemListCallerContract() {
         itemListContract = ItemListContract(0x16c5d0c8fccaf7e5824f5ae25c1662877cec6452);
     }

     function getItemCount() constant returns(uint count) {
         return itemListContract.countItemList();
     }
}
