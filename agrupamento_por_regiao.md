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

### Agrupando veículos por categorias na **Região Sudeste**

- View da [regiao_sudeste](views_sql/view_regiao_sudeste.sql)

#### Categoria "Veículos de Passeio"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado:

| sigla_uf |     Fonte      |      Categoria      |    Total    | ano  |
| :------: | :------------: | :-----------------: | :---------: | :--: |
|    ES    | Região Sudeste | Veículos de Passeio |  5,414,408  | 2004 |
|    MG    | Região Sudeste | Veículos de Passeio | 34,692,826  | 2004 |
|    RJ    | Região Sudeste | Veículos de Passeio | 30,354,728  | 2004 |
|    SP    | Região Sudeste | Veículos de Passeio | 124,501,946 | 2004 |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Motocicletas' AS Categoria,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      |  Categoria   |   Total   | ano  |
| :------: | :------------: | :----------: | :-------: | :--: |
|    ES    | Região Sudeste | Motocicletas |  362,275  | 2004 |
|    MG    | Região Sudeste | Motocicletas | 1,365,912 | 2004 |
|    RJ    | Região Sudeste | Motocicletas | 1,103,877 | 2004 |
|    SP    | Região Sudeste | Motocicletas | 4,731,341 | 2004 |

#### Categoria "Caminhões"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Caminhões' AS Categoria,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria |   Total   |  ano |
| :------: | :------------: | :-------: | :-------: | ---: |
|    ES    | Região Sudeste | Caminhões |  660,521  | 2004 |
|    MG    | Região Sudeste | Caminhões | 3,039,548 | 2004 |
|    RJ    | Região Sudeste | Caminhões | 1,258,435 | 2004 |
|    SP    | Região Sudeste | Caminhões | 7,919,853 | 2004 |

#### Categoria "Transporte Coletivo"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Transporte Coletivo' AS Categoria,
	SUM(onibus + microonibus + bonde) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      |      Categoria      |   Total    | ano  |
| :------: | :------------: | :-----------------: | :--------: | :--: |
|    ES    | Região Sudeste | Transporte Coletivo | 1,438,968  | 2004 |
|    MG    | Região Sudeste | Transporte Coletivo | 8,376,814  | 2004 |
|    RJ    | Região Sudeste | Transporte Coletivo | 2,672,441  | 2004 |
|    SP    | Região Sudeste | Transporte Coletivo | 17,475,449 | 2004 |

#### Categoria "Tratores"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Tratores' AS Categoria,
	SUM(tratoresteira + tratorrodas) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria | Total  | ano  |
| :------: | :------------: | :-------: | :----: | :--: |
|    ES    | Região Sudeste | Tratores  | 4,448  | 2004 |
|    MG    | Região Sudeste | Tratores  | 10,189 | 2004 |
|    RJ    | Região Sudeste | Tratores  | 5,066  | 2004 |
|    SP    | Região Sudeste | Tratores  | 59,141 | 2004 |

#### Categoria "Outros"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Tratores' AS Categoria,
	SUM(outros) AS 'Total',
	ano
FROM
	regiao_sudeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria | Total | ano  |
| :------: | :------------: | :-------: | :---: | :--: |
|    ES    | Região Sudeste | Tratores  |   0   | 2004 |
|    MG    | Região Sudeste | Tratores  |   0   | 2004 |
|    RJ    | Região Sudeste | Tratores  |   0   | 2004 |
|    SP    | Região Sudeste | Tratores  |   0   | 2004 |

### Agrupando veículos por categorias na **Região Centro Oeste**

- View da [regiao_sudeste](views_sql/view_regiao_centro_oeste.sql)

#### Categoria "Veículos de Passeio"

