contract ShippingInterface {
  function shipStuff(bytes32 itemId, uint qty, bytes32 streetAddressId) public returns(bytes32 waybillId);
}

contract Store {

  ShippingInterface s;
  ...
}
