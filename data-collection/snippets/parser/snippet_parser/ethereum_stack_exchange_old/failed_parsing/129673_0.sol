    function withdraw() external checkOwner{
        uint last_ussage = ussage_fee;
        ussage_fee = 0;
        token.transfer(getRoleMember(OWNER, 0), last_ussage);
    }

    modifier checkOwner(){
        require(hasRole(OWNER, msg.sender), "Only the owner could reset the price");
        _;
    }
