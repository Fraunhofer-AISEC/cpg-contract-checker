pragma solidity >=0.4.21 <0.6.0;

contract Certificate {
    string certificateHash;

    
    function set(string memory _certificateHash) public {
        certificateHash = _certificateHash;
    }

    
    function get() public view returns (string memory){
        return certificateHash;
    }

}
