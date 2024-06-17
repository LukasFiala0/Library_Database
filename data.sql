use library;

-- NATIONALITY
INSERT INTO library.nationality (nation) VALUES
('USA'),
('Britain'),
('Canada'),
('France'),
('Germany'),
('Russia'),
('Czechia'),
('Italia'),
('Ireland'),
('Japan'),
('Spain'),
('Netherlands'),
('Poland'),
('Portugal'),
('Sweden'),
('Switzerland'),
('Austria'),
('Greece'),
('Hungary'),
('Norway');

select * from nationality;

-- PUBLISHER

INSERT INTO library.publisher (publisher) VALUES
('Penguin Books'),
('HarperCollins'),
('Simon & Schuster'),
('Random House'),
('Hachette Livre');

select * from publisher;



-- AUTHOR

INSERT INTO library.author (first_name, last_name, birth, death, nobel, nationality_id) VALUES
('Ernest', 'Hemingway', 1899, 1961, 1, 1),  -- American
('George', 'Orwell', 1903, 1950, 0, 2),    -- British
('Margaret', 'Atwood', 1939, NULL, 1, 3),  -- Canadian
('Victor', 'Hugo', 1802, 1885, 0, 4),      -- French
('Johann Wolfgang', 'von Goethe', 1749, 1832, 0, 5),  -- German
('Dante', 'Alighieri', 1265, 1321, 0, 8),  -- Italian
('James', 'Joyce', 1882, 1941, 0, 9),  -- Irish
('Haruki', 'Murakami', 1949, NULL, 0, 10),  -- Japanese
('Jaroslav', 'Hašek', 1883, 1923, 0, 7),  -- Czech
('Karel', 'Čapek', 1890, 1938, 0, 7),  -- Czech
('Franz', 'Kafka', 1883, 1924, 0, 7),  -- Czech
('Božena', 'Němcová', 1820, 1862, 0, 7),  -- Czech
('Jan', 'Neruda', 1834, 1891, 0, 7),  -- Czech
('Gustave', 'Flaubert', 1821, 1880, 0, 4),  -- France
('Fjodor Michajlovič', 'Dostojevskij', 1821, 1881, 0, 6),  -- Russia
('Charles', 'Baudelaire', 1821, 1867, 0, 4),  -- France
('Lev Nikolajevič', 'Tolstoj', 1828, 1910, 0, 6),  -- Russia
('Henrik', 'Ibsen', 1828, 1906, 0, 10),  -- Norway
('Jules', 'Verne', 1828, 1905, 0, 4),  -- France
('Émile', 'Zola', 1840, 1902, 0, 4),  -- France
('Oscar', 'Wilde', 1854, 1900, 0, 9),  -- Ireland
('Jane', 'Austenová', 1775, 1817, 0, 2),  -- Britain
('George Gordon', 'Byron', 1788, 1824, 0, 2),  -- Britain
('Alexandr Sergejevič', 'Puškin', 1799, 1837, 0, 6),  -- Russia
('Honoré', 'de Balzac', 1799, 1850, 0, 4),  -- France
('Nikolaj Vasiljevič', 'Gogol', 1809, 1852, 0, 6),  -- Russia
('Charles', 'Dickens', 1812, 1870, 0, 2),  -- Britain
('William', 'Styron', 1925, 2006, 0, 1),  -- USA
('John', 'Steinbeck', 1902, 1968, 1, 1);  -- USA;


select * from author;

-- GENRE

