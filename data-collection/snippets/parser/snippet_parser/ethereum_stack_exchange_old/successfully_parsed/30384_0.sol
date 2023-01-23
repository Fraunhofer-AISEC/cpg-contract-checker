contract VectorTest {

   
   function VectorTest() public {
      
   }

   
   function addScalar(int[] self, int a) public pure returns (int[] s) {
      for (uint i = 0; i < self.length; i++)
         s[i] = self[i] + a;
  }

   
   function addVector(int[] self, int[] melf) public pure returns (int[] s) {
      for (uint i = 0; i < self.length; i++)
         s[i] = self[i] + melf[i];
   }

}
