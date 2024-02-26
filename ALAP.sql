CREATE DATABASE toppet CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE `toppet`;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE IF NOT EXISTS kutya_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);

CREATE TABLE IF NOT EXISTS macska_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);

CREATE TABLE IF NOT EXISTS hal_hullo_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS hullő_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS kisemlos_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS madar_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska karmolófa', 'Magas minőségű karmolófa macskáknak, amely megvédi a bútorokat és lehetővé teszi a macska számára a karmolászást.', 5000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Akvárium dekoráció', 'Színes műanyag díszek akváriumokhoz, hogy otthonosabbá tegye halai számára az otthont.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Teknős hőlámpa', 'Infravörös hőlámpa teknősök számára, amely biztosítja a megfelelő hőmérsékletet és megvilágítást a terráriumban.', 3000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős futókerék', 'Kényelmes és biztonságos futókerék kisemlősök számára, amely segít fenntartani az egészségüket és formájukat.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár etetőtál', 'Könnyen tisztítható és tartós madár etetőtál, amely lehetővé teszi, hogy kedvenc madaraid kényelmesen táplálkozhassanak.', 800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya nyakörv', 'Divatos és kényelmes kutya nyakörv puha anyagból, amely biztosítja a kutyád biztonságát és kényelmét séták során.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska hintaág', 'Szórakoztató és kényelmes hintaág macskáknak, amely segít az aktív játékban és pihenésben egyaránt.', 3500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal akváriumszűrő', 'Hatékony és csendes akváriumszűrő, amely tiszta és egészséges környezetet biztosít a halaknak.', 4000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő terrárium növény', 'Természetes megjelenésű műanyag növény hüllő terráriumokhoz, hogy otthonosabbá tegye a hüllők élőhelyét.', 1200, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős takaróház', 'Puha és meleg takaróház kisemlősök számára, amely biztosítja a kényelmet és biztonságot.', 1800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár hinta', 'Színes és szórakoztató madár hinta, amely lehetővé teszi a madarak számára a szabad repülés érzését a ketrecben.', 1000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya etetőtál', 'Praktikus és könnyen tisztítható műanyag etetőtál kutyáknak, amely segít a rendszeres és egészséges táplálkozásban.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska alomtálca', 'Szagsemlegesítő fedővel ellátott macska alomtálca, amely kényelmes és higiénikus környezetet biztosít a macskák számára.', 3000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal élettér dísz', 'Természetes megjelenésű műanyag dísz hal akváriumokhoz, amelyek élénkítik a víz alatti környezetet.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő lámpa állvány', 'Állítható hő- és fényforrás tartó állvány hüllők terráriumához, hogy megfelelő környezetet biztosítson számukra.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős játék guruló labda', 'Színes és mozgó játék labda kisemlősök számára, amely stimulálja a mozgást és az érzékeket.', 800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár etetőállvány', 'Könnyen felállítható és tisztítható madár etetőállvány, amely lehetővé teszi a madarak kényelmes táplálkozását.', 1200, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya póráz', 'Erős és strapabíró póráz kutyáknak, amely segít a biztonságos sétákban és vezetéken tartásban.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska játékszer egér', 'Puha és mozgó játék egér macskáknak, amely stimulálja a vadászösztönt és a játékot.', 500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal élelem', 'Magas minőségű halélelem, amely biztosítja a halak egészséges táplálkozását és fejlődését.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő terrárium dísz', 'Természetes megjelenésű műanyag dísz hüllő terráriumokhoz, hogy valósághűbbé tegye a környezetüket.', 1800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős alom', 'Szagtalan és pormentes kisemlős alom, amely biztosítja a higiéniás környezetet és a kényelmet.', 1000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár játszófa', 'Színes és interaktív madár játszófa, amely segíti a madarak szellemi és fizikai fejlődését.', 3000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya hálózsák', 'Kényelmes és puha hálózsák kutyáknak, ideális alváshoz és pihenéshez otthon vagy kirándulások során.', 4000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska cicakaparó', 'Tartós és strapabíró cicakaparó macskáknak, amely segít megelőzni a karmolászást a bútorokon és a falakon.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal akváriumszűrő pumpa', 'Erős és hatékony szűrő pumpa akváriumokhoz, amely tiszta és oxigénben gazdag környezetet biztosít a halaknak.', 3500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő hőmérő', 'Precíz és könnyen olvasható hőmérő hüllők terráriumához, amely segít a megfelelő hőmérséklet fenntartásában.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős fésű', 'Puha sörtéjű fésű kisemlősök szőrzetének ápolásához és tisztításához.', 700, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár játékkönyv', 'Interaktív és tanulást segítő játékkönyv madaraknak, amely fejleszti az érzékeket és az intelligenciát.', 1200, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya biztonsági öv', 'Biztonsági öv kutyáknak az autóban, amely biztosítja a kutyád biztonságát és a vezetés zavartalan menetét.', 3000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska alomtisztító lapát', 'Kényelmes és praktikus alomtisztító lapát macskákhoz, amely segíti a gyors és hatékony alomtisztítást.', 1000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal akváriumdekor', 'Színes és élethű akváriumdekoráció, amely érdekesebbé teszi a halak élőhelyét és segíti őket a rejtekhelyek megtalálásában.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő táplálótál', 'Könnyen tisztítható és tartós műanyag táplálótál hüllők számára, amely segíti a rendszeres és tiszta táplálkozást.', 800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős hám', 'Kényelmes és állítható kisemlős hám, amely segíti a séták során történő irányítást és biztonságos vezetést.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár fürdőkád', 'Könnyen felszerelhető és tisztítható fürdőkád madaraknak, amely segíti a higiéniát és a tollak ápolását.', 1600, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya öltöztető ruha', 'Divatos és kényelmes öltöztető ruha kutyáknak hideg időkre, amely megvédi őket a hidegtől és stílusos megjelenést biztosít.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska játékszer labirintus', 'Interaktív és szórakoztató labirintus játékszer macskáknak, amely fejleszti az intelligenciát és a készségeket.', 1800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal élettér fenék dísz', 'Természetes megjelenésű műanyag dísz akváriumokhoz, amely díszíti a halak életterét és segíti azokat a természetes viselkedésükben.', 1200, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő csontváz dísz', 'Valósághű és különleges csontváz dísz hüllő terráriumokhoz, amelyek érdekesebbé teszik a terrárium belső kialakítását.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős futólabda', 'Állítható és biztonságos futólabda kisemlősöknek, amely stimulálja a mozgást és a szórakozást.', 1300, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár rágó játék', 'Biztonságos és szórakoztató rágó játék madaraknak, amely segíti a csőrük egészséges fenntartását és a játékot.', 700, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya hűsítő matrac', 'Hűsítő és légáteresztő matrac kutyáknak, amely segít megelőzni a túlmelegedést és biztosítja a kényelmet.', 3500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska hordozható WC', 'Praktikus és könnyen hordozható WC macskáknak utazáshoz vagy kis lakásokba.', 2800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal élelmiszertabletta', 'Tápláló és egészséges élelmiszertabletta halaknak, amely egyszerűvé teszi a táplálkozást és a táplálékadagolást.', 1800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő napfénylámpa', 'UVB-sugárzó napfénylámpa hüllők terráriumához, amely segíti azokat a D-vitamin termelésében és az anyagcserében.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős labirintus játék', 'Színes és interaktív labirintus játék kisemlősöknek, amely fejleszti az intelligenciát és a készségeket.', 1500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár hintáztató', 'Biztonságos és szórakoztató hintáztató madaraknak, amely stimulálja a mozgást és a játékot.', 1000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya masszázseszköz', 'Kényelmes és hatékony masszázseszköz kutyáknak, amely segít lazítani az izmokat és javítja a vérkeringést.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska játékszer madárfog', 'Színes és mozgó játékszer macskáknak, amely segíti a vadászösztönt és a szórakozást.', 600, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal akvárium hőmérő', 'Precíz és könnyen olvasható hőmérő akváriumokhoz, amely segít a megfelelő hőmérséklet fenntartásában a halak számára.', 700, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő hidegoldó', 'Elektromos hidegoldó hüllők terráriumához, amely segít megakadályozni a túlzott hőmérsékletet a terráriumban.', 1200, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős játszótér', 'Színes és változatos játszótér kisemlősöknek, amely segíti a mozgást és a szórakozást.', 2500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár fésű', 'Kényelmes és puha fésű madaraknak, amely segíti a tollak ápolását és a kényelmes érzést.', 500, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kutya kutyakabát', 'Vízálló és meleg kutyakabát hideg időkre, amely védi a kutyádat a nedvességtől és a hidegtől.', 3000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Macska cső', 'Szórakoztató és szöszmözölő cső macskáknak, amely segíti a mozgást és a játékot.', 1800, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hal akvárium növény', 'Élethű és könnyen gondozható műanyag akváriumnövény, amely díszíti a halak élőhelyét és oxigént termel.', 900, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Hüllő szőnyeg', 'Természetes hatású és könnyen tisztítható szőnyeg hüllők terráriumához, amely segíti a hüllők mozgását és kényelmét.', 600, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Kisemlős játszóház', 'Színes és strapabíró játszóház kisemlősöknek, amely kényelmes pihenőhelyet és szórakozást biztosít.', 2000, [Mennyiség], [KategóriaID]);
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES ('Madár tollas játék', 'Interaktív és szórakoztató tollas játék madaraknak, amely fejleszti a koordinációt és a játékot.', 800, [Mennyiség], [KategóriaID]);
