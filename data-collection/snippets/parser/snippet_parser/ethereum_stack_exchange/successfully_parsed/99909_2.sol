
pragma solidity ^0.8.0;

contract B {
   event Foo(uint256 x);

   function foo(bytes32[10] calldata values, function(int256[] memory, bytes32[] memory) external callback) external {
       int256[] memory r = new int256[](1);
       r[0] = 1234;
       bytes32[] memory s = new bytes32[](1);
       s[0] = bytes32(uint256(4321));
       callback(r, s);
       emit Foo(1111);
   }

}

contract A {
    address public b;
    
    event Callback(uint256);
    
    constructor() {
        b = address(new B());
    }

    function bar() public{
        bytes32[10] memory myArray;
        (bool success, bytes memory data) = b.call(
            abi.encodeWithSignature(
                "foo(bytes32[10],function)",
                myArray,
                this.callback
            )
        );
        require(success, "CALL Failed");
    }

    function callback(int256[] calldata mapInt, bytes32[] calldata mapBytes32) external {
        emit Callback(4444);
    }
}