-- Žánry v angličtině a češtině
INSERT INTO library.genre (genre, description) VALUES
('anecdote', 'A short amusing or interesting story about a real incident or person.'),  -- anekdota
('fable', 'A short story typically with animals as characters, conveying a moral.'),  -- bajka
('ballad', 'A narrative poem typically arranged in quatrains with alternating rhyme.'),  -- balada
('travelogue', 'An account of someone\'s travels.'),  -- cestopis
('elegy', 'A poem of serious reflection, typically a lament for the dead.'),  -- elegie
('epigram', 'A pithy saying or remark expressing an idea in a clever and amusing way.'),  -- epigram
('epic', 'A long poem, typically derived from oral tradition, narrating the deeds and adventures of heroic or legendary figures.'),  -- epos
('fantasy', 'Literary works featuring magical or supernatural elements.'),  -- fantasy
('calligram', 'A poem or other text in which the words are arranged in a visually meaningful shape or pattern.'),  -- kaligram
('comedy', 'A literary genre and type of dramatic work that is intended to amuse and entertain.'),  -- komedie
('chronicle', 'A factual written account of important or historical events.'),  -- kronika
('legend', 'A traditional story sometimes popularly regarded as historical but unauthenticated.'),  -- legenda
('myth', 'A traditional story, especially one concerning the early history of a people or explaining a natural or social phenomenon, typically involving supernatural beings or events.'),  -- mýtus
('novella', 'A short novel or long short story.'),  -- novela
('ode', 'A lyric poem in the form of an address to a particular subject.'),  -- óda
('cycle', 'A sequence of poems or songs.'),  -- pásmo
('song', 'A short poem or other set of words set to music or meant to be sung.'),  -- píseň
('poem', 'A piece of writing in which the expression of feelings and ideas is given intensity by particular attention to diction, rhythm, and imagery.'),  -- poema
('fairy tale', 'A children\'s story about magical and imaginary beings and lands.'),  -- pohádka
('legend', 'A traditional story sometimes regarded as historical but unauthenticated.'),  -- pověst
('short story', 'A story with a fully developed theme but significantly shorter and less elaborate than a novel.'),  -- povídka
('novel', 'A fictitious prose narrative of book length, typically representing character and action with some degree of realism.'),  -- román
('sci-fi', 'Fiction based on imagined future scientific or technological advances and major social or environmental changes.'),  -- sci-fi
('sonnet', 'A poem of fourteen lines using any of a number of formal rhyme schemes, in English typically having ten syllables per line.'),  -- sonet
('romance', 'A novel or other prose narrative depicting heroic or marvelous deeds, pageantry, romantic exploits, etc.'),  -- romance
('tragedy', 'A play dealing with tragic events and having an unhappy ending, especially one concerning the downfall of the main character.');  -- tragédie

SELECT * FROM genre;

-- BOOK

