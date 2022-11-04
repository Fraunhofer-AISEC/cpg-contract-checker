contract FirstContract{
    String public myString;

    function setMyString(String memory what) public {
        myString=what;
    }
}

contract SecondContract{
    address owner;
    address firstAddress;
    FirstContract firstContract;
    constructor(address _1st){
        owner=msg.sender;
        firstAddress=_1st;
        firstContract=FirstContract(firstAddress);
    }
    function callFirst(String memory what){
        require(msg.sender==owner);
        firstContract.setMyString("hello");
    }
}
