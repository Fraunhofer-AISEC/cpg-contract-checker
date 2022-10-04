function test() external payable {
   if (msg.value > 0) {
      assert(false);
   } else {
      assert(true);
   }
}
