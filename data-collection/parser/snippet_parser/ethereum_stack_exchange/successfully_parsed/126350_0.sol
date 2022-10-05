
pragma solidity >0.6.0;


contract A
{
    struct f
    {
        string name;
        int val;
    }

    mapping(uint => f) private j;

    function start() public
    {
        j[1].val = 8;
    }

    function see() public view returns(int)
    {
        return j[1].val;
    }

    function reset() public 
    {
        j[1].val = 0;
    }
}
