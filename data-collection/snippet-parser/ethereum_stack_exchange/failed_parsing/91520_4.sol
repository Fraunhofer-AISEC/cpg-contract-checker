mapping (address => bool) dudes;

event RegisterDude(address dude, ...)
..
..
..

function setDude(address _dudeAddress) external {
    dudes[_dudeAddress] = true;
    emit RegisterDude(_dudeAddress, ....);
}

function isDude(address _dude_address) view returns (bool) {
        return dudes[_dude_address]; 
    }

