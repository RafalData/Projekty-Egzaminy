# Wydatki (MySQL)

Baza danych do śledzenia domowych wydatków na podstawie paragonów. Celem projektu jest analiza miesięcznych kosztów i szukanie oszczędności, a jednocześnie pokazanie tych samych analiz wykonanych w różnych narzędziach: SQL, Excel, a w kolejnych etapach Power BI i Python.
Baza danych będzie na bieżąco aktualizowana i uzupełniana o nowe zakupy. Będzie to regularnie uzupełniany projekt, aby stale pracować z narzędziami typu Excel i SQL.

## Stan projektu

- [x] Projekt i utworzenie bazy danych (MySQL)
- [x] Wprowadzanie danych z paragonów
- [ ] Analizy w SQL
- [ ] Analizy i dashboard w Excelu
- [ ] Dashboard w Power BI
- [ ] Automatyczny import e-paragonów (Python)

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
- Produkty na wagę zapisywane są w kilogramach (np. `0.534`), a produkty paczkowane w sztukach, z gramaturą w nazwie.
- Kolumna `zaplacono` wylicza się automatycznie i nie jest uzupełniana ręcznie.
