pragma solidity ^0.4.23;

contract PenContract{

    struct Pen{
        uint productCode;
        address ownerAddress;
    }

    address public owner;
    Pen public _pen;

    
    address[] public __history;


    constructor (uint _productCode, address _ownerAddress) public{
        owner = msg.sender;
        _pen.productCode = _productCode;
        _pen.ownerAddress = _ownerAddress;

        
        __history.push(_ownerAddress);
    }


    function exchangePen(address _buyer) public returns (bool) {
        _pen.ownerAddress = _buyer;
        __history.push(_buyer);
        return true;            
    }

    function getHistoryForPen() public view returns (address[]) {
        return __history;
    }
}
