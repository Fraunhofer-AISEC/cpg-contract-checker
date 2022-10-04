pragma solidity 0.4.19; 
  library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) { 
        
         uint256 c = a / b;
         
         return c;
     }


    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }


    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    } }

contract ERC20 { 

     function totalSupply()public view returns (uint total_Supply);
    function balanceOf(address who)public view returns (uint256);
    function allowance(address owner, address spender)public view returns (uint);
     function transferFrom(address from, address to, uint value)public returns (bool ok);
     function approve(address spender, uint value)public returns (bool ok);

   function transfer(address to, uint value)public returns (bool ok);

     event Transfer(address indexed from, address indexed to, uint value);
     event Approval(address indexed owner, address indexed spender, uint value);

 }

 contract FiatContract {
     function USD(uint _id) constant returns (uint256); }


contract P1 is ERC20 { 
    using SafeMath for uint256;


   FiatContract price = FiatContract(0x8055d0504666e2B6942BeB8D6014c964658Ca591); 

     
     string public constant name = "P1";
     
     string public constant symbol = "P1";
     uint8 public constant decimals = 8;
     uint public _totalsupply = 1000000000 * (uint256(10) ** decimals);
     address public owner;
     bool stopped = false;
     uint256 public startdate;
     uint256 ico_first;
     uint256 ico_second;
     uint256 ico_third;

 uint256 ico_fourth;
 address central_account;
 mapping(address => uint) balances;
 mapping(address => mapping(address => uint)) allowed;


 enum Stages {
     NOTSTARTED,
     ICO,
     PAUSED,
     ENDED
 }

 Stages public stage;

 modifier atStage(Stages _stage) {
     if (stage != _stage)
         
         revert();
     _;
 }
}