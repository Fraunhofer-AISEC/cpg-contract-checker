
pragma solidity ^0.7.0;

contract MyContract{
struct item{
    string itemname;
    uint itemprice;
}

mapping(address => item) public shoppingitems;
address[] public shoppinglist;

event shoppinglog(address item, string name, uint price);

function addshoppingitem(address itemID, string memory itemname, uint itemprice) external{
    shoppingitems[itemID] = item(itemname, itemprice);
    
}

function getitemcount() public view returns(uint count){
    return shoppinglist.length;
}

function shoppingloop() public {
    for(uint i=0; i<studentList.length; i++){
        emit shoppinglog(shoppinglist[i], shoppingitems[shoppinglist[i]].itemname, shoppingitems[shoppinglist[i]].itemprice);
    }
}
}
