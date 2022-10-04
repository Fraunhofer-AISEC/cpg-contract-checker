function foo(int256 x) public view returns (bool) {
  if(tuna[x].validOnce == true){
    if(dog[x] == true)
      return true;
    else
      return false;
  } else return true;
}
