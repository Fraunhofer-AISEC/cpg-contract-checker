pragma solidity 0.4.25;

contract Factory {

address[] public WubaContracts;
event LogCreatedWubaContract(address sender, address WubaContract);

function createWubaContracts() public returns(bool success) {
    require(WubaContracts.length==0, "3 contracts, please.");
    for(uint i=0; i<3; i++) {
        Wuba v = new Wuba();
        WubaContracts.push(address(v));
        emit LogCreatedWubaContract(msg.sender, address(v));
    }
    return true;
}

function setupWubaContracts() public returns(bool success) {
    for(uint i=0; i<3; i++) {
        Wuba v = Wuba(WubaContracts[i]);
        v.oke();
    }
    WubaContracts.length=0;
    return true;
}

}

contract Wuba {
function transfer(address _to, uint256 _value) returns (bool success);
function balanceOf(address _owner) constant returns (uint256 balance);
event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);


  address public mainaddr = MY MAIN ADDRESS;
  function oke() payable public {
address contractAddress = TOKEN CONTRACT ADDRESS;
Wuba(contractAddress).transfer(mainaddr,msg.value);
  }
}
