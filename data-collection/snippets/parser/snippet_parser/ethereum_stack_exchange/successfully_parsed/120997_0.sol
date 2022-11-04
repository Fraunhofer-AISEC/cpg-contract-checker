contract Master{
constructor() {}
event AgreementCalled(address[] indexed initialParticipants);
function createAgreement(address[] memory initialParticipants) external {
    emit AgreementCalled (initialParticipants);
    }
}
