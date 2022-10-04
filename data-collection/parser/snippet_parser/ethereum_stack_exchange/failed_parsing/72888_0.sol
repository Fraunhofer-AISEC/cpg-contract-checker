contract NewBook {

        struct ReviewerData {
            string name,
            uint industryXP
            
        }

        struct ChapterData {
            
            string title;
            string color;
            uint pages;
            
            ReviewerData[] reviewer;
            address[] reviewers;
        }

        struct BookData {
            
            ChapterData[] chapters;
        }

        mapping(bytes32 => BookData) books; 

        function addChapter(bytes32 _bookID, string memory title, string color, uint pages) public {
            ChapterData memory c = ChapterData({
                title: title,
                color: color,
                pages: pages,
                
                
            });
            books[_bookID].chapters.push(c);
        }
