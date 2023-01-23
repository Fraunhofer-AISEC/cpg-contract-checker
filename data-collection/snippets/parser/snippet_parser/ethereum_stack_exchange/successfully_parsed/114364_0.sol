function createApplication(EnumLibrary.ApplicationType _applicationType) public{
        

        require(_applicationType == EnumLibrary.ApplicationType.Vaccine, "Only vaccine passport supported atm");
        VaccinePassport item = new VaccinePassport(this);
        applications[address(item)] = item;
        emit ChangeProgressStep(msg.sender, address(item), EnumLibrary.ApplicationProgressStep.AwaitingDeposit, _applicationType);
    }
