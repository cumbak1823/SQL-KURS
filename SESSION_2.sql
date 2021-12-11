/*===================================================
													  SELECT
===================================================*/
	/* tracks tablosundaki track isimlerini (name) sorgulayınız */
	SELECT name FROM tracks;
	
	/* tracks tablosundaki besteci(Composer) ve şarkı isimlerini (name) sorgulayınız*/
	SELECT Composer,name FROM tracks;
	
	/*tracks tablosundaki tüm bilgileri sorgulayınız*/
	SELECT * FROM tracks;
	
	
/*===================================================
													DISTINCT
===================================================*/
	/*tracks tablosundaki composer bilgileri sorgulayınız (TEKRARLI OLABİLİR)*/
	SELECT Composer FROM tracks;
		
	/*tracks tablosundaki composer bilgileri sorgulayınız (TEKRARSIZ) */
	SELECT DISTINCT Composer FROM tracks;
	
	/*tracks tablosundaki AlbumId ve MediaTypeId bigilerini TEKRARSIZ olarak 
	sorgulayınız */
	SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;
		
/*===================================================
														WHERE
====================================================*/

	/*Composer'ı Jimi Hendrix olan şarkıları sorgulayiniz*/
	SELECT name 
	FROM tracks 
	WHERE Composer='Jimi Hendrix';
	
	/* invoices tablosunda Total değeri 10$ dan büyük olan faturaların tüm bilgilerini 
	sorgulayiniz */
	SELECT * 
	FROM invoices 
	WHERE total>10;
	
	SELECT InvoiceId, CustomerId, InvoiceDate
	FROM invoices 
	WHERE total>10;

	/*===================================================
														LIMIT
====================================================*/
	/* invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın InvoiceId, 
	InvoiceDate ve total bilgilerini sorgulayiniz */
	SELECT InvoiceId, InvoiceDate
	FROM invoices 
	WHERE total>10
	LIMIT 4;
-- BURADA 4 ile ilk 4 sonucu aldık. Eğer limit olmasaydı toplam 64 sonucu da görecektik.--

/*===================================================
														ORDER BY
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtları Total değerine göre 
	ARTAN sırada sıralayarak sorgulayiniz */
	
	SELECT *
	FROM invoices
	WHERE total > 10
	ORDER BY  total ASC;
/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
	(InvoiceDate) 	en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 

	SELECT *
	FROM invoices
	WHERE total > 10
	ORDER BY InvoiceDate DESC
	LIMIT 10;	
	
	
	
	/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
	göre  AZALAN sırada listeyiniz */
	SELECT *
	FROM invoices
	WHERE  NOT BillingCountry = "USA" 
	ORDER BY total DESC;
	

-- yukardaki ornegin aynisi
	SELECT *
	FROM invoices
	WHERE  BillingCountry <> "USA" 
	ORDER BY total DESC;


/*===================================================
														OR/NOT KULLANIMI
====================================================*/	
	
/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
	InvoiceId sırasına göre artan sırada listeyiniz */ 

	SELECT *
	FROM invoices
	WHERE   BillingCountry = "USA" OR BillingCountry = "Germany"
	ORDER BY InvoiceId ASC;
	
	
/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
	tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */

SELECT *
FROM invoices
WHERE 	InvoiceDate >=  "2012-01-01" AND InvoiceDate <=  "2013-01-02 00:00:00" ;
--Simdi 84 kayit oldu.


/*===================================================================
														BETWEEN OPERATOR
														(NOT BETWEEN)
It is used for comparriosn in WHERE clauses. It is a comparison operator. 
You can choose it to test of a value is in a range of values.
If the value is in the specified range 													

===================================================================*/

/* Invoices tablosunda fatura tarihi(inviocedate) 2009 ile 2011 tarihleri arasindaki en yeni faturayi listeleyen sorgu yaziniz */

SELECT *
FROM invoices
WHERE 	InvoiceDate  BETWEEN   "2009-01-01" AND  "2011-12-31"
ORDER BY InvoiceDate DESC
LIMIT 1;
-- en yeni dedigi icin DESC yazdik. En ustteki icin limit yazdik.

/*===================================================================
														IN OPERATOR
														(NOT IN)
===================================================================*/

/* customers tablosunda Belgium, Norway veya  Canada  ülkelerinden sipariş veren
		müşterilerin FirstName ve LastName bilgilerini listeyiniz	*/
SELECT FirstName,LastName,country
FROM customers
WHERE country IN("Belgium", "USA","Canada","Norway");

/*===================================================================
														LIKE OPERATOR
														(NOT IN)
===================================================================*/

SELECT FirstName,LastName,country
FROM customers
WHERE FirstName LIKE("h%h");

/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
	listeyen sorguyu yazınız*/
	
    SELECT name, Composer
	FROM tracks
	where Composer LIKE '%Bach';
	
	
	/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
	listeyen sorguyu yazınız*/
	
	SELECT*
	FROM albums
	WHERE Title LIKE "%Greatest%";
	
	/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
	aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/
	
SELECT *
FROM invoices
WHERE InvoiceDate LIKE('201_-02-%');
	