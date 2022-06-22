function sendHash(address student_id, string hash_value) returns(bool sufficient) 
{ 
    student_hashes[student_id] = hash_value;        
    return true; 
}
