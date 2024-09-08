-- CreateTable
CREATE TABLE "Contactos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT,
    "vat" TEXT,
    "type" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Address" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "street" TEXT NOT NULL,
    "streets" TEXT NOT NULL,
    "colony" TEXT,
    "zip" TEXT,
    "state" TEXT,
    "city" TEXT,
    "contactosId" INTEGER,
    CONSTRAINT "Address_contactosId_fkey" FOREIGN KEY ("contactosId") REFERENCES "Contactos" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "perfil" TEXT NOT NULL,
    "permisions" TEXT NOT NULL,
    "contactosId" INTEGER,
    CONSTRAINT "Users_contactosId_fkey" FOREIGN KEY ("contactosId") REFERENCES "Contactos" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Contactos_phone_key" ON "Contactos"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Contactos_email_key" ON "Contactos"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Contactos_vat_key" ON "Contactos"("vat");

-- CreateIndex
CREATE UNIQUE INDEX "Users_userName_key" ON "Users"("userName");
