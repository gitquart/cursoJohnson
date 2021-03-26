/*
Este código lee de un archivo Excel datos y los filtra por ciudad
*/

/*
Recomendaciones: Copiar el cuerpo de "Let" y pegarlo en query editor de Power Query para evitar errores
de sintaxis
*/

Let
    Source = Excel.Workbook(File.Contents("C:\Users\1098350515\Documents\quart\cursoJohnson\DB_Curso.xlsx"), null, true),
    #"Tabla 1_Sheet" = Source{[Item="Tabla 1",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(#"Tabla 1_Sheet", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ID", Int64.Type}, {"Nombre ", type text}, {"Edad", Int64.Type}, {"Ciudad", type text}}),
    #"Ejemplo" = Table.SelectRows(#"Changed Type", each ([Ciudad] = "Monterrey"))

in
    #"Ejemplo"
