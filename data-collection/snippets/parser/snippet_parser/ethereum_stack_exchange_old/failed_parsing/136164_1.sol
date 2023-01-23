contract NFTCollectionTest is Test {
   ...
   function testMint() public {
      address someRandomUser = vm.addr(1);
      vm.prank(someRandomUser);
      vm.deal(someRandomUser, 1 ether);
      nftCollection.mint{value: 0.01 ether}();
      ...
   }
}
