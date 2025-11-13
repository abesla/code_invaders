# Dokumentacija analize do rješenja

## Zadatak

Analiza ulaza sa radara za prepoznavanje invader-a iz ASCII uzoraka.
Praćenje OOP i SOLID principa.
Testovi za svaku klasu i modul rješenja.
Ruby gem struktura.

## Ulazni fajlovi

Ulazni fajlovi su .txt fajlovi sa sadržajem sample-ova iz code_invaders.md. Smješteni su u folderu `/data`
- radar_sample.txt [50][100]
  ~~~~
    ----o--oo----o--ooo--ooo--o------o---oo-o----oo---o--o---------o----o------o-------------o--o--o--o-
    --o-o-----oooooooo-oooooo---o---o----o------ooo-o---o--o----o------o--o---ooo-----o--oo-o------o----
    --o--------oo-ooo-oo-oo-oo-----O------------ooooo-----oo----o------o---o--o--o-o-o------o----o-o-o--
    -------o--oooooo--o-oo-o--o-o-----oo--o-o-oo--o-oo-oo-o--------o-----o------o-ooooo---o--o--o-------
    ------o---o-ooo-ooo----o-----oo-------o---oo-ooooo-o------o----o--------o-oo--ooo-oo-------------o-o
    -o--o-----o-o---o-ooooo-o-------oo---o---------o-----o-oo-----------oo----ooooooo-ooo-oo------------
    o-------------ooooo-o--o--o--o-------o--o-oo-oo-o-o-o----oo------------o--oooo--ooo-o----o-----o--o-
    --o-------------------------oo---------oo-o-o--ooo----oo----o--o--o----o--o-o-----o-o------o-o------
    -------------------o----------o------o--o------o--------o--------o--oo-o-----oo-oo---o--o---o-----oo
    ----------o----------o---o--------------o--o----o--o-o------------oo------o--o-o---o-----o----------
    ------o----o-o---o-----o-o---o-----oo-o--------o---------------------------------o-o-o--o-----------
    ---------------o-------o-----o-------o-------------------o-----o---------o-o-------------o-------oo-
    -o--o-------------o-o-----o--o--o--oo-------------o----ooo----o-------------o----------oo----o---o-o
    -o--o-------------o----oo------o--o-------o--o-----o-----o----o-----o--o----o--oo-----------o-------
    -o-----oo-------o------o----o----------o--o----o-----o-----o-------o-----------o---o-o--oooooo-----o
    -o--------o-----o-----o---------oo----oo---o-o---------o---o--oooo-oo--o-------o------oo--oo--o-----
    ------------o---------o---------o----oooo-------------oo-oo-----ooo-oo-----o-------o-oo-oooooooo---o
    ----------------------o------------oooooooo---o-----o-------o--oooooo-o------------o-o-ooooooo-o----
    ------------o------o---o---o-------oo-oo--o--o---------o--o-o-o-ooooo-o--------------oo-o----o-oo-o-
    ---o-o----------oo-------oo----o----oooooooo-------o----o-o-o-o-----o-o-----o----------ooo-oo--o---o
    -o-o---------o-o---------------o--o--o--ooo---ooo-------o------oo-oo------------o--------o--o-o--o--
    -------oo---------------------------o-oo----------o------o-o-------o-----o----o-----o-oo-o-----o---o
    ---o--------o-----o-------o-oo-----oo--oo-o----oo----------o--o---oo------oo----o-----o-------o-----
    ---o--ooo-o---------o-o----o------------o---------o----o--o-------o----o--------o----------------oo-
    ---o------o----------------o----o------o------o---oo-----------o-------------o----------oo---------o
    --oo---------------o--o------o---o-----o--o-------------o------o-------o-----o-----o----o------o--o-
    -o-------o----------o-o-o-------o-----o--o-o-----------o-oo-----------o------o---------o-----o-o----
    ----------o----o-------o----o--o------o------------o---o---------------oo----o-----ooo--------------
    ----o--------oo----o-o----o--o------ooo----o-oooo---o--o-oo--------o-oo-----o-o---o-o--o-----oo-----
    ------o--------o-ooooo----o---o--o-----o---------------o-o-------o-----o----------------------------
    o-------oo----o--oooooo-o---o--o------oooo----------o-oo-------o---o----------o------oo-------------
    -o---o----------o--oo-oo-o---o-----o-o-----------------------oo--o------o------o--------------------
    -----oo-o-o-o---ooooooooo----o----o--------o--o---oo---o------------o----------o-o---o------o-o--oo-
    ------o------o---ooo-o---------------------------o--o---o---o----o--o-------o-----o------o----o----o
    -------o----------ooo-o-----o----o---o--o-oo--o--o-o--o------o--o-oo---ooo------------------------o-
    -o-------o------o-o--ooo--o---o---oo-----o----o-------------o----o-ooo-o------o--o-o------o-o-------
    ---oo--o---o-o---------o---o--------------o--o-----o-------o-----o--o---o-oo--------o----o----o-----
    o------o----oo-o-----------oo--o---o--------o-o------o-------o-o------o-oo---------o-----oo---------
    ----o--o---o-o-----------o---o------------o-------o----o--o--o--o-o---------------o-----------------
    -------oo--o-o-----o-----o----o-o--o----------------------o-------o------o----oo----ooo---------o---
    o-----oo-------------------o--o-----o-----------o------o-------o----o-----------o----------------o--
    --o---o-------o------------o--------------------o----o--o-------------oo---o---------oo--------o----
    --o--------o---------o------------o------o-------o------------o-------o---o---------ooooo-----------
    ------o--------------o-o-o---------o---o-------o--o-----o-------o-o----------o-----oo-ooo----------o
    --o---------------o----o--oo-------------o---------o-------------------oo---------oo-o-ooo----------
    -o-----------o------ooo----o----------------ooo-----o--------o--o---o-----------o-o-oooooo--------oo
    -o---o-------o---o-oooo-----o-------------------o----oo-----------------o--o--------o--o------o--o--
    -------o---o------oooooo--o----ooo--o--------o-------o----------------------------oo-oo-o--o--------
    o--oo------o-----oo--o-oo------------oo--o------o--o-------------oo----o------------oooo-o------oo--
    -----o----------ooooooooo--------------oo--------------oo-----o-----o-o--o------o----------o----o---
    ~~~~
