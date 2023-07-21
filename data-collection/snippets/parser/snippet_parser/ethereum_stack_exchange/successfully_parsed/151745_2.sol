contract Deployer {

   bytes public implementation;

   constructor(bytes _implementation) {
      implementation = _implementation;
   }

   function deployContract() public returns (address deployed) {
      bytes memory bytecode = abi.encodePacked(implementation, abi.encode(msg.sender));
      assembly{
            deployed := create(0, add(bytecode, 0x20), mload(bytecode))
            if iszero(extcodesize(deployed)) {
                revert(0, 0)
            }
      }
   }

   function changeImplementation(bytes memory _implementation) public {
      implementation = _implementation;
   }
}