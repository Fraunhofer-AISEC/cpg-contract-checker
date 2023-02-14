 function withdrawAgreedUponCollateral(address entityAddress) payable internal  {
    require(state == contractState.DoneVerificationofTerms);
    collateralWithdrawnSuccessfully("Double deposit is withdrawn successfully from: ", entityAddress);

}
