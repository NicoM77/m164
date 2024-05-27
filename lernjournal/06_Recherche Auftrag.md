### Lernportfolio Zusammenfassung

#### 1. **Tablespace, Tablespace Architecture**

Ein Tablespace ist eine logische Speichereinheit in einem Datenbanksystem, die dazu dient, verwandte logische Strukturen zu gruppieren. In Oracle-Datenbanken beispielsweise besteht ein Tablespace aus einem oder mehreren Datenfiles, die physisch auf der Festplatte gespeichert werden. Diese Datenfiles enthalten die Datenobjekte der Datenbank wie Tabellen und Indizes.

Die Architektur von Tablespaces umfasst mehrere wichtige Funktionen:
- **Speicherverwaltung:** Tablespaces helfen bei der logischen Trennung und Verwaltung von Speicherplatz, was eine optimale Nutzung und Verwaltung des Speicherplatzes ermöglicht.
- **Leistungsoptimierung:** Durch die strategische Platzierung von Daten in verschiedenen Tablespaces, die auf unterschiedlichen Speichergeräten liegen, können die I/O-Operationen gleichmäßiger verteilt werden, was die Gesamtleistung verbessert.
- **Backup und Wiederherstellung:** Tablespaces erlauben gezielte Backup- und Wiederherstellungsoperationen. Ein DBA kann spezifische Tablespaces sichern, anstatt die gesamte Datenbank zu sichern.
- **Datenverfügbarkeit:** Wenn ein Tablespace offline ist, sind die darin enthaltenen Daten nicht zugänglich, während die restliche Datenbank weiterhin funktioniert.
- **Sicherheit und Datenmigration:** Tablespaces können read-only gemacht werden, um historische Daten zu schützen, und erleichtern die Migration von Daten zwischen verschiedenen Datenbanken oder physischen Standorten【5†source】【6†source】【7†source】【9†source】.

#### 2. **Partition (bezgl. Datenbanken)**

Eine Partition in Datenbanken bezieht sich auf die Methode, mit der große Tabellen und Indizes in kleinere, verwaltbare Teile aufgeteilt werden, die als Partitionen bezeichnet werden. Jede Partition ist eine unabhängige Einheit, die separat verwaltet und abgefragt werden kann. Die Partitionierung verbessert die Leistung und Verwaltung großer Datenbanken durch:
- **Verbesserte Abfrageleistung:** Indem nur relevante Partitionen durchsucht werden, können Abfragen schneller ausgeführt werden.
- **Einfachere Verwaltung:** Partitionierte Tabellen sind einfacher zu verwalten, da einzelne Partitionen unabhängig gewartet, gesichert und wiederhergestellt werden können.
- **Lastverteilung:** Partitionen können auf unterschiedliche Festplatten verteilt werden, um die I/O-Last zu verteilen und die Gesamtleistung zu verbessern.
- **Bessere Verfügbarkeit:** Bei einem Ausfall kann eine einzelne Partition offline genommen und repariert werden, ohne die gesamte Tabelle zu beeinträchtigen【6†source】【8†source】.

#### 3. **Was macht eine Storage Engine in einer Datenbank?**

Eine Storage Engine in einer Datenbank ist die Komponente, die die Art und Weise bestimmt, wie Daten gespeichert, abgerufen und verwaltet werden. Jede Storage Engine hat ihre eigenen Merkmale und Vorteile, und die Wahl der richtigen Engine hängt von den spezifischen Anforderungen der Anwendung ab. Zu den Hauptaufgaben einer Storage Engine gehören:
- **Datenorganisation und -speicherung:** Sie definiert, wie Daten in Dateien und auf physischen Speichermedien organisiert werden.
- **Indexierung:** Sie bestimmt, wie Indizes erstellt und verwaltet werden, um den schnellen Datenzugriff zu ermöglichen.
- **Transaktionsverwaltung:** Sie kümmert sich um die Verwaltung von Transaktionen, einschließlich der Sicherstellung von ACID-Eigenschaften (Atomicity, Consistency, Isolation, Durability).
- **Fehlerbehebung und Wiederherstellung:** Sie stellt Mechanismen zur Fehlerbehebung und Datenwiederherstellung im Falle von Systemausfällen bereit.
- **Leistungsoptimierung:** Sie bietet Optimierungen für spezifische Abfrage- und Update-Operationen, um die Gesamtleistung zu verbessern.

Beispiele für Storage Engines sind InnoDB und MyISAM in MySQL, die unterschiedliche Ansätze zur Datenverwaltung bieten und je nach Anwendungsfall ausgewählt werden können【9†source】【6†source】【7†source】.

Diese Zusammenfassungen bieten einen Überblick über die wichtigen Konzepte und ihre Funktionen in der Datenbankverwaltung.