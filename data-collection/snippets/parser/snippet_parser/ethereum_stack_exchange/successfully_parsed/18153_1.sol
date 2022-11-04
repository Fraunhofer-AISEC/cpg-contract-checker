contract Group {
    struct Person {
        uint age;
        bytes32 name;
    }
    mapping (address => Person) members;
}

contract RockBand is Group{
    struct MusicianExtra {
        bytes32 instrument;
    }
    mapping (address => MusicianExtra) membersMusicianExtra;
}

contract FootballClub is Group{
    struct PlayerExtra {
        bytes32 position;
    }
    mapping (address => PlayerExtra) membersFootbalExtra;
}
