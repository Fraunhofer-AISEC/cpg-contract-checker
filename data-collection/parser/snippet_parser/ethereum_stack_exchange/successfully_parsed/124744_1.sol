contract Simple {
  bool immutable isNatural;

  constructor(uint number) {
    isNatural = number != 0 ? true : false; 
  }
}
