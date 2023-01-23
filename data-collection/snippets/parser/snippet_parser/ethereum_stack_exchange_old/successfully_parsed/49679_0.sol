contract A{

uint public test = 6;
address public myaddress;
uint public dummy;


event MyEvent(address myaddress);
event ReadEvent(address myaddress, uint dummy);


constructor() public {
    myaddress = msg.sender;
    emit MyEvent(myaddress);
}

function myF(address sender, uint value) internal {
    require(sender == myaddress );
    dummy = value;
    emit ReadEvent(sender, myaddress);

}


function run() public payable{
    myF(msg.sender, msg.value);

    

}
}
