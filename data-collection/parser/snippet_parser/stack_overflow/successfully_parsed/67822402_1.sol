pragma solidity ^0.6.0;

contract register{
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
    constructor() public {
        phonenumber=0;
        aadhar=0;
        
    }
    
    function getname(string memory _name) public pure returns(string memory){
        return _name;
    }
    
    function getdept(string memory _dept) public pure returns(string memory){
        return _dept;
    }
    
    function getphonenumber(uint _phonenumber) public pure returns(uint){
        return _phonenumber;
    }
    
    function getaddresshome(string memory _addresshome) public pure returns(string memory){
        return _addresshome;
    }
    
    function getemailid(string memory _emailid) public pure returns(string memory){
        return _emailid;
    }
    
    function getaadhar(uint _aadhar) public pure returns(uint){
        return _aadhar;
    }
    
    function sendhash1(string memory a) public {
        ipfshash1=a;
    }
     function gethash1() public view returns(string memory a) {
        return ipfshash1;
    }
    
    function sendhash2(string memory b) public {
        ipfshash2=b;
    }
     function gethash2() public view returns(string memory b) {
        return ipfshash2;
    }
    
    function sendhash3(string memory c) public {
        ipfshash3=c;
    }
     function gethash3() public view returns(string memory c) {
        return ipfshash3;
    }
    
    function sendhash4(string memory d) public {
        ipfshash4=d;
    }
     function gethash4() public view returns(string memory d) {
        return ipfshash4;
    }
    
}
