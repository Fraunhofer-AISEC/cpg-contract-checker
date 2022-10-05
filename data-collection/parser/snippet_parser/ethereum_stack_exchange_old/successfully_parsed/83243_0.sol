pragma solidity ^0.5.16;

contract C1 {

  uint public num;
  address public sender;    

  function c2setNum(address _c2, uint _num) public{
      C2 c2 = C2(_c2);
      c2.setNum(_num);
  }
  function delegatecallSetNum(address c2, uint _num) public {
    c2.delegatecall(abi.encodeWithSignature("setNum(uint256)",_num));
  }


  function delegatecallSetNumAssembly(address c2, uint _num) public {

    address _target = c2;
    bytes memory _data = abi.encodeWithSignature("setNum(uint256)",_num);
    bytes32 response;

    
    assembly {
        let succeeded := delegatecall(sub(gas, 500000), _target, add(_data, 0x20), mload(_data), 0, 32)
        response := mload(0)      
        switch iszero(succeeded)
        case 1 {
            
            revert(0, 0)
        }
    }
  }


function getAddr1(address _c2) public view returns (address){
      C2 c2 = C2(_c2);
     return  c2.getAddr();
  }

}

contract C2 {
  uint public num;
  address public sender;

  event AddedValuesByDelegateCall(uint256 a, address addr, bool success);

  function setNum(uint256 _num) public {
    num = _num;
    sender = msg.sender;

    emit AddedValuesByDelegateCall(_num, msg.sender, true);
  }  
    function getAddr() public view returns (address){

        return msg.sender;        
    }
}
