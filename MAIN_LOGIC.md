# Glavna Logika

Core algoritam za pattern matching u ovom programu se nalazi u metodi calculate_match.
Unutar te metode se iterira kroz jedan slice radara u veličini invadera i preračunava se broj podudaranja.

## Metoda: `calculate_match(offset_x, offset_y)`

```ruby
def calculate_match(offset_x, offset_y)
  total_possible_matches = 0
  actual_matches = 0

  @invader.height.times do |dy|
    @invader.width.times do |dx|
      invader_pixel = @invader.grid[dy][dx]

      next if invader_pixel == '-'

      radar_y = offset_y + dy
      radar_x = offset_x + dx

      if radar_y >= 0 && radar_y < @radar.height && radar_x >= 0 && radar_x < @radar.width
        total_possible_matches += 1
        radar_pixel = @radar.grid[radar_y][radar_x]
        actual_matches += 1 if invader_pixel == radar_pixel
      end
    end
  end

  score = total_possible_matches.zero? ? 0.0 : actual_matches.to_f / total_possible_matches

  { score: score, matches: actual_matches, total: total_possible_matches }
end
```

Ova metoda izračunava koliko dobro se invader pattern poklapa sa radarom na određenoj poziciji (offset_x, offset_y). 
Vraća score (rezultat) između 0.0 i 1.0 (0-100%) kao procenat poklapanja.

**Parametri:**
- `offset_x` - X koordinata (kolona) na radaru odakle počinje poređenje
- `offset_y` - Y koordinata (red) na radaru odakle počinje poređenje

**Povratna vrijednost:** 

Hash sa tri ključa:
- `score` - Procenat poklapanja (0.0 - 1.0)
- `matches` - Broj piksela koji se poklapaju
- `total` - Ukupan broj piksela koji su poređeni

---

## Glavna logika metode `calculate_match`

```ruby
def calculate_match(offset_x, offset_y)
```

Metoda calculate_match prima dva parametra, offset_x i offset_y, koji predstavljaju početnu poziciju na radaru odakle kreće provjera za poklapanje sa invader pattern-on.

---

### Inicijalizacija brojača

```ruby
total_possible_matches = 0
actual_matches = 0
```

- `total_possible_matches` - Broji koliko "o" piksela invadera se može poklopiti sa radarom
  (nije statično za svakog invadera radi budućeg unaprijeđenja za off-screen detekcije)
- `actual_matches` - Broji koliko "o" piksela radara se zaista poklopilo sa invader patternom


Ove dvije varijable kasnije koristim za izračunavanje procenta podudaranja (broj podudaranja / ukupan broj mogućih podudaranja).

---

### Petlja za iteraciju kroz linije invadera

```ruby
@invader.height.times do |dy|
```

- Prolazak kroz svaku od linija invader pattern-a
- `dy` (delta Y) je relativna pozicija unutar invadera, kreće od 0 do `@invader.height - 1`
- Ovo je offset od vrha invadera koji će se kasnije koristiti za pozicioniranje unutar radara po linijama

---

### Petlja za iteraciju kroz kolone invadera

```ruby
@invader.width.times do |dx|
```

- Prolazak kroz svaku od kolona invader pattern-a
- `dx` (delta X) je relativna pozicija unutar invadera, kreće od 0 do `@invader.width - 1`
- Ovo je offset od lijeve strane invadera koji će se kasnije koristiti za pozicioniranje unutar radara po kolonama

**Zajedno ove dvije petlje prolaze kroz svaki piksel u radar grid-u po broju kolona i redova invader patterna za koji se radi provjera.**

---

### Čitanje piksela iz invader grid-a

```ruby
invader_pixel = @invader.grid[dy][dx]
```

- Spremi vrijednost piksela na poziciji `[dy][dx]` iz invader grid-a u varijablu `invader_pixel`
- Koristi instance varijablu @invader u koju je proslijeđen invader pattern pri inicijalizaciji PatternMatcher-a

---

### Handle-anje praznih piksela u invader pattern-u

```ruby
next if invader_pixel == '-'
```

- Ako je piksel '-', odnosno prazno mjesto u invader pattern-u, `next` preskače ostatak petlje za ovu iteraciju jer prazna mjesta ne doprinose rezultatu poređenja (ovo je bio pokušaj optimizacije)

---

### Apsolutna pozicija na radaru

```ruby
radar_y = offset_y + dy
radar_x = offset_x + dx
```

