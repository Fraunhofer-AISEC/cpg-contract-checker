contract donMapping{
struct Donation {
    uint id;
    uint amount;
    string donor;
    string msg;
    uint timestamp; 
}
uint amount = 0;
uint id = 0;
mapping(address => uint) public balances;
mapping(address => Donation) public donations;
Donation[] public donation;

function donate(address _recipient, string calldata _donor, string calldata _msg) public payable {
    require(msg.value > 0, "The donation needs to be >0 in order for it to go through");
    amount = msg.value;
    balances[_recipient] += amount;        
    donations[_recipient].push(Donation(id++,amount,_donor,_msg,block.timestamp));
  }
}
