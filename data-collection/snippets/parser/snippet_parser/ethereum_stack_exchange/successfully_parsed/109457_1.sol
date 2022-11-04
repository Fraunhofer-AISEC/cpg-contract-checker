error Unauthorized(string reason);


function withdraw() public {
   revert Unauthorized("No Funds"); 
}
