pragma solidity ^0.4.0;

contract ProductItem {
    address[] _owners;
    address _currentOwner;
    address _nextOwner;
    string _productDigest;

    function ProductItem(string productDigest) {
        _currentOwner = msg.sender;
        _productDigest = productDigest;
    }

    function setNextOwner(address nextOwner) returns(bool set) {
        if (_currentOwner != msg.sender) {
           return false;
        }
        _nextOwner = nextOwner;
        return true;
    }

    function confirmOwnership() returns(bool confirmed) {
        if (_nextOwner != msg.sender) {
            return false;
        }
        _owners.push(_nextOwner);
        _currentOwner = _nextOwner;
        _nextOwner = address(0);
        return true;
    }

    function getOwner() constant returns(address owner) {
        return _currentOwner;
    }

    function getOwners() constant returns(address[] owners) {
        return _owners;
    }

    function getProduct() constant returns (string product) {
       return _productDigest;
    }
}
