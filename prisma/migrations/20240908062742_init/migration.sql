/*
  Warnings:

  - Added the required column `addresType` to the `Address` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Address" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "street" TEXT NOT NULL,
    "streets" TEXT NOT NULL,
    "colony" TEXT,
    "zip" TEXT,
    "state" TEXT,
    "city" TEXT,
    "addresType" TEXT NOT NULL,
    "contactosId" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL,
    CONSTRAINT "Address_contactosId_fkey" FOREIGN KEY ("contactosId") REFERENCES "Contactos" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Address" ("city", "colony", "contactosId", "createdAt", "id", "state", "street", "streets", "updateAt", "zip") SELECT "city", "colony", "contactosId", "createdAt", "id", "state", "street", "streets", "updateAt", "zip" FROM "Address";
DROP TABLE "Address";
ALTER TABLE "new_Address" RENAME TO "Address";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
