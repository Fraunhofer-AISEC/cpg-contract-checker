function hashInfo() public onlyOwner view returns (bytes32) {
      bytes32 hash = sha3(
        '0x969A70A4fa9F69D2D655E4B743abb9cA297E5328',
        '0x496AAFA2960f3Ff530716B5334c9aFf4612e3c27',
        'jdiojd',
        'oidjoidj',
        'idjodj',
        12345
      )  
      return hash;
  }
