contract A{
  function validateSchedule(uint scheduleId)
    public
    view
    returns(uint)
  {
    uint amount = schedules[scheduleId].amount;
    return amount;
  }
}
