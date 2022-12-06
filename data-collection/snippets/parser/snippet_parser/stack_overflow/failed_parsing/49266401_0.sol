contract A{
....

balanceOf[0xE4e5a16C8fx207a07f7df98e3a85e2067feacB9w]=500;

function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
....
}

contract B{
    
}
