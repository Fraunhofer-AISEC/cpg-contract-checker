struct User {
    mapping(uint => uint) directReferrals; 
    mapping(uint => uint) index; 
    uint directReferralsAmount;
}

User[] users;

function getUser(uint _userId) [...] public view returns(uint[] directReferrals) { [...] }
