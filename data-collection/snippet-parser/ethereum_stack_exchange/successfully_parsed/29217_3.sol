contract Writer {

  struct Paragraph {
    string sentances;
  }

  struct Essay {
    string title;
    Paragraph[] paragraphs;
  }

  Essay[] private essays;

  function Writer(string title, string[] _paras) {
    Paragraph[] storage paras;
    for (uint256 i = 0; i < _paras.length; i++) {
        Paragraph memory para = Paragraph(_paras[i]);
        paras.push(para);
    }
    Essay memory initialEssay = Essay(title, paras);
    essays.push(initialEssay);
  }
}
