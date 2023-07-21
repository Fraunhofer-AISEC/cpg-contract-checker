contract Deployer {

   address public implementation;

   constructor(address _implementation) {
      implementation = _implementation;
   }

   function deployContract() public returns (address deployed) {
      bytes memory bytecode = abi.encodePacked(implementation.code, abi.encode(msg.sender));
      assembly{
            deployed := create(0, add(bytecode, 0x20), mload(bytecode))
            if iszero(extcodesize(deployed)) {
                revert(0, 0)
            }
      }
   }
}