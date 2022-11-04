pragma solidity ^0.6.0;

contract Item {
     uint public blabla1;
     uint public blabla2;
     
     constructor(uint _blabla1, uint _blabla2) public {
         blabla1 = _blabla1;
         blabla2 = _blabla2;
     }
     
     function returnData() view public returns(uint, uint) {
         return (blabla1, blabla2);
     }
}

contract Collection {
    Item[]public items;
    
    function addItemContract(uint _blabla1, uint _blabla2) public {
        items.push(new Item(_blabla1, _blabla2));
    }
    
    function readItemContract(uint _index) public view returns(uint, uint) {
        return Item(items[_index]).returnData();
    }
}
