pragma solidity^0.5.0;
import "./TokenSale.sol";
contract Dice{

    TokenSale public tokenSale;
    address tokensaleaddress;

    struct player_details{
        address pAddress;
        string pName;
         }

    struct gameRecords{
        address playerAddress;
        uint selected_num;
        uint rolled_num;
        bool result;
        uint ptoken;
        uint timestamp;
    }

    constructor (TokenSale _tokenSale) public {
      tokenSale = _tokenSale;
    }


    mapping(uint =>gameRecords) public outcome;
    mapping(uint => player_details) public details;

    uint public playerid=0;
    uint played=1;
    uint playercount=0;

      function setplayerDetails(string memory _pName) public{
        details[playerid] = player_details(msg.sender,_pName);
        playerid++;
        playercount++;
      }

    function addGameEvent(uint _betplaced, uint _rollresult,bool _result,uint _ptoken) public{
        require(playercount >=1 );
        outcome[played] = gameRecords(msg.sender,_betplaced,_rollresult,_result,_ptoken,now);
        played++;
    }

    function tokenfetch() public {
        
        tokenSale.buyTokens(100);
    }

  }
