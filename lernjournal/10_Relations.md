Hier ist das Lernportfolio für den Kurs `m164 - Datenbanken erstellen und Daten einfügen`, das die Hauptthemen des vierten Tages zusammenfasst und alle relevanten Informationen und Ressourcen beinhaltet.

---

# Lernportfolio - m164: Datenbanken erstellen und Daten einfügen

## Tag 4: Beziehungen und Constraints in Datenbankmodellen

---

### Beziehungen und Einschränkungen (Constraints)

#### Beziehungstypen und ihre Einschränkungen

- **Eins zu Eins (1:1):** Umgesetzt als 1:c mit Constraints `NN` (Not Null) und `UQ` (Unique).
- **Eins zu Viele (1:m):** Realisiert als 1:mc ohne spezifische Constraints.
- **Viele zu Viele (m:m):** Erfordert eine Transformationstabelle zur Umsetzung.

#### Forward Engineering mit MySQL Workbench

- **Schritte:**
  1. ERD in Workbench laden und Beziehungen analysieren.
  2. Einschränkungen für Fremdschlüssel einstellen.
  3. DDL-SQL-Script generieren und speichern.

#### Analyse und Überprüfung der Constraints

- **NOT NULL** wird automatisch beim Setzen der `NN`-Einschränkung hinzugefügt.
- **UNIQUE** wird mit der `UQ`-Einschränkung implementiert, um Duplikate in Schlüsselwerten zu verhindern.
- **Indexes** erleichtern die Datenbankabfrage, indem sie schnellen Zugriff auf die Daten ermöglichen.

---

### Erweiterte SQL-Anweisungen

#### Hinzufügen von Fremdschlüsseln und eindeutigen Schlüsseln

```sql
ALTER TABLE <DetailTab>
  ADD CONSTRAINT <Constraint> FOREIGN KEY (<Fremdschlüssel>)
  REFERENCES <MasterTab> (Primärschlüssel);

ALTER TABLE <Tabelle>
  ADD UNIQUE (<FS_Name>);
```

---

### Mengenlehre in der Datenbank

#### Grundlegende Konzepte

- **Mengen** und **Elemente** definieren die Basis der Datensammlungen in SQL.
- **Operationen wie Vereinigung (∪), Schnittmenge (∩) und Differenz (\)** sind entscheidend für das Verständnis von JOINs in SQL.

#### Visualisierung von Mengenoperationen


---

### Praktische SQL-Aufgaben

#### SELECT JOIN

- **Grundlegende und fortgeschrittene JOIN-Operationen** durchführen, um Beziehungen zwischen Tabellen zu verstehen und abzufragen.
- **Analyse der referentiellen Integrität** und der Auswirkungen von Constraints auf die Datenintegrität.

---

## Abschluss und Checkpoint

- Überprüfung des Verständnisses von **referentieller Integrität**, **verschiedenen Beziehungstypen**, **JOINs** und **SQL-Constraints**.
- Diskussion der praktischen Umsetzung und möglicher Fehlerquellen ohne Constraints.

---

Dieses Portfolio fasst die wichtigsten Lernpunkte des Kurses zusammen und bietet durch die verlinkten Ressourcen und die Übungsaufgaben eine solide Grundlage für das praktische Arbeiten mit relationalen Datenbanken und SQL.