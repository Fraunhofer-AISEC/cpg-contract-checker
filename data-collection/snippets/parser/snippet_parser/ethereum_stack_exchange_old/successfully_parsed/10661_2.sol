pragma solidity ^0.4.0;

contract ItemListContract {

    function ItemListContract();

    function addItem(bytes name, uint16 iid, bytes code, uint val);

    function countItemList() constant returns (uint count);

    function removeItem(bytes code);

    function getItem(bytes code) constant returns (bytes iname, uint val);
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
