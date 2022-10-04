contract Master {
  bool public isActive=false;
  uint public num=0;

  function changeState() returns bool newState{
    isActive = !isActive;
    newState = isActive;
  }

  function increaseSubjectCount(subjectAddr) returns uint newCount{
    SubjectContract subjectContract = SubjectContract(subjectAddr);
    newCount = ubjectAddr.increaseCount();
  }
}
