
mapping(bytes32 => mapping(address => bool)) roles;

function mint(address recipient, uint256 quantity) public {
  require(roles[ADMIN][msg.sender], "unauthorized");
  
}