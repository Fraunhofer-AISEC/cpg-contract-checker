brownie run scripts/advanced_collectible/deploy_advanced.py 
Brownie v1.14.3 - Python development framework for Ethereum

  File "brownie/_cli/__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "brownie/_cli/run.py", line 38, in main
    if project.check_for_project():
  File "brownie/project/main.py", line 537, in check_for_project
    structure_config = _load_project_structure_config(folder)
  File "brownie/_config.py", line 243, in _load_project_structure_config
    data = _load_config(project_path).get("project_structure", {})
  File "brownie/_config.py", line 180, in _load_config
    return yaml.safe_load(fp)
  File "yaml/__init__.py", line 162, in safe_load
    return load(stream, SafeLoader)
  File "yaml/__init__.py", line 114, in load
    return loader.get_single_data()
  File "yaml/constructor.py", line 49, in get_single_data
    node = self.get_single_node()
  File "yaml/composer.py", line 36, in get_single_node
    document = self.compose_document()
  File "yaml/composer.py", line 55, in compose_document
    node = self.compose_node(None, None)
  File "yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "yaml/composer.py", line 127, in compose_mapping_node
    while not self.check_event(MappingEndEvent):
  File "yaml/parser.py", line 98, in check_event
    self.current_event = self.state()
  File "yaml/parser.py", line 438, in parse_block_mapping_key
    raise ParserError("while parsing a block mapping", self.marks[-1],
ParserError: while parsing a block mapping
  in "/Users/zeeshanbhatti/Desktop/nftDemo/brownie-config.yaml", line 3, column 1
expected <block end>, but found '<block mapping start>'
  in "/Users/zeeshanbhatti/Desktop/nftDemo/brownie-config.yaml", line 15, column 2
