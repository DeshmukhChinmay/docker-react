# BUILD PHASE
FROM node:alpine AS react-build

WORKDIR '/home/app'

COPY ./package.json ./
RUN npm install

COPY ./ ./
RUN npm run build

# RUN PHASE
FROM nginx

COPY --from=react-build /home/app/build /usr/share/nginx/html