
    uint256 public pageNo = 0;
    enum Category {DEFAULT, I, II, IIIA, IIIB}
    mapping(uint => TLB) public TLBs;
    
    struct TLB{
        uint flightNo;
        string flightFrom;
        string flightTo;
        uint256[3] reportDate;
        Category[] category;
        bool EtopsFlight;
        string maintCheck;
        uint licenseNo;
        uint station;
        bool CaaCertification;
        bool handlingAgent; 
        uint CertNo;
    }
    
    function addTLB(uint _flightNo, string memory _flightFrom, string memory _flightTo, uint256[3] memory _reportDate) public {
        Category _category = Category.DEFAULT;
        
        TLBs[pageNo] = TLB(_flightNo, _flightFrom, _flightTo, _reportDate, _category, false, "", 0, 0, false, false, 0);
    }
