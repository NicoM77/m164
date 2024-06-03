# DatenTypen

| Datentyp                           | MariaDB (MySQL)           | Beispiel        | Bemerkung / Einstellungen                      |
|------------------------------------|---------------------------|-----------------|------------------------------------------------|
| Ganze Zahlen                       | INT                       | 42              |                                                 |
| Natürliche Zahlen                  | UNSIGNED INT              | 42              | Nur positive Werte                              |
| Festkommazahlen (Dezimalzahlen)    | DECIMAL(M,D)              | DECIMAL(6,2)    | 1234.56 <br>M=Gesamte Anzahl Stellen <br>D=Nachkommastellen |
| Aufzählungstypen                   | ENUM / SET                      | ENUM('M','F')   | ENUM('M','F')                                  |
| Boolean (logische Werte)           | TINYINT(1)                | 0, 1            | TRUE (1) oder FALSE (0)                        |
| Zeichen (einzelnes Zeichen)        | CHAR(1)                   | 'A'             |                                                 |
| Gleitkommazahlen                   | FLOAT, DOUBLE             | 3.14            |                                                 |
| Zeichenkette fester Länge          | CHAR(N)                   | CHAR(10)        | Zeichenkette mit fester Länge N                |
| Zeichenkette variabler Länge       | VARCHAR(N)                | VARCHAR(255)    | Zeichenkette mit maximaler Länge N             |
| Datum und/oder Zeit                | DATE, TIME, DATETIME      | '2023-06-03'    |                                                 |
| Zeitstempel                        | TIMESTAMP                 | CURRENT_TIMESTAMP | Automatisch aktualisierender Zeitstempel    |
| Binäre Datenobjekte variabler Länge| BLOB, LONGBLOB            |                 | Binary Large Object                            |
| Verbund                            | Der Datensatz ist der Verbund                       |     | Menge von Werten                               |
| JSON                               | JSON                      | {"key": "value"}|                                                 |


# Rekursion
Es ist möglich, dass eine Assoziation nur einen Entitätstyp umfasst, indem ein Datensatz mit einem anderen Datensatz derselben Tabelle über einen Fremdschlüssel verbunden wird, was eine Hierarchie wie in einer Firmenorganisation abbildet.