INSERT INTO library.book (title, year, isbn, pages, description, available, author_id, publisher_id) VALUES
('The Old Man and the Sea', 1952, '9780684801223', 127, 'A short novel written by the American author Ernest Hemingway', 1, 1, 1),
('1984', 1949, '9780451524935', 328, 'A dystopian social science fiction novel and cautionary tale by the English writer George Orwell', 1, 2, 2),
('The Handmaid\'s Tale', 1985, '9780385490818', 311, 'A dystopian novel by Canadian author Margaret Atwood', 1, 3, 3),
('Les Misérables', 1862, '9780451419439', 1463, 'A French historical novel by Victor Hugo', 1, 4, 4),
('Faust', 1808, '9780140449013', 464, 'A tragic play in two parts by Johann Wolfgang von Goethe', 1, 5, 5),
('War and Peace', 1869, '9780199232765', 1225, 'A novel by Tolstoy, which details the French invasion of Russia.', 1, 17, 2),
('The Metamorphosis', 1915, '9780805210576', 201, 'A novella by Franz Kafka, it tells the story of a man who transforms into a giant insect.', 1, 11, 3),
('Divine Comedy', 1320, '9780140448955', 798, 'An epic poem by Dante Alighieri, describing the journey through Hell, Purgatory, and Paradise.', 1, 6, 4),
('Ulysses', 1922, '9780199535675', 732, 'A novel by James Joyce, which chronicles the appointments and encounters of Leopold Bloom in Dublin.', 1, 7, 1),
('Norwegian Wood', 1987, '9780375704024', 296, 'A novel by Haruki Murakami, that is a nostalgic story of loss and burgeoning sexuality.', 1, 8, 5),
('The Good Soldier Švejk', 1923, '9780140449914', 752, 'A satirical novel about a simple soldier in WWI', 1, 9, 1),  -- Jaroslav Hašek
('War with the Newts', 1936, '9780141187140', 352, 'A satirical and dystopian novel about a new species of intelligent newts', 1, 10, 2),  -- Karel Čapek
('The Trial', 1925, '9780805209990', 304, 'A novel about a man prosecuted by a remote, inaccessible authority', 1, 11, 3),  -- Franz Kafka
('Babička', 1855, '9780199232765', 342, 'A novel depicting rural Czech life in the 19th century', 1, 12, 4),  -- Božena Němcová
('Povídky malostranské', 1878, '9780199535675', 308, 'A collection of short stories set in the Malá Strana district of Prague', 1, 13, 5),  -- Jan Neruda
('Madame Bovary', 1857, '9780140449129', 328, 'A novel about a doctor\'s wife who has adulterous affairs and lives beyond her means.', 1, 14, 1),  -- Gustave Flaubert
('Crime and Punishment', 1866, '9780486415871', 430, 'A novel about the mental anguish and moral dilemmas of a poor ex-student.', 1, 15, 2),  -- Fjodor Michajlovič Dostojevskij
('Les Fleurs du mal', 1857, '9780486260204', 208, 'A volume of French poetry by Charles Baudelaire.', 1, 16, 3),  -- Charles Baudelaire
('Anna Karenina', 1877, '9780143035008', 964, 'A tragic romance novel about a young woman in Russian high society.', 1, 17, 4),  -- Lev Nikolajevič Tolstoj
('A Doll\'s House', 1879, '9780486270620', 122, 'A play that questions the traditional roles of men and women in 19th-century marriage.', 1, 18, 5),  -- Henrik Ibsen
('Twenty Thousand Leagues Under the Sea', 1870, '9780140390469', 370, 'A classic science fiction adventure novel about underwater travels.', 1, 19, 1),  -- Jules Verne
('Germinal', 1885, '9780140447422', 592, 'A novel depicting the inhumane working conditions of coal miners in northern France.', 1, 20, 2),  -- Émile Zola
('The Picture of Dorian Gray', 1890, '9780141439570', 254, 'A philosophical novel about a man whose portrait ages while he remains young.', 1, 21, 3),  -- Oscar Wilde
('Pride and Prejudice', 1813, '9780141040349', 432, 'A romantic novel that charts the emotional development of the protagonist Elizabeth Bennet.', 1, 22, 1),  -- Jane Austenová
('Don Juan', 1824, '9780140422168', 816, 'A satiric poem by Lord Byron, based on the legend of Don Juan.', 1, 23, 2),  -- George Gordon Byron
('Eugene Onegin', 1833, '9780140448030', 384, 'A novel in verse written by Alexander Pushkin.', 1, 24, 3),  -- Alexandr Sergejevič Puškin
('Père Goriot', 1835, '9780140440171', 496, 'A novel about the lives of the residents of a boarding house in Paris.', 1, 25, 4),  -- Honoré de Balzac
('Dead Souls', 1842, '9780140448078', 432, 'A novel by Nikolai Gogol, which is a satirical story about the Russian way of life.', 1, 26, 5),  -- Nikolaj Vasiljevič Gogol
('A Tale of Two Cities', 1859, '9780141439600', 544, 'A historical novel set in London and Paris before and during the French Revolution.', 1, 27, 1),  -- Charles Dickens
('Sophie\'s Choice', 1979, '9780679736370', 515, 'A novel about a young writer who becomes friends with a survivor of the Nazi concentration camps.', 1, 28, 2),  -- William Styron
('The Grapes of Wrath', 1939, '9780143039433', 464, 'A novel about the hardships of an American family during the Great Depression.', 1, 29, 3);  -- John Steinbeck

select * from book;

-- BOOK_GENRE

-- Pro Ernest Hemingway - The Old Man and the Sea
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(1, 21); -- The Old Man and the Sea - román

-- Pro George Orwell - 1984
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(2, 22); -- 1984 - sci-fi

