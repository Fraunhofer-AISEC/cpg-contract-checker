    function getInfo() public view returns (bool, uint8, address) {
        return (
            data[msg.sender].ts != 0,
            data[msg.sender].info,
            msg.sender
        );
    }
