for (uint8 i = 0; i < blocks.length; i++) {
  Block storage bTest = blocks[i];

  bool xIntersect = int(fromX) - int(bTest.toX) <= 0 && int(toX) - int(bTest.fromX) >= 0;
  bool yIntersect = int(fromY) - int(bTest.toY) <= 0 && int(toY) - int(bTest.fromY) >= 0;

  require (!(xIntersect && yIntersect));
}
