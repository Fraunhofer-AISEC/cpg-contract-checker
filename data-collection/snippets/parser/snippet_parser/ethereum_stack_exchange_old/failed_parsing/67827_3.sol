Grapes storage g = grapes[previousGrapesId];
g.notes = _notes;
g.vintageYear = _vintageYear;
g.farmOwner = msg.sender;
g.GrapeState = GrapeState.Harvested;
