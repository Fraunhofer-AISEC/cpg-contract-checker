pragma solidity ^0.4.25;

contract UserRegistration {
    function getUserData(address userAddress) public constant returns(string, uint) {
        string memory Firstname = "Hello";
        uint number=123;
        return( Firstname,number);
    }
}

contract SecondContract {
    function FetchDetail(address userAddress) public constant returns(string,uint ) {
        string memory  data1;
        uint  data2;
        UserRegistration ud=new UserRegistration();
        (data1,data2)= ud.getUserData(userAddress);
        return(data1,data2);
    }
}
