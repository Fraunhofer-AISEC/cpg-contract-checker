struct Deposit {
    uint8 tarif;
    uint256 amount;
    uint40 time;
}

struct Player {
    address upline;
    uint256 dividends;
    uint256 match_bonus;
    uint40 last_payout;
    uint256 total_invested;
    uint256 total_withdrawn;
    uint256 total_match_bonus;
    Deposit[] deposits;
    uint256[5] structure;
}

contract A {
    mapping(address => Player) public players;
    
    
}
