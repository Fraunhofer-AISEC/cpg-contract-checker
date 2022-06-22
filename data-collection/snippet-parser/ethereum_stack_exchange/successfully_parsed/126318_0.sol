   pragma solidity >=0.8.0;
    contract marketplace{
      bytes32 offerFromConsumer;
      bytes32 offerFromProducer;

      function setValuea(bytes32 a) external{
          offerFromProducer = a;
      }

      function setValueb(bytes32 b) external{
          offerFromConsumer = b;
      } 

      function checkOffers() public view returns (bool){

          bytes32 a = offerFromProducer;
          bytes32 b = offerFromConsumer;

          if(a == b){
              return true;
          }
          return false;
    }    
}
