pragma solidity >=0.7.0<0.9.0;
contract emp
{
    struct Details
    {
        string name;
        uint id;
        string post;
    }
    Details dtl;

    function setDetails(string a, uint b, string c) public
    {
        dtl=Details('a' , b , 'c');
    }
    function output() public view returns (string memory,uint,string memory)
    {
        return (dtl.name, dtl.id, dtl.post);
    }
}
