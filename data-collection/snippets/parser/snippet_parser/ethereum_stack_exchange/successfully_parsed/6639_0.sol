function check()  public constant returns (string) {

    
    if ( msg.sender != expectedSender )
                return;

    
    return someInformation;

}
