match (n) return n


MATCH p = (n:Person)-[r]-(m:Movie)
where n.name = "Tom Hanks" and m.title = "Sleepless in Seattle"
return n,r, m





# CREATE statement

CREATE (P:Person {name: "Bob"})
return P 

CREATE (P:Person {name: "John", age:28, occupation: "Data Scientist"})
return P 


# MATCH statement
match (P:Person)
where P.name = "Bob"
return P

match (P:Person)
where P.name = "Bob"
delete P


# CREATE relationship
MATCH (p1:Person {name:"Bob"})
MATCH (p2:Person {name:"John"})
CREATE (p1)-[:knows]->(p2)

match p = (P1:Person {name:"Bob"})-[]-(A)
return p


# MERGE statement
MERGE (P:Person {name:"Bob"})
return P

# DELETE statement when node has relationships
match (P:Person {name:"Bob"}) optional match (P)-[r]-()
delete P, r


# QUERY the graph
MATCH (n) RETURN n

MATCH (n:Person)
WHERE n.name = "Tom Hanks"
RETURN n

MATCH (n:Person {name:"Tom Hanks"} 
RETURN n

MATCH p = (n:Person)-[]-(m:Movie)
where n.name = "Tom Hanks"
return p


MATCH p = (n:Person)-[]-(m:Movie)-[]-(n2:Person)
where n.name = "Tom Hanks" and n <> n2
return p


MATCH p = (n:Person)-[]-(m:Movie)-[]-(n2:Person)
where n.name = "Tom Hanks" and n <> n2
with n, n2,count(1) as NumCollaborations
order by NumCollaborations desc
limit 5 
return n.name as TomHanks, n2.name as collaborator, NumCollaborations

