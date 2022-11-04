contract MonsterData {
    struct Monster {
        string name;
        int8 category;
    }
    
    Monster[] monsters;
}

contract MonsterCommon is MonsterData {
    function createMonsterCommon(string name) external{
        monsters.push(Monster(name, 1));
    }
}

contract MonsterRare is MonsterData {
    function createMonsterRare(string name) external{
        monsters.push(Monster(name, 2));
    }
}
