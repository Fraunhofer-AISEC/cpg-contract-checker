    struct allowanceInfo {
     address allowedAddress;
     bool isAllowed;
     }

    mapping(address => allowanceInfo) public allowed;

    function allow() public { 
        require(msg.sender == allowanceInfo[allowedAddress].allowedAddress);
        allowanceInfo[allowedAddress].isAllowed == true;
        }
