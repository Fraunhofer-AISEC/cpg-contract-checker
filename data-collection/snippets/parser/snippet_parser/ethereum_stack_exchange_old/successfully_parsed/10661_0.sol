contract itemlistcallercontract {
     ItemListContract itemlistcontract;
     function itemlistcallercontract()
     {
     itemlistcontract = ItemListContract("0x16c5d0c8fccaf7e5824f5ae25c1662877cec6452");
     }

     function getitemcount() constant returns(int count)
     {
     return itemlistcontract.countItemList();
     }
}
