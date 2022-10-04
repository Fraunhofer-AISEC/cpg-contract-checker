post_matchings = {}

@hug.post('match/post_id/')
def match_file(file_id, post_id):
    1. raise error, if caller of this endpoint is not owner of the post.
    2. Do something.
