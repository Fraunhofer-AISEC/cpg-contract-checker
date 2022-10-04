contract ContractReceiver {

      address public owner;
      address public sender;
      uint public value;
      bytes public data;

      constructor() public payable{
         owner = msg.sender;
         balanceOfMyAccount = msg.value;
      }
      modifier onlyOwner(){
         require(msg.sender == owner);
         _;
      }

     function tokenFallback(address _to, uint _value, bytes memory _data) public {
        sender = _to;
        value = _value;
        data = _data;
     }
}
