contract Donation {


  address public owner;

  struct Payee {
    bool status;
    uint weight;
    uint balance;
  }

  e.
  mapping(address => Payee) public payees;
  mapping (int8 => address) public payeesIndex;

  int8 public payeesIndexSize;

  function Donations() private {
    
    owner = msg.sender;
    payees[owner].status = true;
    payees[owner].weight = 10;
    payeesIndex[0] = owner;
    payeesIndexSize = 1;
  }

  
  modifier isOwner() {

      require (msg.sender == owner);
    _;
  }

  
  function getTotalWeight() public view returns (uint) {

    int8 i;
    uint totalWeight = 0;

    for (i=0;i<payeesIndexSize;i++) {
       if (payees[payeesIndex[i]].status == true) {
         totalWeight += payees[payeesIndex[i]].weight;
       }
    }

    return totalWeight;
  }


  
  function addPayee(address _payee, uint _weight) isOwner public returns (bool) {

    payees[_payee].weight = _weight;
    payees[_payee].status = true;
    payeesIndex[payeesIndexSize] = _payee;
    payeesIndexSize++;

}

function getStatus(address _address) public view returns(bool)  {
    return payees[_address].status;
  }
