contract MyContract {
    struct myStruct {
        address id;
    }
    mapping(address => myStruct) myMapping;

    function doSomeStuff(address _tokenId) public view returns(address) {    
        myStruct storage myObj = myMapping[_tokenId];

        return myObj.id;
    }   
}
