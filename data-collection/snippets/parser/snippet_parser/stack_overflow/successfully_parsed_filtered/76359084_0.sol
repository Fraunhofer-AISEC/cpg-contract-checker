
pragma solidity 0.8.18;

contract marriage {

  address owner = msg.sender;
  int val;
  mapping (address => uint256) private current_balance; 
  mapping (address => address) private link;           
  mapping (address => uint256) private state;          
  mapping (address => uint256) private shared_balance;

  function check_personnal_balance () public returns (uint256)
  {
    return current_balance[owner];  
  }

  function increase_balance (uint256 incre) public {

    require(owner == msg.sender);

    current_balance[owner]=current_balance[owner]+incre;
  }

  function decrease_balance (uint256 incre) public {

    require(owner == msg.sender);

    current_balance[owner]=current_balance[owner]-incre;
  }

  function view_my_address () public returns (address){

    require(owner == msg.sender);

    return msg.sender;
  }

  function view_my_state () public returns (uint){

    require(owner == msg.sender);

    return state[owner];
  }

  function get_partner_address () private returns (address){  

    require(owner == msg.sender);

    return link[owner];
  }

  function check_partner_link ()  private returns(address)  {  

    require(owner == msg.sender);

    address current_partner;

    current_partner = get_partner_address();
    return link[current_partner];
  }

  function reset_state () public {  

    require(owner == msg.sender);
    

    address current_partner;

    
    current_partner = get_partner_address();

    state[current_partner]=0;
    state[owner] =0;
    link[current_partner]=0x0000000000000000000000000000000000000000;
    link[owner]=0x0000000000000000000000000000000000000000;

  }

  function request_partner (address _partner) public{ 
    require(owner == msg.sender);
    state[owner]=1;
    link[owner]=_partner;

    if (check_partner_link() == owner) {    
      state[owner]=2;
      state[_partner]=2;
    }
  }

  function add_to_shared_balance (uint amount) public {

    require(owner == msg.sender);
    require(state[owner]==2);
    require(current_balance[owner]>=amount);  

    shared_balance[owner]=shared_balance[owner]+amount;     
    current_balance[owner]=current_balance[owner]-amount;   
    
    
    address current_partner;
    current_partner = get_partner_address();
    shared_balance[current_partner]=shared_balance[owner];
  }

  function remove_to_shared_balance (uint amount) public {

    require(owner == msg.sender);
    require(state[owner]==2);
    require(shared_balance[owner]>=amount);     

    shared_balance[owner]=shared_balance[owner]-amount;   
    current_balance[owner]=current_balance[owner]+amount; 

    address current_partner;
    current_partner = get_partner_address();
    shared_balance[current_partner]=shared_balance[owner];
  }

  function check_shared_balance()public returns (uint){

    require(msg.sender==owner);

    return shared_balance[owner];
  }

}
