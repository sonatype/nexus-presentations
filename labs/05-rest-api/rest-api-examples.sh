# Get status

curl http://localhost:8081/nexus/service/local/status 

# should display something like
#<status>
#  <data>
#    <appName>Sonatype Nexus Professional</appName>
#    <formattedAppName>Sonatype Nexus&amp;trade; Professional Edition, Version: 2.1.2</formattedAppName>
#    <version>2.1.2</version>
#    <apiVersion>2.1.2</apiVersion>
#    <editionLong>Professional</editionLong>
#    <editionShort>PRO</editionShort>
# ...

# List of repositories
curl http://localhost:8081/nexus/service/local/repositories

# Getting a list of all users, now with authenticating as admin user
curl -X GET -u admin:admin123 http://localhost:8081/nexus/service/local/users

# result e.g.
#<users-list>
#  <data>
#    <users-list-item>
#    <users-list-item>
#      <resourceURI>http://localhost:8081/nexus/service/local/users/anonymous</resourceURI>
#      <userId>anonymous</userId>
# ...

# Search for an artifact (keyword search)
# use http://localhost:8081/nexus/nexus-indexer-lucene-plugin/default/docs/rest.lucene.search.html
curl -X GET -u admin:admin123 http://localhost:8081/nexus/service/local/lucene/search?q=testng

# or better GAV search
curl  -X GET -u admin:admin123 http://localhost:8081/nexus/service/local/lucene/search?g=org.testng&a=testng&v=6.7


# get pom 
# documentation at http://localhost:8081/nexus/nexus-core-documentation-plugin/core/docs/rest.artifact.maven.html
curl -X GET -u admin:admin123 http://localhost:8081/nexus/service/local/artifact/maven?r=central&g=junit&a=junit&v=4.10


# get artifact
# documentation at http://localhost:8081/nexus/nexus-core-documentation-plugin/core/docs/rest.artifact.maven.content.html
curl  -X GET -u admin:admin123 "http://localhost:8081/nexus/service/local/artifact/maven/content?g=org.testng&a=testng&v=LATEST&r=central"


# resolve details about latest version of testng
curl  -X GET -u admin:admin123 "http://localhost:8081/nexus/service/local/artifact/maven/resolve?r=central&g=org.testng&a=testng&v=LATEST"

# above snippet in a shell script extracting the version could look like this:
VERSION=`curl  -X GET -u admin:admin123 "http://localhost:8081/nexus/service/local/artifact/maven/resolve?r=central&g=org.testng&a=testng&v=LATEST" | sed -n 's|<version>\(.*\)</version>|\1|p'`
echo "Version is $VERSION"

# result should be 6.7 at the moment

# And heck out the blog post http://www.sonatype.com/people/2012/07/learning-the-nexus-rest-api-read-the-docs-or-fire-up-a-browser/ about how to use the browser debug tools to monitor rest api calls of the nexus user interface itself