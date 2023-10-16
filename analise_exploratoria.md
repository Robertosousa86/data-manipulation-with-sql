# Entendimento do volume de veículos e Análise exploratória

## Extração de dados

### Consulta de todos os veículos registrados no ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	'Total' AS tipo_veiculo,
	ano,
	SUM(total) AS Valor
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004;

```

#### Resultado:

|             Fonte             | tipo_veiculo | ano  |    Valor    |
| :---------------------------: | :----------: | ---- | :---------: |
| denatran_frota_municipio_tipo |    Total     | 2004 | 455,815,123 |

### Consulta do total de meses onde houve registro de veículos no ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	COUNT(DISTINCT mes) AS total_meses,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004;
```

#### Resultado:

|             Fonte             | total_meses | ano  |
| :---------------------------: | :---------: | :--: |
| denatran_frota_municipio_tipo |     12      | 2004 |

### Consulta da média de resgistros mensais do ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	ROUND(AVG(total_registros), 2) AS media_registros_por_mes,
	'2004' AS ano
FROM
	(
	SELECT
		mes,
		COUNT(*) AS total_registros
	FROM
		denatran_frota_municipio_tipo
	WHERE
		ano = 2004
	GROUP BY
		mes
    );
```

#### Resultado:

|             Fonte             | media_registros_por_mes | ano  |
| :---------------------------: | :---------------------: | :--: |
| denatran_frota_municipio_tipo |        5,471.92         | 2004 |

### Consulta da mediana de resgistros mensais do ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	ROUND(MEDIAN(total_registros), 2) AS mediana_registros_por_mes,
	'2004' AS ano
FROM
	(
	SELECT
		mes,
		COUNT(*) AS total_registros
	FROM
		denatran_frota_municipio_tipo
	WHERE
		ano = 2004
	GROUP BY
		mes
    );

```

#### Resultado:

|             Fonte             | mediana_registros_por_mes | ano  |
| :---------------------------: | :-----------------------: | :--: |
| denatran_frota_municipio_tipo |          5,473.0          | 2004 |

### Consulta do maior valor de resgistros de veículos no ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	mes,
	COUNT(*) AS total_registros,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004
GROUP BY
	mes
HAVING
	COUNT(*) = (
	SELECT
		MAX(count)
	FROM
		(
		SELECT
			COUNT(*) AS count
		FROM
			denatran_frota_municipio_tipo
		WHERE
			ano = 2004
		GROUP BY
			mes));

```

#### Resultado:

|             Fonte             | mes | total_registros | ano  |
| :---------------------------: | :-: | :-------------: | :--: |
| denatran_frota_municipio_tipo | 12  |      5,474      | 2004 |

### Consulta do menor valor de resgistros de veículos no ano de **2004** na tabela **denatran_frota_municipio_tipo**:

```sql
SELECT
	'denatran_frota_municipio_tipo' AS Fonte,
	mes,
	COUNT(*) AS total_registros,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004
GROUP BY
	mes
HAVING
	COUNT(*) = (
	SELECT
		MIN(count)
	FROM
		(
		SELECT
			COUNT(*) AS count
		FROM
			denatran_frota_municipio_tipo
		WHERE
			ano = 2004
		GROUP BY
			mes));

```

#### Resultado:

|             Fonte             | mes | total_registros | ano  |
| :---------------------------: | :-: | :-------------: | :--: |
| denatran_frota_municipio_tipo |  1  |      5,470      | 2004 |
| denatran_frota_municipio_tipo |  2  |      5,470      | 2004 |
| denatran_frota_municipio_tipo |  3  |      5,470      | 2004 |
| denatran_frota_municipio_tipo |  4  |      5,470      | 2004 |

## Análise por tipo de veículo e região do Brasil

### Consulta da soma dos automóveis por estado, agrupados na região Sudeste

```sql
SELECT
	sigla_uf,
	SUM(automovel) AS total_automoveis,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004
	AND sigla_uf IN ('ES', 'MG', 'SP', 'RJ')
GROUP BY
	sigla_uf;
```

#### Resultado:

| sigla_uf | total_automoveis | ano  |
| :------: | :--------------: | :--: |
|    ES    |    4,547,824     | 2004 |
|    MG    |    29,706,162    | 2004 |
|    RJ    |    27,395,493    | 2004 |
|    SP    |   109,817,363    | 2004 |

### Consulta da soma de todos os automóveis registrados em **2004** agrupados na região Sudeste

```sql
SELECT
	'Sudeste' AS Regiao,
	SUM(automovel) AS total_automoveis,
	2004 AS ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2004
	AND sigla_uf IN ('ES', 'MG', 'SP', 'RJ')
GROUP BY
	ano;
