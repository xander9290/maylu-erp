-- CreateTable
CREATE TABLE "Partners" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "secondStreet" TEXT,
    "thirdStreet" TEXT,
    "colonia" TEXT,
    "type" TEXT NOT NULL,
    "partnerParentId" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "partnerId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Partners_email_key" ON "Partners"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Partners_phone_key" ON "Partners"("phone");

-- CreateIndex
CREATE INDEX "Partners_partnerParentId_idx" ON "Partners"("partnerParentId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_userName_key" ON "Users"("userName");

-- CreateIndex
CREATE INDEX "Users_partnerId_idx" ON "Users"("partnerId");
