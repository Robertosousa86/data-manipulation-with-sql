# Entendimento do volume de veículos e Análise exploratória

## Estatísticas básicas por região

### Estatísticas **Região Sul**

- View da [regiao_sul](views_sql/view_regiao_sul.sql)

#### Categoria "Veículos de Passeio"

##### Aumento anual

```sql
SELECT
	'Região Sul' AS Fonte,
	ano,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario)
	AS 'Veículos de Passeio',
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario)
	- LAG(SUM(automovel + caminhonete + camioneta + sidecar + utilitario),
	1,
	0) OVER (
ORDER BY
	ano) AS 'Aumento anual'
FROM
	regiao_sul
WHERE
	ano BETWEEN 2004 AND 2020
GROUP BY
	ano
ORDER BY
	ano;
```

#### Resultado

|   Fonte    | ano  | Veículos de Passeio | Aumento anual |
| :--------: | :--: | :-----------------: | :-----------: |
| Região Sul | 2004 |     72,794,201      |  72,794,201   |
| Região Sul | 2005 |     77,389,693      |   4,595,492   |
| Região Sul | 2006 |     81,679,083      |   4,289,390   |
| Região Sul | 2007 |     86,543,450      |   4,864,367   |
| Região Sul | 2008 |     92,876,510      |   6,333,060   |
| Região Sul | 2009 |     99,662,273      |   6,785,763   |
| Região Sul | 2010 |     107,152,287     |   7,490,014   |
| Região Sul | 2011 |     115,439,793     |   8,287,506   |
| Região Sul | 2012 |     124,196,210     |   8,756,417   |
| Região Sul | 2013 |     133,449,776     |   9,253,566   |
| Região Sul | 2014 |     142,384,034     |   8,934,258   |
| Região Sul | 2015 |     149,665,120     |   7,281,086   |
| Região Sul | 2016 |     154,690,489     |   5,025,369   |
| Região Sul | 2017 |     159,383,882     |   4,693,393   |
| Região Sul | 2018 |     164,836,601     |   5,452,719   |
| Região Sul | 2019 |     170,845,919     |   6,009,318   |
| Região Sul | 2020 |     176,457,568     |   5,611,649   |

#### Percentual de aumento entre **2004 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2004-2020' AS 'Ano Referência',
	'Veículos de Passeio' AS Categoria,
	ROUND(((SUM(total) - (
        SELECT SUM(total)
        FROM regiao_sul
        WHERE ano = 2004)) * 100.0) /
        (SELECT SUM(total)
        FROM regiao_sul
        WHERE ano = 2004), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

|   Fonte    | Ano Referência |      Categoria      | Percentual de Aumento |
| :--------: | :------------: | :-----------------: | :-------------------: |
| Região Sul |   2004-2020    | Veículos de Passeio |         152.6         |




5681373

SELECT
	'Região Norte' AS 'Fonte',
	ano,
	mes,
	automovel AS 'Total automóveis',
	automovel - (
	SELECT
		SUM(automovel)
	FROM
		detran_frota_br_uf
	WHERE
		ano = dfu.ano
		AND sigla_uf = dfu.sigla_uf
		AND mes = 1
    ) AS 'Variante'
FROM
	detran_frota_br_uf dfu
WHERE
	ano = 2004
	AND sigla_uf = 'AC'
	AND mes BETWEEN 1 AND 2
ORDER BY
	ano,
	mes;



SELECT
	'Região Norte' AS 'Fonte',
	ano,
	mes,
	automovel AS 'Total automóveis',
	automovel - LAG(automovel,
	1,
	0) OVER (PARTITION BY ano,
	sigla_uf
ORDER BY
	mes) AS 'Diferença'
FROM
	detran_frota_br_uf
WHERE
	ano = 2004
	AND sigla_uf = 'AC'
	AND mes BETWEEN 1 AND 12
ORDER BY
	ano,
	mes;


SELECT
	sigla_uf AS 'Sigla UF',
	veiculo_trabalho AS 'Veículo de trabalho',
	mes,
	ano
FROM
	regiao_sul_teste
WHERE
	(ano = 2015
		OR ano = 2020)
	
