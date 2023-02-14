
contract C {

  doThing1() {}

  doThing2() {}
}

contract A is C {

  function doThing1() {}

}

contract B is C {

  function doThing2() {}

}
