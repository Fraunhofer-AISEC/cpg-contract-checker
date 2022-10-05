pragma solidity ^0.6.0;

contract SimpleContract{
    string name;
    string dept;
    uint phonenumber;
    string addresshome;
    string emailid;
    uint aadhar;
    string ipfshash1;
    string ipfshash2;
    string ipfshash3;
    string ipfshash4;
    
    
    function sendhash1(string memory x) public {
        ipfshash1=x;
    }
     function gethash1() public view returns(string memory x) {
        return ipfshash1;
    }
    
    function sendhash2(string memory x) public {
        ipfshash2=x;
    }
     function gethash2() public view returns(string memory x) {
        return ipfshash2;
    }
    
    function sendhash3(string memory x) public {
        ipfshash3=x;
    }
     function gethash3() public view returns(string memory x) {
        return ipfshash3;
    }
    
    function sendhash4(string memory x) public {
        ipfshash4=x;
    }
     function gethash4() public view returns(string memory x) {
        return ipfshash4;
    } 
    
}
