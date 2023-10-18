# Entendimento do volume de veículos e Análise exploratória

## Extração de dados por região

### Agrupando veículos por categorias na **Região Sul**

- View da [regiao_sul](views_sql/view_regiao_sul.sql)

#### Categoria "Veículos de Passeio"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado:

| sigla_uf |   Fonte    |      Categoria      |   Total    | ano  |
| :------: | :--------: | :-----------------: | :--------: | :--: |
|    PR    | Região Sul | Veículos de Passeio | 27,565,999 | 2004 |
|    RS    | Região Sul | Veículos de Passeio | 28,544,670 | 2004 |
|    SC    | Região Sul | Veículos de Passeio | 16,683,532 | 2004 |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Motocicletas' AS Categoria,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |   Fonte    |  Categoria   |   Total   | ano  |
| :------: | :--------: | :----------: | :-------: | :--: |
|    PR    | Região Sul | Motocicletas | 1,259,895 | 2004 |
|    RS    | Região Sul | Motocicletas | 1,108,873 | 2004 |
|    SC    | Região Sul | Motocicletas |  841,355  | 2004 |

#### Categoria "Caminhões"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Caminhões' AS Categoria,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |   Fonte    | Categoria |   Total   | ano  |
| :------: | :--------: | :-------: | :-------: | :--: |
|    PR    | Região Sul | Caminhões | 3,265,113 | 2004 |
|    RS    | Região Sul | Caminhões | 2,873,340 | 2004 |
|    SC    | Região Sul | Caminhões | 1,777,060 | 2004 |

#### Categoria "Transporte Coletivo"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Transporte Coletivo' AS Categoria,
	SUM(onibus + microonibus + bonde) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |   Fonte    |      Categoria      |   Total   | ano  |
| :------: | :--------: | :-----------------: | :-------: | :--: |
|    PR    | Região Sul | Transporte Coletivo | 4,603,064 | 2004 |
|    RS    | Região Sul | Transporte Coletivo | 5,056,242 | 2004 |
|    SC    | Região Sul | Transporte Coletivo | 4,008,879 | 2004 |

#### Categoria "Tratores"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Tratores' AS Categoria,
	SUM(tratoresteira + tratorrodas) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |   Fonte    | Categoria | Total  | ano  |
| :------: | :--------: | :-------: | :----: | :--: |
|    PR    | Região Sul | Tratores  | 11,360 | 2004 |
|    RS    | Região Sul | Tratores  | 31,598 | 2004 |
|    SC    | Região Sul | Tratores  | 15,622 | 2004 |

#### Categoria "Outros"

```sql
SELECT
	sigla_uf,
	'Região Sul' AS Fonte,
	'Outros' AS Categoria,
	SUM(outros) AS 'Total',
	ano
FROM
	regiao_sul
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |   Fonte    | Categoria | Total | ano  |
| :------: | :--------: | :-------: | :---: | :--: |
|    PR    | Região Sul |  Outros   |   0   | 2004 |
|    RS    | Região Sul |  Outros   |   0   | 2004 |
|    SC    | Região Sul |  Outros   |   0   | 2004 |
