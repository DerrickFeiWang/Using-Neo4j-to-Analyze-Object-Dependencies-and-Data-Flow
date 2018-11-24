
# Using Neo4j to Analyze Object Dependencies and Data Flow

In relational databases, tens or hundreds of tables, views, stored procedures and functions were created along project development for data manipulation and reporting purposes. The object dependencies and logics of data flow need to be reviewed by solution architects, database developers, and business users from time to time. Neo4j is a perfect tool for investigating the "social network" of objects in a relational database. Neo4j and its Cypher language can provide a quick and comprehensive way for object dependency and data flow review.

It will only take a few minutes to extract object relationships from the meta data of a SQL Server database, and then load into Neo4j to create a graph database for object dependency and data flow review. In this use case, **Neo4j is used as an analytical tool** to investigate the metadata of a SQL Server relational database. 

### 1. Get object dependency data from SQL Server database

1.1 Create a view in the database that you want to investigate object dependencies using the following SQL query:

When an object is created using sql script, SQL Server will capture the query string and store the object dependencies in System Views. We can query the system views to get the object dependency information using the following sql query:

![create view in sql for object dependencies](https://user-images.githubusercontent.com/44976640/48359070-ca986000-e661-11e8-988d-a767b60b862c.JPG)


1.2 Copy the data from the view created in the previous step, save the data to a csv file, and name it as "ObjectDependencies.csv".

### 2. Create a Neo4j database
2.1 Open Neo4j Desktop and create a new project with an appropriate project name.

![createproject](https://user-images.githubusercontent.com/44976640/48359694-1b5c8880-e663-11e8-8189-88cb7a150827.JPG)


2.2 Inside the Project pane, click "Add Graph" to create a new Neo4j database.

![creategraph](https://user-images.githubusercontent.com/44976640/48359839-6f676d00-e663-11e8-9bee-a9431da558eb.JPG)

   Choose "Create a Local Graph", then give a proper name for the database. Set your password, then hit "Create".


2.3 Click the "Start" button to get the database running.

2.4 Click the "Manage" button, then click on "Open Folder" to locate and open the "Import" folder.

2.5 Move the "ObjectDependencies.csv" file into the "Import" folder.

2.6 Run the following Cypher commands to create nodes and relationships in the Neo4j database.

![cyphercommands](https://user-images.githubusercontent.com/44976640/48360149-2ebc2380-e664-11e8-953b-19a79d27056c.JPG)

### 3. Analyze object dependencies

3.1 Get a big picture of the entire universe.

![match_n](https://user-images.githubusercontent.com/44976640/48361096-59a77700-e666-11e8-99a9-d4df41e39dc8.JPG)

![bigpicture](https://user-images.githubusercontent.com/44976640/48361142-7a6fcc80-e666-11e8-9c2e-8aa6ac2c3d90.JPG)

3.2 Which Table has the most dependents.

![numdependents](https://user-images.githubusercontent.com/44976640/48361304-d9cddc80-e666-11e8-89f5-7a981df62962.JPG)

3.3 What are the data sources of a specific object.

![dataflow](https://user-images.githubusercontent.com/44976640/48363309-3df29f80-e66b-11e8-87f7-1fe595fed71e.JPG)

3.4 Data flow of a specific object.

![dataflow1](https://user-images.githubusercontent.com/44976640/48363234-13084b80-e66b-11e8-8e09-be5f7cba1a13.JPG)




