FROM java:jre-alpine

ARG LANGUAGE_MODEL
ARG VERSION

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/$VERSION.zip

RUN unzip $VERSION.zip && \
	rm $VERSION.zip

WORKDIR $VERSION

RUN wget http://nlp.stanford.edu/software/$LANGUAGE_MODEL.jar

RUN export CLASSPATH="`find . -name '*.jar'`"
