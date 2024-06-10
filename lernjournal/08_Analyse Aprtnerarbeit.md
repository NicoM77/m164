1. In den Tabellen, in denen Fremdschlüssel definiert sind, wird der Constraint NOT NULL direkt bei der Definition der Fremdschlüsselspalte angegeben.
2. Ein Index wird für Fremdschlüssel erstellt, um die Effizienz der Datenbank bei der Durchführung von JOIN-Operationen und der Durchsetzung der Referentiellen Integrität zu verbessern. 
Indizes helfen dabei, schnellere Suchen und Verknüpfungen zwischen Tabellen zu ermöglichen, 
was die Gesamtleistung der Datenbank verbessert, 
besonders bei komplexen Abfragen und grossen Datenmengen.
3. In MySQL Workbench wird der UNIQUE Constraint für einen Fremdschlüssel durch die Definition eines UNIQUE INDEX erstellt
4. 
  CONSTRAINT `fk_tbl_Fahrer_tbl_Bus1`
  FOREIGN KEY (`tbl_Bus_ID_Bus`)
  REFERENCES `mydb`.`tbl_Bus` (`ID_Bus`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION