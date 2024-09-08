"use client";
import { Container, Row, Col, Button } from "react-bootstrap";
import { useRouter } from "next/navigation";

export default function NotFoundPage() {
  const router = useRouter();

  const handleGoBack = () => {
    router.back();
  };

  return (
    <Container className="text-center mt-5">
      <Row>
        <Col>
          <h1 className="display-1">404</h1>
          <h2 className="mb-4">Página no encontrada</h2>
          <p className="lead">
            Lo sentimos, la página que buscas no existe o ha sido movida.
          </p>
          <Button variant="primary" onClick={handleGoBack}>
            Volver
          </Button>
        </Col>
      </Row>
    </Container>
  );
}
