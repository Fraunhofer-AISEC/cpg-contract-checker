 contract Transactions{

uint32 public participant_id = 0;   

    struct participant {
    string userName;
    string password;
    string participantType;
    address participantAddress; 
}
    mapping(uint32 => participant) public participants; 
}