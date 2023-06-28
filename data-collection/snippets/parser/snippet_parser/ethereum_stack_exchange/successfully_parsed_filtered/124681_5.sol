contract Example {
   uint256[4] array = [1, 2, 3, 4];

   constructor () {}

    function getArray() external view returns(uint256[4] memory) {
       return array;
   }
}
