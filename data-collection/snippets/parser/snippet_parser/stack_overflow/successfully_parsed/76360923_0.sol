pragma solidity ^0.5;

contract Forest {
    string public name;
    uint public treeCount = 0;
    mapping(string => Tree) private trees;
      

    enum UserType {Producer, Customer}

     struct Tree {
        string dna;
        string country;
        int256 latitude;
        int256 longitude;
        string treeType;
    }

    event TreeRegistered(
        string dna,
        string country,
        int256 latitude,
        int256 longitude,
        string treeType
    );

    constructor() public {
        name = "Tree Identification";
    }

    function registerTree(
        string memory _dna,
        string memory _country,
        int256 _latitude,
        int256 _longitude,
        string memory _treeType
    ) public {
        
        require(bytes(_dna).length > 0, "DNA code must not be empty");
        require(bytes(_country).length > 0, "Country must not be empty");
        require(_latitude != 0 && _longitude != 0, "Latitude and longitude must be provided");
        require(bytes(_treeType).length > 0, "Tree type must not be empty");
        
        require(trees[_dna].latitude == 0 && trees[_dna].longitude == 0, "DNA code already used for a registered tree");
        
        treeCount ++;
        
        trees[_dna] = Tree(_dna, _country, _latitude, _longitude, _treeType);
        
        emit TreeRegistered(_dna, _country, _latitude, _longitude, _treeType);
    }

    
    
    


    function getTreeInformation(string memory _dna) public view returns (string memory, string memory, int256, int256, string memory) {
        
        Tree memory _tree = trees[_dna];
        
        return (_tree.dna, _tree.country, _tree.latitude, _tree.longitude, _tree.treeType);
    }
}
