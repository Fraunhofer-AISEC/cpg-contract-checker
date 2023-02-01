pragma solidity 0.5.1;

contract basics{
    using SafeMath for *;
    uint time;
    address payable sender;
    uint amount;
    event moneySent(address s,uint a);

    mapping(address=>person) public accounts;

    struct person {
        uint time;
        uint vault;
    }        

    function sendToContract() public payable{
        accounts[msg.sender].vault=accounts[msg.sender].vault.add(msg.value);
        accounts[msg.sender].time=now;
    }

    function takeFromContract() public payable{
        if(now>=accounts[msg.sender].time+10 seconds){
            msg.sender.transfer(accounts[msg.sender].vault);
            accounts[msg.sender].time=now;
        }           
    }
}


library SafeMath {

    
    function mul(uint256 a, uint256 b)
        internal
        pure
        returns (uint256 c)
    {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        require(c / a == b, "SafeMath mul failed");
        return c;
    }

    
    function sub(uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        require(b <= a, "SafeMath sub failed");
        return a - b;
    }

    
    function add(uint256 a, uint256 b)
        internal
        pure
        returns (uint256 c)
    {
        c = a + b;
        require(c >= a, "SafeMath add failed");
        return c;
    }

    
    function sqrt(uint256 x)
        internal
        pure
        returns (uint256 y)
    {
        uint256 z = ((add(x,1)) / 2);
        y = x;
        while (z < y)
        {
            y = z;
            z = ((add((x / z),z)) / 2);
        }
    }

    
    function sq(uint256 x)
        internal
        pure
        returns (uint256)
    {
        return (mul(x,x));
    }

    
    function pwr(uint256 x, uint256 y)
        internal
        pure
        returns (uint256)
    {
        if (x==0)
            return (0);
        else if (y==0)
            return (1);
        else
        {
            uint256 z = x;
            for (uint256 i=1; i < y; i++)
                z = mul(z,x);
            return (z);
        }
    }
}
