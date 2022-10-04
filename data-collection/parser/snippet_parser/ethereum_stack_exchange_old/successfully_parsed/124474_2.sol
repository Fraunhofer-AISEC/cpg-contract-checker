

pragma solidity ^0.8.0;
contract A {

  uint256 count;

  address public lastSender; 

  event Increment(address indexed _calle, uint256 count);

  function name() pure external returns(string memory){
    return "contractA";
  }

  function increment() external returns(address) {
    count++;
    emit Increment(msg.sender, count);
    lastSender = msg.sender;
    return msg.sender;
  }

  function getAddress() external view returns(address) {
    return address(this);
  }
}


contract B {

  uint256 count;

  address public lastSender;
  
  function name() pure external returns(string memory){
    return "contractB";
  }

  function incrementOtherWithAbi(address _addr) external returns(address) {
     A callee = A(_addr);
     return callee.increment();
  }

  function incrementOtherWithDelegateCall(address _addr) external returns(address) {
      (bool success, bytes memory result) = _addr.delegatecall(abi.encodeWithSignature("increment()"));
      require(success,"delegate call failed");
      return abi.decode(result,(address));
  }


  function incrementOtherWithCall(address _addr) external returns(address) {
    (bool success, bytes memory result) = _addr.call(abi.encodeWithSignature("increment()"));
    require(success,"call failed");
    return abi.decode(result,(address));
  }


  function getAddress() external view returns(address) {
    return address(this);
  }
}
