mapping (address => address) llIndex;
mapping (address => uint) public balances;

function add(address _addr) public 
{
    llIndex[_addr] = llIndex[0x0];
    llIndex[0x0] = _addr;
}
