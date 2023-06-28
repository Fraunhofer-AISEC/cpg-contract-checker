function createMyFunDity(string memory _addressName) public checkDuplicateName(_addressName)  {
        address caller  = msg.sender;   
        list_of_creators.push(caller);                                             
     bytes32 hashedAddressName = keccak256(abi.encode(_addressName));
     hashedAddressList.push(hashedAddressName);
     bytes32 hashedString = keccak256(abi.encode(_addressName, msg.sender,block.timestamp));
     address castedAddress = address(uint160(uint256(hashedString)));
     address payable funditeeAddress = payable(castedAddress);
    funditees.push(FunDitees(funditeeAddress,_addressName));
     listOfFunDityAddresses.push(funditeeAddress);
     nameToAddress[_addressName]=funditeeAddress;
     creatorToAddressCreated[caller]=funditeeAddress;
     addressCreatedToCreator[funditeeAddress]=caller;
    

    }
