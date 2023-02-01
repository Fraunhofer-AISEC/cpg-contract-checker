contract Storage{
  uint public id;
  uint public status;

  function setId(uint mid) public returns(bool success) {
    id=mid;
    return true;
  }

  function setStatus(uint mStatus) public returns(bool success) {
    status=mStatus;
    return true;
  }
}


contract A{

  Storage s; 

  function A() {
    s = new Storage(); 
  }

  function setId(uint id) public returns(bool success) {
     return s.setId(id);
  }

  function setStatus(uint mStatus) public returns(bool success) {
     return s.setStatus(mStatus);
  }

  function getId() public constant returns(uint id) {
     return s.id();
  }
  function getStatus() public constant returns(uint status) {
     return s.status();
  }
}
