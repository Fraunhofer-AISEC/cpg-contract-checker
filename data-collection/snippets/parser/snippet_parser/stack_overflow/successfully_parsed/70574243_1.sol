library LibDiamond {
struct Position {
    uint Id; 
    uint Size; 
  }

    struct TestStorage {
        uint testInt; 
        mapping(uint => Position) positions;
    }

    function testStorage() internal pure returns (TestStorage storage hs) {
        bytes32 position = keccak256("test.storage");
        assembly {
            hs.slot := position
        }
    }

}
