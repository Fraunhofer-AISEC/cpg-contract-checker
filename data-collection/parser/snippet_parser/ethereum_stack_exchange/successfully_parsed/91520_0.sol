function isDude(address _dude_address) external returns (bool) {
        if (_dude_address == address(0)) return false;
        if (!dudes[_dude_address]) emit dudeNotConfirmed(msg.sender, _dude_address);
        return dudes[_dude_address];  
    }
