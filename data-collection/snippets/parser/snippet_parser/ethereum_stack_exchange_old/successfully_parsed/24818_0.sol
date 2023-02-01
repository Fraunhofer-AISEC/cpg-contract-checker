  contract Payment{

  Order[] public order;
  struct Order {
  bytes32 item;
  bytes32 location;
  uint qty;
  bytes32 bank;
  bytes32 vendor;
  }


  address add;

function place_order(bytes32 _location, uint _qty,bytes32 _item,bytes32 _bank, bytes32 _vendor) returns (bool success){
        Order memory newOrder;
        newOrder.item=_item;
        newOrder.location=_location;
        newOrder.qty=_qty;
        newOrder.bank=_bank;
        newOrder.vendor=_vendor;

        order.push(newOrder);
        return true;
}

function get_info(bytes32 _vendor) constant returns ( bytes32[],uint[],bytes32[],bytes32[]){



       uint length=order.length;

       bytes32[] memory items = new bytes32[](length);
       bytes32[] memory locations = new bytes32[](length);
       uint[] memory quantities = new uint[](length);
       bytes32[] memory banks = new bytes32[](length);

       for(uint i=0; i< order.length; i++){
         Order memory currentOrder;
         currentOrder = order[i];

         if(currentOrder.vendor == _vendor){
         items[i]=currentOrder.item;
         locations[i]=currentOrder.location;
          quantities[i]=currentOrder.qty;
          banks[i]=currentOrder.bank;


          }
      }
        return (items,quantities,locations,banks);

}
}
