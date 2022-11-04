function payWorker1(address schoolId) public payable returns(bool){
        require(Schools[schoolId].moneySent == false);
        require(Schools[schoolId].verified == true);
        Schools[schoolId].accountCaterar.transfer(Schools[schoolId].amountRequired*(caterar/100));
        Schools[schoolId].accountTransporter.transfer(Schools[schoolId].amountRequired*(transporter/100));
        Schools[schoolId].accountSupplier.transfer(Schools[schoolId].amountRequired*(materialSupplier/100));
        Schools[schoolId].moneySent = true;
        return true;
    }
