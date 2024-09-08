/*
  Warnings:

  - Added the required column `updateAt` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "perfil" TEXT NOT NULL,
    "permisions" TEXT NOT NULL,
    "contactosId" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL,
    CONSTRAINT "Users_contactosId_fkey" FOREIGN KEY ("contactosId") REFERENCES "Contactos" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Users" ("contactosId", "id", "password", "perfil", "permisions", "userName") SELECT "contactosId", "id", "password", "perfil", "permisions", "userName" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users_userName_key" ON "Users"("userName");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
