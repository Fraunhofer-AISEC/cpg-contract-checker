describe ('posts', async ()=> {
        let result

        before(async ()=> {
            result = await socialNetwork.createPost('This is my first post', {
                from: author
            })
            postCount = await socialNetwork.postCount()
        })
