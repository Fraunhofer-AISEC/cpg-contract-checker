pragma solidity ^0.4.18;
contract billboard {           
    struct Contributor{             
        string name;                    
        string email;                   
        string message;                
        address addr;                  
    }
    address public owner;           
    string public name;                 
    string public default_name;         
    string public email;                
    string public message;              
    address public addr;                
    uint public numPosts;               
    uint public limit_posts;            
    mapping( uint => Contributor ) public contributors;  
    uint public timestamp;              
    address public winnerAddress;       
    uint public winnerInd;              
    bool public stopped;                

    modifier onlyOwner() {              
    require(msg.sender == owner);
    _;
    } 
    modifier isStopped() {              
    require(!stopped);
    _;
    }

    function billboard(string _title) public {  
        owner = msg.sender;                             
        numPosts = 0;                                   
        stopped = false;                                
        limit_posts = 1002;
    }    
    function post(string _name, string _email, string _message) public payable isStopped {     
        name = _name;                                   
        email = _email;                                
        message = _message;                             
        require(_message.length != 0);                      
        require(limit_posts > numPosts + 1);                
        if(_name.length == 0) {                             
            _name = default_name;
        }
    }
    function hold() public onlyOwner {            
        require(numPosts >= 3);                         
        timestamp = block.timestamp;                
        winnerInd = timestamp % 3;                 
        winnerAddress = contributors[winnerInd];
        if(!winnerAddress.send(this.balance)) {     
                require( false ) ;
        }
    }
    function kill() public onlyOwner {          
        selfdestruct(owner);
    }
}
