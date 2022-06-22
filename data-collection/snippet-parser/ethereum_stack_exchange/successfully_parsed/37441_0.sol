    pragma solidity ^0.4.18;

    import "./TestToken.sol";
    

    contract FactoryToken {

      

      address[] public contracts;

       mapping (address => bool) created;
      
      address newContract;


      string public  name ;
      string public  symbol ;
      uint256 public  decimals ;

      

      function getContractCount() public constant returns(uint contractCount)
      {
        return contracts.length;
      }

       function setToken(string _Name, string _Symbol, uint256 _Decimal) public {
          name = _Name ;
          symbol = _Symbol;
          decimals= _Decimal;
       }

       function getToken() public constant returns (string,string, uint256) {
           return (name, symbol,decimals);
       }


      

       function newToken() public returns(address objAddress)
  {
       newContract = new WILDToken(name,symbol,decimals);
   contracts.push(newContract);


        return newContract;



  }

       function verify() public constant returns (address) {
            return newContract;
        }
      

       
      
    }
