interface IData {
   function getData() external view returns (unit d1, 
                                             string memory d2, 
                                             address d3, 
                                             unit d4, 
                                             string memory d5, 
                                             unit d6, 
                                             address d7);
}

contract Module {
   IData private keepData;
   constructor(address dataAddress) {
      keepData = IData(dataAddress);
   }

   function doSomething() external {
      unit d1;
      string d2;
      address d3;
      unit d4;
      string d5;
      unit d6;
      address d7;
      (d1, d2, d3, d4, d5, d6, d7) = keepData.getData();
      
      
   }
}
