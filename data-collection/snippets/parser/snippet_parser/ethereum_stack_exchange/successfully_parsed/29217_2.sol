contract Writer {

  struct Paragraph {
    string sentances;
  }

  struct Essay {
    string title;
    Paragraph[] paragraphs;
  }

  Essay[] private essays;

  function Writer(Essay essay) {
    essays.push(essay);
  }

}
