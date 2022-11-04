contract Proxy {

    address myAddress;

    function callMyContract() public view returns(address) {
        MyContract(myAddress).doSomthing();
    }
}

contract MyContract {

    event Something(address sender);

    function doSomthing() public (address) {
        emit Something(msg.sender); 
        emit Something(tx.origin); 
    }
}
