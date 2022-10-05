   
        
        pragma solidity >=0.7.0 <0.9.0;
        
        
        contract Game {
        
            uint8 constant ROCK = 0;
            uint8 constant PAPER = 1;
            uint8 constant SCISSORS = 2;
            address[] public players;
        
            
            
            mapping(address => uint8) public choices;
            
            
            function enroll() public payable {
                require(msg.value > .01 ether);
        
                players.push(msg.sender);
            }
        
            function play(uint8 choice) external {
                
                require(choice == ROCK || choice == PAPER || choice == SCISSORS);
                
                require(choices[msg.sender] == 0);
                
                choices[msg.sender] = choice;
            }
        
          function evaluate(address alice, address bob)
                public
                view
                returns (address add)
            {
                
                if (choices[alice] == choices[bob]) {
                    return address(0);
                }
        
                
                if (choices[alice] == ROCK && choices[bob] == PAPER) {
                    return bob;
                    
                } else if (choices[bob] == ROCK && choices[alice] == PAPER) {
                    return alice;
                } else if (choices[alice] == SCISSORS && choices[bob] == PAPER) {
                    return alice;
                } else if (choices[bob] == SCISSORS && choices[alice] == PAPER) {
                    return bob;
                } else if (choices[alice] == ROCK && choices[bob] == SCISSORS) {
                    return alice;
                } else if (choices[bob] == ROCK && choices[alice] == SCISSORS) {
                    return bob;
                }
        
            
            function pickWinner(address bob, address alice) public payable {
                if (evaluate(alice, bob) == bob) {
                    bob.transfer(address(this).balance);
                }
                if (evaluate(alice, bob) == alice) {
                    alice.transfer(address(this).balance);
                }
                players = new address[](0);
            }
            }        
        
                
                
            
           
        }
