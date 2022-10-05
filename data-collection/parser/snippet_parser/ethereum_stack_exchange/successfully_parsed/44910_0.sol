  contract Greeter {

  address public owner; 

  function Greeter() public {
    owner = msg.sender; 
  }

  function greet() public view returns(string greeting) {
    require(msg.sender == owner); 
    return "Hello, owner.";
  }
}
