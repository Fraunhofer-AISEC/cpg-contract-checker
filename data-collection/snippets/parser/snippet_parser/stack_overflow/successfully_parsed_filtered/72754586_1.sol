contract GlobalPassport {

event EmitPassportInfo(address[] citizenship);

    struct PassportInfo {
        address[] citizenship;
    }

    PassportInfo[] public citizen;

    function createNewPassport(address[] memory _citizenship) public {
        citizen.push(PassportInfo(_citizenship));

        emit EmitPassportInfo(_citizenship);
    }

}
