const Chance = require("chance");
const Category = artifacts.require("Category");

const chance = new Chance();

contract("Category", (accounts) => {
  
  const accountOne = accounts[0];
  const accountTwo = accounts[1];
  let categoryInstance;

  before(async () => {
    categoryInstance = await Category.deployed();
  });

  it("should create a category", async () => {
    const title = chance.sentence();

    
    const categoryCreated = await categoryInstance.createCategory([title], {
      from: accountOne,
    });

    
    const category = await categoryInstance.getCategoryByIndex(0);

    assert.equal(category.id, 0, "There is no data for this index");
    assert.equal(category.title, title, "title is not equal");
  });

  it("Should return true because a category exists", async () => {
    const isExists = await categoryInstance.isCategoryExists(0, {
      from: accountOne,
    });

    assert.equal(isExists, true, "Category exists but result is false.");
  });
});
