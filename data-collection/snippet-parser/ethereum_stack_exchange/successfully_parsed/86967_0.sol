 struct Schedule {
        uint releaseTime;
        bool signed;
    }
    
    struct Beneficiary {
        bool isAuthorized;
        uint percentage;
        uint received;
    }
    
    mapping(address => Beneficiary) private _beneficiaries;
    
    mapping(address => uint) internal rewards;
    
    address[] internal _beneficiariesList;
    
    mapping(uint => Schedule) private _schedules;
    Schedule[] internal _schedulesList;

constructor(address[] memory beneficiaries, uint[] memory _percentages, uint[] memory schedules) public {
        require(beneficiaries.length == _percentages.length, 'Beneficiary and percentage arrays must have the same length');
        for(uint i = 0; i < _beneficiariesList.length; i++) {
            _beneficiariesList.push(beneficiaries[i]);
            _beneficiaries[_beneficiariesList[i]].isAuthorized = true;
            _beneficiaries[_beneficiariesList[i]].percentage = _percentages[i];
            uint _totalPercentage = 0;
            _totalPercentage = _totalPercentage.add(_beneficiaries[_beneficiariesList[i]].percentage);
            require(_totalPercentage == 100, 'Percentages must sum up to 100');
        }
        for(uint s = 0; s < _schedulesList.length; s++) {
            _schedulesList[s].releaseTime = now + schedules[s];
            _schedulesList.push(_schedulesList[s]);
        }
    }
