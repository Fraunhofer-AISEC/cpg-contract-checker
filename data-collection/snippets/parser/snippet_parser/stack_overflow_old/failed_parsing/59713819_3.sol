describe ('posts', async ()=> {
    let result;
    let postCount;

    before(async ()=> {
        result = await socialNetwork.createPost('This is my first post', {
            from: author
        })
        postCount = await socialNetwork.postCount()
    })
