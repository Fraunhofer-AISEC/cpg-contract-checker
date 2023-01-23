struct Land {
        uint landId;
        uint producerId;
        ...
        string landSize;
    }

uint land_count;
mapping(uint => Lands) m_lands;

function newRegister (uint _landId, uint _producerId, ...) public {
    m_lands[land_count] = Land(_landId, _producerId, ....);
    land_count++;
}

function getLand (uint landId) public returns (bool) {
    for (uint i = 0 ; i < contacts_count; i++) {
        if (m_lands[i].landId) == landId)) {
            return true;
        } else {
            return false;
        }
    }
}