- invader_a.txt [8][11]
    ~~~
    --o-----o--
    ---o---o---
    --ooooooo--
    -oo-ooo-oo-
    ooooooooooo
    o-ooooooo-o
    o-o-----o-o
    ---oo-oo---
    ~~~
- invader_b.txt [8][8]
    ~~~~
    ---oo---
    --oooo--
    -oooooo-
    oo-oo-oo
    oooooooo
    --o--o--
    -o-oo-o-
    o-o--o-o
    ~~~~

S obzirom na to da su ulazni fajlovi formatirani u obliku `[height][width]`, pri izvršavanju ću ih parsirati u 2D nizove.

## Provjera ulaznih fajlova

Provjeriti da li ulazni fajlovi postoje.
|-> (vratiti grešku da ulazni fajlovi ne postoje i zaustaviti izvršavanje)

Provjeriti da li ulazni fajlovi u svim redovima imaju isti broj karaktera.
|-> (vratiti upozorenje da će se uzeti najmanji broj karaktera u jednom redu i da će se napraviti niz te širine, 
     a da će karakteri van tog okvira biti zanemareni u nastavku izvršavanja)

Provjeriti da li ulazni fajlovi imaju druge karaktere osim "-" i "o"
|-> (vratiti upozorenje da će se nepoznati karakteri tretirati kao šum, 
     te da će slučanim uzorkom biti dodijeljene vrijednosti "-" ili "o" )

Provjeriti da li ulazni fajlovi imaju prazne redove. 
|-> (vratiti upozorenje da će prazni redovi biti zanemareni u unosu iz txt u 2D niz)

## Matching algoritam

Pattern matching algoritam uzima kao ulazne parametre cijeli 2D niz invader paterna te cijeli 2D niz radara. 
Iterira kroz kolone i redove radara spram broja kolona i redova invadera za koji se radi trenutna provjera.
Nakon završene provjere za svaki od invadera vraća rezultate detekcije.

Potrebno postaviti prag za detekciju invadera u postotku podudaranja, pa ukoliko je podudaranje na radaru u postotku većem od postavljenog praga,
bilježi se početna koordinata koja je bila korištena za provjeru, te procenat podudaranja.

Tom logikom bi se trebale izbjegaći potencijalne lažne detekcije invadera i kompenzovati šumovi na radaru,

`NOTE: Ako znamo da su prisutne veće količine šuma na radaru, prag detekcije bi trebalo smanjiti, imajući pri tome u vidu da postoji veća šansa za lažnu detekciju.`

