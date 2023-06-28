contract ItemListContract {
    struct  item 
    {
      bytes iname;
      uint16 itemid;
      bytes icode;
      uint ivalue;
    }
    uint itemcount;
    mapping(bytes => item) itemlist;
    item[] itemarray;
    function ItemListContract()
    {
       log0('hi');
    }
    function AddItem(bytes name, uint16 iid, bytes code, uint val)
    {        
       var itemnew = item(name, iid ,code, val);
       log0(itemnew);
       itemlist[code] = itemnew;
       itemarray.push(itemnew);
       itemcount++;
    }
    function countitemlist() returns (uint count)
    {     
      return itemcount;
    }

    function removeitem(bytes code)
    {
    delete itemlist[code];
    itemcount--;
    }
    function getitem(bytes code) returns (bytes iname, uint val)
    {   
      return (itemlist[code].iname,itemlist[code].ivalue);
    }
}
