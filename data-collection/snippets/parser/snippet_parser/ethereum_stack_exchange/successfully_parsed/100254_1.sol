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
