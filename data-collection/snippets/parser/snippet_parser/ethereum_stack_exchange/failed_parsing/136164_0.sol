contract NFTCollectionTest is Test {
   ...
   function testMint() public {
      address someRandomUser = vm.addr(1);
      vm.prank(someRandomUser);
      nftCollection.mint{value: 0.01 ether}();
      ...
   }
}
