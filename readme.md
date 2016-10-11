# TODOs

- x make all custom files uniform from CSV file  in custom/output/custom.csv
-x already changed in output/custom.csv need to work on all linked.
- x if rename_these is empty(except for header), then there is no need for compile
- x delete rename_these after compile
- x item_parser.rb will run compiler first
-  find all references to vplbl3h8c.xls and shorten

- What if not all items renamed
- What if rename_these with bad caseing
- put length constraints on renaming items to make sure they fit on tag lines

- test on windows
- test OCRA gem
- update gitignore


# Usage
1. Put YH Price Query into tagit/data (replace old file)
2. run custom/custom.rb
  - rename items in output/rename_these.csv & save
3. run lib/item_parser.rb

# make a powershell executable on windows
- C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "& 'C:\Users\jtakiguchi\desktop\Tag_it--master\custom\custom.rb'"

- will need to open and save db file before use -____-
