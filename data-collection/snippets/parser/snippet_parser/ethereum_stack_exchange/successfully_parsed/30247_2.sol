
contract Klendathu {
  bytes32 public bugs;

  function Klendathu(bytes32 _bugs) public {
    bugs = _bugs;
  }
}

contract RogerYoung {
  bytes32 public bugs;

  function getBugsFromKlendathu(Klendathu bigK) public {
    bugs = bigK.bugs();
  }
}
