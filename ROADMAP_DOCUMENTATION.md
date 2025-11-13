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