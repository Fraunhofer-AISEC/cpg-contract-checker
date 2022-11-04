contract Owned {
    address owner;
    address[] listuser;
    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function whitelistAddress (address user) onlyOwner {
        listuser.push(user);
    }   

    modifier onlyusers() {
        

        for(uint index = 0; index < listuser; index++){
            if(userlist[index]==msg.sender){
                _;
                return;
            }
        }
        revert(); 
    }

    function accessbyonlyusers () onlyusers {
        
    }
}
