contract Milestone {
    address payable contractAddress = payable(msg.sender); 

        function payContractor() payable public {
             address payable recipient = 
             payable(0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC); 
             recipient.transfer(5000000000000);

    }
}
