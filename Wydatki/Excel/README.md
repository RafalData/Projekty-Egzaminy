# Wydatki: Excel

Te same analizy wydatków co w części SQL, wykonane w Excelu, aby pokazać dwa podejścia do jednego problemu.

## Import danych

- Dane pobierane są bezpośrednio z bazy MySQL przez Power Query (Dane → Pobierz dane → Z bazy danych) z użyciem sterownika MySQL Connector/NET.
- Zapytanie odświeża się automatycznie przy otwarciu pliku, więc nowe paragony dodane do bazy od razu pojawiają się w analizach.
- Połączenie wskazuje na lokalny serwer MySQL. Po pobraniu pliku z GitHuba widoczne są dane z ostatniego odświeżenia.

## Historia zmian

Pierwszą wersje importu opierałem na eksporcie tabeli `zakupy` z MySQL do pliku CSV. Następnie wrzuciłem plik poprzez Power Query (Dane → Z pliku tekstowego/CSV).
Jednak to rozwiązanie było trochę uciązliwe, każda aktualizacja wymagała ponownego eksportu. 
Po odkryciu możliwości bezpośredniego połączenia z bazą zastąpiłem ten krok połączeniem przez Power Query, co wyeliminowało ręczne przenoszenie plików.