-- Pro Margaret Atwood - The Handmaid's Tale
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(3, 22); -- The Handmaid's Tale - sci-fi

-- Pro Victor Hugo - Les Misérables
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(4, 24); -- Les Misérables - romance

-- Pro Johann Wolfgang von Goethe - Faust
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(5, 18); -- Faust - cycle

-- Pro Lev Tolstoj - War and Peace
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(6, 23), -- War and Peace - romance
(6, 24); -- War and Peace - novel

-- Pro Franz Kafka - The Metamorphosis
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(7, 20); -- The Metamorphosis - short story

-- Pro Dante Alighieri - Divine Comedy
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(8, 17); -- Divine Comedy - poem

-- Pro James Joyce - Ulysses
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(9, 24); -- Ulysses - novel

-- Pro Haruki Murakami - Norwegian Wood
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(10, 24); -- Norwegian Wood - novel

-- Pro Jaroslav Hašek - The Good Soldier Švejk
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(11, 18); -- The Good Soldier Švejk - cycle

-- Pro Karel Čapek - War with the Newts
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(12, 22); -- War with the Newts - sci-fi

-- Pro Franz Kafka - The Trial
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(13, 24); -- The Trial - novel

-- Pro Božena Němcová - Babička
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(14, 24); -- Babička - novel

-- Pro Jan Neruda - Povídky malostranské
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(15, 19); -- Povídky malostranské - legend

-- Pro Gustave Flaubert - Madame Bovary
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(16, 24); -- Madame Bovary - novel

-- Pro Fjodor Michajlovič Dostojevskij - Crime and Punishment
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(17, 23); -- Crime and Punishment - romance

-- Pro Charles Baudelaire - Les Fleurs du mal
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(18, 17); -- Les Fleurs du mal - poem

-- Pro Lev Nikolajevič Tolstoj - Anna Karenina
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(19, 23); -- Anna Karenina - romance

-- Pro Henrik Ibsen - A Doll's House
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(20, 15); -- A Doll's House - tragedy

-- Pro Jules Verne - Twenty Thousand Leagues Under the Sea
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(21, 22); -- Twenty Thousand Leagues Under the Sea - sci-fi

-- Pro Émile Zola - Germinal
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(22, 24); -- Germinal - novel

-- Pro Oscar Wilde - The Picture of Dorian Gray
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(23, 24); -- The Picture of Dorian Gray - novel

-- Pro Jane Austenová - Pride and Prejudice
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(24, 23); -- Pride and Prejudice - romance

-- Pro George Gordon Byron - Don Juan
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(25, 20); -- Don Juan - short story

-- Pro Alexandr Sergejevič Puškin - Eugene Onegin
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(26, 17); -- Eugene Onegin - poem

-- Pro Honoré de Balzac - Père Goriot
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(27, 24); -- Père Goriot - novel

-- Pro Nikolaj Vasiljevič Gogol - Dead Souls
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(28, 24); -- Dead Souls - novel

-- Pro Charles Dickens - A Tale of Two Cities
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(29, 23); -- A Tale of Two Cities - romance

-- Pro William Styron - Sophie's Choice
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(30, 24); -- Sophie's Choice - novel

-- Pro John Steinbeck - The Grapes of Wrath
INSERT INTO library.book_genre (book_id, genre_id) VALUES
(31, 24); -- The Grapes of Wrath - novel


-- USERS
INSERT INTO library.user (username, password, first_name, last_name, email, telephone, active) VALUES
('jdoe', 'password123', 'John', 'Doe', 'jdoe@example.com', '1234567890', 1),
('asmith', 'password123', 'Alice', 'Smith', 'asmith@example.com', '0987654321', 1),
('bwilliams', 'password123', 'Bob', 'Williams', 'bwilliams@example.com', '1230984567', 1),
('cjones', 'password123', 'Charlie', 'Jones', 'cjones@example.com', '9876543210', 1),
('djohnson', 'password123', 'David', 'Johnson', 'djohnson@example.com', '5678901234', 1);

select * from user;


select * from rental;

select * from inventory;







