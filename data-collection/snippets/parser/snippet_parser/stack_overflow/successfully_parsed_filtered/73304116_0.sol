struct Stakes {
    uint256 stakeDate;
    uint256 stakeAmount;
}

mapping (address => Stakes[]) public addressToStaked;


function stake (uint256 _amount) public {
require(_amount > 0, "You must stake more than 0");
addressToStaked[msg.sender].push(Stakes(block.timestamp, _amount)); 
}

function returnStaked () public view returns (uint256[][] memory) {
uint256[][] memory result;
for (uint256 i = 0; i < 2; i++){
    result[i] = [addressToStaked[msg.sender][i].stakeDate, addressToStaked[msg.sender][i].stakeAmount];
}
return result;
}
