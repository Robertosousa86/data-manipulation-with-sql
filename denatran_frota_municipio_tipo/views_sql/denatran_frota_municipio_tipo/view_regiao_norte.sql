CREATE VIEW regiao_norte AS
SELECT
	sigla_uf,
	ano,
	mes,
	SUM(automovel) AS automovel ,
	SUM(bonde) AS bonde ,
	SUM(caminhao) AS caminhao,
	SUM(caminhaotrator) AS caminhaotrator,
	SUM(caminhonete) AS caminhonete,
	SUM(camioneta) AS camioneta,
	SUM(ciclomotor) AS ciclomotor,
	SUM(microonibus) AS microonibus,
	SUM(motocicleta) AS motocicleta,
	SUM(motoneta) AS motoneta,
	SUM(onibus) AS onibus,
	SUM(quadriciclo) AS quadriclo,
	SUM(reboque) AS reboque,
	SUM(semireboque) AS semireboque,
	SUM(sidecar) AS sidecar,
	SUM(outros) AS outros,
	SUM(tratoresteira) AS tratoresteira,
	SUM(tratorrodas) AS tratorrodas,
	SUM(triciclo) AS triciclo,
	SUM(utilitario) AS utilitario,
	SUM(chassiplataforma) AS chassiplataforma,
	SUM(total) AS total
FROM
	denatran_frota_municipio_tipo
WHERE
	sigla_uf IN ('AC', 'AM', 'AP', 'PA', 'RO', 'RR', 'TO')
GROUP BY
	sigla_uf,
	ano,
	mes; 
