pragma solidity ^0.8.0;

pragma experimental ABIEncoderV2;
contract Owner {
    address public fileowner;
    
    
    function Owned() public{
        fileowner = msg.sender;
    }
    
    
    
    modifier onlyOwner {
        require(msg.sender == fileowner); 
        _;
    }
    
    
    function transferOwnership(address newOwner) public onlyOwner { 
        fileowner = newOwner; 
    }
    
    
    function getOwner() public view returns (address) { 
        return fileowner;
    }
}

contract CopyInfoContract{
    uint index;
    struct CopyrightStruct {
        string Artist;
        string Createdtime; 
        string Type; 
        string Description; 
        uint timestamp;
    }

    event Copyright(string Artist, string Createdtime, string Type, string Description, uint timestamp);
    
    CopyrightStruct[] public copyright; 

    function initalized() public{
        index = 0;
    }

    function addCopyright(string memory _Artist, string memory _Createdtime, string memory  _Type, string memory _Description, uint timestamp ) public {
        copyright.push(CopyrightStruct(_Artist, _Createdtime, _Type, _Description, timestamp));
        index++;
        emit Copyright(_Artist, _Createdtime, _Type, _Description, timestamp);
    }
    
    function getCopyright(uint _idx) public view returns(string memory, string memory, string memory, string memory) {
        return (copyright[_idx].Artist, copyright[_idx].Createdtime, copyright[_idx].Type, copyright[_idx].Description);
    }
    
}

contract StorefileHash is Owner {
    struct File {
        string filename;
        uint UploadDate;
        uint Filesize;
    }
    
        
    mapping(string => File) private files; 
    mapping(string => string[]) private fileOwners;
    string[] public owners;
    uint public ownerID = 0;
    
    event FileUpload(string ownername, string filehash, File file);
    
    function upload(string memory _ownername, string memory _filehash, string memory _filename, uint _filesize) onlyOwner public{
        ownerID++;
        owners.push(_ownername);
        File memory f = File(_filename, block.timestamp, _filesize); 
        files[_filehash] = f;
        emit FileUpload(_ownername, _filehash, f);
    }

    function Exsistcheck(string memory filehash) onlyOwner public view returns (bool) {
        if(files[filehash].Filesize > 0) {
            return true;
        }
        return false;
    }
    
    function getOwnerName(uint id) onlyOwner public view returns (string memory) {
        return owners[id];
    }
    
    function getfileinfo(string memory filehash) onlyOwner public view returns (string memory, uint, uint) {
        return (files[filehash].filename, files[filehash].UploadDate, files[filehash].Filesize);
    }
}
