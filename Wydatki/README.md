# Wydatki (MySQL, Excel)

Baza danych do śledzenia domowych wydatków na podstawie paragonów. Celem projektu jest analiza miesięcznych kosztów i szukanie oszczędności, a jednocześnie pokazanie tych samych analiz wykonanych w różnych narzędziach: SQL, Excel, a w kolejnych etapach Power BI i Python.
Baza danych będzie na bieżąco aktualizowana i uzupełniana o nowe zakupy. Będzie to regularnie uzupełniany projekt, aby stale pracować z narzędziami typu Excel i SQL.

## Założenia projektowe

Świadomie zdecydowałem się przechowywać dane w jednej tabeli, bez podziału na kilka powiązanych tabel. Uważam, że przy skali domowych wydatków pełna normalizacja byłaby przerostem formy nad treścią. Takie rozwiązanie komplikowałoby wprowadzanie danych bez wyraźnych korzyści.


## Co zawiera projekt (stan na 03.10.2026)

- bazę danych MySQL z tabelą `zakupy`
- dane z paragonów (167 wierszy)
- połączenie Excela z bazą przez Power Query z automatycznym odświeżaniem danych

## Plany wobec projektu

Obecnie dane wprowadzam ręcznie lub z pomocą AI. Takie rozwiązanie jest czasochłonne i podatne na błędy,
np. literówki czy różne nazwy tego samego produktu. Planuje wprowadzić
**Automatyczny import danych**
  - zdjęcia paragonów: odczyt tekstu w Pythonie i zamiana na wiersze tabeli,
  - e-paragony z aplikacji sklepów (np. Lidl Plus),
  - potwierdzenia zamówień ze sklepów internetowych (np. zooplus).

## Struktura folderu

| Folder | Zawartość |
|---|---|
| [`SQL/`](./SQL) | skrypty tworzące bazę, dane i analizy |
| [`Excel/`](./Excel) | połączenie z bazą, analizy i dashboard w Excelu |

## Struktura tabeli `zakupy`

| Kolumna | Opis |
|---|---|
| `zakup_id` | identyfikator pozycji, nadawany automatycznie |
| `paragon_id` | numer paragonu, łączy produkty kupione razem |
| `sklep` | miejsce zakupu (opcjonalne) |
| `data` | data zakupu |
| `produkt` | nazwa produktu |
| `kategoria` | przeznaczenie zakupu, np. dom, koty |
| `podkategoria` | rodzaj produktu, np. jedzenie, chemia, alkohol |
| `kwota` | łączna cena pozycji z paragonu przed rabatem, np. 2 × 7,49 zł → 14.98 |
| `ilosc` | liczba sztuk lub waga |
| `jednostka` | `szt`, `kg` lub `l` |
| `rabat` | kwota rabatu (wartość dodatnia) |
| `zaplacono` | kolumna wyliczana: `kwota - rabat` |

## Zasady wprowadzania danych

- Dane przepisywane są wprost z paragonu: `kwota` to cena pozycji, a `rabat` to kwota rabatu.
- Produkty na wagę zapisywane są w kilogramach (np. `0.534`), a produkty paczkowane w sztukach, z gramaturą w nazwie. Wyjątki: karma dla kotów zapisywana jest w `kg`, a żwirek w `l`, aby porównywać cenę za kilogram i litr.
- Rabaty na cały paragon wpisywane są jako osobna pozycja „Rabat na paragon” z kwotą 0 i wartością rabatu w kolumnie `rabat`. Dzięki temu suma pozycji zgadza się z kwotą do zapłaty.
- Kolumna `zaplacono` wylicza się automatycznie i nie jest uzupełniana ręcznie.

## Excel
Excel pobiera dane bezpośrednio z bazy MySQL przez Power Query i odświeża je przy otwarciu pliku. Szczegóły w [`Excel/README.md`](./Excel/README.md).
