pragma solidity ^0.4.23;

contract pensCollection{

    struct Pen{
        uint productCode;
        address ownerAddress;
    }

    address public owner;

    
    mapping(uint => address[]) public __history;

    
    mapping(address => Pen[]) public __inventary;

    constructor () public{
        owner = msg.sender;
    }


    function addPen(uint _productCode, address _ownerAddress) public returns (address) {


        Pen memory _pen = Pen({
            productCode : _productCode,
            ownerAddress : _ownerAddress
            });
        __inventary[_ownerAddress].push(_pen);

        
        __history[_productCode].push(_ownerAddress);

        return msg.sender;
    }

    function exchangePen(address _buyer, uint _productCode) public returns (bool) {

       
        for (uint i = 0; i < (__inventary[msg.sender].length); i++) {

            
            if (__inventary[msg.sender][i].productCode == _productCode) {

                Pen memory _pen = Pen(
                    {
                    productCode : _productCode,
                    ownerAddress : _buyer
                    });
                __inventary[_buyer].push(_pen);
                __history[_productCode].push(_buyer);

                delete __inventary[msg.sender][i];
                return true;
            }
        }

        return false;
    }

    function getHistoryForPen(uint _productCode) public view returns (address[]) {
        return __history[_productCode];
    }
}
