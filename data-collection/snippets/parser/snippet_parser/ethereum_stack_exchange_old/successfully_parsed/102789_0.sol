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
    
    function setname(string memory _name) public {
        name=_name;
    }
    
    function getname() public view returns(string memory){
        return name;
    }
    function setdept(string memory _dept) public {
        dept=_dept;
    }
    function getdept() public view returns(string memory){
        return dept;
    }
    function setphonenumber(uint _phonenumber) public{
        phonenumber=_phonenumber;
    }

    function getphonenumber() public view returns(uint){
        return phonenumber;
    }
    
    function setaddresshome(string memory _addresshome) public {
        addresshome=_addresshome;
    }
    function getaddresshome() public view returns(string memory ){
        return addresshome;
    }
    function setemailid(string memory _emailid) public {
        emailid=_emailid;
    }
    function getemailid() public view returns(string memory){
        return emailid;
    }
    
    function setaadhar(uint _aadhar) public {
        aadhar=_aadhar;
    }
    function getaadhar() public view returns(uint){
        return aadhar;
    }
}
