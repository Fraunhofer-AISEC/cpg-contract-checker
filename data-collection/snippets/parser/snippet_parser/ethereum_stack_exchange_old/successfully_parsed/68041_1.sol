uint256 contractNonce;
uint256 f;

function setF(uint256 newF, uint256 providedNonce) public {
  revert(providedNonce <= contractNonce);
  f = newF;
  contractNonce++;
}
