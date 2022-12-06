pragma solidity ^0.5.3;

contract BasicToken {
   uint MAX_SUPPLY = 1000;
   uint OWNER_SUPPLY = 300;
   uint CIRCULATING_SUPPLY = 0;

   address payable public BASIC_TOKEN_ETH_WALLET;
   uint TOKEN_PRICE;

   mapping(address => mapping(address => uint)) APPROVED;
   mapping(address => uint) BALANCES;

   event SupplyChangeEvent(uint NewBalance, uint NewSupply);

   constructor(address payable eth_wallet) public {
      BASIC_TOKEN_ETH_WALLET = eth_wallet;
      BALANCES[BASIC_TOKEN_ETH_WALLET] = OWNER_SUPPLY;
   }

   
   function totalSupply() public view returns(uint _total_supply) {
      return CIRCULATING_SUPPLY;
   }
   function balanceOf(address _owner) public view returns (uint balance){
      return BALANCES[_owner];  
   }
   function transfer(address _to, uint _value) public returns (bool success){

      if( _value < 0 || _value > BALANCES[msg.sender]) return false;

      BALANCES[msg.sender] -= _value;
      BALANCES[_to] += _value;

      return true;
   }
   function approve(address _spender, uint _value) public returns (bool success) {
      if( _value <= 0 || _value > BALANCES[msg.sender]) return false;

      APPROVED[msg.sender][_spender] = _value;

      return true;
   }
   function allowance(address _owner, address _spender) public view returns(uint remaining){
      return APPROVED[_owner][_spender];
   }
   function transferFrom(address _from, address _to, uint _value) public returns (bool success){
      if(_value <= 0 || _value > allowance(_from, msg.sender) || _value > BALANCES[_from])
         return false;

      BALANCES[_from] -= _value;
      APPROVED[_from][msg.sender] -= _value;
      BALANCES[_to] += _value;

      return true;
   }
   
   function buyToken() public payable{
      CIRCULATING_SUPPLY += 1;
      BALANCES[msg.sender] += 1;
      emit SupplyChangeEvent(BALANCES[msg.sender], CIRCULATING_SUPPLY);
      
   }
}
