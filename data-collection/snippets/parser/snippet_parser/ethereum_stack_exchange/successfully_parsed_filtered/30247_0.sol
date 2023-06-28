contract Klendathu {
  string public bugs;

  function Klendathu(string _bugs) public {
    bugs = _bugs;
  }
}

contract RogerYoung {
  string public bugs;

  function getBugsFromKlendathu(Klendathu bigK) public {
    bugs = bigK.bugs();
  }
}
