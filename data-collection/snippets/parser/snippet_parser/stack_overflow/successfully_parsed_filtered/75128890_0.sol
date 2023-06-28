contract kturiadiathritea {
    address  owner;

    constructor() {
        owner = msg.sender;
    }

    event kturiatransfer(uint256 timestamp,string dhmos,string fek,string apof,string dieuth,string status,string cid);

    struct kturiapinakas {   
        string dhmos;
        string fek;
        string apof;
        string dieuth;
        string status;
        string cid;
        uint256 timestamp;
    }
    
    mapping(uint => kturiapinakas) kturiap;
    
    kturiapinakas[] kturiaupoPinakas;

    function setkturia(string memory dhmos,string memory fek,string memory apof,string memory dieuth,string memory status,string memory cid) public {
        kturiaupoPinakas.push(
            kturiapinakas(
                    dhmos,
                    fek,
                    apof,
                    dieuth,
                    status,
                    cid,
                    block.timestamp
            )
        );

}

function getAllkturia() public view returns(kturiapinakas[] memory) {
        return kturiaupoPinakas;
    }
    function getAllkturia2(uint256 timestamp) public view returns(string memory,string memory,string memory,string memory,string memory,string memory) {
        return (
                kturiap[timestamp].dhmos,
                    kturiap[timestamp].fek,
                    kturiap[timestamp].apof,
                    kturiap[timestamp].dieuth,
                    kturiap[timestamp].status,
                    kturiap[timestamp].cid
                    );
    }

    }
