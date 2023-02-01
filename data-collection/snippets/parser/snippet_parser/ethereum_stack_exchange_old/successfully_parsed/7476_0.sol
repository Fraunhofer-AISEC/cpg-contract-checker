contract tokensHolder {
  
   
   bytes32 eZn =   0x655a415200000000000000000000000000000000000000000000000000000000;

    function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
    bytes storage a = bytes(_a);
    bytes memory b = bytes(_b);
    if (a.length != b.length)
      return false;
    
    for (uint i = 0; i < a.length; i ++)
      if (a[i] != b[i])
        return false;
    return true;
  }

  event bought(address indexed Buyer, bytes32 Token ,uint amount, uint _price);
  event sold(address indexed seller,bytes32 Token ,uint amount, uint _price);
  event exchange(address Transferer ,address reciver ,uint amount ,bytes32 token);
  event faliure(address attempter, string attempted,uint amount,string reason);
  event newZARVal(uint NewValueInWei,address owner);
  event tokenAdded(address adder,string unit,uint dp,bytes32 tokenName);

  modifier OnlyOwner {
    if (msg.sender != owner){
      faliure(msg.sender,"owner only function",0,"not the owner");
      throw ;
    }  
    _
  }
  modifier notMyself {

    if (msg.sender == address(this)){
      throw;
    } 
    _
  }

  struct stk {
    mapping (address => uint ) balance;
    address minter;
    string unit;
    uint eZARVal; 
    uint dp;
  }

  mapping (bytes32 => stk ) tokenList ;
  address owner ;

  function tokensHolder(uint _ezarvalinwei){
    owner = msg.sender ;
    tokenList[(eZn)] = stk({
      minter:owner,
      unit: "eZAR",
      eZARVal: _ezarvalinwei, 
      dp: 4 
    });
  }

  function sellTknZ(bytes32 _tknName , uint _amount) notMyself  returns (uint){

    if (tokenList[_tknName].balance[msg.sender] >= _amount * 10**tokenList[_tknName].dp){
      uint tokenValue = tokenList[(_tknName)].eZARVal * 1000 * _amount;
      tokenList[(_tknName)].balance[msg.sender] -= _amount;
        tokenList[(eZn)].balance[msg.sender] += tokenValue;
      sold(msg.sender,_tknName,_amount,tokenList[(_tknName)].eZARVal);
    }else{
      faliure(msg.sender,"Selling tokens",_amount,"Insufficent Funds");
      throw;
    }
  }

  function buyTknZ(bytes32 _tknName, uint _amount) notMyself  {
    uint tokenCost = tokenList[(_tknName)].eZARVal * 1000 * _amount ;
    if (tokenList[(eZn)].balance[msg.sender]  < tokenCost ){
      faliure(msg.sender,"buyingtokens",_amount,"Insufficent Funds");
      throw;
    } else {
      uint tokenAdded;
      tokenList[(eZn)].balance[msg.sender] -= tokenCost;
      tokenList[(_tknName)].balance[msg.sender] += _amount * 10 ** tokenList[_tknName].dp;
      bought(msg.sender,_tknName,_amount,tokenList[(_tknName)].eZARVal);
    }
  }

  function getBalance(bytes32 _tknName)  returns (uint) {
    uint balance = tokenList[(_tknName)].balance[msg.sender];
    return balance;
  }

  function buyZ() notMyself {
    uint amount = msg.value / tokenList[(eZn)].eZARVal * 10000;
    if (amount<1) {
      faliure(msg.sender,"buyZ",0,"PAY MORE ETHER");
      throw;
    }else {
      tokenList[(eZn)].balance[msg.sender] += amount;
      bought(msg.sender,eZn,amount,tokenList[(eZn)].eZARVal);
    }
  }

  function sellZ(uint _amount) notMyself returns (uint){
    if (tokenList[(eZn)].balance[msg.sender] < _amount ){
      faliure(msg.sender,"sellZ",_amount,"insuficient Funds");
      throw;
    }else{
      tokenList[(eZn)].balance[msg.sender] -= _amount;
      msg.sender.send((tokenList[(eZn)].eZARVal )* _amount);
      sold(msg.sender,eZn,_amount,tokenList[(eZn)].eZARVal);
    }

  }

  function setZarVal(uint _amount) OnlyOwner returns (bool){
    tokenList[(eZn)].eZARVal = _amount;
    newZARVal(_amount,owner);
  }

  function replaceOwner(address _ownerNew) OnlyOwner{
    owner = _ownerNew;
  }

  function sendToken(bytes32 _tknName ,address _to, uint _amount) external{
    if (tokenList[_tknName].balance[msg.sender] >= _amount){
      tokenList[_tknName].balance[msg.sender] -= _amount;
      tokenList[_tknName].balance[_to] += _amount;
      exchange(msg.sender, _to,_amount,_tknName);
    }else {
      faliure(msg.sender,"sendToke",_amount,"insufficient funds");
      throw;
    }
  }

  function newToken(bytes32 _tknName,string  _unit,uint _eZARVal,uint _dp) {
    if (stringsEqual(tokenList[_tknName].unit,"") ){
      tokenList[_tknName]= stk({
        minter : msg.sender,
        unit:_unit,
        eZARVal:_eZARVal,
        dp:_dp
      });
      tokenAdded(msg.sender,_unit,_dp,_tknName);
    }else{
      faliure(msg.sender,"add a token",1,"token alreadyexists");
      throw;
    }
  }

  
  }

  contract tokenExchange {

address owner;
tokensHolder holder;
uint validTime;
bytes32 tokenOffered;
uint numberOffered;
bool offered;

address exchangee;
bytes32 tokenExpected;
uint numberExpected;
bool expected;



function tokenExchange(
   address _tokenHolder,
   uint _validTimeinDays,
   bytes32 _tokenOffered,
   uint _numberOffered,
   bytes32 _tokenExpected,
   uint  _numberExpected,
   address  _exchangee)
 {
    owner = msg.sender;
    holder = tokensHolder(_tokenHolder);
    validTime = now + _validTimeinDays * 1 days;
    tokenOffered = _tokenOffered;
    numberOffered = _numberOffered;
    tokenExpected = _tokenExpected;
    numberExpected = _numberExpected;
    exchangee = _exchangee;
   expected = false;
   offered = false;
}


function checkBalances(){

    if ((offered == expected)==true){
       payout();
    }else {
        if (now <= validTime){
            if (holder.getBalance(tokenOffered) == numberOffered){offered = true;}
            if (holder.getBalance(tokenExpected) == numberExpected){expected = true;}
      if ((offered == expected)==true){payout();}
        }else {
            revert();
       } 
    }

}

function  payout() internal {
   if ((offered == expected)==true){
    holder.sendToken(tokenOffered ,exchangee, numberOffered);
    holder.sendToken(tokenExpected,owner,numberExpected);
     selfdestruct(owner);}
}

function revert() internal {
  if (offered == true){holder.sendToken(tokenOffered ,owner, numberOffered);}
  if (expected == true){holder.sendToken(tokenExpected,exchangee,numberExpected);}
    selfdestruct(owner);
}

function valid() returns (bool) {
    if (now <= validTime ){return true;}else{return false;}
}
  }
