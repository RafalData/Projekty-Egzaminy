# Wydatki

Baza danych do śledzenia domowych wydatków na podstawie paragonów. Celem projektu jest analiza miesięcznych kosztów i szukanie oszczędności, a jednocześnie pokazanie tych samych analiz wykonanych w różnych narzędziach: SQL, Excel, a w kolejnych etapach Power BI i Python.

#### Praca na MySQL

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
| `kwota` | cena z paragonu przed rabatem |
| `ilosc` | liczba sztuk lub waga |
| `jednostka` | `szt`, `kg` lub `l` |
| `rabat` | kwota rabatu (wartość dodatnia) |
| `zaplacono` | kolumna wyliczana: `kwota - rabat` |

## Zasady wprowadzania danych

- Dane przepisywane są wprost z paragonu: `kwota` to cena pozycji, a `rabat` to kwota rabatu.
- Produkty na wagę zapisywane są w kilogramach (np. `0.534`), a produkty paczkowane w sztukach, z gramaturą w nazwie.
- Kolumna `zaplacono` wylicza się automatycznie i nie jest uzupełniana ręcznie.

## Plany: Excel

Te same analizy, które powstaną w SQL, zostaną wykonane w Excelu, aby pokazać dwa podejścia do jednego problemu:

- **Power Query**: import danych z bazy lub pliku CSV oraz przekształcenia (np. kolumna z miesiącem, typy danych),
- **funkcje**: `SUMA.WARUNKÓW`, `XLOOKUP`, `FILTRUJ`, `SORTUJ`,
- **tabele przestawne** z fragmentatorami,
- **dashboard** z wykresami podsumowującymi wydatki.

Planowane porównanie:

| Pytanie | SQL | Excel |
|---|---|---|
| Wydatki w miesiącu według kategorii | `GROUP BY` + `SUM` | tabela przestawna |
| Kwota zaoszczędzona na rabatach | `SUM(rabat)` | `SUMA.WARUNKÓW` |
| Najdroższe zakupy | `ORDER BY` + `LIMIT` | `SORTUJ` + `WEŹ` |

## Jak uruchomić

1. Uruchom `SQL/01_schemat.sql`. Skrypt utworzy bazę `wydatki` i tabelę `zakupy`.
2. Uruchom `SQL/02_dane.sql`, aby wczytać przykładowe dane.
