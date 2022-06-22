contract project{

  address public user;
  bytes32[10] name;
  address[10] customer;
  uint public i=0;

  event LogDep (address sender,    uint amount, uint balance);
  event LogSent(address recipient, uint amount, uint balance);
  event LogErr (address recipient, uint amount, uint balance);

  function project(){
    user=msg.sender;
  }

  function depositFunds() public payable returns(bool success) {
    LogDep(msg.sender, msg.value, this.balance); 
    return true;
  }

  function add(bytes32 _name){
    name[i]=_name;
    customer[i]=msg.sender;
    i++;
  }

  function get_address() constant returns(address[10]){
    return customer;
  }

  function reward() {
    for(uint i=0;i<10;i++)
    {

        

        if(customer[i].send(1)) {
            LogSent(customer[i], 1, this.balance);
        } else {
            LogErr(customer[i], 1, this.balance);
        }
    }
  }
}
