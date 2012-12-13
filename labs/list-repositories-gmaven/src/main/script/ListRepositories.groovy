import groovyx.net.http.HTTPBuilder

import static groovyx.net.http.ContentType.JSON
import static groovyx.net.http.Method.GET

def http = new HTTPBuilder('http://localhost:8081') // watch out, this is without the nexus context,
                                                    // adding it here would strip it

// http.auth.basic "admin", "admin123" // if you need authentication this should work

http.request(GET, JSON) { req ->
    // this is the full resource path including the nexus context!
    uri.path = '/nexus/service/local/repositories'

    response.success = { resp, json ->
        assert resp.status == 200
        println "Response status: ${resp.statusLine}"
        println "Response length: ${resp.headers.'Content-Length'}"

        println "List of Repositories"

        // show the full payload
        // System.out << json
        json.data.each { repository ->
            println(repository.id + " " + repository.contentResourceURI)
        }
    }

    // called only for a 404 (not found) status code:
    response.'404' = { resp ->
        println 'Received 404 - Could not contact Nexus server'
    }
}
