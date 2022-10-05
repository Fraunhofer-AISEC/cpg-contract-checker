pragma solidity ^0.4.17;

contract FileDetail {
    uint fileSize;
    string fileName;
    string fileType;

 function set(uint fileS,string fileN, string fileT) {
        fileSize = fileS;
        fileName = fileN;
        fileType = fileT;
    }
}
