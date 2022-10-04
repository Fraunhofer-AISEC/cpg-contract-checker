function createUser(
    address _address, 
    string memory _name, 
    string memory _companyName, 
    int _numYearsExperience, 
    int _pricePerHour, 
    string memory _specialisation, 
    string memory _summary,
    int _numAdsViewed,
    int _numAdsPurchased
    ) public 

{

    address _userAddress = _address;

    
    User storage user = users[_userAddress];


    
    require(
        !user.set,
        "User already exists!"
        );


    
    users[_userAddress] = User({
        name: _name,
        companyName: _companyName,
        numYearsExperience: _numYearsExperience,
        pricePerHour: _pricePerHour,
        specialisation: _specialisation,
        summary: _summary,
        set: true,
        numAdsViewed: _numAdsViewed,
        numAdsPurchased: _numAdsPurchased
    });
}
