contract ATest is Test {
   function testFoo() public {
        
        vm.prank(someAddress);
        A.foo(); 
    }
}
