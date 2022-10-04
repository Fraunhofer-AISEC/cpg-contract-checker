contract GlobalPassport {

event EmitPassportInfo(address[] citizenship);

    struct PassportInfo {
        address[] citizenship;
    }

    PassportInfo[] citizen;

    function createNewPassport(address[] memory _citizenship) public {
        citizen.push(PassportInfo(_citizenship));

        emit EmitPassportInfo(_citizenship);
    }

}
