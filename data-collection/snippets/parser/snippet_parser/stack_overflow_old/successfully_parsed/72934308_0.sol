function createEvidence(uint _eID, string memory _category,string memory _details, string memory _location, address _currOwner) verifiedAdmin verifiedUser(_users) public returns (bool)  
{
        eID=_eID;

        category=_category;
        details=_details;
        location=_location;
        currOwner=_currOwner;
        evidences[_evidenceId] = EvidenceDetail(Status.Pending, _category,_details,_location, _currOwner);
        return true;
    }