```sql
SELECT
	sigla_uf,
	'Região Centro Oeste' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado:

| sigla_uf |        Fonte        |      Categoria      |   Total   | ano  |
| :------: | :-----------------: | :-----------------: | :-------: | :--: |
|    DF    | Região Centro Oeste | Veículos de Passeio | 7,948,787 | 2004 |
|    GO    | Região Centro Oeste | Veículos de Passeio | 9,950,267 | 2004 |
|    MS    | Região Centro Oeste | Veículos de Passeio | 4,249,443 | 2004 |
|    MT    | Região Centro Oeste | Veículos de Passeio | 3,609,459 | 2004 |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Centro Oeste' AS Fonte,
	'Motocicletas' AS Categoria,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |        Fonte        |  Categoria   |  Total  | ano  |
| :------: | :-----------------: | :----------: | :-----: | :--: |
|    DF    | Região Centro Oeste | Motocicletas | 190,087 | 2004 |
|    GO    | Região Centro Oeste | Motocicletas | 872,897 | 2004 |
|    MS    | Região Centro Oeste | Motocicletas | 341,155 | 2004 |
|    MT    | Região Centro Oeste | Motocicletas | 623,779 | 2004 |

#### Categoria "Caminhões"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Caminhões' AS Categoria,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria |   Total   | ano  |
| :------: | :------------: | :-------: | :-------: | :--: |
|    DF    | Região Sudeste | Caminhões |  220,334  | 2004 |
|    GO    | Região Sudeste | Caminhões | 1,089,393 | 2004 |
|    MS    | Região Sudeste | Caminhões |  543,592  | 2004 |
|    MT    | Região Sudeste | Caminhões |  748,276  | 2004 |

#### Categoria "Transporte Coletivo"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Transporte Coletivo' AS Categoria,
	SUM(onibus + microonibus + bonde) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      |      Categoria      |   Total   | ano  |
| :------: | :------------: | :-----------------: | :-------: | :--: |
|    DF    | Região Sudeste | Transporte Coletivo |  608,484  | 2004 |
|    GO    | Região Sudeste | Transporte Coletivo | 3,118,397 | 2004 |
|    MS    | Região Sudeste | Transporte Coletivo | 1,284,942 | 2004 |
|    MT    | Região Sudeste | Transporte Coletivo | 1,793,014 | 2004 |

#### Categoria "Tratores"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Tratores' AS Categoria,
	SUM(tratoresteira + tratorrodas) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria | Total | ano  |
| :------: | :------------: | :-------: | :---: | :--: |
|    DF    | Região Sudeste | Tratores  | 4,906 | 2004 |
|    GO    | Região Sudeste | Tratores  | 1,172 | 2004 |
|    MS    | Região Sudeste | Tratores  | 1,241 | 2004 |
|    MT    | Região Sudeste | Tratores  |  888  | 2004 |

#### Categoria "Outros"

```sql
SELECT
	sigla_uf,
	'Região Centro Oeste' AS Fonte,
	'Tratores' AS Categoria,
	SUM(outros) AS 'Total',
	ano
FROM
	regiao_centro_oeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria | Total | ano  |
| :------: | :------------: | :-------: | :---: | :--: |
|    DF    | Região Sudeste | Tratores  |   0   | 2004 |
|    GO    | Região Sudeste | Tratores  |   0   | 2004 |
|    MS    | Região Sudeste | Tratores  |   0   | 2004 |
|    MT    | Região Sudeste | Tratores  |   0   | 2004 |

### Agrupando veículos por categorias na **Região Nordeste**

- View da [regiao_sudeste](views_sql/view_regiao_nordeste.sql)

#### Categoria "Veículos de Passeio"

```sql
SELECT
	sigla_uf,
	'Região Nordeste' AS Fonte,
	'Veículos de Passeio' AS Categoria,
	SUM(automovel + caminhonete + camioneta + sidecar + utilitario) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |      Fonte      |      Categoria      |   Total   | ano  |
| :------: | :-------------: | :-----------------: | :-------: | :--: |
|    AL    | Região Nordeste | Veículos de Passeio | 1,804,091 | 2004 |
|    BA    | Região Nordeste | Veículos de Passeio | 9,270,825 | 2004 |
|    CE    | Região Nordeste | Veículos de Passeio | 6,089,967 | 2004 |
|    MA    | Região Nordeste | Veículos de Passeio | 1,858,735 | 2004 |
|    PB    | Região Nordeste | Veículos de Passeio | 2,652,873 | 2004 |
|    PE    | Região Nordeste | Veículos de Passeio | 7,765,030 | 2004 |
|    PI    | Região Nordeste | Veículos de Passeio | 1,568,768 | 2004 |
|    RN    | Região Nordeste | Veículos de Passeio | 2,672,673 | 2004 |
|    SE    | Região Nordeste | Veículos de Passeio | 1,701,021 | 2004 |

#### Categoria "Motocicletas"

```sql
SELECT
	sigla_uf,
	'Região Nordeste' AS Fonte,
	'Motocicletas' AS Categoria,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |      Fonte      |      Categoria      |  Total  | ano  |
| :------: | :-------------: | :-----------------: | :-----: | :--: |
|    AL    | Região Nordeste | Veículos de Passeio | 138,712 | 2004 |
|    BA    | Região Nordeste | Veículos de Passeio | 628,615 | 2004 |
|    CE    | Região Nordeste | Veículos de Passeio | 446,919 | 2004 |
|    MA    | Região Nordeste | Veículos de Passeio | 294,897 | 2004 |
|    PB    | Região Nordeste | Veículos de Passeio | 161,240 | 2004 |
|    PE    | Região Nordeste | Veículos de Passeio | 372,810 | 2004 |
|    PI    | Região Nordeste | Veículos de Passeio | 212,938 | 2004 |
|    RN    | Região Nordeste | Veículos de Passeio | 225,025 | 2004 |
|    SE    | Região Nordeste | Veículos de Passeio | 135,173 | 2004 |

