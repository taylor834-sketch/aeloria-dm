import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Elaryn — DM Campaign Tool",
  description: "Campaign management tool for the world of Elaryn",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="h-full">
      <body className="min-h-full flex flex-col bg-stone-950">{children}</body>
    </html>
  );
}
