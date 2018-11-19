match (n) optional match (n) - [r] -() delete n, r

LOAD CSV WITH HEADERS FROM "file:///c:/ObjectDependencies.csv" AS row
MERGE (O:Object {id: row.ObjectID})
ON CREATE SET O.Database = row.ObjectDatabse, O.Schema=row.SchemaName,   O.name=row.ObjectName, O.Type = row.ObjectType

LOAD CSV WITH HEADERS FROM "file:///c:/ObjectDependencies.csv" AS row
MERGE (O:Object {id: row.referenced_id})
ON CREATE SET O.Database = row.RefdDatabase, O.Schema=row.RefdSchema,   O.name=row.RefdObjectName, O.Type = row.RefdObjectType

LOAD CSV WITH HEADERS FROM "file:///c:/ObjectDependencies.csv" AS row
MATCH (o:Object { id:row.ObjectID })
MATCH (r:Object { id:row.referenced_id })
MERGE (o)-[:DependsOn]->(r);


MATCH (n)
WHERE n.Type = 'Table'
SET n:Table

MATCH (n)
WHERE n.Type = 'PROC'
SET n:PROC

MATCH (n)
WHERE n.Type = 'View'
SET n:View

MATCH (n)
WHERE n.Type = 'Function'
SET n:Function



match p = (n)-[]-> (s)
where n.name = "InvoiceCustomerOrders"
return p

match p = (n)-[*..5]-> (s)
where n.name = "PopulateDataToCurrentDate"
return p



==========================================





MATCH (n)
WHERE n.Schema = 'Website'
SET n:Website

MATCH (n)
WHERE n.Schema = 'Integration'
SET n:Integration

MATCH (n)
WHERE n.Schema = 'Application'
SET n:Application

MATCH (n)
WHERE n.Schema = 'Sales'
SET n:Sales



MATCH (n:Table)<--()
WITH n, count(*) AS num
RETURN n.name as TableName,  num as NumberOfDependencies
order by NumberOfDependencies desc
limit 10


match (d1:Doctors)-->(p:Patients)-->(d2:Doctors)
where d1 <> d2
with d1, d2, count(p) as NumSharedPt
order by NumSharedPt desc
limit 30
return d1, d2, NumSharedPt



CALL algo.pageRank("Object", "DependsOn", {direction:"BOTH", writeProperty:'PageRank'}
CALL algo.betweenness("Object", "DependsOn", {direction: "BOTH", writeProperty: "Centrality"})


