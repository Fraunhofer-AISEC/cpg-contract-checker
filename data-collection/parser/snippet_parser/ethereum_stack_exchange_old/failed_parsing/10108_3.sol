ASTPointer<Mapping> Parser::parseMapping()
{
    ASTNodeFactory nodeFactory(*this);
    expectToken(Token::Mapping);
    expectToken(Token::LParen);
    ASTPointer<ElementaryTypeName> keyType;
    Token::Value token = m_scanner->currentToken();
    if (!Token::isElementaryTypeName(token))
        fatalParserError(string("Expected elementary type name for mapping key type"));
