pragma solidity >=0.5.0;

contract Jeevan{

   string public constant name = "Jeevan";
   string public constant symbol = "JA";
   uint8 public constant decimals = 18;
   uint public totalSupply = 30;
   uint256 public creationTime = now;
   address owner;

   mapping(address => uint256) public balaceOf;

    constructor() public{
       balaceOf[msg.sender] = totalSupply;
       owner = msg.sender;
   }

   event balanceTransferred(address _from, address _to, uint256 _value);

 function _transfer(address _from, address _to, uint256 _value) internal{
    require(_to !=_from);
    require(_to != address(0));
    require(balaceOf[_from] >= _value);
    uint previousBalance = (balaceOf[_from] + balaceOf[_to]);
    balaceOf[_from] -= _value;
    balaceOf[_to] += _value;
    assert(balaceOf[_from]+balaceOf[_to] == previousBalance);
 }

   function transfer(address _to, uint256 _value) public {
       _transfer(msg.sender,_to,_value);
       emit balanceTransferred(msg.sender,_to, _value);
   }

   function increaseAge() internal {
     totalSupply += 1;
     balaceOf[owner] += 1;
   }

function triggerAgeCount() public {
    if ( (now-creationTime) >= 365 days ){
        increaseAge();
        creationTime = now;

    }
}

}
