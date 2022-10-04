    address[] memory wallet_addresses = new address[](registeredArray.length);
    string[]  memory _ids = new string[](registeredArray.length);
    string[] memory firstNames = new string[](registeredArray.length);
    string[] memory lastNames = new string[](registeredArray.length);
    string[] memory emailIds = new string[](registeredArray.length);
    
    for (uint i = 0; i < registeredArray.length; i++) {
        
        wallet_addresses[i] = registeredArray[i].wallet_address;
        _ids[i] = registeredArray[i].userId;
        firstNames[i] = registeredArray[i].first_name;
        lastNames[i] = registeredArray[i].last_name;
        emailIds[i] = registeredArray[i].email_id;
        
    }
    
    return (wallet_addresses, _ids, firstNames, lastNames, emailIds);
}
  
