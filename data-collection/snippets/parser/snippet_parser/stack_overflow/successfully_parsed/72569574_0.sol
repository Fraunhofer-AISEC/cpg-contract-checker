
   
   pragma solidity ^0.8.5;

   contract LeagueWinners {

struct Winner {
    bool exists;
    bool claimed;
    uint256 reward;
}

mapping(address=>Winner) public winners;
mapping (address => bool) private AuthAccounts;


modifier onlyAuthAccounts() {
    require(AuthAccounts[msg.sender], "Auth: caller is not the authorized");
    _;
}

constructor () {
    AuthAccounts[_addr_1] = true;
    AuthAccounts[_addr_2] = true;
}


function addWinner(address _address, uint256 _amount ) public {
       Winner storage winner = winners[_address];
       winner.exists = true;
       winner.reward = _amount;
   }

}
