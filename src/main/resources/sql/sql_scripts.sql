-- aqui como criar a tabela authorities que o hibernate não cria sozinho.

-- Table: public.authorities

-- DROP TABLE IF EXISTS public.authorities;

CREATE TABLE IF NOT EXISTS public.authorities
(
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    authority character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fk_authorities_users FOREIGN KEY (username)
        REFERENCES public.users (username) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authorities
    OWNER to postgres;
-- Index: ix_auth_username

-- DROP INDEX IF EXISTS public.ix_auth_username;

CREATE UNIQUE INDEX IF NOT EXISTS ix_auth_username
    ON public.authorities USING btree
    (username COLLATE pg_catalog."default" ASC NULLS LAST, authority COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;