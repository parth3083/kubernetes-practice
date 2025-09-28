FROM node:18-alpine AS base
WORKDIR /app

# Intsall the deps separately for caching 
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

# Copy app souce 
COPY . .

# Run as non-root (alpine node image includes the user-node)
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm","start"]