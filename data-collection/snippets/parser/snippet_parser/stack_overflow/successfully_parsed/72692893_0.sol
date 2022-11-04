

pragma solidity ^0.8.15;


contract Share {

mapping(address => uint256) public balances;
mapping(address => User) public Users ;
address[] public Userlist;
mapping(address => mapping(address => uint256)) public allowance;
 uint256 public totalSupply = 1000000 * 10 **18;
 string public _name;
 string public _symbol;
 uint8 public decimals = 18;
 uint public Usercount = 0;
 address public creater;
 uint256 tax = 10;
 uint256 public createdtime;


 struct User {
 address Useraddress;
 uint256 Account;
 uint256 Number;
 uint256 Purchasetime;
 bool Boughtbefore;
 }




event Transfer(address indexed from , address indexed to, uint256 amount);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);
event reward(address indexed receiver, uint256 amount);


    constructor(string memory name_, string memory symbol_) {
     Usercount += 1;
     _name = name_;
     _symbol = symbol_;
     User memory newUser = User(msg.sender,totalSupply,Usercount,block.timestamp,true);
     Users[msg.sender] = newUser;
     creater = Users[msg.sender].Useraddress;
     createdtime = block.timestamp;
     Userlist.push(msg.sender);
     balances[msg.sender]= totalSupply;
     emit Transfer(address(0), msg.sender, totalSupply);

    }

    function transfer(address _to, uint256 _value) public returns(bool) {
     require(balances[msg.sender]>= _value, 'Account too low');
     uint256 transferamount = _value - ((_value*tax)/100);
     uint256 rewardamount = (_value*tax)/100;
     if(Users[_to].Boughtbefore){
     Users[_to].Account += transferamount;
     Users[msg.sender].Account -= _value;
     balances[_to] += transferamount;
     balances[msg.sender] -= _value;
     }
     if(!Users[_to].Boughtbefore){
     Usercount += 1;
     User memory NewUser = User(_to,transferamount,Usercount,block.timestamp,true);
     Users[_to] = NewUser;
     Users[msg.sender].Account -= _value; 
     Userlist.push(_to);
     balances[_to] += transferamount;
     balances[msg.sender] -= _value;
     }
     if(Users[msg.sender].Account == 0){
     removefromlist(Users[msg.sender].Number);
     delete Users[msg.sender];
     Usercount -= 1;
     }
     emit Transfer(msg.sender, _to, transferamount);
     distribute(rewardamount);
     return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns(bool) {
     require(balances[_from]>= _value, 'Account too low');
     require(allowance[_from][msg.sender] >= _value, 'Allowance too low!');
     uint256 transferamount = _value - ((_value*tax)/100);
     uint256 rewardamount = (_value*tax)/100;
     if(Users[_to].Boughtbefore){
     Users[_to].Account += transferamount;
     Users[_from].Account -= _value;
     balances[_to] += transferamount;
     balances[msg.sender] -= _value;
     }
     if(!Users[_to].Boughtbefore){
     Usercount += 1;
     User memory NewUser = User(_to,transferamount,Usercount,block.timestamp,true);
     Users[_to] = NewUser;
     Users[_from].Account -= _value; 
     Userlist.push(_to);
     balances[_to] += transferamount;
     balances[msg.sender] -= _value;
     }
     if(Users[_from].Account == 0){
     removefromlist(Users[_from].Number);
     delete Users[_from];
     Usercount -= 1;
     }
     emit Transfer(_from, _to, transferamount);
     distribute(rewardamount);
     return true;  
    }


    function distribute(uint256 _charge) internal{
     uint _reward = _charge/Usercount;
     for(uint256 i=0; i<Usercount; i++){
     Users[Userlist[i]].Account += _reward;
     balances[Userlist[i]] += _reward;
     emit reward(Users[Userlist[i]].Useraddress, _reward);
     }
    }

    function removefromlist (uint256 index) internal {
     for (uint256 i = index; i < Userlist.length; i++){
     Userlist[i] = Userlist[i +1];
     }
     Userlist.pop();
    }

    function totalsupply() public view returns(uint256){
     return totalSupply;
    }

    function name() public view returns(string memory){
     return _name;
    }

    function symbol() public view returns(string memory){
     return _symbol;
    }

    function Accountof(address _owner) public view returns(uint256){
     return balances[_owner];

    }

    function approve(address _spender, uint256 _value) public returns (bool) {
     allowance[msg.sender][_spender] = _value;
     emit Approval(msg.sender, _spender, _value);
    return true;   
    }

    function allowances(address owner, address spender) public view returns (uint256 remaining){
        return allowance[owner][spender];
    }

    function burn(uint256 amount) public returns(bool){
     require(Users[msg.sender].Account >= amount, 'Account too low');
     Users[msg.sender].Account -= amount;
     balances[msg.sender] -= amount;
     totalSupply -= amount;
     if(Users[msg.sender].Account == 0){
     removefromlist(Users[msg.sender].Number);
     delete Users[msg.sender];
     Usercount -= 1;
     }
     return true;
    }

    function getOwner()external view returns(address){
    return creater;
    }
}
