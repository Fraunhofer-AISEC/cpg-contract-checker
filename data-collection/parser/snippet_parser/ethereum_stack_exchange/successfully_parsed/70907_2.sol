

function stakeclmidx (uint _stakeidx) public {
require(_stakeidx >= 0);

Stake storage _stake = stakes[msg.sender][_stakeidx];


require(block.number > _stake.endBlock);

require(_stake.amount > 0);


balances[address(this)] = balances[address(this)].sub(_stake.amount);

balances[msg.sender] = balances[msg.sender].add(_stake.amount);

emit Transfer(address(this), msg.sender, _stake.amount);
emit StakeClaimed(_stakeidx);


_deletestake(msg.sender, _stakeidx);

}

function _deletestake(address _staker,uint _index) internal {
require(_index < stakes[_staker].length);
stakes[_staker][_index] = stakes[_staker][stakes[_staker].length-1];
delete stakes[_staker][stakes[_staker].length-1];
stakes[_staker].length = stakes[_staker].length - 1;





}

