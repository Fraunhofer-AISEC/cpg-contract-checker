import "dapple/test.sol";

contract MappingArrayOfStructs is Test {

  struct Review {
    uint rating;
    address reviewer;
    string description;
    uint dateAdded;
  }

  mapping (uint => Review[]) ratings;

  function testMappingArrayOfStructs() {
    
    ratings[0].push(Review({
      rating: 0,
      reviewer: msg.sender,
      description: "",
      dateAdded: now
    }));
    
  }

}
