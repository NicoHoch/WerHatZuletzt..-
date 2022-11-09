
-- Tabelle löschen
Drop TABLE Questions;

-- Tabelle erstellen Tabelle
CREATE TABLE Questions(Id INTEGER PRIMARY KEY, German TEXT, English TEXT, Type TEXT);

-- Alle Tabelleneinträge ausgeben
SELECT * from Questions;

UPDATE Questions 
SET Type = 'pay1'
WHERE Id >= 6

UPDATE Questions 
SET German = 'Wer hat zuletzt einen Disneyfilm gesehen?'
WHERE Id == 42


-- Befüllen der Tabelle

Insert INTO Questions ([German],[English],[Type]) SELECT '

-- Insert INTO Questions ([German]
--            ,[English]
--            ,[Type])
--            SELECT 'Wer war zuletzt im Kino?' as 'German', 'Who was last in the cinema?' as 'English', 'free' as 'Class'
-- UNION ALL SELECT 'Wer war zuletzt auf der Toilette?','Who was last on the toliet?','class1'
-- UNION ALL SELECT 'Wer hat sich zuletzt etwas gebrochen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat sich zuletzt etwas total unnötiges gekauft?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat sich zuletzt ein neues Handy gekauft?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hatte zuletzt einen Sonnenbrand?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hatte zuletzt Geburtstag?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hatte zuletzt ein Brainfreeze?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Buch fertig gelesen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Spaghetti gegessen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt mit den Eltern geredet?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt verschlafen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt etwas online bestellt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Sport gemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt etwas gekocht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Brief von Hand geschrieben?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt bei einem Umzug geholfen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt die Wohnung geputzt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Promi gesehen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt eine Straftat beobachtet?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Purzelbaum gemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Blut gespendet?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt das Bett neu bezogen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt eine Serie zu Ende geschaut?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Feuer gemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt gegrillt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Mittagsschlaf gemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Bargeld abgehoben?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt auf einem Instrument gespielt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Tatort im Ersten gesehen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt eine Schallplatte gehört?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt bei einer Renovierung geholfen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Blatt gelocht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Social-Media-Post veröffentlicht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Kaffee getrunken?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Erdbeeren gegessen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Geld gefunden?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt an eine NGO gespendet?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt etwas kaputt gemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt eine Glühbirne gewechselt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Glas umgeschüttet?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt die Nacht durchgemacht?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt Pizza gegessen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Kleidungsstück gekauft?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt ein Brettspiel gespielt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer hat zuletzt einen Disneyfilm gesehen?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Ausland?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt auf einem Konzert?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt in einem Fast-Food-Restaurant?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt auf einer Hochzeit?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Kino?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt auf einer Demo?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt in der Kirche?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt beim Friseur?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt krank?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Theater?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt auf einem Festival?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Schwimmbad?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt zelten?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Baumarkt?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt in einem ICE?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Wald?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt in einem Flugzeug?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt in einer Polizeikontrolle?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Club?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer war zuletzt im Museum?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer ist zuletzt in Hundekacke getreten?', 'English Version', 'class1'
-- UNION ALL SELECT 'Wer wurde zuletzt von Vogelexkrement getroffen?', 'English Version', 'class1';

-- Alle Tabelleneinträge ausgeben
SELECT * from Questions;

delete from Questions where Id >3;


Insert INTO Questions ([German]
           ,[English]
           ,[Type])
           SELECT 'Wer hatte zuletzt einen Pinsel in der Hand?' as 'German', 'Who last had a paintbrush in their hand?' as 'English', 'class1' as 'free';


Update Questions
set Type = 'class1'
where Id == 101;