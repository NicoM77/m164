### Aufgabe 1
Gesucht sind alle Lieferanten, die ihren Sitz in Freiburg haben. Geben Sie Lieferantenname, Lieferantenort und Postleitzahl aus.

#### SQL-Abfrage:
```sql
SELECT l.name AS Lieferantenname, o.name AS Lieferantenort, o.postleitzahl AS Postleitzahl
FROM lieferanten l
JOIN orte o ON l.orte_orte_id = o.orte_id
WHERE o.name = 'Freiburg';
```

### Aufgabe 2
Gesucht sind alle Verlage, die ihren Sitz in München haben. Geben Sie Verlagsname und Verlagsort aus.

#### SQL-Abfrage:
```sql
SELECT v.name AS Verlagsname, o.name AS Verlagsort
FROM verlage v
JOIN orte o ON v.orte_orte_id = o.orte_id
WHERE o.name = 'München';
```

### Aufgabe 3
Gesucht sind alle Bücher, die im Verlag Assal erschienen sind. Geben Sie Buchtitel, Erscheinungsjahr und Verlagsname aus, absteigend sortiert nach Erscheinungsjahr.

#### SQL-Abfrage:
```sql
SELECT b.titel AS Buchtitel, b.erscheinungsjahr AS Erscheinungsjahr, v.name AS Verlagsname
FROM buecher b
JOIN verlage v ON b.verlage_verlage_id = v.verlage_id
WHERE v.name = 'Assal'
ORDER BY b.erscheinungsjahr DESC;
```

### Aufgabe 4
Gesucht sind alle Bücher des Lieferanten Schustermann. Geben Sie Buchtitel und Lieferantenname aus.

#### SQL-Abfrage:
```sql
SELECT b.titel AS Buchtitel, l.name AS Lieferantenname
FROM buecher_has_lieferanten bl
JOIN buecher b ON bl.buecher_buecher_id = b.buecher_id
JOIN lieferanten l ON bl.lieferanten_lieferanten_id = l.lieferanten_id
WHERE l.name = 'Schustermann';
```

### Aufgabe 5
Gesucht sind alle Thriller. Geben Sie Buchtitel und Sparte aus, sortiert nach Buchtitel.

#### SQL-Abfrage:
```sql
SELECT b.titel AS Buchtitel, s.bezeichnung AS Sparte
FROM buecher_has_sparten bs
JOIN buecher b ON bs.buecher_buecher_id = b.buecher_id
JOIN sparten s ON bs.sparten_sparten_id = s.sparten_id
WHERE s.bezeichnung = 'Thriller'
ORDER BY b.titel;
```

### Aufgabe 6
Gesucht sind alle Liebesromane. Geben Sie Buchtitel, Sparte und Verlagsname aus, sortiert nach Buchtitel aufsteigend.

#### SQL-Abfrage:
```sql
SELECT b.titel AS Buchtitel, s.bezeichnung AS Sparte, v.name AS Verlagsname
FROM buecher_has_sparten bs
JOIN buecher b ON bs.buecher_buecher_id = b.buecher_id
JOIN sparten s ON bs.sparten_sparten_id = s.sparten_id
JOIN verlage v ON b.verlage_verlage_id = v.verlage_id
WHERE s.bezeichnung = 'Liebe'
ORDER BY b.titel;
```

### Aufgabe 7
Gesucht sind alle Bücher von Sabrina Müller. Geben Sie Autorennachname, Autorenvorname und Buchtitel aus, sortiert nach Buchtitel absteigend.

#### SQL-Abfrage:
```sql
SELECT a.nachname AS Autorennachname, a.vorname AS Autorenvorname, b.titel AS Buchtitel
FROM autoren_has_buecher ab
JOIN autoren a ON ab.autoren_autoren_id = a.autoren_id
JOIN buecher b ON ab.buecher_buecher_id = b.buecher_id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller'
ORDER BY b.titel DESC;
```

### Aufgabe 8
Gesucht sind alle Thriller von Sabrina Müller. Geben Sie Autorenname, Buchtitel und Sparte aus.

#### SQL-Abfrage:
```sql
SELECT CONCAT(a.vorname, ' ', a.nachname) AS Autorenname, b.titel AS Buchtitel, s.bezeichnung AS Sparte
FROM autoren_has_buecher ab
JOIN autoren a ON ab.autoren_autoren_id = a.aut

oren_id
JOIN buecher b ON ab.buecher_buecher_id = b.buecher_id
JOIN buecher_has_sparten bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten s ON bs.sparten_sparten_id = s.sparten_id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller' AND s.bezeichnung = 'Thriller';
```

### Aufgabe 9
Gesucht sind alle Bücher von Sabrina Müller, die in die Sparten Thriller oder Humor eingeordnet werden können. Geben Sie Autorenname, Buchtitel und Sparte aus.

#### SQL-Abfrage:
```sql
SELECT CONCAT(a.vorname, ' ', a.nachname) AS Autorenname, b.titel AS Buchtitel, GROUP_CONCAT(s.bezeichnung) AS Sparte
FROM autoren_has_buecher ab
JOIN autoren a ON ab.autoren_autoren_id = a.autoren_id
JOIN buecher b ON ab.buecher_buecher_id = b.buecher_id
JOIN buecher_has_sparten bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten s ON bs.sparten_sparten_id = s.sparten_id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller' AND s.bezeichnung IN ('Thriller', 'Humor')
GROUP BY b.titel
ORDER BY b.titel;
```