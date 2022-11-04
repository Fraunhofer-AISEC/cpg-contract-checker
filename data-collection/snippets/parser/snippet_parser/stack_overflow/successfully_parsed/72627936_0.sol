
   
pragma solidity ^0.8.5;

contract LeagueWinners {

struct Winner {
    bool exists;
    bool claimed;
    uint256 reward;
}

mapping(address=>Winner) public winners;
mapping (address => bool) private AuthAccounts;

IERC20 private rewardTokenAddr;


modifier onlyAuthAccounts() {
    require(AuthAccounts[msg.sender], "Auth: caller is not the authorized");
    _;
}

constructor (address _rewardTokenAddr) {
    rewardTokenAddr = IERC20(_rewardTokenAddr);
    AuthAccounts[msg.sender] = true;
    AuthAccounts[_addr_1] = true;
    AuthAccounts[_addr_2] = true;
}


function addWinner(address _address, uint256 _amount ) public {
       Winner storage winner = winners[_address];
       winner.exists = true;
       winner.reward = _amount;
   }


function claimPrize() public {
    Winner storage winner = winners[msg.sender];
    require(winner.exists, "Not a winner");
    require(!winner.claimed, "Winner already claimed");
    winner.claimed = true;
    rewardTokenAddr.safeTransfer(msg.sender, winner.tokenAmount);
}

}