```

#### Resultado:

| Regiao  | total_automoveis | ano  |
| :-----: | :--------------: | :--: |
| Sudeste |   171,466,842    | 2004 |

### Cálculo do aumento de automóveis ano a ano no Estado de São Paulo

```sql
SELECT
	ano,
	SUM(automovel) AS total_automoveis,
	SUM(automovel) - LAG(SUM(automovel),
	1,
	0) OVER (
ORDER BY
	ano) AS aumento_anual
FROM
	denatran_frota_municipio_tipo
WHERE
	sigla_uf = 'SP'
GROUP BY
	ano
ORDER BY
	ano;
```

#### Resultado:

| ano  | total_automoveis | aumento_anual |
| :--: | :--------------: | :-----------: |
| 2004 |   109,817,363    |  109,817,363  |
| 2005 |   114,946,882    |   5,129,519   |
| 2006 |   120,964,039    |   6,017,157   |
| 2007 |   128,202,777    |   7,238,738   |
| 2008 |   137,211,454    |   9,008,677   |
| 2009 |   146,031,994    |   8,820,540   |
| 2010 |   155,487,437    |   9,455,443   |
| 2011 |   164,978,810    |   9,491,373   |
| 2012 |   174,257,943    |   9279,133    |
| 2013 |   183,492,704    |   9,234,761   |
| 2014 |   192,119,317    |   8,626,613   |
| 2015 |   199,334,640    |   7,215,323   |
| 2016 |   204,737,284    |   5,402,644   |
| 2017 |   209,966,189    |   5,228,905   |
| 2018 |   215,947,444    |   5,981,255   |
| 2019 |   222,212,735    |   6,265,291   |
| 2020 |   227,200,216    |   4,987,481   |
| 2021 |    57,428,771    | -169,771,445  |

\* Observação: O ano de 2021 teve apenas registros em 3 meses

### Soma do total de veículos agrupados pela categoria "veículos de passeio" no estado de São Paulo no ano de **2020**

```sql
SELECT
	'Veiculos_de_Passeio' AS categoria,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario) AS total_veiculos,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND
	sigla_uf = 'SP';

```

#### Resultado:

|      categoria      | total_veiculos | ano  |
| :-----------------: | :------------: | :--: |
| Veiculos_de_Passeio |  267,937,319   | 2020 |

### Soma do total de veículos agrupados pela categoria "motocicletas" no estado de São Paulo no ano de **2020**

```sql
SELECT
	'Motocicletas' AS categoria,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS total_veiculos,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND
	sigla_uf = 'SP';
```

#### Resultado:

| categoria    | total_veiculos | ano  |
| ------------ | :------------: | :--: |
| Motocicletas |   19,372,717   | 2020 |

### Soma do total de veículos agrupados pela categoria "Caminhões" no estado de São Paulo no ano de **2020**

```sql
SELECT
	'Caminhões' AS categoria,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma ) AS total_veiculos,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND
	sigla_uf = 'SP';
```

#### Resultado

| categoria | total_veiculos | ano  |
| :-------: | :------------: | :--: |
| Caminhões |   14,453,004   | 2020 |

### Soma do total de veículos agrupados pela categoria "Transporte coletivo" no estado de São Paulo no ano de **2020**

```sql
SELECT
	'Transporte_coletivo' AS categoria,
	SUM(onibus + microonibus + bonde) AS total_veiculos,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND
	sigla_uf = 'SP';
```

#### Resultado

|      categoria      | total_veiculos | ano  |
| :-----------------: | :------------: | :--: |
| Transporte_coletivo |   58,553,920   | 2020 |

### Soma do total de veículos agrupados pela categoria "Transporte coletivo" no estado de São Paulo no ano de **2020**

```sql
SELECT
	'Tratores' AS categoria,
	SUM(tratoresteira + tratorrodas ) AS total_veiculos,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND
	sigla_uf = 'SP';
```

#### Resultado

| categoria | total_veiculos | ano  |
| :-------: | :------------: | :--: |
| Tratores  |    207,966     | 2020 |

### Consulta da soma dos automóveis por estado, agrupados na região Nordeste

```sql
SELECT
	sigla_uf,
	SUM(automovel) AS total_automoveis,
	ano
FROM
	denatran_frota_municipio_tipo
WHERE
	ano = 2020
	AND sigla_uf IN ('AL', 'BA', 'CE', 'MA', 'PE', 'PB', 'PI', 'SE', 'RN' )
GROUP BY
	sigla_uf;
```

#### Resultado:

| sigla_uf | total_automoveis | ano  |
| :------: | :--------------: | :--: |
|    AL    |    4,574,326     | 2020 |
|    BA    |    23,273,448    | 2020 |
|    CE    |    14,528,313    | 2020 |
|    MA    |    5,606,002     | 2020 |
|    PB    |    6,765,968     | 2020 |
|    PE    |    16,631,450    | 2020 |
|    PI    |    4,626,559     | 2020 |
|    RN    |    7,041,212     | 2020 |
|    SE    |    4,158,893     | 2020 |
