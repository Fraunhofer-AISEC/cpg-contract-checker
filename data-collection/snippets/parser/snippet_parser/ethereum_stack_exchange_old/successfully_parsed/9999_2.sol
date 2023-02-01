pragma solidity ^0.4.4;
contract MetaCoin{
    mapping (address => string) student_hashes;
    function sendHash(address student_id, string hash_value) returns(bool sufficient)  { 
        student_hashes[student_id] = hash_value;        
        return true; 
    }
    function getHash(address student_id) constant returns(string hash)  {       
        return student_hashes[student_id]; 
    }
}
