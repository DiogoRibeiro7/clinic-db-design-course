# Schema diagram export workflow

## Option A: MySQL Workbench (reverse engineer)
1) Open MySQL Workbench and connect to your server.
2) Go to Database -> Reverse Engineer.
3) Select the target schema (e.g., clinic_db).
4) Continue through the wizard to generate the EER diagram.
5) Arrange tables and add labels if needed.
6) File -> Export -> PNG or PDF.
7) Save under docs/diagrams/<week>/.

## Option B: DBeaver (ER diagram)
1) Open DBeaver and connect to your MySQL server.
2) Right-click the schema and choose ER Diagram.
3) Arrange the diagram and add notes if needed.
4) Export as PNG or PDF.
5) Save under docs/diagrams/<week>/.

## Folder naming
Use a folder per week, for example:
- docs/diagrams/week01
- docs/diagrams/week03
- docs/diagrams/week06
