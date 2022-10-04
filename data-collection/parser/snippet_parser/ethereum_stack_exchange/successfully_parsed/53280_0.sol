contract Betting{
    struct Player{
        mapping(uint => uint) amounts;

    }

    struct Match{
        address [] playerAdresses;
        uint [] totalBets;
    }

    mapping(address => Player) public playerInfo;
    mapping(uint => Match) public matchInfo;
}
