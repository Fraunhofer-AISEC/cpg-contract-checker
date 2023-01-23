pragma solidity 0.4.20;

contract Complainer {

    function doRevert() public pure returns(bool success) {
        revert(); 
        return true;
    }

}

contract Adjacent {

    bool state;

    event LogStateChange(address sender, bool succeeded);

    function setState() public returns(bool success) {
        state = true;
        LogStateChange(msg.sender, true);
        return true;
    }
}

contract Originator {

    Complainer c;
    Adjacent a;

    event LogSucceeded(address sender, bool succeeded);
    event LogResult(address sender, bool adjacentResponse, bool complainerResponse);

    function Originator(address complainer, address adjacent) public {
        c = Complainer(complainer);
        a = Adjacent(adjacent);
    }

    function test() public returns(bool success) {
      LogSucceeded(msg.sender, true); 
      bool aResponse = a.setState();  
      bool cResponse = c.doRevert();  
      LogResult(msg.sender, aResponse, cResponse); 
      return true; 
    }

    function test2() public returns(bool success) {
      LogSucceeded(msg.sender, true); 
      bool aResponse = a.setState();  
      bool cResponse = c.call(bytes4(sha3("doRevert()"))); 
      LogResult(msg.sender, aResponse, cResponse); 
      return true; 
    }
}
