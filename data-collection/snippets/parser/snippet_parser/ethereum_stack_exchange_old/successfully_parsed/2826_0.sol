contract Name is mortal{

    mapping(address=>string) public text;
    string public test;

    function register(string _text){
        text[msg.sender]    = _text;
    }
}
