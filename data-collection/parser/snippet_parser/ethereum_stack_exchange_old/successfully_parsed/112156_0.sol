address payable[] public team;
uint256[] public shares;

function dividends()public payable{
    uint256 total = address(this).balance;
    for (uint8 i = 0; i < team.length; i++) {
        team[i].transfer((total * (shares[i] * 100)) / 10000);
    } 
}
