pragma solidity 0.4.24;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";





contract DoesAddressExist {
        using SafeMath for uint256;


constructor() public {
}


function () private payable {}



struct ValueRecorded {
    uint valueEntered;
    uint8 flag;
}

ValueRecorded[] public valueRecorded;

mapping(address => ValueRecorded) user;




function storeValue(uint _value) public {
        ValueRecorded memory newValueRecorded = ValueRecorded ({
                valueEntered: _value,
                flag: 1
                });
        valueRecorded.push(newValueRecorded);

}


function checkForAddress(address _address) public view returns (bool) {
    if(user[_address].flag == 1) {
    return true; }
    else return false;
    }


}