![](https://gitlab.com/ch-tbz-it/Stud/m164/-/raw/main/3.Tag/media/Rekursion.png)

# Einfache Hierarchie


In einer Netzwerkstruktur handelt es sich um eine mc
, wobei eine Transformationstabelle mit zwei Fremdschlüsseln auf die Identifikationsschlüssel der gleichen Tabelle, aber in unterschiedlichen Rollen, benötigt wird.

![](https://gitlab.com/ch-tbz-it/Stud/m164/-/raw/main/3.Tag/media/Einfache_Hierarchie.png) 


```sql 

-- Neue Daten einfügen

-- Mitarbeiter-Daten
INSERT INTO `Mitarbeiter` (`Mitarbeiter_id`, `Vorname`, `Nachname`, `Telefonnummer`) VALUES
(1, 'Hans', 'Muster', '+41 76 764 23 23'),
(2, 'Theo', 'Dohr', '+41 79 324 55 78'),
(3, 'Justin', 'Biber', '+41 79 872 12 32'),
(4, 'Johann S.', 'Fluss', '+41 79 298 98 76'),
(5, 'Diana', 'Knecht', '+41 78 323 77 00'),
(6, 'Anna', 'Schöni', '+41 76 569 67 80'),
(8, 'Lucy', 'Schmidt', '+49 420 232 2232'),
(9, 'Ardit', 'Azubi', NULL);

-- Vorgesetztenbeziehungen
UPDATE `Mitarbeiter`
SET `FK_Vorgesetzter` = 3
WHERE `Mitarbeiter_id` IN (6, 2);

UPDATE `Mitarbeiter`
SET `FK_Vorgesetzter` = 6
WHERE `Mitarbeiter_id` IN (6, 8, 1);

UPDATE `Mitarbeiter`
SET `FK_Vorgesetzter` = 2
WHERE `Mitarbeiter_id` IN (5, 4, 2, 1);

-- Ortschaften
INSERT INTO Ortschaft (Ortschaft_id, PLZ, Beschriftung) VALUES
(1, '8000', 'Zürich'),
(2, '4000', 'Basel'),
(3, '4410', 'Liestal'),
(4, '8400', 'Winterthur'),
(5, '70180', 'Stuttgart'),
(6, '78224', 'Singen'),
(7, '1200', 'Genf'),
(8, '8001', 'Zürich'),
(9, '8400', 'Winterthur');

-- Disponenten
INSERT INTO Disponent (Disponent_id, FK_Mitarbeiter, Disponentennummer) VALUES
(1, 1, 'D123');

-- Fahrzeuge
INSERT INTO fahrzeug (`Fahrzeugkennzeichner`, `Sitz_Plaetze`) VALUES
('FZ12', 72),
('FZ32', 72),
('FZ45', 72),
('FZ51', 72);

-- Touren
INSERT INTO tour (Tour_id, FK_Fahrzeug, FK_Disponent) VALUES
(12, 'FZ12', 1),
(32, 'FZ32', 1),
(45, 'FZ45', 1),
(51, 'FZ51', 1);

-- Stationen
INSERT INTO Station (Station_id, FK_Ortschaft, Parent_Station_id, Station_Name, Tour_Id) VALUES
(1, 1, NULL, 'HB Zürich', 12),        -- HB Zürich, Tour_Id 12
(2, 2, NULL, 'HB Basel', 12),         -- HB Basel, Tour_Id 12
(3, 7, NULL, 'Flughafen Genf', 12),   -- Flughafen Genf, Tour_Id 12
(4, 3, NULL, 'Liestal', 12),          -- Liestal, Tour_Id 12
(5, 9, NULL, 'Schulhausstr.23', 32),  -- Winterthur, Tour_Id 32
(6, 1, NULL, 'HB Zürich', 32),        -- HB Zürich, Tour_Id 32
(7, 9, NULL, 'Schaffhauserstr. 123', 32), -- Winterthur, Tour_Id 32
(8, 9, NULL, 'Eggweg 45', 32),        -- Winterthur, Tour_Id 32
(9, 8, NULL, 'HB Zürich', 45),        -- HB Zürich, Tour_Id 45
(10, 5, NULL, 'HB Stuttgart', 45),    -- HB Stuttgart, Tour_Id 45
(11, 6, NULL, 'HB Singen', 45),       -- HB Singen, Tour_Id 45
(12, 1, NULL, 'Ausstellungsstr. 80, 8090 Zürich', 51), -- Ausstellungsstr. 80, 8090 Zürich, Tour_Id 51
(13, 7, NULL, 'Flughafen, 1200 Genf', 51); -- Flughafen, 1200 Genf, Tour_Id 51       -- Direkt, Tour_Id 51
```

> Querry:

```sql
SELECT 
    t.Tour_id AS `Tour-Nummer`,
    (SELECT CONCAT(SUBSTRING_INDEX(s1.Station_Name, ' ', 1), ', ', o1.PLZ, ' ', o1.Beschriftung)
     FROM Station s1
     JOIN Ortschaft o1 ON s1.FK_Ortschaft = o1.Ortschaft_id
     WHERE s1.Tour_Id = t.Tour_id
     ORDER BY s1.Station_id
     LIMIT 1) AS `Start-Ort`,
    (SELECT CONCAT(SUBSTRING_INDEX(s2.Station_Name, ' ', 1), ', ', o2.PLZ, ' ', o2.Beschriftung)
     FROM Station s2
     JOIN Ortschaft o2 ON s2.FK_Ortschaft = o2.Ortschaft_id
     WHERE s2.Tour_Id = t.Tour_id
     ORDER BY s2.Station_id
     LIMIT 1 OFFSET 1) AS `Ziel-Ort`,
    CASE 
        WHEN COUNT(s.Station_id) <= 2 THEN 'Direkt'
        ELSE GROUP_CONCAT(
                CONCAT(SUBSTRING_INDEX(s.Station_Name, ' ', 1), ', ', o.PLZ, ' ', o.Beschriftung)
                ORDER BY s.Station_id SEPARATOR '<br>')
    END AS `Via`
FROM 
    Tour t
JOIN 
    Station s ON t.Tour_id = s.Tour_Id
JOIN 
    Ortschaft o ON s.FK_Ortschaft = o.Ortschaft_id
GROUP BY 
    t.Tour_id
```


## Parts Explosion Problem

Das Parts Explosion Problem ist eine klassische Anwendung der Rekursion, bei der die Komponenten, die zur Montage eines Objekts erforderlich sind, durch einen Graphen dargestellt werden. Dieser Graph wird dann verwendet, um die Gesamtzahl der benötigten elementaren Teile zu berechnen. Zum Beispiel besteht ein Bücherregal aus Regalbrettern, einer Rückwand, Füßen und Schrauben. Durch die Verwendung rekursiver SQL-Abfragen können die Gesamtmengen dieser Teile ermittelt werden.

![Parts Explosion Diagramm](https://infocenter.sybase.com/help/topic/com.sybase.help.sqlanywhere.12.0.1/dbusage/gif/parts-explosion.gif)  

### SQL-Tabelle und Dateneinfügen
```sql
CREATE TABLE bookcase (
    component      VARCHAR(9),
    subcomponent   VARCHAR(9),
    quantity       INTEGER,
    PRIMARY KEY ( component, subcomponent )
); 

INSERT INTO bookcase
  SELECT 'bookcase', 'back',      1 UNION
  SELECT 'bookcase', 'side',      2 UNION
  SELECT 'bookcase', 'shelf',     3 UNION
  SELECT 'bookcase', 'foot',      4 UNION
  SELECT 'bookcase', 'screw',     4 UNION
  SELECT 'back',     'backboard', 1 UNION
  SELECT 'back',     'screw',     8 UNION
  SELECT 'side',     'plank',     1 UNION
  SELECT 'shelf',    'plank',     1 UNION
  SELECT 'shelf',    'screw',     4;
```

### Rekursive Abfrage zur Berechnung der Gesamtteile
```sql
WITH RECURSIVE parts ( component, subcomponent, quantity ) AS
( 
  SELECT component, subcomponent, quantity
  FROM bookcase WHERE component = 'bookcase'
  UNION ALL
  SELECT b.component, b.subcomponent, p.quantity * b.quantity
  FROM parts p JOIN bookcase b ON p.subcomponent = b.component 
)
SELECT subcomponent, SUM( quantity ) AS quantity
FROM parts
WHERE subcomponent NOT IN ( SELECT component FROM bookcase )
GROUP BY subcomponent
ORDER BY subcomponent;
```

### Ergebnisse
| Subkomponente | Menge |
|---------------|-------|
| Rückenbrett   | 1     |
| Fuß           | 4     |
| Planke        | 5     |
| Schraube      | 24    |