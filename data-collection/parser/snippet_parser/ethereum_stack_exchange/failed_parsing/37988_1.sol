
Author storage author = mapArticleIdToAuthorStruct[_articleId];
uint[] memory temp = new uint[](author.articleId.length-1);
uint j = 0;
for (uint i = 0; i < author.articleId.length; i++) {
    if (author.articleId[i] != _articleId) {
        temp[j] = author.articleId[i];
        j++;
    }
}
author.articleId = temp;

mapArticleIdToAuthorId[articleId] = 0;
