# The Berka Dataset

Repozytorium stworzone by przedstawić pracę nad projektem The Berka Dataset



## Dane
<img width="338" height="268" alt="image" src="https://github.com/user-attachments/assets/1217a3df-cc71-45f8-90b4-0eb6d1cc94f0" />

Źródło: https://www.kaggle.com/datasets/marceloventura/the-berka-dataset

zanonimizowane dane czeskiego banku z lat 1993–1998: 
- 4 500 rachunków, 
- 682 kredyty, 
- ponad milion transakcji.

Dane zostały przetłumaczone z języka czeskiego na język angielski z pomocą AI.

Wszystkie zapytania i analizy w folderze `Scripts` są mojego autorstwa.



### Ograniczenia danych

- Dane nie zawierają informacji o indywidualnych zarobkach klientów. Wynagrodzenie to średnia dla regionu, a wpływy na rachunek to tylko przybliżenie dochodu.
- Rachunek może mieć dwóch użytkowników, więc wpływy to raczej dochód gospodarstwa domowego niżeli jednej osoby.
- Grupa kredytów niespłacanych jest mała (76 umów), więc pojedyncze przypadki mogą wyraźnie przesuwać średnią.



## Analizy

1. [01_kredyty_niesplacane.sql](https://github.com/RafalData/Projekty-Egzaminy/blob/main/The%20Berka%20Dataset/Scripts/01_kredyty_niesplacane.sql)
2. [02_kwoty_okresy_raty.sql](https://github.com/RafalData/Projekty-Egzaminy/blob/main/The%20Berka%20Dataset/Scripts/02_kwoty_okresy_raty.sql)
3. [03_raty_a_wynagrodzenia.sql](https://github.com/RafalData/Projekty-Egzaminy/blob/main/The%20Berka%20Dataset/Scripts/03_raty_a_wynagrodzenia.sql)
4. [04_raty_a_wplywy_na_rachunek.sql](https://github.com/RafalData/Projekty-Egzaminy/blob/main/The%20Berka%20Dataset/Scripts/04_raty_a_wplywy_na_rachunek.sql)



## Wnioski



### 1. Kredyty niespłacane (statusy B i D) 
<img width="824" height="67" alt="image" src="https://github.com/user-attachments/assets/3306dbc9-342a-4fa0-9f35-02934c8e1e91" />

Kredyty niespłacane (statusy B i D)  stanowią 11,14% wszystkich umów, ale aż 15,09% pożyczonej kwoty.
Oznacza to, że kredyty niespłacane są średnio wyższe niż spłacane terminowo. 
Warto sprawdzić, czym jeszcze różnią się obie grupy.


### 2. Kwoty, okresy i raty
<img width="1220" height="66" alt="image" src="https://github.com/user-attachments/assets/3dc6d3a6-3e2c-40d1-8574-97b9e6eda32c" />

Na podstawie danych można zauważyć, że kredyty niespłacane są zawarte średnio na dużo wyższą kwotę (ok. 40%) niż te spłacane.
Dodatkowo okres kredytowania jest niemalże identyczny, co powoduje, że miesięczna rata jest wyższa o około 30%.


### 3. Raty a wynagrodzenia
<img width="962" height="70" alt="image" src="https://github.com/user-attachments/assets/948db73c-dbdd-4fbf-9f97-182eb5fb1a7a" />

Baza danych nie zawiera pewnej informacji o zarobkach klientów. Możemy określić wyłącznie wpływy na konto, co nie daje jednoznacznej informacji o zarobkach.
Określiłem więc średnią i medianę przeciętnego wynagrodzenia w regionie klienta.
Jak możemy zauważyć, nie odstają one znacząco między statusem kredytów.
Ale można zauważyć wyraźną różnicę między udziałem raty w pensji per status.
W kredytach niespłacanych możemy zauważyć, że rata pochłania średnio o 14 punktów procentowych więcej przeciętnej pensji w regionie.
Różnica nie wynika z niższych zarobków w regionie, tylko z wyższej raty.


### 4. Raty a wpływy na rachunek
<img width="1096" height="67" alt="image" src="https://github.com/user-attachments/assets/44e86e7d-7ae8-4920-8847-7e47b91eddb0" />

Jak widać, różnica średniej wpływów między grupami jest marginalna.
Mediana za to jest wyższa u grupy niespłacającej zadłużenia.
Ale można zauważyć, że stosunek raty do średnich wpływów na konto jest o 11 punktów procentowych wyższy u grupy niespłacającej.
Mediana jednak różni się zaledwie o półtora punktu procentowego.
Można zauważyć, że u części kredytobiorców z grupy niespłacającej rata pochłania dużą część wpływów.
Ciężko jednoznacznie stwierdzić przyczynę niespłacania zadłużenia.
