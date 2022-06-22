contract Subject {
  uint public count = 0;

  function increaseCount() returns newCount{
    count ++;
    newCount = count;
  }
}
