struct Hoge {
  uint id;
  string text;
}

・・・

constructor() public {
  hoges.push(Hoge(1, "Hogehoge"));
}

・・・

function hogehoge() external view returns(Hoge memory) {
  return hoges[0];
}

