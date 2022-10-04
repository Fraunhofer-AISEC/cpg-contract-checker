   function editEntityLink(uint _entityLinks,uint _targeted,string _content) external onlyOwner() {
            if(_targeted == 1){
                allLinks[_entityLinks].linksName = _content;
            }
            else if(_targeted == 2){
                allLinks[_entityLinks].linksUrl = _content;
            }
        }
