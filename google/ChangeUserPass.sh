#!/bin/bash
JAVA_HOME="/usr/java/jdk1.6.0_18" CLASSPATH=.:/canadia/google/gdata/java/lib/gdata-core-1.0.jar:/canadia/google/gdata/java/lib/gdata-docs-3.0.jar:/canadia/google/gdata/java/lib/gdata-spreadsheet-3.0.jar:/canadia/google/gdata/java/sample/util/lib/sample-util.jar:/canadia/google/commons-cli-1.2/commons-cli-1.2.jar:/canadia/google/javamail-1.4.3/mail.jar:/canadia/google/jaf-1.1.1/activation.jar:/canadia/google/gdata/java/deps/google-collect-1.0-rc1.jar:/canadia/google/gdata/java/deps/jsr305.jar:/canadia/google/gdata/java/sample/appsforyourdomain/lib/AppsForYourDomainClient.jar:/canadia/google/gdata/java/lib/gdata-appsforyourdomain-1.0.jar /usr/bin/java ChangeUserPass $@

