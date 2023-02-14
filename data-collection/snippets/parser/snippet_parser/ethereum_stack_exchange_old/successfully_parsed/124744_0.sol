contract Simple {
  bool immutable isNatural;

  constructor(uint number) {

    if (number != 0) {
        isNatural = true;
    } else {
        isNatural = false;
    }
  }
}