### Threshold parametar
- **threshold**: Prag detekcije u postotku (default: 0.65 = 65%) 

__Za potrebe ovog zadatka postavio sam hardcoded vrijednost na 0.7, odnosno 70%, što bi trebalo dati dovoljno precizne, a ne prestroge kriterije za detekciju.
Ukoliko se ukaže potreba može se dodati još jedan parametar u konstruktor.__

### Koraci algoritma:

1. **Provjera dimenzija**: Provjerava se da li invader može stati na radar (da li su dimenzije 2D niza invadera manje ili jednake dimenzijama radara).
    - Ako je dimenzija invadera veća od dimenzija radara, prikazuje se upozorenje da taj invader ne može stati na radar, te da moguće detekcije mogu biti neuspješne.

2. **Iteracija kroz 2D niz**: Za svaku od koordinata radara (x + offset_x, y + offset_y) koja se može uzeti kao početna radi se provjera podudaranja za svaki od unesenih invadera.
    //TODO: Razmisliti o logici za partialy off-screen detekcije

3. **Iteracija kroz kolone i redove invadera i radara**:
    - Prolazi se kroz kolone i redove radara spram brojeva kolona i redova invadera za koji se radi provjera.
    - **Preskaču se '-' pikseli** iz invader paterna jer ne doprinose ukupnom rezultatu matcha.
    - Provjerava se da li radar ima isti karakter kao i invader na istom indexu:
        - Ako invader ima karakter koji nije `-`, a koordinata je unutar dimenzija radara, povećava se broj ukupnih mogućih matcheva za 1.
        - Ako invader i radar imaju isti karakter na istom indexu, povećava se broj podudaranja za 1.

4. **Računanje score-a**: Vraća se broj podudaranja / ukupan broj mogućih matcheva u paternu invadera.

5. **Filtriranje na osnovu threshold-a**: Ako je broj podudaranja veći od postavljenog praga (threshold-a) za detekciju, bilježi se pozicija kao potencijalna detekcija invadera.


### Opis napravljenih klasa

- `CodeInvaders::RadarSample` - Input uzorak čitanja sa radara
    - `grid` - 2D array koji sadrži karaktere radara
    - `width` - širina radara
    - `height` - visina radara
    - `parse` - metoda za parsiranje ulaznog fajla u 2D array


- `CodeInvaders::InvaderPattern` - Input uzorak invadera
    - `name` - ime invadera
    - `grid` - 2D array koji sadrži karaktere invadera
    - `width` - širina invadera
    - `height` - visina invadera
    - `parse` - metoda za parsiranje ulaznog fajla u 2D array

- `CodeInvaders::InputValidator` - Klasa koja predstavlja validaciju ulaznih fajlova.
  U inicijalizaciji prima 2D niz koji predstavlja ulazni fajl, a sadrži metodu za provjeru ispravnosti učitanog niza
    - `validate` - metoda za provjeru ulaznog fajla koja vraća validirani 2D niz

- `CodeInvaders::Errors::InvalidInputError` - Klasa koja predstavlja grešku koja se baca kada ulazni fajl nije validan 
(prazan ili u neodgovarajućem formatu). Ova greška prekida izvršavanje i ispisuje poruku greške.

- `CodeInvaders::Errors::InconsistentLineWidthError` - Klasa koja predstavlja grešku koja se baca kada ulazni fajl ima linije različite dužine.
Ova greška ne prekida izvršavanje koda već ispisuje upozorenje da su linije u ulaznom fajlu različite dužine,
da dužina linija varira od $najmanja_dužina_reda do $najveća_dužina_reda,
te da će se koristiti najmanja dužina linije za sve redove, a da će se ostatak kolona u redovima koji su duži od najmanjeg zanemariti.

- `CodeInvaders::Errors::InvalidCharactersError` - Klasa koja predstavlja grešku koja se baca kada ulazni fajl sadrži nepoznate karaktere.
Ova greška ne prekida izvršavanje koda već ispisuje upozorenje da ulazni fajl sadrži nepoznate karaktere,
da će se karakteri koji nisu "-" ili "o" tretirati kao šum i da će se za njih slučajnim uzorkom dodijeliti vrijednost "-" ili "o".

- `CodeInvaders::Errors::EmptyLineError` - Klasa koja predstavlja grešku koja se baca kada ulazni fajl ima prazne linije.
Ova greška ne prekida izvršavanje koda već ispisuje upozorenje da ulazni fajl ima prazne linije, te da će se prazne linije zanemariti.