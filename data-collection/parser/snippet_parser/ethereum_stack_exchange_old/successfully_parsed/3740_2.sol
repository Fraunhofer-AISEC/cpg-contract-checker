contract Card
{
    enum Suit {Heart, Diamond, Shape, Club, Jocker}
    Suit public suit;

    enum Rank {Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace, Jocker}
    Rank public rank;

    function equal(Card card) returns (bool)
    {
        return suit == card.suit() && rank == card.rank();
    }
}
