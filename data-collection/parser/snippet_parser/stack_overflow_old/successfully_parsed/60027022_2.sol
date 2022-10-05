bytes32 public appHash = '1s2a3d4g';
bool public locked = false;

function doSomething(bytes32 appSecret) public {
  require(keccak256(appSecret) == appHash);
  require(locked == false);
  
  locked = true;
}

function unlock(bytes32 nextAppHash) public onlyAdmin {
  appHash = nextAppHash;
  locked = false;
}
