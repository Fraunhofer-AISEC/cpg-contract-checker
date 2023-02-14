contract Token {
   using SafeMath for uint;
   uint _totalSupply;
   address owner;
   mapping(address => uint) balances;

   event Transfer(address indexed from, address indexed to, uint tokens);

   constructor() public {
       _totalSupply = 1000000 * 10**uint(18);
       owner = msg.sender;
       balances[owner] = _totalSupply;
       emit Transfer(address(0), owner, _totalSupply);
   }

   function totalSupply() public view returns (uint) {
       return _totalSupply.sub(balances[address(0)]);
   }
}

contract Marketplace {

   Token public cashToken;

   constructor(address cashTokenAddress) public {
       cashToken = Token(cashTokenAddress);
   }

   function getTotalSupply() public view returns (uint) {
       return cashToken.totalSupply();
   }
}
