FROM node:20
WORKDIR /backend

RUN corepack enable

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .

RUN npx prisma generate && pnpm build


CMD ["sh", "-c", "pnpm run db:deploy && node ./dist/src/index.js"]
