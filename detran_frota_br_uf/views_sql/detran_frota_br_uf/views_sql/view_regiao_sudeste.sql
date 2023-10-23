CREATE VIEW regiao_sudeste AS
SELECT
	sigla_uf,
	ano,
	mes,
	SUM(automovel) AS automovel_passeio,
	SUM(caminhonete + camioneta + sidecar + utilitario) AS automovel_trabalho,
	SUM(ciclomotor + motocicleta + motoneta + triciclo) AS motocicleta,
	SUM(caminhao + caminhaotrator + reboque + semireboque + chassiplataforma) AS veiculo_carga,
	SUM(onibus + microonibus) AS transporte_coletivo,
	bonde,
	SUM(tratoresteira + tratorrodas) AS trator,
	outros,
	SUM(total) AS total
FROM
	detran_frota_br_uf
WHERE
	sigla_uf IN ('ES', 'MG', 'RJ', 'SP')
GROUP BY
	sigla_uf,
	ano,
	mes;