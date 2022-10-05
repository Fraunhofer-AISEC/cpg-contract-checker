contract EtherMon{ 
    uint public starterEgg;
    address public owner;



    struct player{
        uint256 goldAmount;
      uint[10] listOfEggs;
        bool eggCoolDown;
        uint eggTime;
        uint eggID;
        bool battleCoolDown;
        bool breedingCoolDown;
        uint[] ownedEthermon;
    }

      mapping (address => player) public listOfPlayers;

    function EtherMon(){
        owner = msg.sender;

    }

    function createAccount(){


     starterEgg = block.timestamp % 10;

     listOfPlayers[msg.sender].goldAmount  = 100;
     listOfPlayers[msg.sender].listOfEggs[0] = starterEgg;


        }



  function getCurrentEggs() returns (uint[]) {
 uint length =  listOfPlayers[msg.sender].listOfEggs.length;
 uint[] eggArray;
            for(uint i = 0; i < length; i++){
               eggArray[i] =  listOfPlayers[msg.sender].listOfEggs[i];
            }
            return eggArray;
        }

    }
