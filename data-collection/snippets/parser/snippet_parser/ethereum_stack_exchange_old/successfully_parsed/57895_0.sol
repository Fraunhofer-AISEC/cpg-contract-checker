function test2 () public view returns (Post[]) {
        Post memory post;
        post.sender = msg.sender;
        post.link = "test";
        post.category = "test";
        post.comment = "test";
        post.timestamp = now;

        Post[] storage postsOnPage;
        postsOnPage.push(post);

        return postsOnPage;
    }
