import type { Metadata } from "next";
import "./globals.css";
import "bootswatch/dist/lumen/bootstrap.css";
import "react-toastify/ReactToastify.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import { ToastContainer } from "react-toastify";
import TopNav from "@/components/TopNav";

export const metadata: Metadata = {
  title: " MAYLU 🍣",
  description: "La nueva aplicación de gestión para Sushi Maylu",
  icons: {
    icon: "./favicon.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body className="vh-100" style={{ overflow: "hidden" }}>
        <TopNav />
        <main style={{ height: "calc(100vh - 60px)", overflow: "auto" }}>
          {children}
        </main>
        <ToastContainer />
      </body>
    </html>
  );
}
