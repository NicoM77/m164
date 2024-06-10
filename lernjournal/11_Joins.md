### Aufgaben

#### Kartesisches Produkt:
**Frage:** Erklären Sie in eigenen Worten, warum diese Abfrage kein sinnvolles Ergebnis gibt:

```sql
SELECT * FROM kunden
INNER JOIN orte;
```

**Antwort:** 
Diese SQL-Abfrage gibt kein sinnvolles Ergebnis, weil sie einen INNER JOIN zwischen den Tabellen `kunden` und `orte` ohne eine JOIN-Bedingung durchführt. Das führt zu einem kartesischen Produkt, bei dem jede Zeile aus der Tabelle `kunden` mit jeder Zeile aus der Tabelle `orte` kombiniert wird. Das Resultat ist eine große Anzahl von Ergebniszeilen, die in den meisten praktischen Anwendungen nicht sinnvoll sind, da sie keine relevante Verknüpfung zwischen den Tabellen aufzeigen. Normalerweise sollten Tabellen über ein gemeinsames Feld verbunden werden, um relevante und aussagekräftige Datenbeziehungen zu erhalten.

#### Einfache Abfragen über zwei Tabellen

a) **Aufgabe:** Geben Sie Name, Postleitzahl und Wohnort aller Kunden aus. Die Liste enthält den Kundennamen und den Namen des Orts, wo er wohnt.

**SQL-Script:**
```sql
SELECT k.name AS Kundenname, k.fk_ort_postleitzahl AS Postleitzahl, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl;
```

b) **Aufgabe:** Geben Sie Name und Wohnort aller Kunden aus, die die Postleitzahl 79312 haben.

**SQL-Script:**
```sql
SELECT k.name, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE k.fk_ort_postleitzahl = '79312';
```

c) **Aufgabe:** Geben Sie Name und Wohnort aller Kunden aus, die in Emmendingen wohnen (Einschränkungskriterium ist NICHT die Postleitzahl, sondern 'Emmendingen').

**SQL-Script:**
```sql
SELECT k.name, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.name = 'Emmendingen';
```

d) **Aufgabe:** Geben Sie Name, Wohnort und Einwohnerzahl für alle Kunden aus, die in einem Ort mit mehr als 70000 Einwohnern wohnen.

**SQL-Script:**
```sql
SELECT k.name, o.name AS Wohnort, o.einwohnerzahl
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl > 70000;
```

e) **Aufgabe:** Geben Sie alle Orte aus, die weniger als 1000000 Einwohner haben.

**SQL-Script:**
```sql
SELECT name
FROM orte
WHERE einwohnerzahl < 1000000;
```

f) **Aufgabe:** Geben Sie Kundename und Ortname aus für alle Kunden, die in Orten mit einer Einwohnerzahl zwischen 100.000 und 1.500.000 leben.

**SQL-Script:**
```sql
SELECT k.name AS Kundenname, o.name AS Ortname
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl BETWEEN 100000 AND 1500000;
```

g) **Aufgabe:** Geben Sie Kundename, Postleitzahl und Ortname aus für alle Kunden, deren Name ein "e" enthält und alle Orte, die ein "u" oder ein "r" enthalten.

**SQL-Script:**
```sql
SELECT k.name AS Kundenname, k.fk_ort_postleitzahl, o.name AS Ortname
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE k.name LIKE '%e%' AND (o.name LIKE '%u%' OR o.name LIKE '%r%');
```