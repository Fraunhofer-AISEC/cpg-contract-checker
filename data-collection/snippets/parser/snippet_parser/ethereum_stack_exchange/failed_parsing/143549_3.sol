contract TestWrapper{
  address TestContract;
  function callTest(address target) external {
    (bool s, bytes memory returndata) = TestContract.call(abi.encodeWithSignature("callToken(address)", target);
    
        if(s == false) {
          
        }
        else{
          
        }
  }
}
