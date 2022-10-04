struct Data {
        string aNumber;
        string pNumber;
        string fullName;
    }

mapping(string => Data)  kData;

function getData(string memory _aNumber)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
        )
    {
        Data storage dataInfo = kData[_aNumber];
        return (
            dataInfo.aNumber,
            dataInfo.fullName,
            dataInfo.pNumber
        );
    }
