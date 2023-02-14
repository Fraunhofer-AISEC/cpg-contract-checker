bytes32 public appHash = '1s2a3d4g';

function doSomething(appSecret bytes32) public {
  require(keccak256(appSecret) == appHash);
  
  emit didSomething(msg.sender, appSecret);
}
