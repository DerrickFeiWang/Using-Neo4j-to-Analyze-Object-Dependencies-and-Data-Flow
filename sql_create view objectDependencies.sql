
CREATE view [dbo].[vw_ObjectDependencies] as 


select 'YourDatabaseName' as ObjectDatabase
      ,c.name as SchemaName,  b.name as ObjectName
	  ,b.type TypeAbbre
      ,case when b.type = 'P' then 'PROC'
	        when b.type = 'V' then 'View'
			when b.type = 'U' then 'Table'
			when b.type = 'IF' then 'Function'
			when b.type = 'SP' then 'Security Policy'
			when b.type = 'C' then 'Check Constraint'
			when b.type = 'D' then 'Default'
			when b.type = 'FN' then 'Function'
			when b.type = 'SO' then 'Sequence'
	   else null end as ObjectType
      ,[referencing_id]     ObjectID
      ,isnull([referenced_database_name], 'YourDatabaseName') RefdDatabase
      ,isnull([referenced_schema_name], null)   RefdSchema
      ,[referenced_entity_name]   RefdObjectName
	  ,d.Type RefdTypeAbbr
	  ,case when d.type = 'P' then 'PROC'
	        when d.type = 'V' then 'View'
			when d.type = 'U' then 'Table'
			when d.type = 'IF' then 'Function'
			when d.type = 'SP' then 'Security Policy'
			when d.type = 'C' then 'Check Constraint'
			when d.type = 'D' then 'Default'
			when d.type = 'FN' then 'Function'
			when d.type = 'SO' then 'Sequence'
	   else null end as RefdObjectType


	  ,case when [referenced_id] is null then 100000000 + dense_rank() over ( order by [referenced_schema_name], [referenced_entity_name]) 
	        else [referenced_id] end [referenced_id]
FROM sys.sql_expression_dependencies a
left join sys.objects b on a.referencing_id = b.object_id
left join sys.schemas c on b.schema_id = c.schema_id
left join sys.objects d on a.[referenced_id] = d.object_id
GO


