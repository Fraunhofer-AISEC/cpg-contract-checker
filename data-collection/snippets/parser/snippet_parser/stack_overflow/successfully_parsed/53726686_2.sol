function MyFunc() external payable {
    if (addresses[msg.sender]) {
      emit ParticipateStatus(0, allRunningBets[_betListIndex].betPlacer, msg.sender);
      return;
    }
}
