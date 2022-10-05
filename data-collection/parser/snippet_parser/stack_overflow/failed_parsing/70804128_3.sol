const Chance = require("chance");
const Category = artifacts.require("Category");
const Post = artifacts.require("post");

const chance = new Chance();

contract("Post", (accounts) => {
  
  const accountOne = accounts[0];
  const accountTwo = accounts[1];

  let categoryInstance;
  let postInstance;

  before(async () => {
    
    categoryInstance = await Category.deployed();
    const title = chance.sentence();

    
    const categoryCreated = await categoryInstance.createCategory(
      [title, purpose, area],
      [polygon],
      {
        from: accountOne,
      }
    );

    postInstance = await Post.deployed();
  });

  it("should create a post", async () => {
    
    const title = chance.sentence();
    const body = chance.paragraph();
    const thumbnail = chance.url();
    const categoryId = 0;

    
    const postCreated = await postInstance.createPost(
      [title, body, thumbnail, categoryId],
      {
        from: accountOne,
      }
    );

    
    const post = await postInstance.getPostByIndex(0);

    assert.equal(post.id, 0, "There is no data for this index");
    assert.equal(post.title, title, "title is not equal");
    assert.equal(post.categoryId, categoryId, "categoryId is not equal");
  });
});
