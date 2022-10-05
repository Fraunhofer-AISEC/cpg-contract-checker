  struct allowanceInfo {
     address allowedAddress;
     bool isAllowed;
 }

 mapping(address => allowanceInfo) public allowed;
 modifier onlyAllowedAddress(require(msg.sender == allowed[msg.sender].allowedAddress); _;)

 function allow() public onlyAllowedAddress() { 
     allowed[msg.sender].isAllowed = true;
 }
