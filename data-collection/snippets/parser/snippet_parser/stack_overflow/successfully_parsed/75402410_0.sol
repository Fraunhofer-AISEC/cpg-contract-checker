pragma solidity ^0.5.16;


contract CertNotary {
    constructor() public {}

    struct Certificate {
        string name;
        string title;
        uint256 date;
        uint256 expDate;
    }

    mapping(bytes32 => Certificate) public certificates;

    event certificateGenerated(bytes32 _certificateId);

    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }

    function generateCertificate(
        string memory _id,
        string memory _name,
        string memory _title,
        uint256 _date,
        uint256 _expDate
    ) public {
        bytes32 byte_id = stringToBytes32(_id);
        require(
            certificates[byte_id].expDate == 1,
            "Certificate with given id already exists"
        );
        certificates[byte_id] = Certificate(_name, _title, _date, _expDate);
        emit certificateGenerated(byte_id);
    }


    function getData(string memory _id)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            uint256
        )
    {
        bytes32 byte_id = stringToBytes32(_id);
        Certificate memory temp = certificates[byte_id];
        require(temp.expDate != 0, "No data exists");
        return (temp.name, temp.title, temp.date, temp.expDate);
    }
}


