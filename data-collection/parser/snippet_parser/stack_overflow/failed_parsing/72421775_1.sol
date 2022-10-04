const Campaign = artifacts.require("Campaign");
var sinon = require("sinon");



contract('Campaign', (accounts) => {
  const _name = "Beneficiary Name";
  const _imageURL = "https://picsum.photos/200/300"; 
  const _description = "Beneficiary description";
  const _descriptionURL = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" 
  const _beneficiary = accounts[1];
  const _custodian = accounts[0];
  const ERROR_MSG = "VM Exception while processing transaction: revert ";
  let clock;
  beforeEach(function () {
      clock = sinon.useFakeTimers();
  });

  afterEach(function () {
      clock.restore();
  });

  it('should donate only when campaign is not expired', async () => {
    const campaignInstance = await Campaign.new(
      _name, 
      _imageURL, 
      _description, 
      _descriptionURL, 
      150,
      2,
      1,
      _beneficiary, 
      _custodian);
    
    try {
      clock.tick(17290);
      await campaignInstance.donate(accounts[3], 20);
    } catch (err) {
      assert(err, "Expected an error but did not get one");
      expect(err.message).to.include("Campaign has expired");
    }
  });

});


