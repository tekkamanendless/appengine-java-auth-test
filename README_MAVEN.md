# Maven
In February of 2017, we switched to Maven for handling all of the Java workflow.
This was because Google finally put out a sweet new Google Cloud plugin for Eclipse with strong Maven support.

## Show goals and parameters

```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn appengine:help -Ddetail=true
```

## Build the package

```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn clean package
```

## Run the development server
The new "gcloud"-based development server is way nicer than the old app-engine-sdk one.
It takes a while to start up (since it goes through EVERY file), but once it's started, it'll reload the server code as soon as it changes, which is nice.

```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn appengine:run
```

## Update the static files
While Eclipse will compile its Java files to the target directory, it won't copy any static files there.

```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn war:exploded
```

## Deploy to App Engine

```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn appengine:deploy
```

To deploy to a specific version for testing ("app.deploy.promote=false" *prevents* redirecting all traffic to it):
   
```
JAVA_HOME=/usr/lib/jvm/java-7-oracle/ mvn appengine:deploy -Dapp.deploy.version=vXXX -Dapp.deploy.promote=false
```

# Additional Resources

1. Using Maven with Google App Engine: [https://cloud.google.com/appengine/docs/java/tools/using-maven]()
1. Maven goal/parameter reference: [https://cloud.google.com/appengine/docs/java/tools/maven-reference]()
1. Google Cloud Maven source code: [https://github.com/GoogleCloudPlatform/app-maven-plugin]()

