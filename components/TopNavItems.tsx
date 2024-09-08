"use client";

import { Links } from "@/types/ui";
import Link from "next/link";
import { Nav, Navbar, Container, Button } from "react-bootstrap";
import { usePathname } from "next/navigation";
import Clock from "./Clock";
import { useState } from "react";
import "bootstrap-icons/font/bootstrap-icons.css";

const links: Links = [
  {
    name: "punto de venta",
    to: "/",
  },
  {
    name: "Menu",
    to: "/menu",
  },
  {
    name: "ajustes",
    to: "/ajustes",
  },
];

function TopNavItems() {
  const [darkMode, setDarkMode] = useState<boolean>(false);
  const pathname = usePathname();

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    document.documentElement.setAttribute(
      "data-bs-theme",
      darkMode ? "light" : "dark"
    );
  };

  return (
    <>
      <Navbar
        expand="lg"
        bg={darkMode ? "dark" : "light"}
        data-bs-theme={darkMode ? "dark" : "light"}
      >
        <Container>
          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse>
            <Nav className="me-auto">
              {links.map((l) => (
                <Nav.Item key={`link-${l.name}`}>
                  <Link
                    className={`nav-link text-uppercase ${
                      l.to === pathname ? "active" : ""
                    }`}
                    href={l.to}
                  >
                    {l.name}
                  </Link>
                </Nav.Item>
              ))}
            </Nav>
          </Navbar.Collapse>
          <Nav>
            <Nav.Item
              className={`fs-3 ${
                darkMode ? "text-white" : "text-dark"
              } text-uppercase non-select`}
            >
              <Clock />
            </Nav.Item>
            <Nav.Item className="ms-2">
              <Button
                variant={darkMode ? "light" : "dark"}
                onClick={toggleDarkMode}
                size="sm"
              >
                {darkMode ? (
                  <i className="bi bi-sun-fill"></i>
                ) : (
                  <i className="bi bi-moon-stars-fill"></i>
                )}
              </Button>
            </Nav.Item>
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}

export default TopNavItems;
