
contract Factory {

    event NewToken(address)


    function createToken() returns bool{
        Token token = new Token(address(this))
        emit NewToken(address(token))    
    }
}

contract Token {

    address factory;

    constructor(address _factory){
        factory = _factory;
    }

    modifier isFactory {
        if(msg.sender !== factory){
            revert("Only the factory can access this");
        }
        _;
    }    

}

