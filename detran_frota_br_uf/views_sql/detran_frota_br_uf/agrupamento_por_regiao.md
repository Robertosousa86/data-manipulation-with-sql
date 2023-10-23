# Entendimento do volume de veículos e Análise exploratória

## Extração de dados por região

### Agrupando veículos por categorias na **Região Sul** entre **2015 e 2020**

- View da [regiao_sul](views_sql/view_regiao_sul.sql)

#### Categoria "Veículos de Passeio"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	automovel_passeio AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado:

| sigla_uf |   Fonte    |      Categoria      |   Total   | ano  |
| :------: | :--------: | :-----------------: | :-------: | :--: |
|    PR    | Região Sul | Veículos de Passeio | 4,109,097 | 2015 |
|    PR    | Região Sul | Veículos de Passeio | 4,690,887 | 2020 |
|    RS    | Região Sul | Veículos de Passeio | 3,960,938 | 2015 |
|    RS    | Região Sul | Veículos de Passeio | 4,528,209 | 2020 |
|    SC    | Região Sul | Veículos de Passeio | 2,655,083 | 2015 |
|    SC    | Região Sul | Veículos de Passeio | 3,148,729 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Veículos de Passeio' AS Categoria,
	ROUND(((SUM(automovel_passeio) - (
        SELECT SUM(automovel_passeio)
        FROM regiao_sul
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(automovel_passeio)
        FROM regiao_sul
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

#### Resultado

|   Fonte    | Ano Referência |      Categoria      | Percentual de Aumento |
| :--------: | :------------: | :-----------------: | :-------------------: |
| Região Sul |   2015-2020    | Veículos de Passeio |         15.7          |

#### Categoria "veículos de carga"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Veículos de carga' AS Categoria,
	automovel_trabalho AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |   Fonte    |     Categoria     |   Total   | ano  |
| :------: | :--------: | :---------------: | :-------: | :--: |
|    PR    | Região Sul | Veículos de carga |  842,730  | 2015 |
|    PR    | Região Sul | Veículos de carga | 1,069,761 | 2020 |
|    RS    | Região Sul | Veículos de carga |  726,625  | 2015 |
|    RS    | Região Sul | Veículos de carga |  966,246  | 2020 |
|    SC    | Região Sul | Veículos de carga |  522,348  | 2015 |
|    SC    | Região Sul | Veículos de carga |  750,078  | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Veículos de carga' AS Categoria,
	ROUND(((SUM(automovel_trabalho) - (
        SELECT SUM(automovel_trabalho)
        FROM regiao_sul
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(automovel_trabalho)
        FROM regiao_sul
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

#### Resultado

|   Fonte    | Ano Referência |     Categoria     | Percentual de Aumento |
| :--------: | :------------: | :---------------: | :-------------------: |
| Região Sul |   2015-2020    | Veículos de carga |         33.62         |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Motocicletas' AS Categoria,
	motocicleta AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |   Fonte    |  Categoria   |   Total   | ano  |
| :------: | :--------: | :----------: | :-------: | :--: |
|    PR    | Região Sul | Motocicletas | 1,357,183 | 2015 |
|    PR    | Região Sul | Motocicletas | 1,565,482 | 2020 |
|    RS    | Região Sul | Motocicletas | 1,202,129 | 2015 |
|    RS    | Região Sul | Motocicletas | 1,336,250 | 2020 |
|    SC    | Região Sul | Motocicletas | 1,072,274 | 2015 |
|    SC    | Região Sul | Motocicletas | 1,213,810 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Motocicletas' AS Categoria,
	ROUND(((SUM(motocicleta) - (
        SELECT SUM(motocicleta)
        FROM regiao_sul
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(motocicleta)
        FROM regiao_sul
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

#### Resultado

|   Fonte    | Ano Referência |  Categoria   | Percentual de Aumento |
| :--------: | :------------: | :----------: | :-------------------: |
| Região Sul |   2015-2020    | Motocicletas |         13.45         |

#### Categoria "Transporte coletivo"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Trasporte coletivo' AS Categoria,
	transporte_coletivo AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |   Fonte    |     Categoria      | Total  | ano  |
| :------: | :--------: | :----------------: | :----: | :--: |
|    PR    | Região Sul | Trasporte coletivo | 61,301 | 2015 |
|    PR    | Região Sul | Trasporte coletivo | 71,448 | 2020 |
|    RS    | Região Sul | Trasporte coletivo | 59,311 | 2015 |
|    RS    | Região Sul | Trasporte coletivo | 64,559 | 2020 |
|    SC    | Região Sul | Trasporte coletivo | 30,124 | 2015 |
|    SC    | Região Sul | Trasporte coletivo | 34,108 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Motocicletas' AS Categoria,
	ROUND(((SUM(motocicleta) - (
        SELECT SUM(motocicleta)
        FROM regiao_sul
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(motocicleta)
        FROM regiao_sul
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

#### Resultado

|   Fonte    | Ano Referência |      Categoria      | Percentual de Aumento |
| :--------: | :------------: | :-----------------: | :-------------------: |
| Região Sul |   2015-2020    | Transporte coletivo |         13.39         |

#### Categoria "Tratores"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Tratores' AS Categoria,
	trator AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |   Fonte    | Categoria | Total | ano  |
| :------: | :--------: | :-------: | :---: | :--: |
|    PR    | Região Sul | Tratores  | 1,880 | 2015 |
|    PR    | Região Sul | Tratores  | 2,131 | 2020 |
|    RS    | Região Sul | Tratores  | 7,543 | 2015 |
|    RS    | Região Sul | Tratores  | 8,528 | 2020 |
|    SC    | Região Sul | Tratores  | 3,009 | 2015 |
|    SC    | Região Sul | Tratores  | 3,421 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sul' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Tratores' AS Categoria,
	ROUND(((SUM(trator) - (
        SELECT SUM(trator)
        FROM regiao_sul
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(trator)
        FROM regiao_sul
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sul
WHERE
	ano = 2020;
```

#### Resultado

|   Fonte    | Ano Referência | Categoria | Percentual de Aumento |
| :--------: | :------------: | :-------: | :-------------------: |
| Região Sul |   2015-2020    | Tratores  |         12.86         |

### Agrupando veículos por categorias na **Região Sudeste** entre **2015 e 2020**

- View da [regiao_sul](views_sql/view_regiao_sudeste.sql)

#### Categoria "Veículos de passeio"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	automovel_passeio AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |     Fonte      |      Categoria      |   Total    | ano  |
| :------: | :------------: | :-----------------: | :--------: | :--: |
|    ES    | Região Sudeste | Veículos de Passeio |  876,424   | 2015 |
|    ES    | Região Sudeste | Veículos de Passeio | 1,019,153  | 2020 |
|    MG    | Região Sudeste | Veículos de Passeio | 5,441,609  | 2015 |
|    MG    | Região Sudeste | Veículos de Passeio | 6,595,668  | 2020 |
|    RJ    | Região Sudeste | Veículos de Passeio | 4,193,776  | 2015 |
|    RJ    | Região Sudeste | Veículos de Passeio | 4,715,404  | 2020 |
|    SP    | Região Sudeste | Veículos de Passeio | 16,834,630 | 2015 |
|    SP    | Região Sudeste | Veículos de Passeio | 19,089,286 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sudeste' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Veículos de passeio' AS Categoria,
	ROUND(((SUM(automovel_passeio) - (
        SELECT SUM(automovel_passeio)
        FROM regiao_sudeste
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(automovel_passeio)
        FROM regiao_sudeste
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sudeste
WHERE
	ano = 2020;
```

#### Resultado

|     Fonte      | Ano Referência |      Categoria      | Percentual de Aumento |
| :------------: | :------------: | :-----------------: | :-------------------: |
| Região Sudeste |   2015-2020    | Veículos de passeio |         15.67         |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Motocicletas' AS Categoria,
	motocicleta AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	(ano = 2015
		OR ano = 2020)
	AND mes = 12;
```

#### Resultado

| sigla_uf |     Fonte      |  Categoria   |   Total   | ano  |
| :------: | :------------: | :----------: | :-------: | :--: |
|    ES    | Região Sudeste | Motocicletas |  508,109  | 2015 |
|    ES    | Região Sudeste | Motocicletas |  597,311  | 2020 |
|    MG    | Região Sudeste | Motocicletas | 2,599,388 | 2015 |
|    MG    | Região Sudeste | Motocicletas | 3,049,085 | 2020 |
|    RJ    | Região Sudeste | Motocicletas | 1,039,889 | 2015 |
|    RJ    | Região Sudeste | Motocicletas | 1,252,016 | 2020 |
|    SP    | Região Sudeste | Motocicletas | 5,119,755 | 2015 |
|    SP    | Região Sudeste | Motocicletas | 6,021,458 | 2020 |

#### Percentual de aumento entre **2015 e 2020**

```sql
SELECT
	'Região Sudeste' AS Fonte,
	'2015-2020' AS 'Ano Referência',
	'Motocicletas' AS Categoria,
	ROUND(((SUM(motocicleta) - (
        SELECT SUM(motocicleta)
        FROM regiao_sudeste
        WHERE ano = 2015)) * 100.0) /
        (SELECT SUM(motocicleta)
        FROM regiao_sudeste
        WHERE ano = 2015), 2) AS 'Percentual de Aumento'
FROM
	regiao_sudeste
WHERE
	ano = 2020;
```

#### Resultado

|     Fonte      | Ano Referência |  Categoria   | Percentual de Aumento |
| :------------: | :------------: | :----------: | :-------------------: |
| Região Sudeste |   2015-2020    | Motocicletas |         18.34         |
