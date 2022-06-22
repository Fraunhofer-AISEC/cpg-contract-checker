        pragma solidity ^0.4.0;
        import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

        

        contract Betting is usingOraclize{
            address public player_;
            uint256 public betamount_;
            uint public winningamount_;
            uint private balance_;
            uint public betnumber_;
            uint public winningnumber_;
            uint public result_;
            string private question_;

        event LogNewOraclizeQuery(string description);
        event WinningNumber(uint winningnumber_);
        event BetResult(string result_);
        event Log( string mystring_);

        mapping (address => uint256) public balances;

        
        

        
        function checkBalance (address player_, uint betamount_) private returns (bool isSuccess) {

        
            Log ("Checking players balance");
            require(player_.balance >= betamount_);

        
            Log ("Checking host's balance");
            require (msg.sender.balance >= 10*(betamount_));    

            Log ("Validation pass");
            return true;

        }

        function executeBetting (address player_, uint betamount_, uint betnumber_ ) public payable
             returns(uint answer_, string result_) {

        
            checkBalance(player_, betamount_);
            require (true); 

        
             question_ = "random number between 2 and 12";
             askOraclize (question_);


        

                if (betnumber_ ==  winningnumber_){
                    winningamount_ = 10e18;
                    player_.transfer(winningamount_);
                    result_ = 'You are lucky and have Won 1 Ether';
                }else
                if (betnumber_ !=  winningnumber_){ 
                    balances[player_] -= betamount_;
                    balances[msg.sender] += betamount_;
                    result_ = 'You lost';
                   }
                WinningNumber(winningnumber_);
                BetResult(result_);
                answer_ = winningnumber_;
        }


        
          
            function askOraclize(string question_) public payable{
             if (oraclize_getPrice("WolframAlpha") > this.balance) {
                 LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
                }else{
                 LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");    
                 oraclize_query("WolframAlpha", question_);
                }
            }    



            
              function __callback(
                bytes32 _myid,
                string _result,
                bytes _proof
              ) public
                  {
                    require(msg.sender == oraclize_cbAddress());
                    winningnumber_ = parseInt(_result); 
            }

        }
