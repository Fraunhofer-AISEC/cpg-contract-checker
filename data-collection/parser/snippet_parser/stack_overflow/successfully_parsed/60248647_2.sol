contract A {
    string public name;
    constructor(string memory tokenName) public {
        name = tokenName;
    }

    function setName(string memory newName) public returns ( string memory){
        name = newName;
        return newName;
    }
}


contract B  {
    event Log(string msg);
    string public myName;
    function call(address addr, string memory newName) public {
        bytes memory payload = abi.encodeWithSignature("setName(string)", newName);  
        (bool success, bytes memory result)= addr.call(payload);

        
        string memory name = abi.decode(result, (string));

        myName = name;
        emit Log(name);
    }
}
