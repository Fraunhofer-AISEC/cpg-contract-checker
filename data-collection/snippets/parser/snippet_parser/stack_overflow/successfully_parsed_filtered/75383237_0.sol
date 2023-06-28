contract Test {
    address public addr;
    bytes public sourceCode;


    function deploy() private returns (address pointer) {
        bytes memory code = abi.encodePacked(
            hex"60003560805260206080f3"
            );

        sourceCode = code;
        
        assembly { 
            pointer := create(0, add(code, 32), mload(code)) 
        }
        addr = pointer;
        return pointer;
    }

    function win() public returns (bool, bytes memory, uint) {
        address a = deploy();
        (bool sent, bytes memory data) = address(this).call(abi.encodeWithSignature("func()"));
        uint returnValue = abi.decode(data, (uint));
        return (sent, data, returnValue);
    }
}