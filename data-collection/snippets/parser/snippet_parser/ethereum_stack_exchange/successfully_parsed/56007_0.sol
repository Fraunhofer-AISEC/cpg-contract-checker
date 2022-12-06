pragma solidity ^0.4.17;

contract FileDetail {
 struct File{
    string fileName;
    string fileHash;
 }



 File[] private files;

 event Uploaded(
       string fileName,
       string fileHash
    );


 function setFile(string fName, string fileHash) public{
 File memory file = File({fileName:fName,fileHash:fileHash});
  files.push(file);
 emit Uploaded(fName,fileHash);
 }

 function getFile(uint256 index) external view returns(
 string fileName,
 string fileHash

 ){

   File memory file = files[index];
   fileName = file.fileName;
   fileHash = file.fileHash;

 }
}
