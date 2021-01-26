#Use the node:10-alpine image as a base to
FROM node:10-alpine
#create a directory for the app and its node_modules with node as its owner
RUN useradd node -md /home/app && chown -R node:node /home/app/
USER node
WORKDIR /home/app/
ENV PATH "$PATH:/home/app"
#install all packages in package.json
COPY package*.json ./
COPY --chown=node:node . .
RUN npm install
#expose port 8080 and run the app
EXPOSE 8080
CMD [ "docker", "run" ]
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
