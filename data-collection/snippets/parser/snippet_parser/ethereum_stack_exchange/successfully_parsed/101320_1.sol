pragma solidity >=0.4.22 <0.9.0;
contract SimpleStorage{
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
    
    function setname(string memory _name) public  returns(string memory){
        name=_name;
    }
    
    function getname() public view returns(string memory){
        return name;
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
}
