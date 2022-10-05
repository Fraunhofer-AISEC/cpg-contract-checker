pragma solidity ^0.4.21;

contract Token {
    function transfer(address _to, uint _value) public returns (bool success);
}

contract TestContract1 {

    function transfer(address _to, uint _amount) public returns (bool success) {
    
        address tokenContract = 0x861783a4B946026e3180FCA173261d937aa2fabF;

        Token _tokenSomething = Token(tokenContract);

        _tokenSomething.transfer(_to, _amount);

        return true;
    }
}

contract TestContract2 {

    function transfer(address _to, uint _amount) public returns (bool success) {
    
        address tokenContract = 0x1dD42376F6902F812E03C3861Da3c8654462c267

        Token _tokenSomething = Token(tokenContract);

        _tokenSomething.transfer(_to, _amount);

        return true;
    }
}

contract TestContract3 {

    function transfer(address _to, uint _amount) public returns (bool success) {
    
        address tokenContract = 0x8970fd3E01504D5b83d48faFbad92547AE9B6630

        Token _tokenSomething = Token(tokenContract);

        _tokenSomething.transfer(_to, _amount);

        return true;
    }
}
