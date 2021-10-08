﻿DROP TABLE IF EXISTS #TipoIdentificacionTemp

SELECT 
IdTipoIdentificacion, Descripcion INTO #TipoIdentificacionTemp
FROM (
VALUES
(1, 'CEDULA'),
(2, 'PASAPORTE'),
(3, 'CEDULAJURIDICA')
)AS TEMP (IdTipoIdentificacion, Descripcion)


----ACTUALIZAR DATOS---
UPDATE T SET
  T.Descripcion= TM.Descripcion
FROM dbo.TipoIdentificacion T
INNER JOIN #TipoIdentificacionTemp TM
    ON T.IdTipoIdentificacion= TM.IdTipoIdentificacion


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoIdentificacion ON

INSERT INTO dbo.TipoIdentificacion(
IdTipoIdentificacion, Descripcion)
SELECT
IdTipoIdentificacion, Descripcion
FROM #TipoIdentificacionTemp


EXCEPT
SELECT
IdTipoIdentificacion, Descripcion
FROM dbo.TipoIdentificacion


SET IDENTITY_INSERT dbo.TipoIdentificacion OFF

GO