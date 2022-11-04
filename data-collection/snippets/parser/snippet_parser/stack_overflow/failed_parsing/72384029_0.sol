    
    pragma solidity ^0.8.10;

   import "@openzeppelin/contracts/access/Ownable.sol";


    contract Bet is Ownable{

     
     uint public Money;  
     bool Odd;  
     uint TotalDiceNumber = 12;  
     uint result;  
     mapping(address => uint)  allowance;  
     uint  BetValue;  
     uint  _amount; 
     bool  Active; 
     
     

     
    constructor() {
    

    }

    

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;  
    }
    event BetMade(address player, uint Bet);  
     function receiveMoney() public payable  {  
        emit BetMade(msg.sender, BetValue); 
        
        Money += msg.value;
        BetValue = msg.value;
            if (owner() == msg.sender) {
                Active = false;  
            } else {
                Active = true;  
                require(BetValue <= 20 ether, "Bets must be below 21 Ether"); 
          bet under 20 ether/ owner can put as much money as they want on
         }
      }
    event BalanceofContract(uint Balcontract);
       function getBalance()public returns(uint) { 
        uint Bal;
        Bal = address(this).balance;
        emit BalanceofContract(Bal);
        return Bal;
        
        
    }
    
    event PlayerSelectOddEven(address player, bool OddEven);
    function selectOddorEven(bool OddEven) public {
        emit PlayerSelectOddEven(msg.sender, OddEven);
        require(msg.sender != owner(), "You are the house and cannot bet");  
        require(Active = true, "Game not in play. Please place a bet"); 
        Odd = OddEven;  
        

    }

    
    function Random() internal view returns(uint) {
        return uint(keccak256(abi.encodePacked
        (block.difficulty, 
        block.timestamp, 
        TotalDiceNumber)));  
        
        
    } 
    event RollDiceOutput(address player, uint DiceNumber);
    function Rolldice() public returns(uint){
        emit RollDiceOutput(msg.sender, result);
        uint Outcome;
        require(Active = true, "Game not in play. Please place a bet");  
        Outcome = Random() % TotalDiceNumber;
        result = Outcome + 1;  
        return result;  
        
        }
    function OutcomeDice() public view returns (uint) {
        uint Outcome1;
        Outcome1 = result;
        return Outcome1;
        
        }
        
    function numberOddorEven() public view returns (bool) {
        bool OddorEven;  
        uint _result;
        _result = result;
            if (_result == 1  ||  _result == 3  || _result == 5 || _result == 7 || _result == 9 || 
          _result == 11) {
                OddorEven = true; 
            } else {
                OddorEven = false;
            }
            return OddorEven;
        
            }
    event Winning(address Player, uint WinningsValue);
    function addAllowance() public   {
        emit Winning(msg.sender, _amount);  
        require(msg.sender != owner(), "You are the house and cannot bet");
        require(Active = true, "Game not in play. Please place a bet");
        address _who = msg.sender; 
        _amount = BetValue * 2; 
        allowance[_who] == _amount;  
        
        }

    event Won(address Player, uint Winnings);               
    function WinMoney() public  {  
        emit Won(msg.sender, _amount);
        bool UserInputOdd = numberOddorEven();
        bool decisionOdd = Odd;
        address _who = msg.sender; 
        require(Active = true, "Game not in play. Please place a bet"); 
        require(_amount > 0, "Add the house's money by adding a allowance to collect winning");
            if (UserInputOdd == decisionOdd) {
                address payable to = payable(msg.sender);  
                to.transfer(_amount); 
                _amount = 0; 
                allowance[_who] = 0; 
                BetValue = 0; 
                Odd = false; 
                Active = false;  

            } else {
                _amount = 0;  
                allowance[_who] = 0;  
                BetValue = 0;  
                Odd = false;  
                Active = false;  

                }
            
                                    
         }

        receive() external payable {
        receiveMoney();
      }
   }
