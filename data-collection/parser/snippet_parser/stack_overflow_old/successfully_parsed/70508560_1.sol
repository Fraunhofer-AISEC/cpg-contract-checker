contract Inbox{
string public message;
function inbox(string initialMessage) public {
    message = initialMessage;
}
function setMessage(string newMessage) public {
    message = newMessage;
}
function doMath(int a, int b){
    a+b;
    b-a;
    b*a;
    a==0;
}
}
