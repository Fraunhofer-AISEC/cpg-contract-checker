contract MembersMODDED {

    mapping (address => uint) public memberId;
    mapping (uint => Member) public members; 

    struct Member {  
        string Name;
        string SurName;
        address MemberAccountNo;
        bool IsActive;
        int AccountType;
        uint MemberNo;
        uint memberSince;
    }

    function MembersMODDED( ) { 
        memberId[12345] = 0;
    }

    function changeMembership(address memberAccountNo, bool isActive, string name, 
    string surName,int accountType,uint memberNo) {
        uint id;
        if (memberId[memberAccountNo] == 0) {
            memberId[memberAccountNo] = memberNo;
            id = memberNo;
            members[id] = Member({MemberAccountNo: memberAccountNo, IsActive: isActive, memberSince: now, Name: name, SurName: surName, AccountType: accountType, MemberNo: memberNo});
        } else {
            id = memberId[memberAccountNo];
            Member m = members[id];
            m.IsActive = isActive;
            m.Name = name;
            m.SurName = surName;
        }  
    }
}
