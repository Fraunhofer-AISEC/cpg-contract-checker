mapping (address => uint) count;

function set() public{
    count[address(0xde0B295669a9FD93d5F28D9Ec85E40f4cb697BAe)] = 3;
}

function get(address _address) public view returns(uint){
    return count[_address];
}
