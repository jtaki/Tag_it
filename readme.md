# TODOs

- x make all custom files uniform from CSV file  in custom/output/custom.csv
- x already changed in output/custom.csv need to work on all linked.
- x if rename_these is empty(except for header), then there is no need for compile
- x delete rename_these after compile
- x item_parser.rb will run compiler first
-  find all references to vplbl3h8c.xls and shorten

- What if not all items renamed
- put length constraints on renaming items to make sure they fit on tag lines

- update gitignore

- error handling for no data query file

- x remove the wipe of rename file from item parser and put only on custom namer

- for some reason catch weight items are not multiplying out correctly.
- need conversion methods for catch weight
- tag prints out per up
- Get item weight included in download from rick, replace cwtolb with item weight.
- child custom names pull from parent custom names. deprecated all child names


# Usage
1. Weekly or Daily file download should go into data folder as an .xls
2. run 'custom' script
  - Items without a custom name will output here.
  - Add custom names to these records with excel.
3. run tagit script
  - Outputs data/tags_to_print.csv
4. Open bartender 3.1 to print tags.

If there are erros in the tags, you can edit straight from tags_to_print file.


# ERRORS 10/31

- x price is not multiplying out for cw items
- duplicating items to name in custom
