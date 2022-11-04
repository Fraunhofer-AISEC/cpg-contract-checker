contract ATest is Test {
       function testFoo() public {
            
            vm.prank(someAddress);
            vm.expectRevert(bytes("State not set correctly for continuation")); 
            A.foo(); 
        }
    }