#### Categoria "Caminhões"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Caminhões' AS Categoria,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria |  Total  | ano  |
| :------: | :------------: | :-------: | :-----: | :--: |
|    AL    | Região Sudeste | Caminhões | 171,133 | 2004 |
|    BA    | Região Sudeste | Caminhões | 847,904 | 2004 |
|    CE    | Região Sudeste | Caminhões | 502,044 | 2004 |
|    MA    | Região Sudeste | Caminhões | 199,564 | 2004 |
|    PB    | Região Sudeste | Caminhões | 222,122 | 2004 |
|    PE    | Região Sudeste | Caminhões | 699,954 | 2004 |
|    PI    | Região Sudeste | Caminhões | 164,897 | 2004 |
|    RN    | Região Sudeste | Caminhões | 211,840 | 2004 |
|    SE    | Região Sudeste | Caminhões | 164,653 | 2004 |

#### Categoria "Transporte Coletivo"

```sql
SELECT
	sigla_uf,
	'Região Nordeste' AS Fonte,
	'Transporte Coletivo' AS Categoria,
	SUM(onibus + microonibus + bonde) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |      Fonte      |      Categoria      |   Total   | ano  |
| :------: | :-------------: | :-----------------: | :-------: | :--: |
|    AL    | Região Nordeste | Transporte Coletivo |  577,738  | 2004 |
|    BA    | Região Nordeste | Transporte Coletivo | 2,644,467 | 2004 |
|    CE    | Região Nordeste | Transporte Coletivo | 3,222,510 | 2004 |
|    MA    | Região Nordeste | Transporte Coletivo | 1,247,673 | 2004 |
|    PB    | Região Nordeste | Transporte Coletivo | 1,008,691 | 2004 |
|    PE    | Região Nordeste | Transporte Coletivo | 2,510,598 | 2004 |
|    PI    | Região Nordeste | Transporte Coletivo | 1,074,043 | 2004 |
|    RN    | Região Nordeste | Transporte Coletivo | 1,126,527 | 2004 |
|    SE    | Região Nordeste | Transporte Coletivo |  620,332  | 2004 |

#### Categoria "Tratores"

```sql
SELECT
	sigla_uf,
	'Região Sudeste' AS Fonte,
	'Tratores' AS Categoria,
	SUM(tratoresteira + tratorrodas) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |     Fonte      | Categoria | Total | ano  |
| :------: | :------------: | :-------: | :---: | :--: |
|    AL    | Região Sudeste | Tratores  |  92   | 2004 |
|    BA    | Região Sudeste | Tratores  | 1,596 | 2004 |
|    CE    | Região Sudeste | Tratores  |  577  | 2004 |
|    MA    | Região Sudeste | Tratores  |  247  | 2004 |
|    PB    | Região Sudeste | Tratores  |  370  | 2004 |
|    PE    | Região Sudeste | Tratores  | 1,074 | 2004 |
|    PI    | Região Sudeste | Tratores  |  189  | 2004 |
|    RN    | Região Sudeste | Tratores  | 1,137 | 2004 |
|    SE    | Região Sudeste | Tratores  |  805  | 2004 |

#### Categoria "Outros"

```sql
SELECT
	sigla_uf,
	'Região Nordeste' AS Fonte,
	'Outros' AS Categoria,
	SUM(outros) AS 'Total',
	ano
FROM
	regiao_nordeste
WHERE
	ano = 2004
GROUP BY
	sigla_uf;
```

#### Resultado

| sigla_uf |      Fonte      | Categoria | Total | ano  |
| :------: | :-------------: | :-------: | :---: | :--: |
|    AL    | Região Nordeste | Tratores  |   0   | 2004 |
|    BA    | Região Nordeste | Tratores  |   0   | 2004 |
|    CE    | Região Nordeste | Tratores  |   0   | 2004 |
|    MA    | Região Nordeste | Tratores  |   0   | 2004 |
|    PB    | Região Nordeste | Tratores  |   0   | 2004 |
|    PE    | Região Nordeste | Tratores  |   0   | 2004 |
|    PI    | Região Nordeste | Tratores  |   0   | 2004 |
|    RN    | Região Nordeste | Tratores  |   0   | 2004 |
|    SE    | Região Nordeste | Tratores  |   0   | 2004 |
