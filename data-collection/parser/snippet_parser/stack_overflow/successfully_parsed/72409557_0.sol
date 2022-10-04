 uint256 public cost = 0.001 ether;
 function test(uint256 _mintAmount) public payable {
               require(msg.value >= cost * _mintAmount);
               
    }
