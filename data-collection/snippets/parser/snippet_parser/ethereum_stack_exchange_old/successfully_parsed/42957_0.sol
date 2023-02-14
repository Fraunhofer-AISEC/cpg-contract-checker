function SignTermsAndConditions() OnlySender_Receiver_Transporter{
    if(msg.sender == sender){
        require(state == contractState.waitingForVerificationbySender);
        SignedBy("Terms and Conditiond verified : ", msg.sender);
        state = contractState.waitingForVerificationbyTransporter;
    }else if(msg.sender == transporter)
    {
        require(state == contractState.waitingForVerificationbyTransporter);
        SignedBy("Terms and Conditiond verified : ", msg.sender);
        state = contractState.waitingForVerificationbyReceiver;
    }
    else if(msg.sender == receiver){
        require(state == contractState.waitingForVerificationbyReceiver);
        SignedBy("Terms and Conditiond verified : ", msg.sender);
        state = contractState.DoneVerificationofTerms;
        POD_PhysicalItems.withdrawAgreedUponCollateral.value(2*itemPrice)(sender);
        POD_PhysicalItems.withdrawAgreedUponCollateral.value(2*itemPrice)(transporter);
        POD_PhysicalItems.withdrawAgreedUponCollateral.value(2*itemPrice)(receiver);
    }
}

function withdrawAgreedUponCollateral(address entityAddress) payable internal  {
    require(state == contractState.DoneVerificationofTerms);
    collateralWithdrawnSuccessfully("Double deposit is withdrawn successfully from: ", entityAddress);

}
