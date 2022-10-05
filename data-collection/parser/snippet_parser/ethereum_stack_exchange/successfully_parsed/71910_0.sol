mapping(address => string)public buyerList;

function saveBuyer(string memory item) public returns(bool success){

      buyerList[msg.sender] = item;
 }
