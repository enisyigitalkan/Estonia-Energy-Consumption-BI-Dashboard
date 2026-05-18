USE Enerji_Operasyonu;
GO

ALTER VIEW vw_Enerji_Master AS
SELECT 
    t.datetime AS Tarih_Saat,
    t.county AS Ilce_Kodu,
    t.is_business AS Ticari_Mi,
    t.product_type AS Sozlesme_Tipi,
    t.is_consumption AS Tuketim_Mi,
    t.target AS Hedef_Miktar,
    c.installed_capacity AS Gunes_Paneli_Gucu,
    c.eic_count AS Abone_Sayisi,
    e.euros_per_mwh AS Elektrik_Fiyati_Euro,
    g.lowest_price_per_mwh AS Gaz_Taban_Fiyati_Euro
FROM train AS t
LEFT JOIN client AS c
    ON t.county = c.county 
    AND t.is_business = c.is_business 
    AND t.product_type = c.product_type
    AND CAST(t.datetime AS DATE) = c.date 
LEFT JOIN electricity_prices AS e
    ON t.datetime = e.forecast_date
LEFT JOIN gas_prices AS g
    ON CAST(t.datetime AS DATE) = CAST(g.forecast_date AS DATE);