function sell(address useraddress, string memory propertyId) payable public {
        request storage sellingRequest = sellingRequests[propertyId];
        require(!sellingRequest.users[useraddress], "Selling Request already exists");
        request memory buyingRequest = buyingRequests[propertyId];
        if(buyingRequest.exists){
            address payable buyer = buyingRequest.usersaddress[0];
            sendMoney.sendMoneyTo.value(msg.value)(useraddress);

        }
        else{
            sellingRequest.exists = true;
            sellingRequest.users[useraddress] = true;
            address payable seller  = address(uint160(address(useraddress)));
            sellingRequest.usersaddress.push(seller);
        }

    }
