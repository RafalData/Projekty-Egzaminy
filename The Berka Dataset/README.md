# The Berka Dataset

Repozytorium stworzone by przedstawić pracę nad projektem The Berka Dataset



## Dane

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



1\. \[01\_kredyty\_niesplacane.sql](Scripts/01\_kredyty\_niesplacane.sql)

2\. \[02\_kwoty\_okresy\_raty.sql](Scripts/02\_kwoty\_okresy\_raty.sql)

3\. \[03\_raty\_a\_wynagrodzenia.sql](Scripts/03\_raty\_a\_wynagrodzenia.sql)

4\. \[04\_raty\_a\_wplywy\_na\_rachunek.sql](Scripts/04\_raty\_a\_wplywy\_na\_rachunek.sql)



\## Wnioski



\### 1. Kredyty niespłacane (statusy B i D) 

<img width="831" height="74" alt="image" src="https://github.com/user-attachments/assets/0a252c75-5a0d-4826-9d78-cb63b012fe44" />



Kredyty niespłacane (statusy B i D)  stanowią 11,14% wszystkich umów, ale aż 15,09% pożyczonej kwoty.

Oznacza to, że kredyty niespłacane są średnio wyższe niż spłacane terminowo. 

Warto sprawdzić, czym jeszcze różnią się obie grupy.



\### 2. Kwoty, okresy i raty

<img width="1231" height="76" alt="image" src="https://github.com/user-attachments/assets/16a9864b-9596-4077-9178-c0c85d36f37f" />



Na podstawie danych można zauważyć, że kredyty niespłacane są zawarte średnio na dużo wyższą kwotę (ok. 40%) niż te spłacane.

Dodatkowo okres kredytowania jest niemalże identyczny, co powoduje, że miesięczna rata jest wyższa o około 30%.





\### 3. Raty a wynagrodzenia

<img width="957" height="70" alt="image" src="https://github.com/user-attachments/assets/f74566ae-adc9-40f2-a4dd-6c848c0a8ddb" />



Baza danych nie zawiera pewnej informacji o zarobkach klientów. Możemy określić wyłącznie wpływy na konto, co nie daje jednoznacznej informacji o zarobkach.

Określiłem więc średnią i medianę przeciętnego wynagrodzenia w regionie klienta.

Jak możemy zauważyć, nie odstają one znacząco między statusem kredytów.

Ale można zauważyć wyraźną różnicę między udziałem raty w pensji per status.

W kredytach niespłacanych możemy zauważyć, że rata pochłania średnio o 14 punktów procentowych więcej przeciętnej pensji w regionie.

Różnica nie wynika z niższych zarobków w regionie, tylko z wyższej raty.



\### 4. Raty a wpływy na rachunek

<img width="1109" height="75" alt="image" src="https://github.com/user-attachments/assets/a97fb835-7d06-44ad-abb2-de860217e7f8" />



Jak widać, różnica średniej wpływów między grupami jest marginalna.

Mediana za to jest wyższa u grupy niespłacającej zadłużenia.

Ale można zauważyć, że stosunek raty do średnich wpływów na konto jest o 11 punktów procentowych wyższy u grupy niespłacającej.

Mediana jednak różni się zaledwie o półtora punktu procentowego.

Można zauważyć, że u części kredytobiorców z grupy niespłacającej rata pochłania dużą część wpływów.

Ciężko jednoznacznie stwierdzić przyczynę niespłacania zadłużenia.



