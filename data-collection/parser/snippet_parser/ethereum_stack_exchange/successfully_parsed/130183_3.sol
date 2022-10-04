
pragma solidity ^0.8.0;

  library Test{

  struct Vertex {
    bytes x;
    bytes y;
  }

  struct Data {
    mapping(bytes => Vertex) a;
  }

  function inc(Data storage self) internal {
    self.a['0'].x = "ban"; self.a['0'].y = "sam";
    self.a['1'].x = "tom"; self.a['1'].y = "pan";
  }
}

contract Example{

    address recipient = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    Test.Data Datastruct;

    
    function setName() public {
        Test.inc(Datastruct);
    }

    function getNames() external view returns(string memory) {
        
        Test.Vertex memory v = Datastruct.a['0'];
        return string(abi.encodePacked(v.x));
    }
}
