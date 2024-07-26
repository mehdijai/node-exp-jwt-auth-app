-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('DOCTOR', 'PATIENT', 'ADMIN');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "verifiedEmail" BOOLEAN NOT NULL DEFAULT false,
    "userType" "UserType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reset_password_tokens" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "reset_password_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "update_password_tokens" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "newPassword" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "update_password_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verify_email_tokens" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "verify_email_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refresh_tokens" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_id_key" ON "users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "reset_password_tokens_id_key" ON "reset_password_tokens"("id");

-- CreateIndex
CREATE UNIQUE INDEX "reset_password_tokens_token_key" ON "reset_password_tokens"("token");

-- CreateIndex
CREATE UNIQUE INDEX "reset_password_tokens_userId_key" ON "reset_password_tokens"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "update_password_tokens_id_key" ON "update_password_tokens"("id");

-- CreateIndex
CREATE UNIQUE INDEX "update_password_tokens_token_key" ON "update_password_tokens"("token");

-- CreateIndex
CREATE UNIQUE INDEX "update_password_tokens_userId_key" ON "update_password_tokens"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "verify_email_tokens_id_key" ON "verify_email_tokens"("id");

-- CreateIndex
CREATE UNIQUE INDEX "verify_email_tokens_token_key" ON "verify_email_tokens"("token");

-- CreateIndex
CREATE UNIQUE INDEX "verify_email_tokens_userId_key" ON "verify_email_tokens"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "refresh_tokens_token_key" ON "refresh_tokens"("token");

-- AddForeignKey
ALTER TABLE "reset_password_tokens" ADD CONSTRAINT "reset_password_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "update_password_tokens" ADD CONSTRAINT "update_password_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "verify_email_tokens" ADD CONSTRAINT "verify_email_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "refresh_tokens" ADD CONSTRAINT "refresh_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
