Contract A {

 function foo(address addressB, address addressC, ...){

  assembly {
      let x := mload(0x40)
      mstore(x, sig)
      mstore(add(x, 0x04), fooB)
      mstore(add(x, 0x24), barB)
      mstore(add(x, 0x44), bazB)
      mstore(add(x, 0x64), quxB)
      mstore(0x40, add(x, 0x84))

      pop(call(gas(), addressB, 0, x, 0x84, 0, 0))
      mstore(0x40, add(x, 0x84))
    }

  assembly {
      let x := mload(0x40)
      mstore(x, sig)
      mstore(add(x, 0x04), fooC)
      mstore(add(x, 0x24), barC)
      mstore(add(x, 0x44), bazC)
      mstore(add(x, 0x64), quxC)
      mstore(0x40, add(x, 0x84))

      pop(call(gas(), addressC, 0, x, 0x84, 0, 0))
      mstore(0x40, add(x, 0x84))
    }
}

}
