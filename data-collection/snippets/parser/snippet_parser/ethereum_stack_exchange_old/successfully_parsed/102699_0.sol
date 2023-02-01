pragma solidity >=0.7.0 <0.9.0; 
contract HelloWorld { 
string public message; 
function setMessage(string memory newMessage) public { 
message = newMessage; 
} 

function remove() public {
 selfdestruct(0x0); 
} 
}
