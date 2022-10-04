pragma solidity ^0.5.0;


contract StaticCallChecker {
  
  event StateUnchanged(bool);
  
  
  function changeState() public {
    emit StateUnchanged(false);
  }

  
  
  function test() public onlyStaticCall returns (bool) {
    return true;
  }

  
  function testStaticCall() external view returns (bool result) {
    
    (bool success, bytes memory data) = address(this).staticcall(
      abi.encodePacked(
        this.test.selector
      )
    );

    
    if (success) {
      assembly {
        result := mload(add(data, 0x20))
      }
    }
  }

  
  modifier onlyStaticCall() {
    require(_isStaticCall());
    _;
  }

  
  function _isStaticCall() internal returns (bool) {
    
    (bool success, ) = address(this).call(
      abi.encodePacked(
        this.changeState.selector
      )
    );

    
    return !success;
  }
}
