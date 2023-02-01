pragma solidity ^0.4.22;

contract Testing {


    function setName(bytes32 firstName , bytes32 lastName) public  returns(bool) {
        Sample _test = new Sample(firstName);
        _test.addLastName(firstName, lastName);
        return true;
    }
}

contract Sample {

    address a;

    bytes32 firstName;

    bytes32 lastName;

    constructor(bytes32 _firstName) public {
        firstName = _firstName;
    }

    modifier onlyBy(bytes32 _firstName) {
        require(
            firstName == _firstName,
            "Error"
        );
        _;
    }

    function addLastName(bytes32 firstName, bytes32 _name) public onlyBy(firstName) returns(bool) {
        lastName = _name;
        return true;
    }
}


I am getting this error


(node:12667) UnhandledPromiseRejectionWarning: Error: Transaction has been reverted by the EVM:

    {
       "blockHash":"0xe709d446057c70ba4928424a71e072aa0b144461ceea0fc535849cd05c7b1cda",
       "blockNumber":4301,
       "contractAddress":null,
       "cumulativeGasUsed":62775,
       "from":"0x112fda795ce61992653b8775597a9152ee776e4c",
       "gasUsed":62775,
       "logsBloom":"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
       "status":false,
       "to":"0x41e864e68ecebe2fd69cea1eed49b5fc516e9af9",
       "transactionHash":"0x33b3921491631d4e2d35a3887858f21a3c02b2dd552b624bb243e2c33f6c4e86",
       "transactionIndex":0,
       "events":{

       }
    }
