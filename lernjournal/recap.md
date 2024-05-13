# Recap von m162
1. **Welche Stufen gibt es bei der Wissenstreppe?**
   Die Stufen sind: Daten, Informationen, Wissen und Weisheit.
- Beispiel mit einem Wechselkurs:

     - Daten: Eine Liste von Zahlen, die verschiedene Wechselkurse repräsentieren.
     - Informationen: Eine Tabelle, die die Wechselkurse verschiedener Währungen im Vergleich zu einer Basiskonversionswährung anzeigt.
     - Wissen: Die Analyse der historischen Wechselkursschwankungen und deren potenzielle Auswirkungen auf die Wirtschaft.
     - Weisheit: Die Fähigkeit, fundierte Entscheidungen in Bezug auf Investitionen oder Handel basierend auf einem tiefen Verständnis der Wechselkursschwankungen zu treffen.

2. **Wie werden Netzwerk-Beziehungen im logischen Modell abgebildet?**
   Netzwerkbeziehungen werden im logischen Modell durch Beziehungstabellen oder -diagramme dargestellt, die die Verbindungen zwischen verschiedenen Entitäten oder Objekten zeigen.

3. **Was sind Anomalien in einer Datenbasis? Welche Arten gibt es?**
   Anomalien in einer Datenbasis sind Abweichungen oder Unregelmässigkeiten, die die Datenqualität beeinträchtigen können. Zu den Arten gehören Einfügeanomalien, Aktualisierungsanomalien und Löschanomalien.
   - Update-Anomalie
   - Schreib-Anomalie
   - Lese-Anomalie
   
   Es sind Fehler in der Datenbank

4. **Gibt es redundante "Daten"? Warum?**
   Ja, redundante Daten können vorhanden sein, wenn Informationen wiederholt oder dupliziert werden. Dies kann zu erhöhtem Speicherbedarf und Inkonsistenzen führen. Redundante Daten können auftreten, wenn Informationen in mehreren Tabellen gespeichert werden, anstatt in einer zentralisierten Form.

5. **Datenstrukturierung:**
- Welche zwei Aspekte können strukturiert werden?
     Die zwei Aspekte sind Datentypen und Beziehungen zwischen den Daten.
- Welche Kategorien (Abstufungen) gibt es bei der Strukturierung?
     Die Kategorien der Strukturierung umfassen relationale und hierarchische Strukturen.
- Wie müssen die Daten in einer DB strukturiert sein?
     Die Daten müssen gemäss den definierten Datenbankstrukturen organisiert und gespeichert werden, um eine effiziente Verwaltung und Abfrage zu ermöglichen.
6. **Tabelle bennenn**
    
    1. Tabellen Name
    2. ID(PK)
    3. Spalten
    4. Daten

![Bild vom Gitlab Repo](https://gitlab.com/ch-tbz-it/Stud/m164/-/raw/main/10_Auftraege_und_Uebungen/00_Start/Recap_Fragen/Tabelle_labelled.png)
7. **Einstellungen:**
    
- Primärschlüssel (PK): Stellt sicher, dass jeder Wert in der Spalte eindeutig und nicht null ist. Wird oft für eine ID-Spalte verwendet, um jeden Datensatz in einer Tabelle eindeutig zu identifizieren.

 - Nicht Null (NN): Gibt an, dass die Spalte keine Nullwerte akzeptieren kann. Dies ist wichtig für Felder, die immer Daten enthalten müssen, wie Identifikationsnummern oder Benutzernamen.

- Eindeutig (UN): Stellt sicher, dass alle Werte in der Spalte im gesamten Datensatz eindeutig sind; im Gegensatz zum Primärschlüssel kann die Spalte jedoch Nullwerte akzeptieren, sofern sie nicht ausdrücklich eingeschränkt ist.

- Fremdschlüssel (FK): Stellt eine Beziehung zwischen der Spalte und einer Spalte in einer anderen Tabelle her und erzwingt so die referenzielle Integrität. Beispielsweise kann eine Spalte auf den Primärschlüssel einer anderen Tabelle verweisen, wodurch sichergestellt wird, dass nur Werte aus der Primärschlüsselspalte dieser Tabelle in dieser Spalte erscheinen.

- Check (CK): Legt eine spezifische Bedingung für die Werte fest, die in der Spalte gespeichert werden können. Beispielsweise kann es durchsetzen, dass nur bestimmte Zahlenbereiche oder spezifische Zeichen erlaubt sind.

![Bild vom Gitlab Repo](https://gitlab.com/ch-tbz-it/Stud/m164/-/raw/main/10_Auftraege_und_Uebungen/00_Start/Recap_Fragen/WB_Constraints.png)

