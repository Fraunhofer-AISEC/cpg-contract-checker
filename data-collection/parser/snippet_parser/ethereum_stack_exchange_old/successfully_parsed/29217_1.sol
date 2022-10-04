pragma solidity ^0.4.0;

contract Writer {

  struct Paragraph {
    string[] lines;
  }

  struct Essay {
    Paragraph[] paragraphs;
  }

  Essay[] private essays;

  function Writer(Essay initialEssay) {
    essays.push(initialEssay);
  }

}
