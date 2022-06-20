function createStudents(string fname, string year, string hash, uint256 _ipfsHash) public {
Student memory student = Student(fname, year, hash);   
students.push(student);
studentInfo(fname, year, hash);
ipfsHash.push(_ipfsHash);
}