function todayStart() public view returns(uint) { 
  return funkyCalculation;
}
function todayStop() public view uint() { ...

modifiers onlyOfficeHours {
  require(now >= todayStart && now < todayStop);
  _;
}

function doSomething() public onlyOfficeHours { ...
