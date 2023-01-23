contract UserIdentity{

    struct User {
        address userAccount;
        address photo;
        bytes32 fName;
        bytes32 lName;
        address signature;
        bytes32 email;
        uint mno;
        bytes32 street;
        bytes32 city;
        bytes32 state;
        bytes32 country;
    }

    User public user;

    function UserIndendity(address _userAccount,address _photo,bytes32 _fName,bytes32 _lName,address _signature,bytes32 _email,uint _mno,bytes32 _street,bytes32 _city,bytes32 _state,bytes32 _country){

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
