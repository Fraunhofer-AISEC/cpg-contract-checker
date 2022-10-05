import "remix_tests.sol"; 
import "./ContainerContract.sol";

contract test_1 {

    ContainerContract container;

    function beforeAll () public {
       container = new ContainerContract();
    }

    function testUserAdding() public returns (string memory) {
        
        string memory name = "Alice";

        bytes32 nameBytes = 0x416c696365000000000000000000000000000000000000000000000000000000;

        
        container.addData(name);
        bytes32 recoveredNameBytes = container.data(0);
        string memory recoveredName = bytes32ToString(recoveredNameBytes);

        
        Assert.equal(nameBytes, recoveredNameBytes, "byte representations should be the same.");
        Assert.equal(name, name, "They should be literally the same.");
        string memory assertMsg = string(abi.encodePacked(name, " and ", recoveredName, " are not the same."));
        Assert.equal(name, recoveredName, assertMsg);
    }

    function bytes32ToString(bytes32 x) public returns (string memory value) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        value = string(bytesStringTrimmed);
    }
}
