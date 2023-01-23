contract test {
  enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
  function test()
  {
     choices = ActionChoices.GoStraight;
  }
  function getChoice() returns (uint d)
  {
      d = uint256(choices);
  }
  ActionChoices choices;
}
