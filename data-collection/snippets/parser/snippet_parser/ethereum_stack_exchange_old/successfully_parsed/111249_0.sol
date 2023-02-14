pragma solidity ^0.4.16;

contract OwnedToken {
    address owner;
    string name;

    function OwnedToken(string _name) public {

        owner = msg.sender;

        name = _name;
    }

    function changeName(string newName) public {

            name = newName;
    }

    function transfer(address newOwner) public {

        if (msg.sender != owner) return;

            owner = newOwner;
    }
}

contract TokenCreator {
    function createToken(string name)
       public
       returns (OwnedToken tokenAddress)
    {

        return new OwnedToken(name);
    }

    function changeName(OwnedToken tokenAddress, string name)  public {

        tokenAddress.changeName(name);
    }

    function isTokenTransferOK(address currentOwner, address newOwner)
        public
        view
        returns (bool ok)
    {

        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}
