contract Group {
    struct Person {
        uint age;
        bytes32 name;
    }
    mapping (address => Person) members;
}

contract RockBand {
    struct Musician {
        uint age;
        bytes32 name;
        bytes32 instrument;
    }
    mapping (address => Musician) members;
}

contract FootballClub {
    struct Player {
        uint age;
        bytes32 name;
        bytes32 position;
    }
    mapping (address => Player) members;
}
