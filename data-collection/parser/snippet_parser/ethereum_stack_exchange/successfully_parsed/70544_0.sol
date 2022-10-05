  struct TestStruct5 {
    uint8 m_nOther1;
    uint8 m_nOther2;
    uint8 m_nOther3;
    uint8 m_nOther4;
    uint8 m_nOther5;
  }



struct TestStruct6 {
    uint8 m_nOther1;
    uint8 m_nOther2;
    uint8 m_nOther3;
    uint8 m_nOther4;
    uint8 m_nOther5;
    uint8 m_nOther6;
  }

  struct TestStruct7 {
    uint8 m_nOther1;
    uint8 m_nOther2;
    uint8 m_nOther3;
    uint8 m_nOther4;
    uint8 m_nOther5;
    uint8 m_nOther6;
    uint8 m_nOther7;
  }

  struct TestStruct8 {
    uint8 m_nOther1;
    uint8 m_nOther2;
    uint8 m_nOther3;
    uint8 m_nOther4;
    uint8 m_nOther5;
    uint8 m_nOther6;
    uint8 m_nOther7;
    uint8 m_nOther8;
  }



struct TestStruct9 {
    uint8 m_nOther1;
    uint8 m_nOther2;
    uint8 m_nOther3;
    uint8 m_nOther4;
    uint8 m_nOther5;
    uint8 m_nOther6;
    uint8 m_nOther7;
    uint8 m_nOther8;
    uint8 m_nOther9;
  }



TestStruct5[] internal m_testStruct5;
  TestStruct6[] internal m_testStruct6;
  TestStruct7[] internal m_testStruct7;
  TestStruct8[] internal m_testStruct8;
  TestStruct9[] internal m_testStruct9;



function GasTest5(address a_owner) external returns (uint256)
  {
    TestStruct5 memory item = TestStruct5({
      m_nOther1 : 0,
      m_nOther2 : 0,
      m_nOther3 : 0,
      m_nOther4 : 0,
      m_nOther5 : 0
    });
    uint256 nItemID = m_testStruct5.push(item) - 1;
  }



function GasTest6(address a_owner) external returns (uint256)
  {
    TestStruct6 memory item = TestStruct6({
      m_nOther1 : 0,
      m_nOther2 : 0,
      m_nOther3 : 0,
      m_nOther4 : 0,
      m_nOther5 : 0,
      m_nOther6 : 0
    });
    uint256 nItemID = m_testStruct6.push(item) - 1;
  }



function GasTest7(address a_owner) external returns (uint256)
  {
    TestStruct7 memory item = TestStruct7({
      m_nOther1 : 0,
      m_nOther2 : 0,
      m_nOther3 : 0,
      m_nOther4 : 0,
      m_nOther5 : 0,
      m_nOther6 : 0,
      m_nOther7 : 0
    });
    uint256 nItemID = m_testStruct7.push(item) - 1;
  }



function GasTest8(address a_owner) external returns (uint256)
  {
    TestStruct8 memory item = TestStruct8({
      m_nOther1 : 0,
      m_nOther2 : 0,
      m_nOther3 : 0,
      m_nOther4 : 0,
      m_nOther5 : 0,
      m_nOther6 : 0,
      m_nOther7 : 0,
      m_nOther8 : 0
    });
    uint256 nItemID = m_testStruct8.push(item) - 1;
  }



function GasTest9(address a_owner) external returns (uint256)
  {
    TestStruct9 memory item = TestStruct9({
      m_nOther1 : 0,
      m_nOther2 : 0,
      m_nOther3 : 0,
      m_nOther4 : 0,
      m_nOther5 : 0,
      m_nOther6 : 0,
      m_nOther7 : 0,
      m_nOther8 : 0,
      m_nOther9 : 0
    });
    uint256 nItemID = m_testStruct9.push(item) - 1;
  }