- `radar_y` - Apsolutna Y pozicija na radaru (offset redova do onog reda u kojem počinje detekcija + relativna pozicija unutar invadera)
- `radar_x` - Apsolutna X pozicija na radaru (offset karaktera(kolona) do onog karaktera od kojeg počinje detekcija + relativna pozicija unutar invadera)
- Ovaj dio logike mapira poziciju sliding windowa za detekciju invadera na radaru

**Primjer:**
- Ako je offset_y = 5, offset_x = 10
- I trenutno smo na dy = 2, dx = 3 unutar invadera
- Tada je radar_y = 5 + 2 = 7, radar_x = 10 + 3 = 13
- Znači gledamo poziciju [7][13] na radaru

---

### Provjera da li je pozicija unutar granica radara

```ruby
if radar_y >= 0 && radar_y < @radar.height && radar_x >= 0 && radar_x < @radar.width
```

Provjerava da li je izračunata pozicija validna (unutar radara):
- `radar_y >= 0` - Nije iznad radara (ne ide u negativne redove)
- `radar_y < @radar.height` - Nije ispod radara (ne prelazi visinu)
- `radar_x >= 0` - Nije lijevo od radara (ne ide u negativne kolone)
- `radar_x < @radar.width` - Nije desno od radara (ne prelazi širinu)

**Važno:** Ova provjera omogućava detekciju invadera koji su djelimično van ekrana (off-screen). 
Ako dio invadera pada van radara, samo se pikseli koji su unutar radara uzimaju u obzir.

---

### Ukupan broj mogućih matcheva

```ruby
total_possible_matches += 1
```

- Ako je piksel invadera unutar granica radara (i nije '-'), to je jedan mogući match
- Ovo broji koliko piksela invadera se nalazi na radaru i može se porediti
- Ova vrijednost će biti nazivnik kod izračuna ukupnog rezultata

---

### Čitanje piksela sa radara

```ruby
radar_pixel = @radar.grid[radar_y][radar_x]
```

- Uzima vrijednost piksela sa radara na izračunatoj poziciji
- Ovo je piksel koji će se porediti sa invader pikselom
- Može biti 'o', '-', ili neki drugi karakter

---

### Poređenje i brojanje matcheva

```ruby
actual_matches += 1 if invader_pixel == radar_pixel
```

- Ako se invader piksel i radar piksel poklapaju sa upisanim karakterima, povećava brojač stvarnih poklapanja

---

### Izračun rezultata matcha

```ruby
score = total_possible_matches.zero? ? 0.0 : actual_matches.to_f / total_possible_matches
```

- **Uvjetni (ternary) operator:** Ako je `total_possible_matches` nula, score je 0.0, inače se računa procenat
- `actual_matches.to_f / total_possible_matches` - Dijeli broj stvarnih poklapanja sa ukupnim mogućim poklapanjima
- `.to_f` konvertuje u float da bi dobili decimalni rezultat (npr. 0.85 za 85% match)
- **Rezultat:** Broj između 0.0 (nijedno poklapanje) i 1.0 (savršeno poklapanje)

---

### Vraćanje rezultata

```ruby
{ score: score, matches: actual_matches, total: total_possible_matches }
```

Metoda vraća hash sa tri vrijednosti:
- `score` - Procenat poklapanja (0.0 - 1.0)
- `matches` - Broj piksela koji se poklapaju
- `total` - Ukupan broj aktivnih piksela u invaderu

---

## Poziv metode

Metoda `calculate_match` se poziva iz metode `find_matches` (linija 20):

```ruby
(0..@radar.height - @invader.height).each do |offset_y|
  (0..@radar.width - @invader.width).each do |offset_x|
    result = calculate_match(offset_x, offset_y)

    if result[:score] >= @threshold
      matches << MatchResult.new(@invader.name, offset_x, offset_y, result[:score], off_screen: false)
    end
  end
end
```

1. Ulazak u petlju za broj linija, postavlja se trenutna vrijednost brojača iz rangea u offset_y
2. Ulazak u petlju za broj kolona, postavlja se trenutna vrijednost brojača iz rangea u offset_x
3. Poziv metode `calculate_match` dodjelom vrijednosti u `results`. Metodi se proslijeđuju trenutni offseti 
4. Provjera rezultata: Ako je score veći ili jednak thresholdu, rezultat se pusha u listu `matches` zajedno sa imenom detektovanog invadera i offsetima.

---