#Use the node:10-alpine image as a base to
FROM node:10-alpine
RUN useradd -ms /bin/bash node
#create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/app/node_modules/ && chown -R node:node /home/app/node_modules
#install all packages in package.json
WORKDIR /home/app/node_modules
CMD [ "npm", "install"]
WORKDIR /home/app/
RUN apt-get -y install express path
#expose port 8080 and run the app
EXPOSE 8080
CMD [ "npm", "start" ]
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
