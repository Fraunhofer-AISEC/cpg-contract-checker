contract Adminstrator {
  address public admin;

  function Adminstrator() {
    admin = msg.sender;

    
    modifier onlyAdmin() { 
      if (msg.sender != admin) throw; 
      _;
    } 
}   
