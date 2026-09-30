SET @paragon = 1, @sklep = 'Lidl', @data = '2026-09-30';
insert into zakupy(
paragon_id, sklep, data, produkt, kategoria, podkategoria, kwota, ilosc, jednostka, rabat)
values
(@paragon, @sklep, @data, 'Pomidory susz.paski'	,'dom','jedzenie'		,14.98,2	,'szt',1.50),
(@paragon, @sklep, @data, 'reklamówka'			,'dom','torba zakupowa'	,0.79 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Makaron tagliatelle'	,'dom','jedzenie'		,5.49 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Jabłka Ligol'		,'dom','jedzenie'		    ,2.66 ,0.534,'kg' ,0),
(@paragon, @sklep, @data, 'Black Napój Energ.'	,'dom','energetyk'	,5.98 ,2	,'szt',0),
(@paragon, @sklep, @data, 'Szpinak baby'		,'dom','jedzenie'		    ,5.99 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Uniflora Kiełki'		,'dom','jedzenie'		  ,4.29 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Szczypiorek'			,'dom','jedzenie'		    ,2.99 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Makaron Linguine'	,'dom','jedzenie'		  ,5.49 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Lubella Spaghetti'	,'dom','jedzenie'		  ,4.49 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Bajgel z makiem'		,'dom','jedzenie'		  ,3.38 ,2	,'szt',0),
(@paragon, @sklep, @data, 'Rzodkiewki pęczek'	,'dom','jedzenie'		  ,2.69 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Garage Hard Piwo'	,'dom','alkohol'		  ,5.99 ,1	,'szt',0),
(@paragon, @sklep, @data, 'Polędwiczki kurczak'	,'dom','jedzenie'		,11.99,1	,'szt',0),
(@paragon, @sklep, @data, 'Sushi Tokyo'			,'dom','jedzenie'		,7.49 ,1	,'szt',0);
