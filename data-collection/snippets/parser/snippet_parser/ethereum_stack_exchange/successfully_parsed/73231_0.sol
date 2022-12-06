    uint filesCount;
    mapping(uint => NotaryEntry) public files;
    mapping(address => uint[]) public personFiles;

    struct NotaryEntry{
        uint id;
        string description;
        uint timestamp;
        string hash;
        address setBy;
        bool isSet;
    }

    function addNotaryEntry( string memory _hash, string memory _desc) public {

        uint _id = filesCount += 1;

        NotaryEntry memory notary;
        notary.id = _id;
        notary.description = _desc;
        notary.timestamp = now;
        notary.hash = _hash;
        notary.setBy = msg.sender;
        notary.isSet = true;
        personFiles[msg.sender].push(filesCount);
    }
`
