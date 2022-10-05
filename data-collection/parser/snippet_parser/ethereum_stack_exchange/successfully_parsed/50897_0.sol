pragma solidity ^0.4.0;

contract CustodialContract{

    address client;
    bool public _switch = false;

    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint amount);

    function CustodialContract(){
        client = msg.sender;
}

    modifier IfClient(){
        if(msg.sender !=client){
            revert();
    }
    _;
}

    function depositFunds() payable{
        emit UserStatus('User has deposited money!', msg.sender, msg.value);

}

    function withdrawFunds(uint amount) IfClient{
        if(client.send(amount)){
            emit UpdateStatus('User has transferred some money!');
            _switch=true;
    }
        else{
            _switch = false ;
    }
}

    function getFunds() constant returns(uint) {
        emit UpdateStatus('Someone called a getter!');
        return address(this).balance;
}
}