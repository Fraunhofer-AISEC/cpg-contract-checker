contract OrcBase is InterfaceOrcs {
    struct Orc {
        uint health;
        uint strenth;
    }

    Orc[] orcs;

    function createOrc(uint _health, uint _strenth) public returns(uint) {
        
        Orc memory _orc = Orc({
            health: _health,
            strenth: _strenth
        });
        uint256 newOrcId = orcs.push(_orc) - 1;

        return newOrcId;
    }

    
    
    function totalSupply() public view returns (uint) {
        uint length = orcs.length;
        return length;
    }

    function getOrcHealth(uint id) public view returns (uint) {
        uint health = orcs[id].health;
        return health;
    }

    function getOrcStrenth(uint id) public view returns (uint) {
        uint strenth = orcs[id].strenth;
        return strenth;
    }
}
