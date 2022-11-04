contract Whitelist {
 mapping(address => uint) whitelist;
 mapping(address => uint) admins;

    function Whitelist() {
        admins[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(admin[msg.sender] == true);
            _;
    }


    function addWhitelist(address userAddress) onlyAdmin {
            require(userAddress != 0x0 && !whitelist[userAddress]);             
            whitelist[whitelist] = true;    
    }

    function isWhitelisted(address passAddress) external returns (bool) {   
        return whitelist[passAddress];
    }

    function addAdmin(address userAddress) onlyAdmin {
            require(userAddress != 0x0 && !admins[userAddress]);             
            admins[userAddress] = true;    

    }
}
