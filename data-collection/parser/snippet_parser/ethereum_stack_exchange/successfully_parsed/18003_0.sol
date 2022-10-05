contract Relay {
  address public currentVersion;
  address public owner;
  mapping (address => uint) user_amounts;


  modifier onlyOwner() {
    if (msg.sender != owner) {
        throw;
    }
    _;
  }

  function Relay(address initAddr) {
    currentVersion = initAddr;
    owner = msg.sender; 
  }

  function changeContract(address newVersion) public
  onlyOwner()
  {
    currentVersion = newVersion;
  }

  function() {
    if(!currentVersion.delegatecall(msg.data)) throw;
  }
}  
