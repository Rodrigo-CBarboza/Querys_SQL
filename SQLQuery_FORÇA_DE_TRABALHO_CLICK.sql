

------------------ CRIA TABELA DO T�CNICO --------------------

IF OBJECT_ID('BDRV.DBO.FT_TECNICO_SEREDE') IS NOT NULL
DROP TABLE BDRV.DBO.FT_TECNICO_SEREDE

SELECT A.UF,
A.SETOR,
B.ID_SEREDE,
A.NOME_TECNICO,
A.TR_GA,
A.NOME_GA,
B.DS_CARGO,
B.COD_CENTRO_CUSTO,
B.DS_STATUS,
C.AREA,
C.GER
INTO BDRV.DBO.FT_TECNICO_SEREDE
FROM BDRV.dbo.FORCA_GESTORES A
INNER JOIN
PCP.dbo.hierarquia_gh B WITH (NOLOCK)
ON A.TR_TECNICO = B.NU_MATRICULA
INNER JOIN
BDMIS.dbo.SETORES_GRA_SEREDE_CONECTA_MATRIZ C WITH (NOLOCK)
ON A.SETOR = C.DIST_TEAM

SELECT * FROM BDRV.DBO.FT_TECNICO_SEREDE

------------------ CRIA TABELA DO GESTOR --------------------

IF OBJECT_ID('BDRV.DBO.FT_GESTORES_SEREDE') IS NOT NULL
DROP TABLE BDRV.DBO.FT_GESTORES_SEREDE

SELECT A.UF,
B.ID_SEREDE,
A.TR_GA,
A.NOME_GA,
A.AREA,
A.GER,
B.DS_CARGO,
B.DS_STATUS
INTO BDRV.DBO.FT_GESTORES_SEREDE
FROM BDRV.DBO.FT_TECNICO_SEREDE A
INNER JOIN
PCP.dbo.hierarquia_gh B WITH (NOLOCK)
ON A.TR_GA = B.nu_matricula
GROUP BY
A.UF,
B.ID_SEREDE,
A.TR_GA,
A.NOME_GA,
A.AREA,
A.GER,
B.DS_CARGO,
B.DS_STATUS

SELECT * FROM BDRV.DBO.FT_GESTORES_SEREDE
