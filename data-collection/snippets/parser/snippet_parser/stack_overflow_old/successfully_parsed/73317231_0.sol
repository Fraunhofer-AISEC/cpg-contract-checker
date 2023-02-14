   contract Test {

     struct IncrementalPrice{
        uint256 prices;
        uint256 threshold;
     }

     IncrementalPrice[] price = [
        IncrementalPrice(0, 1000),
        IncrementalPrice(0.01 ether, 2000)
     ];
   }
