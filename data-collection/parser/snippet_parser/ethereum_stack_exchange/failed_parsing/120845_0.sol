uint256 blocktime = block.timestamp;

if (blocktime - _latestTransaction[sender] < _antibotTime) {

      
     _blacklist[sender] = true;

} else {
     transfer_(sender, recipient, amount, blocktime);
}
