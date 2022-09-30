
-- Tabelle löschen
Drop TABLE Questions;

-- Tabelle erstellen Tabelle
CREATE TABLE Questions(Id INTEGER PRIMARY KEY, German TEXT, English TEXT, Type TEXT);

-- Alle Tabelleneinträge ausgeben
SELECT * from Questions;

-- Befüllen der Tabelle
Insert INTO Questions ([German]
           ,[English]
           ,[Type])
           SELECT 'Wer war zuletzt im Kino?' as 'German', 'Who was last in the cinema?' as 'English', 'free' as 'Class'
UNION ALL SELECT 'Wer war zuletzt auf der Toilette?','Who was last on the toliet?','free'
UNION ALL SELECT 'Wer hat sich zuletzt etwas gebrochen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat sich zuletzt etwas total unnötiges gekauft?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat sich zuletzt ein neues Handy gekauft?', 'English Version', 'free'
UNION ALL SELECT 'Wer hatte zuletzt einen Sonnenbrand?', 'English Version', 'free'
UNION ALL SELECT 'Wer hatte zuletzt Geburtstag?', 'English Version', 'free'
UNION ALL SELECT 'Wer hatte zuletzt ein Brainfreeze?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Buch fertig gelesen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Spaghetti gegessen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt mit den Eltern geredet?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt verschlafen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt etwas online bestellt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Sport gemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt etwas gekocht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Brief von Hand geschrieben?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt bei einem Umzug geholfen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt die Wohnung geputzt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Promi gesehen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt eine Straftat beobachtet?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Purzelbaum gemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Blut gespendet?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt das Bett neu bezogen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt eine Serie zu Ende geschaut?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Feuer gemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt gegrillt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Mittagsschlaf gemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Bargeld abgehoben?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt auf einem Instrument gespielt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Tatort im Ersten gesehen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt eine Schallplatte gehört?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt bei einer Renovierung geholfen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Blatt gelocht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt einen Social-Media-Post veröffentlicht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Kaffee getrunken?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Erdbeeren gegessen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Geld gefunden?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt an eine NGO gespendet?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt etwas kaputt gemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt eine Glühbirne gewechselt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Glas umgeschüttet?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt die Nacht durchgemacht?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt Pizza gegessen?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Kleidungsstück gekauft?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Brettspiel gespielt?', 'English Version', 'free'
UNION ALL SELECT 'Wer hat zuletzt ein Disneyfilm gesehen?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Ausland?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt auf einem Konzert?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt in einem Fast-Food-Restaurant?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt auf einer Hochzeit?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Kino?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt auf einer Demo?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt in der Kirche?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt beim Friseur?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt krank?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Theater?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt auf einem Festival?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Schwimmbad?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt zelten?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Baumarkt?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt in einem ICE?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt im Wald?', 'English Version', 'free'
UNION ALL SELECT 'Wer war zuletzt in einem Flugzeug?', 'English Version', 'class1'
UNION ALL SELECT 'Wer war zuletzt in einer Polizeikontrolle?', 'English Version', 'class1'
UNION ALL SELECT 'Wer war zuletzt im Club?', 'English Version', 'class1'
UNION ALL SELECT 'Wer war zuletzt im Museum?', 'English Version', 'class1'
UNION ALL SELECT 'Wer ist zuletzt in Hundekacke getreten?', 'English Version', 'class1'
UNION ALL SELECT 'Wer wurde zuletzt von Vogelexkrement getroffen?', 'English Version', 'class1';

-- Alle Tabelleneinträge ausgeben
SELECT * from Questions;