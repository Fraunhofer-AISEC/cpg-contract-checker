 contract mortal {

address owner;

function mortal() {
    owner = msg.sender;
}

function kill(){
    if(msg.sender == owner){
        selfdestruct(owner);
    }
   }
}

contract Hello is mortal
{

string public message;

function Hello(){
    message = 'This is the initial Message';
    }

function getMessage() public constant returns(string){
    return message;
    }

function setNewMessage(string newMessage) public payable {
    message = newMessage;   
    }
} 
