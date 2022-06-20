pragma solidity 0.4.25;

contract UserRegistration
{
    function getUserCount() public returns(uint);
    function getUser(uint) public returns(uint,string,string,uint,uint);
}

contract Exam
{
    address private addrUsr;
    uint public count;
    UserRegistration r;
    constructor(address _addrUsr)
    {
        addrUsr=_addrUsr;
        r = UserRegistration(addrUsr);
    }

    function updateCount() public {

        count=r.getUserCount();
    }

    function getUserData(uint _id) public
    {
        
    }       

}
