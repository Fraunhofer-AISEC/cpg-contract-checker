struct MyStruct {
   uint256 number1;
   address address1;
   
}

contract MyContract {
    function foo(MyStruct memory data) public {
        uint256 num1 = data.number1;
        address addr1 = data.address1;
        
    }
}
