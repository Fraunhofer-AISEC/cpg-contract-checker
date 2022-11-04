contract Monster {
    string name;
    uint win;
    uint loss;
    event EmitName(string name);

    address constant public ethermonster = 0xf3259eec5b4a46748a1f608ec3d74b89058bb3ad;
    EtheremonLite monsters_contract;


    constructor() public {
        monsters_contract = EtheremonLite(ethermonster);        
    }

    function create_moster(string monster_name) public returns (bool) {
        monsters_contract.initMonster(monster_name);
    }

    function get_monster_name() public {
        name = monsters_contract.getName(address(this));
        emit EmitName(name);
    }

    function get_last_block_hash() public view returns(uint) {
        return uint(blockhash(block.number -1));
    }

    function get_game_stats() public view returns(string) {
        win = monsters_contract.getNumWins(address(this));
        loss = monsters_contract.getNumLosses(address(this));
        return string(abi.encodePacked("win: ", win, " loss: ", loss));

    }

    function check_attack() public view returns(uint) {
        uint result;
        uint _dice = get_last_block_hash();
        uint dice = _dice / 85;
        return dice % 3;
    }

    function attack() public returns(uint256) {
        return monsters_contract.battle();   
    }
}
