Example:
function isRestricted() public view returns (bool) {
 if(block.timestamp <= RestrictedFromDividendUntil[msg.sender]) return true;
 return false;
}
