function getPerson() 
public view returns(uint ppNo,  bytes32 firstName, string memory gender, string memory dayOfbirth, string memory country) 
{
    return (PersoneDictionary[msg.sender].ppNo, PersoneDictionary[msg.sender].firstName, 
            PersoneDictionary[msg.sender].gender, PersoneDictionary[msg.sender].dayOfbirth, 
            PersoneDictionary[msg.sender].country);
}

