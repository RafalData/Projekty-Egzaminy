# Logistic_01: analiza operacji firmy transportowej w Excelu
 
Projekt analityczny na danych firmy transportowej (flota, kierowcy, przejazdy, tankowania, serwis, incydenty). Całość wykonuje w Excelu: Power Query, tabele przestawne, slicery i wykresy przestawne.
 
## Dane
 
- Źródło: [Logistics Operations Database](https://www.kaggle.com/datasets/yogape/logistics-operations-database)
- Dane są syntetyczne, co potwierdza opis autora w [repozytorium na GitHubie](https://github.com/Xyxtvs/logistics-operations-dataset) oraz niespójności logiczne w danych (np. `years_experience`).
- 7 tabel, okres 2022–2024, m.in. `trips` (85 410 przejazdów), `fuel_purchases` (196 442 tankowania), `trucks` (120 ciężarówek), `drivers` (150 kierowców), `safety_incidents` (170 incydentów).

## Narzędzia 
- **Power Query**: czyszczenie, łączenie i agregacja tabel (Merge, Group By, kolumny pomocnicze).
- **Tabele przestawne, slicery, wykresy przestawne**: analiza i prezentacja wyników.
- **Formuły Excela**: testy kontroli jakości (np. porównania z tolerancją).

## Cele projektu
1. Bezpieczeństwo i koszty szkód
   - Którzy kierowcy generują największe straty i jakie są najczęstsze przyczyny
2. Flota: spalanie, koszt na milę i obciążenie
   - Średnie spalanie na ciężarówkę i odchylenia od normy
   - Koszt ciężarówki na milę
   - Które ciężarówki mają najwięcej zleceń, a które najmniej (do odciążenia)
3. Jakość dostaw
   - Odsetek terminowych i opóźnionych dostaw
   - Średni czas oczekiwania na załadunek i rozładunek
4. Rentowność
   - Które trasy są najbardziej, a które najmniej dochodowe

## Proces pracy nad projektem
 
### 1. Kontrola jakości danych
 
#### 1.1 Typy danych
- Liczby z kropką jako separatorem dziesiętnym (np. 12629.26) były rozpoznawane jako tekst, więc zamieniłem separator z "." na ",".
- Daty i liczby zapisane jako tekst zmieniłem na właściwe.
- Błąd wynikał z błędnie ustawionego regionu podczas importu.
#### 1.2 Zgodność liczby wierszy ze źródłem
Porównałem ilość wierszy w plikach CSV z liczbą wierszy w tabelach Excel. Ilość wierszy zgodna.
 
#### 1.3 Braki danych (null'e, puste wartości, spacje)
W Power Query włączyłem Column quality, Column distribution i Column profile. Ustawiłem profilowanie na cały zbiór danych, bo domyślnie liczy tylko z pierwszych 1000 wierszy. W kolumnach tekstowych zastosowałem Trim, żeby wyciąć wartości składające się wyłącznie ze spacji.
 
- **trips**: kolumny `driver_id`, `truck_id`, `trailer_id` zawierały 2% pustych wartości. Reszta kolumn bez braków.
- **safety_incidents**: kolumny `truck_id`, `driver_id`, każda z nich zawierała po jednym wierszu z pustą wartością. Reszta kolumn bez braków.
- **fuel_purchases**: kolumny `truck_id`, `driver_id` zawierały 2% pustych wartości.
- **drivers**: kolumna `termination_date` zawiera 83% pustych wartości, lecz nie jest to błąd. Większość kierowców pracuje, co definiują właśnie te puste wartości.
Reszta tabel bez zarzutów. Podjąłem decyzję, aby tabele z pustymi wartościami zostawić bez zmian.
 
#### 1.4 Unikalność kluczy głównych
Sprawdziłem, czy każdy klucz główny ma taką samą liczbę wartości **Unique** i **Distinct**. To samo zrobiłem z kolumnami typu `vin`, `unit_number` i podobnymi. Nie mam zastrzeżeń, wszystko się zgadza.
 
#### 1.5 Spójność logiczna danych
- **drivers**: `years_experience` nie jest spójne z `hire_date` i `date_of_birth`. Test „doświadczenie ≤ wiek − 18" wykrył 16 niespójnych rekordów. Kolumny nie używam w analizach.
- **fuel_purchases**: sprawdziłem, czy `gallons × price_per_gallon = total_cost`, z tolerancją 0,01 USD.
- **driver_monthly_metrics**: `average_mpg` różni się od `total_miles / total_fuel_gallons`. W analizie spalania liczę sumę mil ÷ sumę galonów.
Na tym zakończyłem testy. Dalsze kontrole ograniczyłem do tych, które są potrzebne do analiz.
 
### 2. Określenie celów projektu
Zdefiniowałem pytania biznesowe i podzieliłem je na cztery segmenty: bezpieczeństwo i koszty szkód, flota, jakość dostaw oraz rentowność.
 
### 3. Analiza 1: bezpieczeństwo i koszty szkód
 
**Przygotowanie danych w Power Query**
- Zaimportowałem `safety_incidents`, ustawiłem typy danych i usunąłem kolumny niepotrzebne w tej analizie (`trip_id`, `truck_id`, `location_city`, `location_state`, `preventable_flag`).
- Dołączyłem `drivers` (Merge, Left Outer po `driver_id`), żeby mieć imię i nazwisko oraz status zatrudnienia, i połączyłem `first_name` z `last_name` w `driver_name`.
- Dodałem `Driver_fault` (1, gdy `at_fault_flag` = TRUE, inaczej 0).
- Rozdzieliłem opis incydentu po tekście „ incident involving " na `incident_severity` (ciężkość) i `incident_reason` (przyczyna).
- Wynik załadowałem jako tabelę `Incidents_analysis` (170 wierszy), źródło wszystkich pivotów.
**Tabele przestawne i wykresy**
- Kluczowe wskaźniki: liczba incydentów, suma i średni koszt, liczba incydentów z winy kierowcy.
- Top 10 kierowców według łącznego kosztu szkód (grupowanie po `driver_id`, bo nazwiska się powtarzają).
- Koszty według ciężkości i według przyczyny, miesięczne koszty szkód.
- Wykres słupkowy Top 10 i wykres liniowy kosztów miesięcznych.
- Cztery slicery (`incident_type`, `at_fault_flag`, `injury_flag`, `Years`) podłączone do wszystkich pivotów.
**Wnioski:** [do uzupełnienia, własnymi słowami na podstawie pulpitu]
 
### 4. Analiza 2: flota (w trakcie)
 
- Bazą jest tabela `trips` (jeden wiersz na przejazd, 85 410 wierszy) w zapytaniu `Fleet_Analysis`.
- Scalone (Left Outer): `trucks` (marka, rok modelu), `loads` (trasa, typ i waga ładunku, przychód, dopłaty), `trailers` (typ naczepy).
- Do scalenia: `routes`, `fuel_purchases` (najpierw agregacja po `trip_id`), `maintenance_records` (najpierw agregacja po `truck_id`), opcjonalnie `drivers`.
- Zasada: po każdym scaleniu liczba wierszy nadal wynosi 85 410, a tabele o innym poziomie szczegółowości najpierw agreguję (Group By), potem łączę.
- Spalanie liczę jako suma mil ÷ suma galonów (pole obliczeniowe w pivocie), nie jako średnią z kolumn `average_mpg`.
- Dane ładuję jako PivotTable Report bez Data Model.
**Wnioski:** [do uzupełnienia]
 
### 5. Analizy 3 i 4
Planowane: jakość dostaw oraz rentowność tras.
 
## Założenia i ograniczenia
 
- Dane są syntetyczne, część wartości jest logicznie niespójna (np. `years_experience`), więc nie opieram na nich wniosków.
- Ok. 2% przejazdów i tankowań nie ma `truck_id` lub `driver_id`. Wiersze te zostawiłem w danych, ale nie wchodzą do analiz per ciężarówka i per kierowca.
- W `trips` nie ma ciężarówek niewykorzystanych w okresie analizy (28 z 120 nie ma przejazdów). 
## Wnioski
 
[do uzupełnienia po zakończeniu analiz]
