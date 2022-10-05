pragma solidity 0.8.12;

contract marketplace {

    bytes32 public offerFromConsumer;
    bytes32 public offerFromProducer;

    function setValuea(bytes32 a) external{
      offerFromProducer = a;
    }

    function setValueb(bytes32 b) external{
      offerFromConsumer = b;
    } 

    function checkOffers() public view returns (bool) {
      return offerFromProducer == offerFromConsumer;
    }    
}
