contract UserIndendity{

    struct User {
        address userAccount;
        address photo;
        string fName;
        string lName;
        address signature;
        string email;
        uint mno;
        string street;
        string city;
        string state;
        string country;
    }

    User public user;

    function UserIndendity(address _userAccount,address _photo,string _fName,string _lName,address _signature,string _email,uint _mno,string _street,string _city,string _state,string _country){

        user.userAccount=_userAccount;
        user.photo=_photo;
        user.fName=_fName;
        user.lName=_lName;
        user.signature=_signature;
        user.email=_email;
        user.mno=_mno;
        user.street=_street;
        user.city=_city;
        user.state=_state;
        user.country=_country;
    }
}
