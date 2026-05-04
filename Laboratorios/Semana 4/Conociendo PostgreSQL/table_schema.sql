DROP TABLE IF EXISTS Entregan;
DROP TABLE IF EXISTS Proyectos;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Materiales;

CREATE TABLE public."Entregan" (
    clave integer NOT NULL,
    rfc character varying(15) NOT NULL,
    numero integer NOT NULL,
    fecha date NOT NULL,
    cantidad integer NOT NULL
);

CREATE TABLE public."Materiales" (
    clave integer NOT NULL,
    descripcion character varying(40) NOT NULL,
    precio numeric NOT NULL,
    impuesto numeric NOT NULL
);

CREATE TABLE public."Proveedores" (
    rfc character varying(15) NOT NULL,
    razonsocial character varying(40) NOT NULL
);

CREATE TABLE public."Proyectos" (
    numero integer NOT NULL,
    denominacion character varying(40) NOT NULL
);

ALTER TABLE ONLY public."Entregan"
    ADD CONSTRAINT "Entregan_pkey" PRIMARY KEY (clave, rfc, numero, fecha);

ALTER TABLE ONLY public."Materiales"
    ADD CONSTRAINT "Materiales_pkey" PRIMARY KEY (clave);

ALTER TABLE ONLY public."Proveedores"
    ADD CONSTRAINT "Proveedores_pkey" PRIMARY KEY (rfc);

ALTER TABLE ONLY public."Proyectos"
    ADD CONSTRAINT "Proyectos_pkey" PRIMARY KEY (numero);

ALTER TABLE ONLY public."Entregan"
    ADD CONSTRAINT clave FOREIGN KEY (clave) REFERENCES public."Materiales"(clave) NOT VALID;

ALTER TABLE ONLY public."Entregan"
    ADD CONSTRAINT numero_fk FOREIGN KEY (numero) REFERENCES public."Proyectos"(numero) NOT VALID;

ALTER TABLE ONLY public."Entregan"
    ADD CONSTRAINT rfc_fk FOREIGN KEY (rfc) REFERENCES public."Proveedores"(rfc) NOT VALID;
