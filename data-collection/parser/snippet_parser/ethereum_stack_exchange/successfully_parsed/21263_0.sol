struct GameListItem {
  uint prev;
  uint next;
}

mapping (uint => GameListItem) public openGamesList;
uint public firstOpenGame;

function addOpenGame (uint gameID) internal {
    require (gameID != 0, "Game ID is NULL");
    GameListItem storage item = openGamesList [gameID];
    require (item.next == 0, "Game is already in the list");

    if (firstOpenGame == 0) {
        item.next = gameID;
        item.prev = gameID;
        firstOpenGame = gameID;
    } else {
        GameListItem storage first = openGamesList [firstOpenGame];
        uint lastID = first.prev;
        GameListItem storage last = openGamesList [lastID];

        item.next = firstOpenGame;
        item.prev = lastID;
        first.prev = gameID;
        last.next = gameID;
    }
}

function removeOpenGame (uint gameID) internal {
    require (gameID != 0, "Game ID is NULL");
    GameListItem storage item = openGamesList [gameID];
    uint nextID = item.next;
    require (nextID != 0, "Game is not in the list");

    uint prevID = item.prev;
    if (nextID == gameID)
        firstOpenGame = 0;
    else {
        GameListItem storage next = openGamesList [nextID];
        GameListItem storage prev = openGamesList [prevID];

        next.prev = prevID;
        prev.next = nextID;

        if (firstOpenGame == gameID) firstOpenGame = nextID;
    }

    item.next = 0;
    item.prev = 0;
}
