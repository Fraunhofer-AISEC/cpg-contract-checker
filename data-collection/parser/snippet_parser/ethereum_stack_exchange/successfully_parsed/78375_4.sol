pragma solidity 0.4.25; 

contract GoodToken {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    function transfer(address _to, uint256 _value) public returns (bool) {
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}

contract BadToken {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    function transfer(address _to, uint256 _value) public {
        emit Transfer(msg.sender, _to, _value);
    }
}

contract Caller {
    function transferGoodToken(address _token, address _to, uint256 _value) public {
        GoodToken(_token).transfer(_to, _value);
    }
    function transferBadToken(address _token, address _to, uint256 _value) public {
        BadToken(_token).transfer(_to, _value);
    }
}
