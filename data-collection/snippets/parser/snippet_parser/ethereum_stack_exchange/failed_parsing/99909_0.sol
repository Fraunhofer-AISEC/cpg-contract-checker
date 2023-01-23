contract B{
   event Foo();
   ...
   function foo(bytes32[10] calldata values,function(int256[] memory, bytes32[] memory) external callback){
       emit Foo();
       ...
   }

}

contract A{

    address b;
    ...

    function bar(){
       (bool success, bytes memory data) = b.call(
            abi.encodeWithSignature(
                "foo(bytes32[10],function(int256[],bytes32[]))",
                myArray,
                this.callback
            )
        );
        if (!success) {
            revert("CALL Failed");
        }
    }

    function callback(int256[] calldata mapInt,bytes32[] calldata mapBytes32) external {
        ...
    }

