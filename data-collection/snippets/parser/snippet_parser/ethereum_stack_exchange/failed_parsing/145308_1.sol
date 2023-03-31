struct Child {
    address childAddress;
    string name;
    address tokenPreference;
}


mapping(address => Child[]) public parentToChildMapping;


mapping(address => mapping(address => Child)) public parentToChildMappingNested;


function addChild(string memory _name, address _childAddress, address _tokenPreference,) public  {

    Child memory child = Child({
        childAddress: _childAddress, 
        name: _name, 
        tokenPreference: _tokenPreference, 
    }); 

    parentToChildMapping[msg.sender].push(child);
    parentToChildMappingNested[msg.sender][_childAddress] = child;
}
