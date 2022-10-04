function __callback(string result) public returns(uint,address,uint){
    emit Print(result);
    string memory _int = Strings.substring(result,60,90);
    emit Print(_int);
    emit P2(stringToUint(_int));
    uint _amount= parseInt(_int);
    _int =strConcat('0x',Strings.substring(result,91,130)) ;
    address _owner =  parseAddr(_int);
    _int =Strings.substring(result,131,194) ;
    uint _transId = parseInt(_int);
    return (_amount,_transId,_transId);
}
