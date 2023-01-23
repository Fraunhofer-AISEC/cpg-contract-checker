const expected_period           = 7     ;
const SECONDS_IN_DAY            = 86400 ;

const Mon_01_Jun_00_00_UTC_2020 = 1590969600; 
const Mon_09_Jun_13_00_UTC_2020 = 1591660800; 

contract('PCE_Contract', async (accounts) =>
{ 
  before( async () => {
  
    instance_1 = await PCE_Contract.new(Mon_01_Jun_00_00_UTC_2020 ,expected_period );
    instance_2 = await PCE_Contract.new(Mon_09_Jun_13_00_UTC_2020 ,expected_period );
  });
const expected_address          = accounts[1];



  it("No entry after period is over, OK", async() => 
  {
    await test_helper.advanceTimeAndBlock(SECONDS_IN_DAY * (expected_period ));

    await instance_2.enter({ from: expected_address, value: String(1e18)});
  
  });

}
