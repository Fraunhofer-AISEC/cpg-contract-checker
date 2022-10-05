
contract Lottery
{

        
            address Owner;
            constructor() public
            {   
                 Owner = msg.sender;    
                 
            }
    
        
        
            struct person
            {
                string name;
                uint age;
                bool played;
            }
    
        
            mapping (address => person) players;

        
        address payable[] playersAddressList;

        
            uint public balance=0;
            
        
        modifier ownerOnly(){
         require(msg.sender==Owner);
         _;
        }
        
        
        function addPlayer(string memory a, uint b) public payable
        {

                address payable creator = msg.sender;
               
            
                require (players[creator].played == false);
                
            
                playersAddressList.push(creator);
            
            
                balance = balance + msg.value;
                require (msg.value >= 1 ether);
                
                
            
                players[creator].name = a;
                players[creator].age = b;
                players[creator].played = true;
        }
        
    
        
        function selectWinner() public ownerOnly {
            uint a = random() % playersAddressList.length;
            address payable winner; 
            winner = playersAddressList[a];
            winner.transfer(balance);
            balance = 0;
            delete playersAddressList;
        }
    
        
        function displayDetails(uint a) public view returns(uint,  string memory, bool){
            
            return(players[playersAddressList[a]].age,players[playersAddressList[a]].name,players[playersAddressList[a]].played);

        }
    
        
        function random() private view returns(uint){
           return uint(keccak256(abi.encodePacked(block.difficulty, now, playersAddressList)));
        }
    
}```
