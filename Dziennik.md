Analiza Frytek Różnych Sieci Fast Food

Dziennik:
[04.09.2026 20:54] - Rozpocząłem publiczny projekt. Przygotowuję wstępną strukturę pod import danych z różnych źródeł (URL).

[09.09.2026 20:54] - Duży postęp w strukturze ETL. Stworzyłem architekturę, która pobiera i tnie surowy HTML na bloki (Nutrition, Ingredients, Allergens, OilFryer) dla każdej sieci. Kilka sieci (Five Guys, KFC, Arby's) ma dwa warianty frytek (klasyczny oraz sezonowany/curly), podjąłem decyzję o pominięciu sezonowych/curly alternatyw, bierzemy pod uwagę wyłącznie klasyczne. Muszę znaleźć rozwiązanie, żeby liczba składników per sieć była fair. Nutrition sprowadzone do jednolitej porcji (100g).

[09.09.2026 21:30] - Praca nad tabelą Ingredients. 
Ustalenia:
Warianty sezonowane (Five Guys Cajun, KFC Seasoning, Arby's Crinkle). Podjąłem decyzję o uproszczenie zakresu i skupieniu się na podstawowym wariancie frytek.
Odkryłem, że "seasoning" w danych oznacza dwie różne rzeczy zależnie od kontekstu:
(1) nazwę własną konkretnej przyprawy marki (np. "wingstop fry seasoning", "bojangles seasoning blend") 
(2) faktyczną listę enumeracyjną poprzedzoną dwukropkiem (np. "seasoning: salt, pepper, canola oil") — tu usuwam prefiks i rozbijam na osobne składniki
Zamiast automatycznego podziału przecinkiem, poprawię listę ręcznie - część wpisów zawiera przecinki/ukośniki będące częścią nazwy własnej (np. "salt / fry 'n steakburger™ seasoning"), a nie prawdziwą enumeracją składników.
Zidentyfikowany osobny problem: konstrukcje typu "beef tallow / canola oil blend" lub "canola or soybean oil (or blend)" oznaczają niepewność/zmienność (jeden ALBO drugi, zależnie od lokalizacji), nie jednoczesną obecność obu składników jak w liście przecinkowej. Decyzja: nie rozbijać tych wpisów jak zwykłej listy, żeby nie sugerować fałszywej pewności co do jednoczesnego użycia obu.
Odkryłem że tabela Chains ma problem z kolumną Established. Dwie restauracje posiadają podwójny rok utworzenia. Problem powoduje połączenie dwóch restauracji w jedną. Podjąłem decyzję aby w tabeli znalazły się 2 kolumny z datami Established_primary oraz Established_secondary.
Ukończone tabele: Main, Nutrition, Chains, Allergens.
Tabela Oils wymaga ręcznej standaryzacji.             
