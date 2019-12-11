--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO free_be;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO free_be;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO free_be;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO free_be;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresscs; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.addresscs (
    id integer NOT NULL,
    street character varying,
    city character varying,
    province character varying,
    postal_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.addresscs OWNER TO free_be;

--
-- Name: addresscs_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.addresscs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresscs_id_seq OWNER TO free_be;

--
-- Name: addresscs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.addresscs_id_seq OWNED BY public.addresscs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO free_be;

--
-- Name: business_partners; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.business_partners (
    id integer NOT NULL,
    name character varying,
    addressc_id integer,
    business_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.business_partners OWNER TO free_be;

--
-- Name: business_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.business_partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_partners_id_seq OWNER TO free_be;

--
-- Name: business_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.business_partners_id_seq OWNED BY public.business_partners.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.businesses (
    id integer NOT NULL,
    type_one character varying,
    date_corporation date,
    name character varying,
    number_employees character varying,
    union_affiliated boolean,
    union_text character varying,
    addressc_id integer,
    contract_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name_p character varying,
    name_sp character varying,
    date_corporation_p date
);


ALTER TABLE public.businesses OWNER TO free_be;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.businesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO free_be;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.businesses_id_seq OWNED BY public.businesses.id;


--
-- Name: cash_out_payments; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.cash_out_payments (
    id integer NOT NULL,
    user_id integer,
    apply timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    amount double precision,
    persents double precision,
    ppal_email character varying,
    pay_system character varying,
    card_number character varying
);


ALTER TABLE public.cash_out_payments OWNER TO free_be;

--
-- Name: cash_out_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.cash_out_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cash_out_payments_id_seq OWNER TO free_be;

--
-- Name: cash_out_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.cash_out_payments_id_seq OWNED BY public.cash_out_payments.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying,
    "position" integer,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    typec character varying
);


ALTER TABLE public.categories OWNER TO free_be;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO free_be;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: complaints; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.complaints (
    id integer NOT NULL,
    user_id integer,
    complaint_types character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_id integer,
    task_id integer
);


ALTER TABLE public.complaints OWNER TO free_be;

--
-- Name: complaints_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.complaints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complaints_id_seq OWNER TO free_be;

--
-- Name: complaints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.complaints_id_seq OWNED BY public.complaints.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    contractor_name character varying,
    type_work character varying,
    legal_title character varying,
    mailing_address_id integer,
    remittance_address_id integer,
    contact_name character varying,
    email character varying,
    password character varying,
    telephone character varying,
    gst character varying,
    authority_person_name character varying,
    authority_person_phone character varying,
    serv_req_name character varying,
    serv_req_email character varying,
    serv_req_phone character varying,
    bil_req_name character varying,
    bil_req_email character varying,
    bil_req_phone character varying,
    full_name character varying,
    title character varying,
    date_submitted date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    user_id integer,
    check_sub boolean,
    check_fin boolean,
    check_sert boolean,
    check_ins boolean,
    check_bus boolean,
    check_bond boolean,
    check_cont boolean,
    check_work boolean,
    check_exp boolean,
    bussines_bil_req_phone character varying,
    bussines_serv_req_phone character varying,
    team boolean,
    city character varying
);


ALTER TABLE public.contracts OWNER TO free_be;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO free_be;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO free_be;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO free_be;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    owner_id integer,
    token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.devices OWNER TO free_be;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO free_be;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: dialogs; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.dialogs (
    id integer NOT NULL,
    suggestion_id integer,
    hire_id integer,
    concierge_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dialogs OWNER TO free_be;

--
-- Name: dialogs_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.dialogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dialogs_id_seq OWNER TO free_be;

--
-- Name: dialogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.dialogs_id_seq OWNED BY public.dialogs.id;


--
-- Name: estimator_types; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.estimator_types (
    id bigint NOT NULL,
    name character varying,
    admin_descr text,
    active boolean,
    widget boolean,
    standard_field boolean,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.estimator_types OWNER TO free_be;

--
-- Name: estimator_types_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.estimator_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estimator_types_id_seq OWNER TO free_be;

--
-- Name: estimator_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.estimator_types_id_seq OWNED BY public.estimator_types.id;


--
-- Name: estimators; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.estimators (
    id bigint NOT NULL,
    city character varying,
    address character varying,
    name character varying,
    phone character varying,
    email character varying,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    archive boolean,
    status_work character varying,
    work_order character varying,
    project_task_id bigint,
    supervisor_id integer,
    estimator_type_id integer
);


ALTER TABLE public.estimators OWNER TO free_be;

--
-- Name: estimators_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.estimators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estimators_id_seq OWNER TO free_be;

--
-- Name: estimators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.estimators_id_seq OWNED BY public.estimators.id;


--
-- Name: favorite_tasks; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.favorite_tasks (
    id integer NOT NULL,
    user_id integer,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.favorite_tasks OWNER TO free_be;

--
-- Name: favorite_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.favorite_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_tasks_id_seq OWNER TO free_be;

--
-- Name: favorite_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.favorite_tasks_id_seq OWNED BY public.favorite_tasks.id;


--
-- Name: feed_notifications; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.feed_notifications (
    id integer NOT NULL,
    owner_id integer,
    user_id integer,
    notification_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    task_title character varying,
    message text,
    task_id integer,
    suggestion_id integer,
    sent integer DEFAULT 0,
    task_owner_id integer
);


ALTER TABLE public.feed_notifications OWNER TO free_be;

--
-- Name: feed_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.feed_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feed_notifications_id_seq OWNER TO free_be;

--
-- Name: feed_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.feed_notifications_id_seq OWNED BY public.feed_notifications.id;


--
-- Name: field_estimators; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.field_estimators (
    id bigint NOT NULL,
    fieldable_id bigint,
    fieldable_type character varying,
    name character varying,
    name_scope character varying,
    machine_name character varying,
    active boolean,
    type_field character varying,
    "desc" text,
    default_value numeric(19,2),
    astra_price numeric(19,2),
    trade_price numeric(19,2),
    ancestry character varying,
    required boolean,
    multiple boolean,
    style_cls text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    field_estimator_id bigint,
    option jsonb,
    depend_id integer
);


ALTER TABLE public.field_estimators OWNER TO free_be;

--
-- Name: field_estimators_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.field_estimators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.field_estimators_id_seq OWNER TO free_be;

--
-- Name: field_estimators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.field_estimators_id_seq OWNED BY public.field_estimators.id;


--
-- Name: financials; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.financials (
    id integer NOT NULL,
    contract_id integer,
    bank character varying,
    addressc character varying,
    contact character varying,
    phone character varying,
    email character varying,
    acct character varying,
    transist character varying,
    institution character varying,
    bonding_company character varying,
    bc_limit character varying,
    bc_address character varying,
    bc_contact character varying,
    bc_phone character varying,
    bc_email character varying,
    insurance_company character varying,
    ic_address character varying,
    ic_general_laibility character varying,
    ic_expiry date,
    ic_email character varying,
    ic_wcb character varying,
    other_work_astra boolean,
    other_property_name character varying,
    other_property_address character varying,
    other_contact character varying,
    other_phone character varying,
    other_phone_alt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ins_cert_file_name character varying,
    ins_cert_content_type character varying,
    ins_cert_file_size bigint,
    ins_cert_updated_at timestamp without time zone,
    wcb_cert_file_name character varying,
    wcb_cert_content_type character varying,
    wcb_cert_file_size bigint,
    wcb_cert_updated_at timestamp without time zone,
    bc_n_a boolean,
    void_check_file_name character varying,
    void_check_content_type character varying,
    void_check_file_size bigint,
    void_check_updated_at timestamp without time zone,
    ic_phone character varying
);


ALTER TABLE public.financials OWNER TO free_be;

--
-- Name: financials_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.financials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.financials_id_seq OWNER TO free_be;

--
-- Name: financials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.financials_id_seq OWNED BY public.financials.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.invoices (
    id bigint NOT NULL,
    payable_type character varying,
    payable_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoices OWNER TO free_be;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO free_be;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: line_estimators; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.line_estimators (
    id bigint NOT NULL,
    value character varying,
    field_estimator_id bigint,
    estimator_id bigint,
    task_id bigint,
    astra_total numeric,
    trade_total numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.line_estimators OWNER TO free_be;

--
-- Name: line_estimators_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.line_estimators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_estimators_id_seq OWNER TO free_be;

--
-- Name: line_estimators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.line_estimators_id_seq OWNED BY public.line_estimators.id;


--
-- Name: line_tasks; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.line_tasks (
    id integer NOT NULL,
    title character varying,
    budget numeric(19,2),
    type_line character varying,
    status character varying,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.line_tasks OWNER TO free_be;

--
-- Name: line_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.line_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_tasks_id_seq OWNER TO free_be;

--
-- Name: line_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.line_tasks_id_seq OWNED BY public.line_tasks.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    author_id integer,
    recipient_id integer,
    message_body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    task_id integer,
    suggestion_id integer,
    system boolean DEFAULT false,
    rating boolean DEFAULT false NOT NULL,
    points double precision,
    give_a_rate boolean DEFAULT false NOT NULL,
    file_file_name character varying,
    file_content_type character varying,
    file_file_size bigint,
    file_updated_at timestamp without time zone,
    type_message character varying,
    id_line_task integer,
    title character varying,
    budget integer,
    type_line character varying,
    status character varying,
    budget_task integer,
    total numeric
);


ALTER TABLE public.messages OWNER TO free_be;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO free_be;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);


ALTER TABLE public.oauth_access_grants OWNER TO free_be;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO free_be;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oauth_access_tokens OWNER TO free_be;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO free_be;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.oauth_applications (
    id integer NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.oauth_applications OWNER TO free_be;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.oauth_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO free_be;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    action character varying,
    subject_class character varying,
    subject_id integer,
    active boolean,
    role_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO free_be;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO free_be;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.places (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    task_id integer,
    country_id integer,
    city character varying,
    state character varying,
    address text,
    apartment character varying
);


ALTER TABLE public.places OWNER TO free_be;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.places_id_seq OWNER TO free_be;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: project_tasks; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.project_tasks (
    id integer NOT NULL,
    name character varying,
    address character varying,
    type_pt character varying,
    description text,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number integer
);


ALTER TABLE public.project_tasks OWNER TO free_be;

--
-- Name: project_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.project_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_tasks_id_seq OWNER TO free_be;

--
-- Name: project_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.project_tasks_id_seq OWNED BY public.project_tasks.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    description character varying,
    year_completion character varying,
    value character varying,
    owner_name character varying,
    project_address_id integer,
    owner_contact_one character varying,
    phone_one character varying,
    email_one character varying,
    owner_contact_two character varying,
    consultant_two character varying,
    phone_two character varying,
    email_two character varying,
    contract_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    check_past boolean
);


ALTER TABLE public.projects OWNER TO free_be;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO free_be;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: quick_books_integrations; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.quick_books_integrations (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tokens jsonb DEFAULT '{}'::jsonb,
    access_token_expired_at timestamp without time zone
);


ALTER TABLE public.quick_books_integrations OWNER TO free_be;

--
-- Name: quick_books_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.quick_books_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quick_books_integrations_id_seq OWNER TO free_be;

--
-- Name: quick_books_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.quick_books_integrations_id_seq OWNED BY public.quick_books_integrations.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    task_id integer,
    points integer,
    positive boolean,
    negative boolean,
    concierge_id integer,
    hire_id integer,
    hire boolean DEFAULT false NOT NULL,
    concierge boolean DEFAULT false NOT NULL
);


ALTER TABLE public.ratings OWNER TO free_be;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO free_be;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO free_be;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO free_be;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO free_be;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    var character varying NOT NULL,
    value text,
    thing_id integer,
    thing_type character varying(30),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.settings OWNER TO free_be;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO free_be;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: task_payments; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.task_payments (
    id integer NOT NULL,
    task_id integer,
    user_id integer,
    hire boolean,
    concierge boolean,
    persents double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    budget double precision,
    payment_method character varying
);


ALTER TABLE public.task_payments OWNER TO free_be;

--
-- Name: task_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.task_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_payments_id_seq OWNER TO free_be;

--
-- Name: task_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.task_payments_id_seq OWNED BY public.task_payments.id;


--
-- Name: task_requests; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.task_requests (
    id integer NOT NULL
);


ALTER TABLE public.task_requests OWNER TO free_be;

--
-- Name: task_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.task_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_requests_id_seq OWNER TO free_be;

--
-- Name: task_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.task_requests_id_seq OWNED BY public.task_requests.id;


--
-- Name: task_suggestions; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.task_suggestions (
    id integer NOT NULL,
    user_id integer,
    task_id integer,
    proposed_text text,
    price numeric(19,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    hire_read boolean DEFAULT false,
    concierge_read boolean DEFAULT true
);


ALTER TABLE public.task_suggestions OWNER TO free_be;

--
-- Name: task_suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.task_suggestions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_suggestions_id_seq OWNER TO free_be;

--
-- Name: task_suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.task_suggestions_id_seq OWNED BY public.task_suggestions.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    owner_id integer,
    concierge_id integer,
    title character varying,
    status character varying,
    task_type character varying,
    description text,
    phone character varying,
    date_limit timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size bigint,
    photo_updated_at timestamp without time zone,
    suggestions_counter integer,
    suggestion_id integer,
    budget numeric(19,2),
    completed_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    photo1_file_name character varying,
    photo1_content_type character varying,
    photo1_file_size bigint,
    photo1_updated_at timestamp without time zone,
    photo2_file_name character varying,
    photo2_content_type character varying,
    photo2_file_size bigint,
    photo2_updated_at timestamp without time zone,
    photo3_file_name character varying,
    photo3_content_type character varying,
    photo3_file_size bigint,
    photo3_updated_at timestamp without time zone,
    photo4_file_name character varying,
    photo4_content_type character varying,
    photo4_file_size bigint,
    photo4_updated_at timestamp without time zone,
    photo5_file_name character varying,
    photo5_content_type character varying,
    photo5_file_size bigint,
    photo5_updated_at timestamp without time zone,
    photo6_file_name character varying,
    photo6_content_type character varying,
    photo6_file_size bigint,
    photo6_updated_at timestamp without time zone,
    photo7_file_name character varying,
    photo7_content_type character varying,
    photo7_file_size bigint,
    photo7_updated_at timestamp without time zone,
    project_task_id integer,
    tender boolean,
    apartment character varying DEFAULT ''::character varying,
    date_start date,
    fact_start date,
    fact_end date,
    city character varying,
    pay_state character varying
);


ALTER TABLE public.tasks OWNER TO free_be;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO free_be;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.trades (
    id integer NOT NULL,
    name character varying,
    range character varying,
    financial_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trades OWNER TO free_be;

--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.trades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trades_id_seq OWNER TO free_be;

--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size bigint,
    photo_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    street character varying,
    city character varying,
    postal_code character varying,
    phone1 character varying,
    phone2 character varying,
    facebook_id character varying,
    facebook_token character varying,
    cardholder_name character varying,
    card_number character varying,
    cvk integer,
    exp_month integer,
    exp_year integer,
    country_id integer DEFAULT 0 NOT NULL,
    description text,
    balance double precision DEFAULT 0.0,
    blocked_to timestamp without time zone,
    unlock_token character varying,
    locked_at timestamp without time zone,
    is_logged_in boolean DEFAULT false,
    token_web character varying,
    coordinates jsonb DEFAULT '{}'::jsonb,
    coordinates_updated_at timestamp without time zone,
    last_address character varying
);


ALTER TABLE public.users OWNER TO free_be;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO free_be;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_pendings_tasks; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.users_pendings_tasks (
    id integer NOT NULL,
    user_id integer,
    task_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users_pendings_tasks OWNER TO free_be;

--
-- Name: users_pendings_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.users_pendings_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_pendings_tasks_id_seq OWNER TO free_be;

--
-- Name: users_pendings_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.users_pendings_tasks_id_seq OWNED BY public.users_pendings_tasks.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.users_roles (
    user_id integer,
    role_id integer
);


ALTER TABLE public.users_roles OWNER TO free_be;

--
-- Name: versions; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id bigint NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone,
    object_changes text
);


ALTER TABLE public.versions OWNER TO free_be;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO free_be;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: work_zone_visit_logs; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.work_zone_visit_logs (
    id bigint NOT NULL,
    user_id bigint,
    work_zone_id bigint,
    time_from timestamp without time zone,
    time_to timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date date
);


ALTER TABLE public.work_zone_visit_logs OWNER TO free_be;

--
-- Name: work_zone_visit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.work_zone_visit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_zone_visit_logs_id_seq OWNER TO free_be;

--
-- Name: work_zone_visit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.work_zone_visit_logs_id_seq OWNED BY public.work_zone_visit_logs.id;


--
-- Name: work_zones; Type: TABLE; Schema: public; Owner: free_be
--

CREATE TABLE public.work_zones (
    id integer NOT NULL,
    name character varying,
    spot_one character varying,
    spot_two character varying,
    spot_three character varying,
    spot_four character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.work_zones OWNER TO free_be;

--
-- Name: work_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: free_be
--

CREATE SEQUENCE public.work_zones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_zones_id_seq OWNER TO free_be;

--
-- Name: work_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: free_be
--

ALTER SEQUENCE public.work_zones_id_seq OWNED BY public.work_zones.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresscs id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.addresscs ALTER COLUMN id SET DEFAULT nextval('public.addresscs_id_seq'::regclass);


--
-- Name: business_partners id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.business_partners ALTER COLUMN id SET DEFAULT nextval('public.business_partners_id_seq'::regclass);


--
-- Name: businesses id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.businesses ALTER COLUMN id SET DEFAULT nextval('public.businesses_id_seq'::regclass);


--
-- Name: cash_out_payments id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.cash_out_payments ALTER COLUMN id SET DEFAULT nextval('public.cash_out_payments_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: complaints id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.complaints ALTER COLUMN id SET DEFAULT nextval('public.complaints_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: dialogs id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.dialogs ALTER COLUMN id SET DEFAULT nextval('public.dialogs_id_seq'::regclass);


--
-- Name: estimator_types id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.estimator_types ALTER COLUMN id SET DEFAULT nextval('public.estimator_types_id_seq'::regclass);


--
-- Name: estimators id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.estimators ALTER COLUMN id SET DEFAULT nextval('public.estimators_id_seq'::regclass);


--
-- Name: favorite_tasks id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.favorite_tasks ALTER COLUMN id SET DEFAULT nextval('public.favorite_tasks_id_seq'::regclass);


--
-- Name: feed_notifications id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.feed_notifications ALTER COLUMN id SET DEFAULT nextval('public.feed_notifications_id_seq'::regclass);


--
-- Name: field_estimators id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.field_estimators ALTER COLUMN id SET DEFAULT nextval('public.field_estimators_id_seq'::regclass);


--
-- Name: financials id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.financials ALTER COLUMN id SET DEFAULT nextval('public.financials_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: line_estimators id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_estimators ALTER COLUMN id SET DEFAULT nextval('public.line_estimators_id_seq'::regclass);


--
-- Name: line_tasks id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_tasks ALTER COLUMN id SET DEFAULT nextval('public.line_tasks_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: project_tasks id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.project_tasks ALTER COLUMN id SET DEFAULT nextval('public.project_tasks_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: quick_books_integrations id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.quick_books_integrations ALTER COLUMN id SET DEFAULT nextval('public.quick_books_integrations_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: task_payments id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_payments ALTER COLUMN id SET DEFAULT nextval('public.task_payments_id_seq'::regclass);


--
-- Name: task_requests id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_requests ALTER COLUMN id SET DEFAULT nextval('public.task_requests_id_seq'::regclass);


--
-- Name: task_suggestions id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_suggestions ALTER COLUMN id SET DEFAULT nextval('public.task_suggestions_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: trades id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_pendings_tasks id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.users_pendings_tasks ALTER COLUMN id SET DEFAULT nextval('public.users_pendings_tasks_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: work_zone_visit_logs id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zone_visit_logs ALTER COLUMN id SET DEFAULT nextval('public.work_zone_visit_logs_id_seq'::regclass);


--
-- Name: work_zones id; Type: DEFAULT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zones ALTER COLUMN id SET DEFAULT nextval('public.work_zones_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
69	documents	Task	503	69	2019-07-19 20:28:19.423466
70	documents	Task	503	70	2019-07-19 20:28:19.427059
71	documents	Task	503	71	2019-07-19 20:28:19.430228
72	documents	Task	504	72	2019-07-19 20:33:23.685973
73	documents	Task	505	73	2019-07-19 20:43:28.544791
74	documents	Task	506	74	2019-07-19 20:49:31.039941
75	documents	Task	506	75	2019-07-19 20:49:31.041351
76	documents	Task	506	76	2019-07-19 20:49:31.042383
77	documents	Task	506	77	2019-07-19 20:49:31.043361
78	documents	Task	508	78	2019-07-20 08:29:30.823063
79	documents	Task	509	79	2019-07-21 19:58:13.071309
80	documents	Task	509	80	2019-07-21 19:58:13.074269
81	documents	Task	509	81	2019-07-21 19:58:13.075657
82	documents	Task	509	82	2019-07-21 19:58:13.076908
90	documents	Task	514	90	2019-07-22 19:50:55.010318
91	documents	Task	514	91	2019-07-22 19:50:55.0152
104	documents	Task	521	104	2019-07-23 09:30:58.267993
105	documents	Task	524	105	2019-08-06 21:34:51.592004
38	documents	Task	447	38	2019-07-17 21:53:57.807433
39	documents	Task	419	39	2019-07-17 22:02:40.640368
106	documents	Task	524	106	2019-08-06 21:34:51.597658
107	documents	Task	524	107	2019-08-06 21:34:51.600321
108	documents	Task	534	108	2019-08-13 08:24:11.622853
109	documents	Task	534	109	2019-08-13 08:24:11.631792
47	documents	Task	447	47	2019-07-18 08:24:30.545881
48	documents	Task	447	48	2019-07-18 08:24:30.551486
49	documents	Task	447	49	2019-07-18 08:25:10.002031
50	documents	Task	447	50	2019-07-18 08:25:10.007107
51	documents	Task	447	51	2019-07-18 08:26:29.87227
52	documents	Task	447	52	2019-07-18 08:26:29.876125
53	documents	Task	447	53	2019-07-18 09:35:43.601309
54	documents	Task	447	54	2019-07-18 09:35:43.604974
111	documents	Task	538	111	2019-08-13 21:28:28.901335
112	documents	Task	559	112	2019-09-02 10:15:41.107636
113	documents	Task	559	113	2019-09-02 10:15:41.114426
114	documents	Task	560	114	2019-09-02 11:09:32.581982
115	documents	Task	561	115	2019-09-02 11:12:17.595982
116	documents	Task	561	116	2019-09-02 11:12:17.598232
117	documents	Task	562	117	2019-09-02 13:39:07.523853
118	documents	Task	564	118	2019-09-02 20:26:49.992179
119	documents	Task	564	119	2019-09-02 20:26:49.994441
120	documents	Task	565	120	2019-09-02 20:31:55.247883
121	documents	Task	566	121	2019-09-04 15:54:45.568333
122	documents	Task	566	122	2019-09-04 15:54:45.571235
123	documents	Task	567	123	2019-09-04 16:01:37.878799
124	documents	Task	568	124	2019-09-04 16:07:33.617499
125	documents	Task	574	125	2019-09-10 16:47:25.806795
126	documents	Task	577	126	2019-09-11 09:22:36.372662
127	documents	Task	591	127	2019-09-26 21:56:46.187909
128	documents	Task	592	128	2019-10-01 07:31:49.372827
129	documents	Task	592	129	2019-10-01 07:31:49.378468
130	documents	Task	597	130	2019-10-04 11:55:32.891512
131	documents	Task	597	131	2019-10-04 11:55:32.894008
132	documents	Task	598	132	2019-10-04 11:56:52.038782
133	documents	Task	598	133	2019-10-04 11:56:52.041258
134	documents	Task	599	134	2019-10-04 13:26:24.125203
135	documents	Task	599	135	2019-10-04 13:26:24.130831
136	documents	Task	600	136	2019-10-04 13:28:15.226514
137	documents	Task	600	137	2019-10-04 13:28:15.22842
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
69	C4FymyRo3tb3Cq6i598ScBvB	хоккей (2).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3888840	/2VSFf6boXjFhYPaJn397A==	2019-07-19 20:28:19.420987
70	LWdpTU8bixEENffZz75FmXus	TERMS.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-19 20:28:19.425651
71	YdAv9TYFZ9AZAH46KAcrVABn	purchase_order_301.pdf	application/pdf	{"identified":true,"analyzed":true}	24296	eLZBT8t9viyyAzuSfkX9vQ==	2019-07-19 20:28:19.428891
72	9pnqa4ZGYp4reJUbhnFxJ1nh	Penguins - копия.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	777835	nTd7EM53jEk4s8fixjoimg==	2019-07-19 20:33:23.606122
73	R8ZKMzVUhXUDYgza3PGHaQuw	purchase_order_342.pdf	application/pdf	{"identified":true,"analyzed":true}	25131	xXHHVnI5T6NGp0WIavfyPg==	2019-07-19 20:43:28.28555
74	qADAjXqswtkapdiAJ9UboEsX	хоккей (2).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3888840	/2VSFf6boXjFhYPaJn397A==	2019-07-19 20:49:30.918979
75	ZeofiY31RyAdQmUXHnaHckzh	TERMS (1).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-19 20:49:30.940156
77	dK1DW2qNNkqhno46xkWRU1kb	purchase_order_368.pdf	application/pdf	{"identified":true,"analyzed":true}	26636	RFzwRH3/o2zR0ckBxuDDJw==	2019-07-19 20:49:30.949849
76	SaKNem6XFErPxsfukkhuZtPJ	Screenshot_20181102-012332_Astra Tenders.jpg	image/jpeg	{"identified":true,"width":1080,"height":2220,"analyzed":true}	266996	u4o4IZZOVlLOJg4ITQAoYA==	2019-07-19 20:49:30.944917
79	SWnftkAJd4yddiB7bBGnzD8p	Invoce Astra Group.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	23295	utA5mzebfoVh2pz9VJDudg==	2019-07-21 19:58:12.63503
80	1GQfd5n6FsUFeeT7vVXZECvc	Work Order Astra Group.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	32903	WA/bSOez45b6GVpoPpZY2A==	2019-07-21 19:58:12.647322
81	1jxYrFsffiULE7N3PmMVgRAK	Правки по Админ-панеле.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	184096	hnA0jn0/H0wDsQaLazwstA==	2019-07-21 19:58:12.654298
82	kgJFo5VoLm95LLwamyPwvfe8	ТЗ №2.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	15003	RUNdTjlu0EkmaZGy69oeSA==	2019-07-21 19:58:12.657176
90	tMj9k5cZSTLMbAevk5LYEDH2	ТЗ №2.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	15003	RUNdTjlu0EkmaZGy69oeSA==	2019-07-22 19:50:54.756858
91	6p5DQLZBf4hiv8Bpso3obqvo	Astra Group - Pre-Qualification Form notes.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	18791	XBHAsVlcFjYSTPHaQVOi6A==	2019-07-22 19:50:54.761129
104	YvbfbFk4wSJ7EvwybmQcZ3Ry	візитка_2.pdf	application/pdf	{"identified":true,"analyzed":true}	1505870	ONZXPf0JshlIOOpToDnmEQ==	2019-07-23 09:30:58.025594
105	qyw5TbBRxheu6j3YQ8cUQwFH	Penguins - копия.jpg	image/jpeg	{"identified":true}	777835	nTd7EM53jEk4s8fixjoimg==	2019-08-06 21:34:51.11443
106	3NMD9qJ65KkvV6JcfMhyLNJ9	1 (2).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true}	26814	egQ+xJ2iYxYOsUu+k94ZZQ==	2019-08-06 21:34:51.129288
107	TrfscGdFs2fhsDyDFju2XK4i	70c4397eb9599055da6e3ecefdc826b2 (1).pdf	application/pdf	{"identified":true}	6378170	QTPPZMaCSkiwW5eW/BBbHQ==	2019-08-06 21:34:51.169071
108	MEj8hekapnB1dvbv2NhGF4NX	Astra-Our_Company_Brochure(Online).pdf	application/pdf	{"identified":true}	1520216	JTgnNOEauBSptevinaOGNw==	2019-08-13 08:24:11.328583
109	NSk3tSWHq1zYry5NDfhPThrN	1 (5).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true}	30202	LKiROu0yWl+9Rx5h1LG9EQ==	2019-08-13 08:24:11.350528
113	G4MzYtMCa1d82yJSgqAGv1mc	invoice_order_309.pdf	application/pdf	{"identified":true,"analyzed":true}	24101	YrsaiV6u8dgEzXWcbKpFlg==	2019-09-02 10:15:40.423932
45	Qajf61AeF5ptF9ou4oAGaJdv	TERMS.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-18 06:40:26.03402
44	k3vZLJKZkUgggjtuUVAFFnXw	хоккей (1).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3806108	jJzawG4IBipzuUNywwP08g==	2019-07-18 06:40:26.029861
47	foPSvqQ8NyJZR3hDyjvTfM1Y	13000R1-640x480.jpg	image/jpeg	{"identified":true,"width":640,"height":480,"analyzed":true}	47256	vf4oe7BauYAv6i4cI98Tyg==	2019-07-18 08:24:30.542408
49	4JB4QZ6by8djHfFTtDXG9UNe	01_category.jpg	image/jpeg	{"identified":true,"width":600,"height":600,"analyzed":true}	54236	3j5/+j2w/lIifspxqr2GWA==	2019-07-18 08:25:09.998686
48	k7rXm1c9DToyuh5Hnr4pyjmN	about-img.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	138772	+sSGYN9IECrh1jzzzHFx7A==	2019-07-18 08:24:30.549455
46	mqBZPkGfjysDWsyryijy5W8s	Screenshot_20181102-012332_Astra Tenders.jpg	image/jpeg	{"identified":true,"width":1080,"height":2220,"analyzed":true}	266996	u4o4IZZOVlLOJg4ITQAoYA==	2019-07-18 06:40:26.03819
50	Tss1nQFJyUsLK4XVZcArUeVU	02_category.jpg	image/jpeg	{"identified":true,"width":600,"height":600,"analyzed":true}	26272	QOorR4rBMSUPMrosSV/IWg==	2019-07-18 08:25:10.005408
39	bDtf8BPRWaToTd9mB2zmvCuV	image_2019-07-16_12-05-26.png	image/png	{"identified":true,"width":413,"height":102,"analyzed":true}	38972	Hwd3vRrPXc+VehT5hfjq4Q==	2019-07-17 22:02:40.624497
112	8AKTvG1pnu3kMHBVaocXYo8T	Penguins - копия.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	777835	nTd7EM53jEk4s8fixjoimg==	2019-09-02 10:15:40.406681
117	wKrG8R1kpg4G65ksw3ae3Jxj	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-09-02 13:39:07.165163
120	tKxiJ6AFH4zXW3GAxqJP8DKD	1 (3).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	31738	HfqNCqtC+ZZeMc5CQjS2YQ==	2019-09-02 20:31:54.903677
125	m85fhzwdRgKpczwA1iSPvuv1	Chrysanthemum.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	879394	B248rtdYocGMkaDpyuM2jw==	2019-09-10 16:47:25.800611
38	yy9hitpdqjHcp98Z27vug8Ch	668x1002-fit-5Hw4xB4IuJayyGhTUwcUsj7YQWd82RQ3NWGrs5LT-600x600.jpg	image/jpeg	{"identified":true,"width":600,"height":600,"analyzed":true}	51690	5aoowCAzbSO/sMZbOTLBHw==	2019-07-17 21:53:57.793866
128	KcNm8DV1B8wFxM9sAo4MvwwL	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-10-01 07:31:48.929615
78	fMei1ryd5ojDaGGCUBqb7iTb	image_2019-07-16_12-05-26.png	image/png	{"identified":true,"width":413,"height":102,"analyzed":true}	38972	Hwd3vRrPXc+VehT5hfjq4Q==	2019-07-20 08:29:30.448895
96	cUHEdJMJCYYdmgnhqipv8Hdy	хоккей (2).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3888840	/2VSFf6boXjFhYPaJn397A==	2019-07-22 20:49:10.556647
99	8LBfzsSyWAvxbe9jTo49Czmj	purchase_order_342.pdf	application/pdf	{"identified":true,"analyzed":true}	25131	xXHHVnI5T6NGp0WIavfyPg==	2019-07-22 20:49:10.569408
97	ni8e7yERjjcEpbeGMLrxHrYA	Screenshot_20181102-012332_Astra Tenders.jpg	image/jpeg	{"identified":true,"width":1080,"height":2220,"analyzed":true}	266996	u4o4IZZOVlLOJg4ITQAoYA==	2019-07-22 20:49:10.561669
98	pzs8VMcU6rxKJeuKzk9nF1Rr	Screenshot_20181102-012332_Astra Tenders.jpg	image/jpeg	{"identified":true,"width":1080,"height":2220,"analyzed":true}	266996	u4o4IZZOVlLOJg4ITQAoYA==	2019-07-22 20:49:10.566087
52	B236nEHNXNBCYVgF8VE1K1bh	03_slider_image.jpg	image/jpeg	{"identified":true,"width":1920,"height":1152,"analyzed":true}	126379	GcOz5aUkK9hZq5JPlZsMZQ==	2019-07-18 08:26:29.874692
51	ScLj2EeAHv86nrJn8vCdSAMe	02_slider_image.jpg	image/jpeg	{"identified":true,"width":1920,"height":1152,"analyzed":true}	342648	u/pwBON0hohzHTlKN1TOEA==	2019-07-18 08:26:29.869693
54	rzr2iLpr4nuvejWfh16YfexN	_9-640x480.jpg	image/jpeg	{"identified":true,"width":640,"height":480,"analyzed":true}	59708	a5A1AonFH2qSir7rDVHJXA==	2019-07-18 09:35:43.603607
53	j6QR5E8mBC8oxXFTzRUtx5KR	_6-640x480.jpg	image/jpeg	{"identified":true,"width":640,"height":480,"analyzed":true}	61500	QhpbpNa/95TUW6Z4F292ag==	2019-07-18 09:35:43.597748
100	F6ZkJLHhT9C2iVWChv3YYfrw	хоккей (1).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3806108	jJzawG4IBipzuUNywwP08g==	2019-07-22 20:52:45.809409
103	CberWzURqq5tfRr4iBR8btQ3	purchase_order_342.pdf	application/pdf	{"identified":true,"analyzed":true}	25131	xXHHVnI5T6NGp0WIavfyPg==	2019-07-22 20:52:45.824198
101	v5MT2ueV8AMKFwN6xA1Nuifg	TERMS (1).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-22 20:52:45.814315
102	8VKLmkoG1WhcAK3KSBMNM4Wf	TERMS.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-22 20:52:45.819324
110	qLwahe2ZoS4ezGXovdd4UsPC	5.png	image/png	{"identified":true}	13257	b7O2rBzfbdCtVw5rzQZnGg==	2019-08-13 21:27:41.613448
111	xHBXwWSwVH58zNMV85xSBF1A	0.png	image/png	{"identified":true}	47381	wmeqoEHSsQdnFMcgWDc7FQ==	2019-08-13 21:28:28.815287
92	NfvYcNjibH1cokz4uKj8jqek	purchase_order_301.pdf	application/pdf	{"identified":true,"analyzed":true}	24296	eLZBT8t9viyyAzuSfkX9vQ==	2019-07-22 20:34:00.147756
95	UcxK2hCoMDSN8xU2dARFNye5	TERMS.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	{"identified":true,"analyzed":true}	26138	Lw9GnUf7Vrv1o0/p/GXmrw==	2019-07-22 20:34:00.195406
93	8kqBpn758hDYwXHKXovHUG8H	хоккей (1).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	3806108	jJzawG4IBipzuUNywwP08g==	2019-07-22 20:34:00.182636
94	5XY5fPhKUiYHDjSR4qZd2Byt	Screenshot_20181031-232427_Astra Tenders.jpg	image/jpeg	{"identified":true,"width":1080,"height":2220,"analyzed":true}	334861	mI8o4dpP0cipMHC9LhEDXw==	2019-07-22 20:34:00.18997
116	RoKvWrpxBVRwN4og5VRcs2vU	icon-contractors.svg	image/svg+xml	{"identified":true}	6968	aDMvj4BQKtx9kkYQdz27Cg==	2019-09-02 11:12:17.255367
114	9Dy1xNe8q1VAM5eJWKCgrPpk	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	{"identified":true,"width":640,"height":342,"analyzed":true}	34810	7LgQiTzaup16qkxccJL5PQ==	2019-09-02 11:09:31.718811
115	jjAmn9kNKauSQgTmWU4VMJWD	icon-chevron.svg	image/svg+xml	{"identified":true,"width":10,"height":6,"analyzed":true}	190	WmcO+GwmIAbDvnR15zT2hw==	2019-09-02 11:12:17.242769
119	EnJXRemcC6qDwY7yb8VxAc52	1 (2).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	26814	egQ+xJ2iYxYOsUu+k94ZZQ==	2019-09-02 20:26:49.596148
118	oHxTvnPc5br4ZfaRQrA6iqQx	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-09-02 20:26:49.587435
121	TmLqMz4qrGcdvGUmq2k2jNf1	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-09-04 15:54:45.197544
122	qTUbsWnTbEzsEt9p8uoRnH3H	change_order_158.pdf	application/pdf	{"identified":true,"analyzed":true}	25087	pAIAckYhMZ7MkiFoktQjwQ==	2019-09-04 15:54:45.203302
123	EHgPDp8gqTGQmCVw4r7ckCCa	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	{"identified":true,"width":640,"height":342,"analyzed":true}	34810	7LgQiTzaup16qkxccJL5PQ==	2019-09-04 16:01:37.488597
124	GGAHhXaa8ktefu79LBKQqm4R	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-09-04 16:07:33.037948
126	UQbjJN3deyjSt7V5UdhHEY71	Penguins.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	777835	nTd7EM53jEk4s8fixjoimg==	2019-09-11 09:22:36.107689
127	2z8M9dbuFXDLmBaB9m64vmtW	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	{"identified":true,"width":640,"height":342,"analyzed":true}	34810	7LgQiTzaup16qkxccJL5PQ==	2019-09-26 21:56:45.830692
129	zdKYT2sjW7VREdpw7E4yd9t7	1729661_aviaticket_9506590 (1).pdf	application/pdf	{"identified":true,"analyzed":true}	325834	X9IWjRJg8ObySS1kugz5Fw==	2019-10-01 07:31:48.946167
130	sTr2HAY8QgFhyKqk4UkWaZtW	2 (1).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	37741	4NpiVGWVM0hsTeCps23GpA==	2019-10-04 11:55:32.486411
131	PPYRZF3cEAcRPRQ5KCYEDgrq	1729661_aviaticket_9506590 (1).pdf	application/pdf	{"identified":true,"analyzed":true}	325834	X9IWjRJg8ObySS1kugz5Fw==	2019-10-04 11:55:32.497808
133	TWKSVpeh5jxVmXaak5ybnFUt	1 (7).xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	{"identified":true,"analyzed":true}	36028	97G3LtCWOhR7d6yqwb0JCg==	2019-10-04 11:56:51.702731
132	8xSK4Cjq4NuxTet8JzVmh4EP	Без названия (1).jpg	image/jpeg	{"identified":true,"width":259,"height":194,"analyzed":true}	7863	2qvu07Uq7ijF1qfONNm2MQ==	2019-10-04 11:56:51.698657
134	Uzc6bPVRz5jQjQyufZK6fmzY	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	{"identified":true,"width":640,"height":342,"analyzed":true}	34810	7LgQiTzaup16qkxccJL5PQ==	2019-10-04 13:26:23.755225
135	8FUkSvkcaJhFJvWdm5Vb8wTQ	1729661_aviaticket_9506581 (1).pdf	application/pdf	{"identified":true,"analyzed":true}	326177	HXC78XngUTSli7fdnalAoA==	2019-10-04 13:26:23.769698
136	2sPPrtTXp2MyrEgYtz1bei7P	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	{"identified":true,"width":299,"height":265,"analyzed":true}	39477	52kgi8K+iWTEB/4lLnAFWQ==	2019-10-04 13:28:14.762092
137	6kbBGW6b4g9bbGa46M2qzjJN	gipsokarton.png	image/png	{"identified":true,"width":200,"height":200,"analyzed":true}	41077	Izu/GS3qYleR5rFQG5C4cQ==	2019-10-04 13:28:14.766038
\.


--
-- Data for Name: addresscs; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.addresscs (id, street, city, province, postal_code, created_at, updated_at) FROM stdin;
1			\N		2018-09-04 12:39:15.406849	2018-09-04 12:39:15.406849
2			\N		2018-09-04 12:39:15.410184	2018-09-04 12:39:15.410184
3			\N		2018-09-04 12:39:15.416026	2018-09-04 12:39:15.416026
4			\N		2018-09-04 12:39:15.423221	2018-09-04 12:39:15.423221
5			\N	\N	2018-09-04 12:39:15.443925	2018-09-04 12:39:15.443925
6	Mailing Address:	city	Manitoba	054	2018-09-04 12:41:26.060669	2018-09-04 12:41:26.060669
7			\N		2018-09-04 12:41:26.066245	2018-09-04 12:41:26.066245
8			\N		2018-09-04 12:41:26.071542	2018-09-04 12:41:26.071542
9			\N		2018-09-04 12:41:26.076668	2018-09-04 12:41:26.076668
10	Project Address:	056	Quebec	\N	2018-09-04 12:41:26.088924	2018-09-04 12:41:26.088924
11			\N		2018-09-06 22:21:29.698528	2018-09-06 22:21:29.698528
12			\N		2018-09-06 22:21:29.701761	2018-09-06 22:21:29.701761
13			\N		2018-09-06 22:21:29.708128	2018-09-06 22:21:29.708128
14			\N		2018-09-06 22:21:29.714492	2018-09-06 22:21:29.714492
15			\N	\N	2018-09-06 22:21:29.739718	2018-09-06 22:21:29.739718
16	Heroev Krut 16	Dnipro	New Brunswick	49100	2018-09-08 14:40:14.08559	2018-09-08 14:40:14.08559
17			\N		2018-09-08 14:40:14.088181	2018-09-08 14:40:14.088181
18			\N		2018-09-08 14:40:14.093237	2018-09-08 14:40:14.093237
19			\N		2018-09-08 14:40:14.09782	2018-09-08 14:40:14.09782
20	Canada	21212	Alberta	\N	2018-09-08 14:40:14.120627	2018-09-08 14:40:14.120627
21	Canada	424929	Alberta	\N	2018-09-08 14:40:14.12594	2018-09-08 14:40:14.12594
22			\N		2018-09-11 13:53:29.726878	2018-09-11 13:53:29.726878
23			\N		2018-09-11 13:53:29.728873	2018-09-11 13:53:29.728873
24			\N		2018-09-11 13:53:29.73237	2018-09-11 13:53:29.73237
25			\N		2018-09-11 13:53:29.735526	2018-09-11 13:53:29.735526
26			\N	\N	2018-09-11 13:53:29.743224	2018-09-11 13:53:29.743224
27	oreol	bird construct	Ontario	85 on 9C7	2018-09-13 19:05:51.927879	2018-09-13 19:05:51.927879
28			\N		2018-09-13 19:05:51.930942	2018-09-13 19:05:51.930942
29			\N		2018-09-13 19:05:51.936063	2018-09-13 19:05:51.936063
30			\N		2018-09-13 19:05:51.941168	2018-09-13 19:05:51.941168
31			Saskatchewan	\N	2018-09-13 19:05:51.953037	2018-09-13 19:05:51.953037
32			\N		2018-09-14 08:36:00.82498	2018-09-14 08:36:00.82498
33			\N		2018-09-14 08:36:00.82665	2018-09-14 08:36:00.82665
34			\N		2018-09-14 08:36:00.829509	2018-09-14 08:36:00.829509
35			\N		2018-09-14 08:36:00.832061	2018-09-14 08:36:00.832061
36			\N	\N	2018-09-14 08:36:00.838123	2018-09-14 08:36:00.838123
37			\N		2018-09-14 08:37:03.262849	2018-09-14 08:37:03.262849
38			\N		2018-09-14 08:37:03.264409	2018-09-14 08:37:03.264409
39			\N		2018-09-14 08:37:03.268156	2018-09-14 08:37:03.268156
40			\N		2018-09-14 08:37:03.271363	2018-09-14 08:37:03.271363
41			\N	\N	2018-09-14 08:37:03.279627	2018-09-14 08:37:03.279627
42	Shevchenko	Kobelyaki	\N	39200	2018-09-15 07:59:50.805092	2018-09-15 07:59:50.805092
43			\N		2018-09-15 07:59:50.807012	2018-09-15 07:59:50.807012
44			\N		2018-09-15 07:59:50.810218	2018-09-15 07:59:50.810218
45			\N		2018-09-15 07:59:50.813524	2018-09-15 07:59:50.813524
46			\N	\N	2018-09-15 07:59:50.821429	2018-09-15 07:59:50.821429
47	Shevchenko	Kobelyaki	\N	39200	2018-09-15 08:02:39.240232	2018-09-15 08:02:39.240232
48			\N		2018-09-15 08:02:39.243954	2018-09-15 08:02:39.243954
49			\N		2018-09-15 08:02:39.247051	2018-09-15 08:02:39.247051
50			\N		2018-09-15 08:02:39.250267	2018-09-15 08:02:39.250267
51			\N	\N	2018-09-15 08:02:39.258623	2018-09-15 08:02:39.258623
52	Heroev Krut 16	Dnipro	New Brunswick	49100	2018-09-15 17:59:37.716068	2018-09-15 17:59:37.716068
53			\N		2018-09-15 17:59:37.717707	2018-09-15 17:59:37.717707
54	4324324	Dnipro	New Brunswick	49100	2018-09-15 17:59:37.720504	2018-09-15 17:59:37.720504
55			\N		2018-09-15 17:59:37.723142	2018-09-15 17:59:37.723142
56	pobeda	49100	Newfoundland and Labrador	\N	2018-09-15 17:59:37.753735	2018-09-15 17:59:37.753735
57			\N		2018-09-15 20:12:23.441699	2018-09-15 20:12:23.441699
58			\N		2018-09-15 20:12:23.443337	2018-09-15 20:12:23.443337
59			\N		2018-09-15 20:12:23.44607	2018-09-15 20:12:23.44607
60			\N		2018-09-15 20:12:23.448857	2018-09-15 20:12:23.448857
61			\N	\N	2018-09-15 20:12:23.455091	2018-09-15 20:12:23.455091
62			\N	\N	2018-09-15 20:12:23.457838	2018-09-15 20:12:23.457838
63			British Columbia		2018-09-16 06:39:57.462989	2018-09-16 06:39:57.462989
64			\N		2018-09-16 06:39:57.46494	2018-09-16 06:39:57.46494
65			\N		2018-09-16 06:39:57.467963	2018-09-16 06:39:57.467963
66			\N		2018-09-16 06:39:57.470859	2018-09-16 06:39:57.470859
67			\N	\N	2018-09-16 06:39:57.478836	2018-09-16 06:39:57.478836
661	Shevchenko2	Kobelyaki	Manitoba	39200	2019-01-21 12:34:42.633432	2019-01-21 12:34:42.633432
662			Manitoba		2019-01-21 12:34:42.637849	2019-01-21 12:34:42.637849
70			\N		2018-09-21 09:02:14.64252	2018-09-21 09:02:14.64252
71			\N		2018-09-21 09:02:14.647721	2018-09-21 09:02:14.647721
397			\N		2018-11-12 22:16:36.297002	2018-11-12 22:16:36.297002
398			\N		2018-11-12 22:16:36.29974	2018-11-12 22:16:36.29974
663			Manitoba		2019-01-21 12:34:42.642672	2019-01-21 12:34:42.642672
75			\N		2018-09-21 19:50:01.9146	2018-09-21 19:50:01.9146
76			\N		2018-09-21 19:50:01.917845	2018-09-21 19:50:01.917845
664			Manitoba		2019-01-21 12:34:42.648988	2019-01-21 12:34:42.648988
402			\N		2018-11-12 22:34:19.197491	2018-11-12 22:34:19.197491
80	dasdasd	adasasd	Manitoba	d342342	2018-09-23 21:16:02.462218	2018-09-23 21:16:02.462218
81			\N		2018-09-23 21:16:02.466357	2018-09-23 21:16:02.466357
403	Kanada	NY	Alberta	65255	2018-11-12 22:34:19.199883	2018-11-12 22:34:19.199883
404	Kanada	Hitr	Yukon	52822	2018-11-12 22:34:19.202124	2018-11-12 22:34:19.202124
405	Kanada	Gom	Nunavut	45512	2018-11-12 22:34:19.204249	2018-11-12 22:34:19.204249
85			\N		2018-09-24 14:34:48.883972	2018-09-24 14:34:48.883972
86			\N		2018-09-24 14:34:48.88786	2018-09-24 14:34:48.88786
667			\N		2019-01-21 15:03:51.417981	2019-01-21 15:03:51.417981
668			\N		2019-01-21 15:03:51.421244	2019-01-21 15:03:51.421244
90			\N		2018-09-24 14:34:51.240627	2018-09-24 14:34:51.240627
91			\N		2018-09-24 14:34:51.244082	2018-09-24 14:34:51.244082
409	Kanada	Kanada	Yukon	556	2018-11-12 22:43:14.157389	2018-11-12 22:43:14.157389
410	Kanada	NY	Alberta	65255	2018-11-12 22:43:14.159886	2018-11-12 22:43:14.159886
678	148 Christie Park Hill SW 	Calgary 	Alberta	T3H2V5	2019-01-28 03:10:27.91272	2019-01-28 03:10:27.91272
95			\N		2018-09-24 14:34:52.450015	2018-09-24 14:34:52.450015
96			\N		2018-09-24 14:34:52.45386	2018-09-24 14:34:52.45386
679			\N		2019-01-28 03:10:27.916563	2019-01-28 03:10:27.916563
680			\N		2019-01-28 03:10:27.921419	2019-01-28 03:10:27.921419
681			\N		2019-01-28 03:10:27.925326	2019-01-28 03:10:27.925326
100			\N		2018-09-24 14:34:53.342784	2018-09-24 14:34:53.342784
101			\N		2018-09-24 14:34:53.357542	2018-09-24 14:34:53.357542
105			\N		2018-09-24 14:34:53.488174	2018-09-24 14:34:53.488174
106			\N		2018-09-24 14:34:53.504073	2018-09-24 14:34:53.504073
437			\N		2018-11-14 07:56:19.114002	2018-11-14 07:56:19.114002
438			\N		2018-11-14 07:56:19.116948	2018-11-14 07:56:19.116948
697			\N		2019-01-31 21:14:07.355227	2019-01-31 21:14:07.355227
110			\N		2018-09-24 14:34:53.749563	2018-09-24 14:34:53.749563
111			\N		2018-09-24 14:34:53.762655	2018-09-24 14:34:53.762655
698			\N		2019-01-31 21:14:07.361997	2019-01-31 21:14:07.361997
699	fhgjhgj	hgjhjkhj	New Brunswick	ghfhhgjhjhklkjkjjjjjjjjjjj	2019-01-31 21:45:06.468215	2019-01-31 21:45:06.468215
442			\N		2018-11-14 08:01:03.908216	2018-11-14 08:01:03.908216
115			\N		2018-09-24 14:34:53.932625	2018-09-24 14:34:53.932625
116			\N		2018-09-24 14:34:53.939794	2018-09-24 14:34:53.939794
443			\N		2018-11-14 08:01:03.910823	2018-11-14 08:01:03.910823
665					2019-01-21 15:03:51.41274	2019-02-04 09:57:48.25663
120			\N		2018-09-24 14:34:54.227705	2018-09-24 14:34:54.227705
121			\N		2018-09-24 14:34:54.230852	2018-09-24 14:34:54.230852
666					2019-01-21 15:03:51.414553	2019-02-04 09:57:48.258476
447			\N		2018-11-14 08:01:11.993962	2018-11-14 08:01:11.993962
448			\N		2018-11-14 08:01:11.996709	2018-11-14 08:01:11.996709
125			\N		2018-09-24 14:34:54.36398	2018-09-24 14:34:54.36398
126			\N		2018-09-24 14:34:54.373789	2018-09-24 14:34:54.373789
452			\N		2018-11-14 08:02:11.26437	2018-11-14 08:02:11.26437
453			\N		2018-11-14 08:02:11.267989	2018-11-14 08:02:11.267989
700					2019-01-31 21:45:06.470257	2019-02-04 12:41:47.578066
130			\N		2018-09-24 14:34:55.02333	2018-09-24 14:34:55.02333
131			\N		2018-09-24 14:34:55.026305	2018-09-24 14:34:55.026305
456			\N		2018-11-14 08:04:38.010751	2018-11-14 08:04:38.010751
457			\N		2018-11-14 08:04:38.014505	2018-11-14 08:04:38.014505
135			\N		2018-09-24 20:36:28.08672	2018-09-24 20:36:28.08672
136			\N		2018-09-24 20:36:28.090417	2018-09-24 20:36:28.090417
477			\N		2018-11-14 23:01:13.638449	2018-11-14 23:01:13.638449
478			\N		2018-11-14 23:01:13.646953	2018-11-14 23:01:13.646953
481			\N		2018-11-15 22:10:29.335426	2018-11-15 22:10:29.335426
482			\N		2018-11-15 22:10:29.338212	2018-11-15 22:10:29.338212
485			\N		2018-11-15 22:15:08.179308	2018-11-15 22:15:08.179308
486			\N		2018-11-15 22:15:08.18181	2018-11-15 22:15:08.18181
489			Alberta		2018-11-16 05:21:16.129255	2018-11-16 05:21:16.129255
490			Alberta		2018-11-16 05:21:16.133064	2018-11-16 05:21:16.133064
415			\N		2018-11-13 14:09:44.364962	2018-11-13 14:09:44.364962
140			\N		2018-09-25 06:00:22.512476	2018-09-25 06:00:22.512476
141			\N		2018-09-25 06:00:22.515112	2018-09-25 06:00:22.515112
416	Kanada	Kanada	Yukon	553242	2018-11-13 14:09:44.370175	2018-11-13 14:09:44.370175
671	sdfsdf	sdfsdfsdf	Saskatchewan	11111	2019-01-22 09:55:27.770199	2019-01-22 09:55:27.770199
672			\N		2019-01-22 09:55:27.77342	2019-01-22 09:55:27.77342
145			\N		2018-09-25 06:00:24.37269	2018-09-25 06:00:24.37269
146			\N		2018-09-25 06:00:24.377164	2018-09-25 06:00:24.377164
460			Manitoba		2018-11-14 08:39:24.530378	2018-11-14 08:39:24.530378
461			Manitoba		2018-11-14 08:39:24.534318	2018-11-14 08:39:24.534318
150			\N		2018-09-25 06:00:25.584181	2018-09-25 06:00:25.584181
151			\N		2018-09-25 06:00:25.586817	2018-09-25 06:00:25.586817
674	Ghjjh	Gghjjf	Prince Edward Island		2019-01-22 10:08:56.545772	2019-01-22 10:08:56.545772
675			\N		2019-01-22 10:08:56.547268	2019-01-22 10:08:56.547268
464			\N		2018-11-14 08:45:39.26185	2018-11-14 08:45:39.26185
155			\N		2018-09-25 06:00:26.940316	2018-09-25 06:00:26.940316
156			\N		2018-09-25 06:00:26.942973	2018-09-25 06:00:26.942973
465			\N		2018-11-14 08:45:39.264713	2018-11-14 08:45:39.264713
676			\N		2019-01-22 10:08:56.550216	2019-01-22 10:08:56.550216
677	Dndnrne	Dhdjrj	Saskatchewan	Fndjrjdkd	2019-01-22 10:08:56.552993	2019-01-22 10:08:56.552993
160			\N		2018-09-25 07:36:18.438898	2018-09-25 07:36:18.438898
161			\N		2018-09-25 07:36:18.441387	2018-09-25 07:36:18.441387
468			\N		2018-11-14 08:54:12.545031	2018-11-14 08:54:12.545031
469			\N		2018-11-14 08:54:12.548244	2018-11-14 08:54:12.548244
715			\N		2019-02-01 22:56:20.680173	2019-02-01 22:56:20.680173
165			\N		2018-09-28 10:19:47.733555	2018-09-28 10:19:47.733555
166			\N		2018-09-28 10:19:47.736779	2018-09-28 10:19:47.736779
683	Shevchenko	Kobelyaki	Manitoba	39200	2019-01-30 23:21:05.193157	2019-01-30 23:21:05.193157
472			Alberta		2018-11-14 15:25:17.049597	2018-11-14 15:25:17.049597
473			Alberta		2018-11-14 15:25:17.052283	2018-11-14 15:25:17.052283
170			\N		2018-09-28 11:00:50.070049	2018-09-28 11:00:50.070049
171			\N		2018-09-28 11:00:50.073102	2018-09-28 11:00:50.073102
684			Manitoba		2019-01-30 23:21:05.194738	2019-01-30 23:21:05.194738
685			Manitoba		2019-01-30 23:21:05.197613	2019-01-30 23:21:05.197613
686			Manitoba		2019-01-30 23:21:05.200676	2019-01-30 23:21:05.200676
175			\N		2018-09-28 11:58:52.985226	2018-09-28 11:58:52.985226
176			\N		2018-09-28 11:58:52.98844	2018-09-28 11:58:52.98844
493			Manitoba		2018-11-18 17:13:50.270958	2018-11-18 17:13:50.270958
494			Manitoba		2018-11-18 17:13:50.274933	2018-11-18 17:13:50.274933
701	ertyuio	tyuio	Newfoundland and Labrador	ertyuio	2019-01-31 21:45:06.473993	2019-01-31 21:45:06.473993
180			\N		2018-09-28 11:58:54.987844	2018-09-28 11:58:54.987844
181			\N		2018-09-28 11:58:54.990791	2018-09-28 11:58:54.990791
702			\N		2019-01-31 21:45:06.477702	2019-01-31 21:45:06.477702
505	Ветеринарная	Kobelyaki	Ontario	39200	2018-11-19 00:08:59.581768	2018-11-19 00:08:59.581768
506	hfghfghgfh	Kobelyaki	Manitoba	39200	2018-11-19 00:08:59.585605	2018-11-19 00:08:59.585605
185			\N		2018-09-28 11:58:56.978936	2018-09-28 11:58:56.978936
186			\N		2018-09-28 11:58:56.981544	2018-09-28 11:58:56.981544
710			\N		2019-02-01 22:43:56.365774	2019-02-01 22:43:56.365774
509	Ветеринарная	Kobelyaki	Manitoba	39200	2018-11-19 00:10:05.018072	2018-11-19 00:10:05.018072
190			\N		2018-09-28 11:58:59.212757	2018-09-28 11:58:59.212757
191			\N		2018-09-28 11:58:59.215602	2018-09-28 11:58:59.215602
510	hfghfghgfh	Kobelyaki	Manitoba	39200	2018-11-19 00:10:05.021166	2018-11-19 00:10:05.021166
711			\N		2019-02-01 22:43:56.37263	2019-02-01 22:43:56.37263
195			\N		2018-09-28 21:39:31.705809	2018-09-28 21:39:31.705809
196			\N		2018-09-28 21:39:31.708579	2018-09-28 21:39:31.708579
570			\N		2018-11-21 00:07:16.800116	2018-11-21 00:07:16.800116
571	Kanada	NY	Alberta	63g36	2018-11-21 00:07:16.803109	2018-11-21 00:07:16.803109
200			\N		2018-09-29 08:20:20.521501	2018-09-29 08:20:20.521501
201			\N		2018-09-29 08:20:20.524327	2018-09-29 08:20:20.524327
572	Kanada	NY	British Columbia	63h258	2018-11-21 00:07:16.805835	2018-11-21 00:07:16.805835
714			\N		2019-02-01 22:56:20.676979	2019-02-01 22:56:20.676979
205			\N		2018-09-29 11:07:49.600133	2018-09-29 11:07:49.600133
206			\N		2018-09-29 11:07:49.602863	2018-09-29 11:07:49.602863
575	Kanada	KRT	Saskatchewan	52u8523	2018-11-21 00:24:18.417992	2018-11-21 00:24:18.417992
576	Kanada	NY	Alberta	63g36	2018-11-21 00:24:18.420694	2018-11-21 00:24:18.420694
210			\N		2018-09-29 11:13:34.769267	2018-09-29 11:13:34.769267
211			\N		2018-09-29 11:13:34.771725	2018-09-29 11:13:34.771725
718			\N		2019-02-01 23:12:25.157754	2019-02-01 23:12:25.157754
587			Prince Edward Island		2018-11-22 17:27:41.460768	2018-11-22 17:27:41.460768
588			Prince Edward Island		2018-11-22 17:27:41.463414	2018-11-22 17:27:41.463414
215			\N		2018-09-29 11:16:09.446359	2018-09-29 11:16:09.446359
216			\N		2018-09-29 11:16:09.448942	2018-09-29 11:16:09.448942
719			\N		2019-02-01 23:12:25.161333	2019-02-01 23:12:25.161333
591			Prince Edward Island		2018-11-22 17:31:27.739445	2018-11-22 17:31:27.739445
220			\N		2018-09-29 11:20:52.136881	2018-09-29 11:20:52.136881
221			\N		2018-09-29 11:20:52.139596	2018-09-29 11:20:52.139596
592			Prince Edward Island		2018-11-22 17:31:27.742114	2018-11-22 17:31:27.742114
722			\N		2019-02-01 23:29:14.374773	2019-02-01 23:29:14.374773
225			\N		2018-09-29 11:22:30.184249	2018-09-29 11:22:30.184249
226			\N		2018-09-29 11:22:30.186678	2018-09-29 11:22:30.186678
599			\N		2018-11-28 09:25:49.606545	2018-11-28 09:25:49.606545
600			\N		2018-11-28 09:25:49.609395	2018-11-28 09:25:49.609395
643			Alberta		2018-12-19 01:08:33.067776	2018-12-19 01:08:33.067776
230			\N		2018-09-29 11:46:17.118104	2018-09-29 11:46:17.118104
231			\N		2018-09-29 11:46:17.120919	2018-09-29 11:46:17.120919
723			\N		2019-02-01 23:29:14.378009	2019-02-01 23:29:14.378009
709					2019-02-01 22:43:56.360089	2019-02-02 02:36:43.156511
626			Manitoba		2018-12-14 00:24:42.695163	2018-12-14 00:24:42.695163
235			Alberta		2018-09-29 14:27:16.579977	2018-09-29 14:27:16.579977
236			Alberta		2018-09-29 14:27:16.584725	2018-09-29 14:27:16.584725
627			Manitoba		2018-12-14 00:24:42.698465	2018-12-14 00:24:42.698465
640	1122 40 AVE SW	Calgary 	Alberta	T2E 5T8	2018-12-19 01:08:33.060252	2018-12-19 01:08:33.060252
641			Alberta		2018-12-19 01:08:33.062052	2018-12-19 01:08:33.062052
240			\N		2018-09-29 17:59:36.818397	2018-09-29 17:59:36.818397
241			\N		2018-09-29 17:59:36.822059	2018-09-29 17:59:36.822059
642			Alberta		2018-12-19 01:08:33.064973	2018-12-19 01:08:33.064973
647			\N		2018-12-24 22:37:05.371059	2018-12-24 22:37:05.371059
245			Manitoba		2018-10-01 11:19:13.842906	2018-10-01 11:19:13.842906
246			Manitoba		2018-10-01 11:19:13.846093	2018-10-01 11:19:13.846093
648			\N		2018-12-24 22:37:05.373732	2018-12-24 22:37:05.373732
250			\N		2018-10-01 20:04:23.833327	2018-10-01 20:04:23.833327
251			\N		2018-10-01 20:04:23.837501	2018-10-01 20:04:23.837501
651			\N		2018-12-24 22:45:15.642663	2018-12-24 22:45:15.642663
652			\N		2018-12-24 22:45:15.644981	2018-12-24 22:45:15.644981
653			\N		2019-01-04 20:58:45.75548	2019-01-04 20:58:45.75548
255			Manitoba		2018-10-01 21:44:17.425509	2018-10-01 21:44:17.425509
256			Manitoba		2018-10-01 21:44:17.428859	2018-10-01 21:44:17.428859
654			\N		2019-01-04 20:58:45.757435	2019-01-04 20:58:45.757435
655			\N		2019-01-04 20:58:45.760608	2019-01-04 20:58:45.760608
656			\N		2019-01-04 20:58:45.763681	2019-01-04 20:58:45.763681
260			\N		2018-10-03 17:33:16.466527	2018-10-03 17:33:16.466527
261			\N		2018-10-03 17:33:16.470849	2018-10-03 17:33:16.470849
613					2018-12-09 22:38:53.279929	2019-01-06 14:25:36.652387
657	Park Land	Alberta 	Alberta	49017	2019-01-06 15:19:12.702452	2019-01-06 15:19:12.702452
658	sdfkhdl	sdfsd	Quebec	49000	2019-01-06 15:19:12.704634	2019-01-06 15:19:12.704634
659			\N		2019-01-06 15:19:12.707664	2019-01-06 15:19:12.707664
266			Alberta		2018-10-03 19:26:33.246174	2018-10-03 19:26:33.246174
267			Alberta		2018-10-03 19:26:33.249638	2018-10-03 19:26:33.249638
660			\N		2019-01-06 15:19:12.710907	2019-01-06 15:19:12.710907
716					2019-02-01 23:12:25.151612	2019-02-04 09:55:59.034476
717					2019-02-01 23:12:25.153823	2019-02-04 09:55:59.036257
726			\N		2019-02-04 22:30:53.534203	2019-02-04 22:30:53.534203
727			\N		2019-02-04 22:30:53.537439	2019-02-04 22:30:53.537439
724	23 W Meadows Pl, Canada	Calgary		AB T3Z 1M4	2019-02-04 22:30:53.528429	2019-02-04 22:43:49.109404
725					2019-02-04 22:30:53.530534	2019-02-04 22:43:49.111484
272			\N		2018-10-06 05:25:33.993027	2018-10-06 05:25:33.993027
273			\N		2018-10-06 05:25:33.996413	2018-10-06 05:25:33.996413
420			\N		2018-11-13 17:58:37.988495	2018-11-13 17:58:37.988495
421			\N		2018-11-13 17:58:37.993041	2018-11-13 17:58:37.993041
277			\N		2018-10-12 18:12:45.571486	2018-10-12 18:12:45.571486
278			\N		2018-10-12 18:12:45.577484	2018-10-12 18:12:45.577484
689			\N		2019-01-31 11:42:58.578261	2019-01-31 11:42:58.578261
690			\N		2019-01-31 11:42:58.581411	2019-01-31 11:42:58.581411
424			\N		2018-11-13 18:24:05.431678	2018-11-13 18:24:05.431678
282			Manitoba		2018-10-17 14:04:12.9583	2018-10-17 14:04:12.9583
283			Manitoba		2018-10-17 14:04:12.9625	2018-10-17 14:04:12.9625
425			\N		2018-11-13 18:24:05.435412	2018-11-13 18:24:05.435412
691			Prince Edward Island	14	2019-01-31 17:14:38.684218	2019-01-31 17:14:38.684218
692			Prince Edward Island		2019-01-31 17:14:38.685965	2019-01-31 17:14:38.685965
428	куцкцук		Prince Edward Island	49100	2018-11-13 18:46:04.314687	2018-11-13 18:46:04.314687
429			\N		2018-11-13 18:46:04.318531	2018-11-13 18:46:04.318531
693			Prince Edward Island		2019-01-31 17:14:38.689317	2019-01-31 17:14:38.689317
694			Prince Edward Island		2019-01-31 17:14:38.692138	2019-01-31 17:14:38.692138
703	d	d	Prince Edward Island	14	2019-01-31 23:29:21.113058	2019-01-31 23:29:21.113058
433			\N		2018-11-13 19:41:14.833386	2018-11-13 19:41:14.833386
287			\N		2018-10-31 10:31:53.235855	2018-10-31 10:31:53.235855
288			\N		2018-10-31 10:31:53.238532	2018-10-31 10:31:53.238532
434			\N		2018-11-13 19:41:14.838636	2018-11-13 19:41:14.838636
704			Prince Edward Island		2019-01-31 23:29:21.115118	2019-01-31 23:29:21.115118
705			Prince Edward Island		2019-01-31 23:29:21.118622	2019-01-31 23:29:21.118622
292			\N		2018-10-31 21:30:09.35317	2018-10-31 21:30:09.35317
293			\N		2018-10-31 21:30:09.356085	2018-10-31 21:30:09.356085
497			\N		2018-11-18 22:42:44.264333	2018-11-18 22:42:44.264333
498			\N		2018-11-18 22:42:44.267986	2018-11-18 22:42:44.267986
706			Prince Edward Island		2019-01-31 23:29:21.12201	2019-01-31 23:29:21.12201
297			\N		2018-10-31 22:09:16.286505	2018-10-31 22:09:16.286505
298			\N		2018-10-31 22:09:16.289189	2018-10-31 22:09:16.289189
501			\N		2018-11-19 00:05:43.291954	2018-11-19 00:05:43.291954
502	hfghfghgfh	Kobelyaki	Manitoba	39200	2018-11-19 00:05:43.295433	2018-11-19 00:05:43.295433
302	Kharkov	Kharkov	\N	61112	2018-11-01 23:04:59.351069	2018-11-01 23:04:59.351069
303			\N		2018-11-01 23:04:59.353723	2018-11-01 23:04:59.353723
708					2019-02-01 22:43:56.355754	2019-02-02 02:36:43.152428
513			\N		2018-11-19 05:02:40.595889	2018-11-19 05:02:40.595889
514			\N		2018-11-19 05:02:40.600274	2018-11-19 05:02:40.600274
517			\N		2018-11-19 05:02:40.645636	2018-11-19 05:02:40.645636
307			\N		2018-11-03 07:06:36.710748	2018-11-03 07:06:36.710748
308			\N		2018-11-03 07:06:36.713302	2018-11-03 07:06:36.713302
518			\N		2018-11-19 05:02:40.649477	2018-11-19 05:02:40.649477
312			\N		2018-11-03 07:31:53.651574	2018-11-03 07:31:53.651574
313			\N		2018-11-03 07:31:53.654407	2018-11-03 07:31:53.654407
521			\N		2018-11-19 05:02:40.779009	2018-11-19 05:02:40.779009
522			\N		2018-11-19 05:02:40.782903	2018-11-19 05:02:40.782903
317			\N		2018-11-03 12:56:49.680093	2018-11-03 12:56:49.680093
318			\N		2018-11-03 12:56:49.684296	2018-11-03 12:56:49.684296
525			\N		2018-11-19 05:06:09.896444	2018-11-19 05:06:09.896444
526			\N		2018-11-19 05:06:09.899308	2018-11-19 05:06:09.899308
322			\N		2018-11-03 12:57:38.041026	2018-11-03 12:57:38.041026
323			\N		2018-11-03 12:57:38.043565	2018-11-03 12:57:38.043565
327			\N		2018-11-04 22:48:04.779014	2018-11-04 22:48:04.779014
328			\N		2018-11-04 22:48:04.782113	2018-11-04 22:48:04.782113
530			\N		2018-11-19 13:23:08.244787	2018-11-19 13:23:08.244787
531			\N		2018-11-19 13:23:08.248104	2018-11-19 13:23:08.248104
534			\N		2018-11-19 13:59:43.182495	2018-11-19 13:59:43.182495
332			Manitoba		2018-11-05 22:20:04.593378	2018-11-05 22:20:04.593378
333			Manitoba		2018-11-05 22:20:04.596234	2018-11-05 22:20:04.596234
535			\N		2018-11-19 13:59:43.185845	2018-11-19 13:59:43.185845
337			Manitoba		2018-11-05 22:22:19.282727	2018-11-05 22:22:19.282727
338			Manitoba		2018-11-05 22:22:19.286718	2018-11-05 22:22:19.286718
538			\N		2018-11-19 14:14:51.280024	2018-11-19 14:14:51.280024
539			\N		2018-11-19 14:14:51.28348	2018-11-19 14:14:51.28348
342			Manitoba		2018-11-05 22:31:40.138025	2018-11-05 22:31:40.138025
343			Manitoba		2018-11-05 22:31:40.141167	2018-11-05 22:31:40.141167
542			\N		2018-11-19 14:23:10.397573	2018-11-19 14:23:10.397573
543			\N		2018-11-19 14:23:10.400311	2018-11-19 14:23:10.400311
347			\N		2018-11-06 07:51:09.158603	2018-11-06 07:51:09.158603
348			\N		2018-11-06 07:51:09.161503	2018-11-06 07:51:09.161503
546			Prince Edward Island		2018-11-19 14:33:05.697697	2018-11-19 14:33:05.697697
547	d	d	Prince Edward Island	14	2018-11-19 14:33:05.700889	2018-11-19 14:33:05.700889
352			\N		2018-11-07 06:30:52.558409	2018-11-07 06:30:52.558409
353			\N		2018-11-07 06:30:52.56214	2018-11-07 06:30:52.56214
550			Prince Edward Island		2018-11-19 14:43:55.564102	2018-11-19 14:43:55.564102
551			Prince Edward Island		2018-11-19 14:43:55.56801	2018-11-19 14:43:55.56801
554			\N		2018-11-19 15:19:04.226235	2018-11-19 15:19:04.226235
357			\N		2018-11-07 17:23:10.684357	2018-11-07 17:23:10.684357
358			\N		2018-11-07 17:23:10.687156	2018-11-07 17:23:10.687156
555			\N		2018-11-19 15:19:04.228883	2018-11-19 15:19:04.228883
362			\N		2018-11-07 17:45:02.442104	2018-11-07 17:45:02.442104
363			\N		2018-11-07 17:45:02.445277	2018-11-07 17:45:02.445277
558			\N		2018-11-19 15:24:44.459486	2018-11-19 15:24:44.459486
559	Kanada	Regina	Ontario	665f55	2018-11-19 15:24:44.462951	2018-11-19 15:24:44.462951
367			\N		2018-11-11 20:41:27.919422	2018-11-11 20:41:27.919422
368			\N		2018-11-11 20:41:27.92201	2018-11-11 20:41:27.92201
562	Kanada	Regina	Manitoba	52f9633	2018-11-19 15:38:51.974549	2018-11-19 15:38:51.974549
563	Kanada	Regina	Ontario	665f55	2018-11-19 15:38:51.978126	2018-11-19 15:38:51.978126
372			\N		2018-11-11 21:40:49.087105	2018-11-11 21:40:49.087105
373			\N		2018-11-11 21:40:49.08957	2018-11-11 21:40:49.08957
377			\N		2018-11-11 21:52:35.19092	2018-11-11 21:52:35.19092
378			\N		2018-11-11 21:52:35.1936	2018-11-11 21:52:35.1936
382			Alberta		2018-11-12 17:04:45.335797	2018-11-12 17:04:45.335797
383			Alberta		2018-11-12 17:04:45.338293	2018-11-12 17:04:45.338293
566			\N		2018-11-20 14:59:05.605838	2018-11-20 14:59:05.605838
567			\N		2018-11-20 14:59:05.610233	2018-11-20 14:59:05.610233
387			Manitoba		2018-11-12 17:12:50.463191	2018-11-12 17:12:50.463191
388			Manitoba		2018-11-12 17:12:50.465786	2018-11-12 17:12:50.465786
579			\N		2018-11-22 10:38:58.762541	2018-11-22 10:38:58.762541
580			\N		2018-11-22 10:38:58.765417	2018-11-22 10:38:58.765417
392			Manitoba		2018-11-12 17:14:25.632414	2018-11-12 17:14:25.632414
393			Manitoba		2018-11-12 17:14:25.634876	2018-11-12 17:14:25.634876
583			\N		2018-11-22 10:46:10.347301	2018-11-22 10:46:10.347301
584			\N		2018-11-22 10:46:10.3497	2018-11-22 10:46:10.3497
593	140 Lysander Place	Calgary	Alberta	T2C 1L8	2018-11-28 00:34:15.676492	2018-11-28 00:34:15.676492
594			\N		2018-11-28 00:34:15.678832	2018-11-28 00:34:15.678832
595			\N		2018-11-28 00:34:15.682844	2018-11-28 00:34:15.682844
596			\N		2018-11-28 00:34:15.687817	2018-11-28 00:34:15.687817
603			\N		2018-12-07 22:21:16.547587	2018-12-07 22:21:16.547587
604			\N		2018-12-07 22:21:16.551806	2018-12-07 22:21:16.551806
606	888 - 3rd Street SW, 10th Floor, Bankers Hall, West Tower	Calgary	Alberta	T2P 5C5	2018-12-08 17:56:14.439478	2018-12-08 17:56:14.439478
607			\N		2018-12-08 17:56:14.441819	2018-12-08 17:56:14.441819
608			Alberta		2018-12-08 17:56:14.446606	2018-12-08 17:56:14.446606
609			Alberta		2018-12-08 17:56:14.450743	2018-12-08 17:56:14.450743
612			British Columbia		2018-12-09 22:38:53.275908	2018-12-09 22:38:53.275908
614			\N		2018-12-09 22:38:53.284117	2018-12-09 22:38:53.284117
615			\N		2018-12-09 22:38:53.288935	2018-12-09 22:38:53.288935
618			\N		2018-12-10 21:48:28.754182	2018-12-10 21:48:28.754182
619			\N		2018-12-10 21:48:28.756782	2018-12-10 21:48:28.756782
622			\N		2018-12-10 22:38:33.917908	2018-12-10 22:38:33.917908
623			\N		2018-12-10 22:38:33.920563	2018-12-10 22:38:33.920563
628	150 Auburn Meadows Walk SE	Calgary	Alberta	T3M 2E7	2018-12-14 01:13:34.61089	2018-12-14 01:13:34.61089
629			\N		2018-12-14 01:13:34.612465	2018-12-14 01:13:34.612465
630	150 Auburn Meadows Walk SE	Calgary	Newfoundland and Labrador	T3M 2E7	2018-12-14 01:13:34.615279	2018-12-14 01:13:34.615279
631			\N		2018-12-14 01:13:34.618034	2018-12-14 01:13:34.618034
634			\N		2018-12-16 08:52:33.573766	2018-12-16 08:52:33.573766
635			\N		2018-12-16 08:52:33.579207	2018-12-16 08:52:33.579207
638			\N		2018-12-16 09:10:18.241401	2018-12-16 09:10:18.241401
639			\N		2018-12-16 09:10:18.245237	2018-12-16 09:10:18.245237
728	d	d	Prince Edward Island	14	2019-02-05 22:14:57.092865	2019-02-05 22:14:57.092865
729			Prince Edward Island		2019-02-05 22:14:57.094954	2019-02-05 22:14:57.094954
730			Prince Edward Island		2019-02-05 22:14:57.098398	2019-02-05 22:14:57.098398
731			Prince Edward Island		2019-02-05 22:14:57.10166	2019-02-05 22:14:57.10166
733	Tractorostroiteley 86/137	Kharkov	\N	61112	2019-02-05 22:33:20.066402	2019-02-05 22:33:20.066402
734			\N		2019-02-05 22:33:20.068406	2019-02-05 22:33:20.068406
735			\N		2019-02-05 22:33:20.072029	2019-02-05 22:33:20.072029
736			\N		2019-02-05 22:33:20.075188	2019-02-05 22:33:20.075188
737	d	d	Prince Edward Island	14	2019-02-05 22:55:39.74858	2019-02-05 22:55:39.74858
738			Prince Edward Island		2019-02-05 22:55:39.750969	2019-02-05 22:55:39.750969
739	d	d	Prince Edward Island	14	2019-02-05 22:55:39.755227	2019-02-05 22:55:39.755227
740			Prince Edward Island		2019-02-05 22:55:39.758638	2019-02-05 22:55:39.758638
741	Heroev Krut 16	Dnipro	Saskatchewan	49100	2019-02-05 23:17:59.020851	2019-02-05 23:17:59.020851
742	аыаыв		New Brunswick		2019-02-05 23:17:59.023112	2019-02-05 23:17:59.023112
743			\N		2019-02-05 23:17:59.027271	2019-02-05 23:17:59.027271
744			\N		2019-02-05 23:17:59.030812	2019-02-05 23:17:59.030812
747	915 14 Ave NW	Calgary	\N	 AB T2N 1N3	2019-02-05 23:55:07.612683	2019-02-05 23:55:07.612683
748			\N		2019-02-05 23:55:07.614711	2019-02-05 23:55:07.614711
749	tatyanakipot@yahoo.com		\N		2019-02-05 23:55:07.618362	2019-02-05 23:55:07.618362
750			\N		2019-02-05 23:55:07.621636	2019-02-05 23:55:07.621636
751	d	d	Prince Edward Island	14	2019-02-06 00:36:10.31815	2019-02-06 00:36:10.31815
752			Prince Edward Island		2019-02-06 00:36:10.319776	2019-02-06 00:36:10.319776
753			Prince Edward Island		2019-02-06 00:36:10.323635	2019-02-06 00:36:10.323635
754			Prince Edward Island		2019-02-06 00:36:10.32728	2019-02-06 00:36:10.32728
756	Shevchenko	Kobelyaki	\N	39200	2019-02-06 09:58:01.00651	2019-02-06 09:58:01.00651
757			\N		2019-02-06 09:58:01.009129	2019-02-06 09:58:01.009129
758			\N		2019-02-06 09:58:01.012952	2019-02-06 09:58:01.012952
759			\N		2019-02-06 09:58:01.016308	2019-02-06 09:58:01.016308
760			\N		2019-02-06 10:33:42.456113	2019-02-06 10:33:42.456113
761			\N		2019-02-06 10:33:42.457786	2019-02-06 10:33:42.457786
762			\N		2019-02-06 10:33:42.461136	2019-02-06 10:33:42.461136
763			\N		2019-02-06 10:33:42.464143	2019-02-06 10:33:42.464143
764	dffdsfdsfds	dsffdsfds	Manitoba	fdfdsfdsfds	2019-02-06 22:02:58.213915	2019-02-06 22:02:58.213915
765			\N		2019-02-06 22:02:58.215849	2019-02-06 22:02:58.215849
766			\N		2019-02-06 22:02:58.21929	2019-02-06 22:02:58.21929
767			\N		2019-02-06 22:02:58.222798	2019-02-06 22:02:58.222798
769	458 22 Ave NE	Calgary	Yukon	 AB T2E 1T7	2019-02-06 22:35:03.110523	2019-02-06 22:35:03.110523
771	458 22 Ave NE	Calgary	Yukon	 AB T2E 1T7	2019-02-06 22:35:03.11504	2019-02-06 22:35:03.11504
772			\N		2019-02-06 22:35:03.117833	2019-02-06 22:35:03.117833
774			Prince Edward Island		2019-02-06 22:51:15.843593	2019-02-06 22:51:15.843593
775			Prince Edward Island		2019-02-06 22:51:15.845388	2019-02-06 22:51:15.845388
776			Prince Edward Island		2019-02-06 22:51:15.848806	2019-02-06 22:51:15.848806
777			Prince Edward Island		2019-02-06 22:51:15.851814	2019-02-06 22:51:15.851814
770					2019-02-06 22:35:03.112159	2019-02-06 23:11:52.739309
778	458 22 Ave NE	Calgary	Yukon	 AB T2E 1T7	2019-02-06 23:27:03.755705	2019-02-06 23:27:03.755705
779			\N		2019-02-06 23:27:03.757929	2019-02-06 23:27:03.757929
780	458 22 Ave NE	Calgary	Yukon	 AB T2E 1T7	2019-02-06 23:27:03.761198	2019-02-06 23:27:03.761198
781			\N		2019-02-06 23:27:03.764309	2019-02-06 23:27:03.764309
783			Prince Edward Island		2019-02-08 00:39:21.473883	2019-02-08 00:39:21.473883
784			Prince Edward Island		2019-02-08 00:39:21.476755	2019-02-08 00:39:21.476755
785			Prince Edward Island		2019-02-08 00:39:21.480562	2019-02-08 00:39:21.480562
786			Prince Edward Island		2019-02-08 00:39:21.486082	2019-02-08 00:39:21.486082
787			Prince Edward Island		2019-02-08 10:01:47.88	2019-02-08 10:01:47.88
788			Prince Edward Island		2019-02-08 10:01:47.882156	2019-02-08 10:01:47.882156
789			Prince Edward Island		2019-02-08 10:01:47.886584	2019-02-08 10:01:47.886584
790			Prince Edward Island		2019-02-08 10:01:47.890145	2019-02-08 10:01:47.890145
791	Test	Test	Ontario	00000	2019-02-08 10:12:26.483018	2019-02-08 10:12:26.483018
792			\N		2019-02-08 10:12:26.48572	2019-02-08 10:12:26.48572
793	ph.dmitry.rudenko@gmail.com	Днепр	Manitoba	49000	2019-02-08 10:12:26.489672	2019-02-08 10:12:26.489672
794			\N		2019-02-08 10:12:26.493463	2019-02-08 10:12:26.493463
795	fox_home@gmail.com	Kiev	Quebec	55000	2019-02-08 10:48:40.772452	2019-02-08 10:48:40.772452
796			\N		2019-02-08 10:48:40.77586	2019-02-08 10:48:40.77586
797	fox_home@gmail.com	Kiev	\N	55000	2019-02-08 10:48:40.780613	2019-02-08 10:48:40.780613
798			\N		2019-02-08 10:48:40.785017	2019-02-08 10:48:40.785017
799		Calgary	Alberta	T2P-1Q8	2019-02-08 11:52:03.496118	2019-02-08 11:52:03.496118
800			\N		2019-02-08 11:52:03.499099	2019-02-08 11:52:03.499099
801	st. Somewhere	Calgary	Alberta	T2P-1Q8	2019-02-08 11:52:03.503648	2019-02-08 11:52:03.503648
802			\N		2019-02-08 11:52:03.508199	2019-02-08 11:52:03.508199
806			\N		2019-02-08 11:55:10.857484	2019-02-08 11:55:10.857484
807			\N		2019-02-08 11:55:10.85979	2019-02-08 11:55:10.85979
808			\N		2019-02-08 11:55:10.86348	2019-02-08 11:55:10.86348
809			\N		2019-02-08 11:55:10.866997	2019-02-08 11:55:10.866997
810	Shevchenko	Kobelyaki	Manitoba	39200	2019-02-08 13:10:15.831175	2019-02-08 13:10:15.831175
811			Manitoba		2019-02-08 13:10:15.83425	2019-02-08 13:10:15.83425
812			Manitoba		2019-02-08 13:10:15.838391	2019-02-08 13:10:15.838391
813			Manitoba		2019-02-08 13:10:15.84268	2019-02-08 13:10:15.84268
814	sdfsdf	sdfsdf	Ontario	dsf	2019-02-08 13:25:06.164676	2019-02-08 13:25:06.164676
815			\N		2019-02-08 13:25:06.167576	2019-02-08 13:25:06.167576
816			\N		2019-02-08 13:25:06.173316	2019-02-08 13:25:06.173316
817			\N		2019-02-08 13:25:06.178949	2019-02-08 13:25:06.178949
818			\N		2019-02-08 13:36:10.828452	2019-02-08 13:36:10.828452
819			\N		2019-02-08 13:36:10.832524	2019-02-08 13:36:10.832524
820			\N		2019-02-08 13:36:10.839697	2019-02-08 13:36:10.839697
821			\N		2019-02-08 13:36:10.844938	2019-02-08 13:36:10.844938
824	Kyskgzk@jfjc.cic	Hmvmv kgz	Alberta	Itskgzkzg	2019-02-08 14:46:08.160068	2019-02-08 14:46:08.160068
825			\N		2019-02-08 14:46:08.163288	2019-02-08 14:46:08.163288
826			\N		2019-02-08 14:46:08.168538	2019-02-08 14:46:08.168538
827			\N		2019-02-08 14:46:08.173071	2019-02-08 14:46:08.173071
828	pobeda	Dnipro	British Columbia	49100	2019-02-10 11:55:00.075918	2019-02-10 11:55:00.075918
830			\N		2019-02-10 11:55:00.083029	2019-02-10 11:55:00.083029
831			\N		2019-02-10 11:55:00.086614	2019-02-10 11:55:00.086614
833			\N		2019-02-11 00:34:05.163698	2019-02-11 00:34:05.163698
834			\N		2019-02-11 00:34:05.166024	2019-02-11 00:34:05.166024
835			\N		2019-02-11 00:34:05.170726	2019-02-11 00:34:05.170726
836			\N		2019-02-11 00:34:05.175621	2019-02-11 00:34:05.175621
837			\N		2019-02-11 00:39:52.075882	2019-02-11 00:39:52.075882
838			\N		2019-02-11 00:39:52.077819	2019-02-11 00:39:52.077819
839			\N		2019-02-11 00:39:52.081141	2019-02-11 00:39:52.081141
840			\N		2019-02-11 00:39:52.084373	2019-02-11 00:39:52.084373
841	 5323 Thorncliffe Dr NW	Calgary	\N	AB T2K 2Z4	2019-02-11 18:12:20.586018	2019-02-11 18:12:20.586018
842			\N		2019-02-11 18:12:20.588572	2019-02-11 18:12:20.588572
843			\N		2019-02-11 18:12:20.592975	2019-02-11 18:12:20.592975
844			\N		2019-02-11 18:12:20.597203	2019-02-11 18:12:20.597203
845			\N		2019-02-13 19:25:30.026325	2019-02-13 19:25:30.026325
846			\N		2019-02-13 19:25:30.029481	2019-02-13 19:25:30.029481
847			\N		2019-02-13 19:25:30.036411	2019-02-13 19:25:30.036411
848			\N		2019-02-13 19:25:30.041481	2019-02-13 19:25:30.041481
829					2019-02-10 11:55:00.078704	2019-03-02 13:46:30.940881
849	WB Bow TR @ 40 ST SW	Calgary	British Columbia	AB T3C	2019-03-05 18:53:08.640804	2019-03-05 18:53:08.640804
850	638 Hillcrest Ave SW	Calgary	Yukon	AB T2S 0M9	2019-03-05 18:53:08.645149	2019-03-05 18:53:08.645149
851	3020 Spiller Rd SE	Calgary	British Columbia	AB T2G 2P8	2019-03-05 18:53:08.654014	2019-03-05 18:53:08.654014
852			\N		2019-03-05 18:53:08.662633	2019-03-05 18:53:08.662633
854			\N		2019-03-07 21:57:50.373292	2019-03-07 21:57:50.373292
855			\N		2019-03-07 21:57:50.377336	2019-03-07 21:57:50.377336
856			\N		2019-03-07 21:57:50.388955	2019-03-07 21:57:50.388955
857			\N		2019-03-07 21:57:50.397621	2019-03-07 21:57:50.397621
858			\N		2019-03-09 15:58:34.70231	2019-03-09 15:58:34.70231
859			\N		2019-03-09 15:58:34.705888	2019-03-09 15:58:34.705888
860			\N		2019-03-09 15:58:34.717713	2019-03-09 15:58:34.717713
861			\N		2019-03-09 15:58:34.728015	2019-03-09 15:58:34.728015
863	32 Hill Rd NE	Calgary	\N	AB T2E 5E2	2019-03-10 13:37:07.123318	2019-03-10 13:37:07.123318
864			\N		2019-03-10 13:37:07.126892	2019-03-10 13:37:07.126892
865			\N		2019-03-10 13:37:07.136404	2019-03-10 13:37:07.136404
866			\N		2019-03-10 13:37:07.144063	2019-03-10 13:37:07.144063
867			\N		2019-03-10 17:22:52.421684	2019-03-10 17:22:52.421684
868			\N		2019-03-10 17:22:52.424873	2019-03-10 17:22:52.424873
869			\N		2019-03-10 17:22:52.433193	2019-03-10 17:22:52.433193
870			\N		2019-03-10 17:22:52.439952	2019-03-10 17:22:52.439952
871			\N		2019-03-10 17:23:48.385817	2019-03-10 17:23:48.385817
872			\N		2019-03-10 17:23:48.388507	2019-03-10 17:23:48.388507
873			\N		2019-03-10 17:23:48.395417	2019-03-10 17:23:48.395417
874			\N		2019-03-10 17:23:48.401137	2019-03-10 17:23:48.401137
875			\N		2019-03-10 17:25:08.767421	2019-03-10 17:25:08.767421
876			\N		2019-03-10 17:25:08.770961	2019-03-10 17:25:08.770961
877			\N		2019-03-10 17:25:08.782307	2019-03-10 17:25:08.782307
878			\N		2019-03-10 17:25:08.790303	2019-03-10 17:25:08.790303
879			\N		2019-03-10 18:34:27.019733	2019-03-10 18:34:27.019733
880			\N		2019-03-10 18:34:27.022736	2019-03-10 18:34:27.022736
881			\N		2019-03-10 18:34:27.031575	2019-03-10 18:34:27.031575
882			\N		2019-03-10 18:34:27.038822	2019-03-10 18:34:27.038822
883	332 Hill Rd NE, Calgary, AB T2E 5E2, Канада A		\N		2019-03-14 21:25:30.219117	2019-03-14 21:25:30.219117
884			\N		2019-03-14 21:25:30.229022	2019-03-14 21:25:30.229022
885			\N		2019-03-14 21:25:30.253672	2019-03-14 21:25:30.253672
886			\N		2019-03-14 21:25:30.275613	2019-03-14 21:25:30.275613
887	Shevchenko	Kobelyaki	Poltava	39200	2019-03-21 23:15:49.262941	2019-03-21 23:15:49.262941
888	Shevchenko	Kobelyaki	Poltava	39200	2019-03-21 23:15:49.26712	2019-03-21 23:15:49.26712
889	Shevchenko	Kobelyaki	Poltava	39200	2019-03-26 17:20:53.259268	2019-03-26 17:20:53.259268
890	Shevchenko	Kobelyaki	Poltava	39200	2019-03-26 17:20:53.265386	2019-03-26 17:20:53.265386
891			\N		2019-03-28 14:48:06.189616	2019-03-28 14:48:06.189616
892			\N		2019-03-28 14:48:06.19531	2019-03-28 14:48:06.19531
893			\N		2019-03-28 14:48:06.206289	2019-03-28 14:48:06.206289
894			\N		2019-03-28 14:48:06.214735	2019-03-28 14:48:06.214735
895			\N		2019-03-28 14:57:19.425315	2019-03-28 14:57:19.425315
896			\N		2019-03-28 14:57:19.428163	2019-03-28 14:57:19.428163
897			\N		2019-03-28 14:57:19.436244	2019-03-28 14:57:19.436244
898			\N		2019-03-28 14:57:19.443927	2019-03-28 14:57:19.443927
899	Shevchenko	Kobelyaki	\N	39200	2019-03-28 15:21:29.63603	2019-03-28 15:21:29.63603
900			\N		2019-03-28 15:21:29.639994	2019-03-28 15:21:29.639994
901			\N		2019-03-28 15:21:29.647709	2019-03-28 15:21:29.647709
902			\N		2019-03-28 15:21:29.656503	2019-03-28 15:21:29.656503
903	Ветеринарная	Kobelyaki	\N	39200	2019-03-28 15:26:09.577729	2019-03-28 15:26:09.577729
904			\N		2019-03-28 15:26:09.582075	2019-03-28 15:26:09.582075
905			\N		2019-03-28 15:26:09.592529	2019-03-28 15:26:09.592529
906			\N		2019-03-28 15:26:09.602744	2019-03-28 15:26:09.602744
907			\N		2019-03-28 15:39:24.17798	2019-03-28 15:39:24.17798
908			\N		2019-03-28 15:39:24.181699	2019-03-28 15:39:24.181699
909			\N		2019-03-28 15:39:24.191786	2019-03-28 15:39:24.191786
910			\N		2019-03-28 15:39:24.198758	2019-03-28 15:39:24.198758
911			\N		2019-03-28 16:04:06.47309	2019-03-28 16:04:06.47309
912			\N		2019-03-28 16:04:06.475924	2019-03-28 16:04:06.475924
913			\N		2019-03-28 16:04:06.482848	2019-03-28 16:04:06.482848
914			\N		2019-03-28 16:04:06.489192	2019-03-28 16:04:06.489192
915					2019-03-28 16:39:30.39094	2019-03-28 16:39:30.39094
916					2019-03-28 16:39:30.398944	2019-03-28 16:39:30.398944
918					2019-03-28 16:48:20.240786	2019-03-28 16:48:20.240786
919			\N		2019-03-28 20:57:50.32965	2019-03-28 20:57:50.32965
920			\N		2019-03-28 20:57:50.333654	2019-03-28 20:57:50.333654
921			\N		2019-03-28 20:57:50.34235	2019-03-28 20:57:50.34235
922			\N		2019-03-28 20:57:50.350214	2019-03-28 20:57:50.350214
917	45G65	Calgary		65g525	2019-03-28 16:48:20.237256	2019-03-28 21:10:09.162732
923			\N		2019-03-28 21:19:33.364115	2019-03-28 21:19:33.364115
924			\N		2019-03-28 21:19:33.367935	2019-03-28 21:19:33.367935
925			\N		2019-03-28 21:19:33.379731	2019-03-28 21:19:33.379731
926			\N		2019-03-28 21:19:33.389577	2019-03-28 21:19:33.389577
927			\N		2019-03-28 21:21:52.605263	2019-03-28 21:21:52.605263
928			\N		2019-03-28 21:21:52.607764	2019-03-28 21:21:52.607764
929			\N		2019-03-28 21:21:52.614594	2019-03-28 21:21:52.614594
930			\N		2019-03-28 21:21:52.619757	2019-03-28 21:21:52.619757
931					2019-03-28 21:23:45.053377	2019-03-28 21:23:45.053377
932					2019-03-28 21:23:45.057589	2019-03-28 21:23:45.057589
933					2019-03-28 21:29:34.189164	2019-03-28 21:29:34.189164
934					2019-03-28 21:29:34.191562	2019-03-28 21:29:34.191562
937			\N		2019-03-28 21:41:36.706766	2019-03-28 21:41:36.706766
938			\N		2019-03-28 21:41:36.713044	2019-03-28 21:41:36.713044
935	45G65	Calgary		65g525	2019-03-28 21:41:36.694637	2019-03-28 21:58:12.092711
936					2019-03-28 21:41:36.698805	2019-03-28 21:58:12.095367
939	Shevchenko2	Kobelyaki	Manitoba	39200	2019-07-16 10:18:10.31656	2019-07-16 10:18:10.31656
940			Manitoba		2019-07-16 10:18:10.320506	2019-07-16 10:18:10.320506
941			Manitoba		2019-07-16 10:18:10.325119	2019-07-16 10:18:10.325119
942			Manitoba		2019-07-16 10:18:10.328767	2019-07-16 10:18:10.328767
943	Shevchenkoe2	Kobelyaki	Manitoba	39200	2019-07-16 17:55:24.256016	2019-07-16 17:55:24.256016
944			Manitoba		2019-07-16 17:55:24.257878	2019-07-16 17:55:24.257878
945			Manitoba		2019-07-16 17:55:24.260915	2019-07-16 17:55:24.260915
946			Manitoba		2019-07-16 17:55:24.263422	2019-07-16 17:55:24.263422
947	Shevchenkoe2	Kobelyaki	Manitoba	39200	2019-07-16 18:03:30.64899	2019-07-16 18:03:30.64899
948			Manitoba		2019-07-16 18:03:30.651447	2019-07-16 18:03:30.651447
949			Manitoba		2019-07-16 18:03:30.654182	2019-07-16 18:03:30.654182
950			Manitoba		2019-07-16 18:03:30.656529	2019-07-16 18:03:30.656529
951	455E52	Calgary	Quebec	52l96	2019-07-17 21:34:58.516616	2019-07-17 21:34:58.516616
952			\N		2019-07-17 21:34:58.519557	2019-07-17 21:34:58.519557
953			\N		2019-07-17 21:34:58.52397	2019-07-17 21:34:58.52397
954			\N		2019-07-17 21:34:58.527272	2019-07-17 21:34:58.527272
955	456UJ52	Calgary	Quebec	52L852	2019-07-17 22:07:31.901663	2019-07-17 22:07:31.901663
957			\N		2019-07-17 22:07:31.908415	2019-07-17 22:07:31.908415
958			\N		2019-07-17 22:07:31.912193	2019-07-17 22:07:31.912193
959	456UJ52	Calgary	Quebec	52L852	2019-07-17 22:12:58.649584	2019-07-17 22:12:58.649584
960			\N		2019-07-17 22:12:58.650768	2019-07-17 22:12:58.650768
961			\N		2019-07-17 22:12:58.652823	2019-07-17 22:12:58.652823
962			\N		2019-07-17 22:12:58.654541	2019-07-17 22:12:58.654541
956					2019-07-17 22:07:31.905172	2019-07-17 22:19:00.082811
963			\N		2019-07-17 22:24:01.074861	2019-07-17 22:24:01.074861
964			\N		2019-07-17 22:24:01.076335	2019-07-17 22:24:01.076335
965			\N		2019-07-17 22:24:01.079172	2019-07-17 22:24:01.079172
966			\N		2019-07-17 22:24:01.081633	2019-07-17 22:24:01.081633
967					2019-07-17 22:28:11.09063	2019-07-17 22:28:11.09063
968					2019-07-17 22:28:11.091542	2019-07-17 22:28:11.091542
969	45G65	Brooks	Yukon	45p556	2019-07-19 19:51:51.910217	2019-07-19 19:51:51.910217
971			\N		2019-07-19 19:51:51.914076	2019-07-19 19:51:51.914076
972			\N		2019-07-19 19:51:51.916547	2019-07-19 19:51:51.916547
973	45G65	Calgary	Alberta	65g525	2019-07-19 19:51:51.92789	2019-07-19 19:51:51.92789
970					2019-07-19 19:51:51.911601	2019-07-19 19:58:19.333646
976			\N		2019-07-19 20:04:14.610417	2019-07-19 20:04:14.610417
977			\N		2019-07-19 20:04:14.612989	2019-07-19 20:04:14.612989
978	Shevchenkoe2	Kobelyaki	Newfoundland and Labrador	39200	2019-07-20 08:20:17.319447	2019-07-20 08:20:17.319447
979			Manitoba		2019-07-20 08:20:17.32168	2019-07-20 08:20:17.32168
980			Manitoba		2019-07-20 08:20:17.323957	2019-07-20 08:20:17.323957
981			Manitoba		2019-07-20 08:20:17.326142	2019-07-20 08:20:17.326142
982	Shevchenkoe2	Kobelyaki	Manitoba	39200	2019-07-25 13:30:29.185347	2019-07-25 13:30:29.185347
983			Manitoba		2019-07-25 13:30:29.188309	2019-07-25 13:30:29.188309
984			Manitoba		2019-07-25 13:30:29.191138	2019-07-25 13:30:29.191138
985			Manitoba		2019-07-25 13:30:29.19325	2019-07-25 13:30:29.19325
986			\N		2019-07-26 14:04:51.35003	2019-07-26 14:04:51.35003
987			\N		2019-07-26 14:04:51.352034	2019-07-26 14:04:51.352034
988			\N		2019-07-26 14:04:51.356024	2019-07-26 14:04:51.356024
989			\N		2019-07-26 14:04:51.359248	2019-07-26 14:04:51.359248
992			\N		2019-07-26 14:06:29.9684	2019-07-26 14:06:29.9684
993			\N		2019-07-26 14:06:29.970111	2019-07-26 14:06:29.970111
990					2019-07-26 14:06:29.965115	2019-07-26 14:07:59.605938
991					2019-07-26 14:06:29.966323	2019-07-26 14:07:59.607298
994	pobeda	Dnipro	Manitoba	49100	2019-08-06 19:06:31.283896	2019-08-06 19:06:31.283896
995			\N		2019-08-06 19:06:31.288159	2019-08-06 19:06:31.288159
996			\N		2019-08-06 19:06:31.297105	2019-08-06 19:06:31.297105
997			\N		2019-08-06 19:06:31.303354	2019-08-06 19:06:31.303354
998	pobeda	Dnipro	Manitoba	49100	2019-08-06 19:40:03.574181	2019-08-06 19:40:03.574181
999			\N		2019-08-06 19:40:03.57716	2019-08-06 19:40:03.57716
1000			\N		2019-08-06 19:40:03.582584	2019-08-06 19:40:03.582584
1001			\N		2019-08-06 19:40:03.587175	2019-08-06 19:40:03.587175
1002			Alberta		2019-08-07 20:40:45.694576	2019-08-07 20:40:45.694576
1003			Alberta		2019-08-07 20:40:45.700099	2019-08-07 20:40:45.700099
1004			Alberta		2019-08-07 20:40:45.712194	2019-08-07 20:40:45.712194
1005			Alberta		2019-08-07 20:40:45.721343	2019-08-07 20:40:45.721343
1006	pobeda	Dnipro	Newfoundland and Labrador	49100	2019-08-07 20:46:25.665903	2019-08-07 20:46:25.665903
1007			Alberta		2019-08-07 20:46:25.668486	2019-08-07 20:46:25.668486
1008			Alberta		2019-08-07 20:46:25.674181	2019-08-07 20:46:25.674181
1009			Alberta		2019-08-07 20:46:25.679236	2019-08-07 20:46:25.679236
1010					2019-09-02 21:39:23.790281	2019-09-02 21:39:23.790281
1011					2019-09-02 21:39:23.792905	2019-09-02 21:39:23.792905
974					2019-07-19 20:04:14.606455	2019-09-10 17:53:06.773427
975					2019-07-19 20:04:14.607746	2019-09-10 17:53:06.774671
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-09-04 09:27:47.262408	2019-09-04 13:38:11.573178
\.


--
-- Data for Name: business_partners; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.business_partners (id, name, addressc_id, business_id, created_at, updated_at) FROM stdin;
198		902	240	2019-03-28 15:21:29.660099	2019-03-28 15:21:29.660099
210		958	256	2019-07-17 22:07:31.912893	2019-07-17 22:07:31.912893
213		972	260	2019-07-19 19:51:51.917238	2019-07-19 19:51:51.917238
214		977	261	2019-07-19 20:04:14.614049	2019-07-19 20:04:14.614049
215		981	262	2019-07-20 08:20:17.326779	2019-07-20 08:20:17.326779
216		985	263	2019-07-25 13:30:29.193882	2019-07-25 13:30:29.193882
217		989	264	2019-07-26 14:04:51.360257	2019-07-26 14:04:51.360257
218		993	265	2019-07-26 14:06:29.970753	2019-07-26 14:06:29.970753
219		997	266	2019-08-06 19:06:31.305673	2019-08-06 19:06:31.305673
220		1001	267	2019-08-06 19:40:03.589105	2019-08-06 19:40:03.589105
221		1005	268	2019-08-07 20:40:45.725635	2019-08-07 20:40:45.725635
222		1009	269	2019-08-07 20:46:25.681241	2019-08-07 20:46:25.681241
\.


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.businesses (id, type_one, date_corporation, name, number_employees, union_affiliated, union_text, addressc_id, contract_id, created_at, updated_at, name_p, name_sp, date_corporation_p) FROM stdin;
240	Corporation	\N			\N		901	197	2019-03-28 15:21:29.651185	2019-03-28 15:21:29.651185			\N
256	Corporation	\N			\N		957	213	2019-07-17 22:07:31.909139	2019-07-17 22:19:00.085107			\N
260	Corporation	2002-01-02	TEST	100	\N		971	217	2019-07-19 19:51:51.914787	2019-07-19 19:58:19.33596			\N
262	Corporation	\N			\N		980	219	2019-07-20 08:20:17.324619	2019-07-20 08:25:57.654304			\N
264	Corporation	\N			\N	\N	988	221	2019-07-26 14:04:51.357118	2019-07-26 14:04:51.357118			\N
265	Corporation	\N			\N		992	222	2019-07-26 14:06:29.969087	2019-07-26 14:07:59.61094			\N
263	Corporation	\N			\N		984	220	2019-07-25 13:30:29.191899	2019-07-26 14:13:21.832621			\N
266	Corporation	\N	line	line	\N	\N	996	223	2019-08-06 19:06:31.299269	2019-08-06 19:06:31.299269			\N
267	Corporation	\N	line	line	\N	\N	1000	224	2019-08-06 19:40:03.584471	2019-08-06 19:40:03.584471			\N
268	Corporation	\N			\N	\N	1004	225	2019-08-07 20:40:45.716117	2019-08-07 20:40:45.716117			\N
269	Corporation	\N	line	line	\N	\N	1008	226	2019-08-07 20:46:25.676682	2019-08-07 20:46:25.676682			\N
270		\N		\N	\N	\N	\N	227	2019-09-02 21:39:23.796747	2019-09-02 21:39:23.796747	\N	\N	\N
261	Corporation	\N			\N		976	218	2019-07-19 20:04:14.61136	2019-09-10 17:53:06.776868			\N
\.


--
-- Data for Name: cash_out_payments; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.cash_out_payments (id, user_id, apply, created_at, updated_at, amount, persents, ppal_email, pay_system, card_number) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.categories (id, name, "position", active, created_at, updated_at, typec) FROM stdin;
62	Doors	1	t	2019-08-13 21:17:16.94107	2019-08-17 19:25:34.539392	Contractors
42	Site Equipment / Rentals	12	t	2018-09-04 09:27:47.058137	2019-08-15 08:23:12.194386	Suppliers
63	2 NEW TEST	13	t	2019-08-13 21:25:48.118946	2019-08-15 08:23:12.197468	Suppliers
18	Windows & Doors	2	t	2018-09-04 09:27:46.997849	2019-08-17 19:25:37.269878	Contractors
13	Sprinklers & Fire Suppression	3	t	2018-09-04 09:27:46.98399	2019-08-17 19:25:37.272516	Contractors
11	Building Automation & Controls	4	t	2018-09-04 09:27:46.978962	2019-08-17 19:25:37.275144	Contractors
14	Drywall & T-Bar & Frame	5	t	2018-09-04 09:27:46.986154	2019-08-17 19:25:37.277724	Contractors
24	Waste disposal & Garbage hauling	6	t	2018-09-04 09:27:47.012852	2019-08-17 19:25:37.280238	Contractors
60	NEW TEST	10	t	2019-08-09 08:06:43.513032	2019-08-17 19:25:32.279405	Contractors
43	Pest Control	14	t	2018-09-04 09:27:47.060259	2019-08-15 08:23:12.200458	Suppliers
44	Other Suppliers	15	t	2018-09-04 09:27:47.062353	2019-08-15 08:23:12.203446	Suppliers
33	Electrical Fixtures & Materials	16	t	2018-09-04 09:27:47.034775	2019-08-15 08:23:12.206492	Suppliers
61	Very lonr title & title very long how in app intresting and in admin	17	t	2019-08-09 08:32:56.605517	2019-08-15 08:23:12.20946	Suppliers
1	Framing (Wood)	11	t	2018-09-04 09:27:46.950812	2019-08-17 19:25:32.281809	Contractors
65	Test15082	0	t	2019-08-15 08:22:34.295809	2019-08-15 08:25:26.461097	Suppliers
32	HVAC Supplies	3	t	2018-09-04 09:27:47.032166	2019-08-15 08:23:12.166037	Suppliers
19	Design build Metal Work	12	t	2018-09-04 09:27:47.000608	2019-08-17 19:25:32.284203	Contractors
20	Hard Surfaces (Granite & Quartz)	13	t	2018-09-04 09:27:47.003286	2019-08-17 19:25:32.286665	Contractors
21	Glass & Film Work	14	t	2018-09-04 09:27:47.005973	2019-08-17 19:25:32.289164	Contractors
36	Millwork	1	t	2018-09-04 09:27:47.043283	2019-08-15 08:25:28.301471	Suppliers
15	Millwork (Doors & Cabinets)	7	t	2018-09-04 09:27:46.988878	2019-08-17 19:25:37.282841	Contractors
22	Window Cleaners	15	t	2018-09-04 09:27:47.008323	2019-08-17 19:25:32.291688	Contractors
23	Landscaping &  Snow Removal	16	t	2018-09-04 09:27:47.010685	2019-08-17 19:25:32.294114	Contractors
28	Demountable Partitions	17	t	2018-09-04 09:27:47.022842	2019-08-17 19:25:32.296522	Contractors
12	Fire Alarm & Life Safety	2	t	2018-09-04 09:27:46.981505	2019-08-15 08:25:28.305431	Suppliers
29	General Contractor	18	t	2018-09-04 09:27:47.025213	2019-08-17 19:25:32.299035	Contractors
64	Test1508	0	t	2019-08-15 08:22:13.758347	2019-08-15 08:22:13.758347	Contractors
30	Other	19	t	2018-09-04 09:27:47.027776	2019-08-17 19:25:32.301491	Contractors
25	Asbestos & Restorations Worker	20	t	2018-09-04 09:27:47.015167	2019-08-17 19:25:32.303907	Contractors
16	Painting & Wallpaper	8	t	2018-09-04 09:27:46.991934	2019-08-17 19:25:37.285331	Contractors
17	Flooring & Tile	9	t	2018-09-04 09:27:46.994901	2019-08-17 19:25:37.287816	Contractors
31	Plumbing Supplies & Fixtures	4	t	2018-09-04 09:27:47.029998	2019-08-15 08:23:12.169291	Suppliers
34	Restorations Supplies and Equipment	5	t	2018-09-04 09:27:47.037869	2019-08-15 08:23:12.172484	Suppliers
35	Drywall & T-Bar & Frame Materials	6	t	2018-09-04 09:27:47.040582	2019-08-15 08:23:12.175652	Suppliers
37	Furniture	7	t	2018-09-04 09:27:47.045971	2019-08-15 08:23:12.17876	Suppliers
38	Paint & Wallpaper Store	8	t	2018-09-04 09:27:47.048837	2019-08-15 08:23:12.181884	Suppliers
39	Flooring Commercial	9	t	2018-09-04 09:27:47.051474	2019-08-15 08:23:12.185004	Suppliers
40	Flooring Residential	10	t	2018-09-04 09:27:47.053737	2019-08-15 08:23:12.18819	Suppliers
26	Janitorial Contractor	21	t	2018-09-04 09:27:47.017579	2019-08-17 19:25:32.306386	Contractors
27	Locksmith	22	t	2018-09-04 09:27:47.019987	2019-08-17 19:25:32.308887	Contractors
2	Framing (Steel)	23	t	2018-09-04 09:27:46.954372	2019-08-17 19:25:32.311329	Contractors
41	Tile & Floor Materials	11	t	2018-09-04 09:27:47.055912	2019-08-15 08:23:12.191318	Suppliers
3	Engineering / Consulting	24	t	2018-09-04 09:27:46.957037	2019-08-17 19:25:32.314107	Contractors
4	Concrete Cutting & Coring	25	t	2018-09-04 09:27:46.959667	2019-08-17 19:25:32.317524	Contractors
5	Plumbing	26	t	2018-09-04 09:27:46.962316	2019-08-17 19:25:32.320031	Contractors
6	Drain Cleaning	27	t	2018-09-04 09:27:46.965114	2019-08-17 19:25:32.322635	Contractors
7	Heating & Ventilation	28	t	2018-09-04 09:27:46.967668	2019-08-17 19:25:32.325074	Contractors
8	Electrical	29	t	2018-09-04 09:27:46.970456	2019-08-17 19:25:32.327569	Contractors
9	Data & Network	30	t	2018-09-04 09:27:46.973106	2019-08-17 19:25:32.330006	Contractors
10	Security systems	31	t	2018-09-04 09:27:46.975958	2019-08-17 19:25:32.332422	Contractors
58	Pre - Construction	32	f	2019-01-13 18:22:46.33725	2019-08-17 19:25:32.334918	Contractors
\.


--
-- Data for Name: complaints; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.complaints (id, user_id, complaint_types, description, created_at, updated_at, owner_id, task_id) FROM stdin;
1	19	"Inappropriate profile picture(s) / Sexual chat or pictures / Spam / Advertizing / Harrassment"	"ииит"	2018-11-01 23:20:50.918205	2018-11-01 23:20:50.918205	18	75
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.contracts (id, contractor_name, type_work, legal_title, mailing_address_id, remittance_address_id, contact_name, email, password, telephone, gst, authority_person_name, authority_person_phone, serv_req_name, serv_req_email, serv_req_phone, bil_req_name, bil_req_email, bil_req_phone, full_name, title, date_submitted, created_at, updated_at, status, user_id, check_sub, check_fin, check_sert, check_ins, check_bus, check_bond, check_cont, check_work, check_exp, bussines_bil_req_phone, bussines_serv_req_phone, team, city) FROM stdin;
223	\N	Framing (Wood), Framing (Steel)	line	994	995	admin1	page.aleks@gmail.com	123321	(123) 123-1231	123213213	Aleks Page		Aleks Page	page.aleks@gmail.com	(557) 657-5675	Aleks Page	page.aleks@gmail.com	\N	Alexandr Naboka		2019-08-06	2019-08-06 19:06:31.290468	2019-08-06 19:06:31.339424	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			f	Lethbridge, Brooks, Medicine hat
225	\N	Framing (Wood), Framing (Steel)		1002	1003	667uyuytuuy	naboka888@gmail.com	123321	(887) 877-8687	8766		(677) 567-5756	Aleks Page	page.aleks@gmail.com		Aleks Page	page.aleks@gmail.com	\N	Aleks Page		2019-08-07	2019-08-07 20:40:45.70439	2019-08-07 20:40:45.763476	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			f	Calgary, Edmonton
226	\N	Framing (Wood), Framing (Steel)	line	1006	1007	fddfsfdssdfdsffsd	naboka8s8dfsdsf@gmail.comf	123321	(795) 825-8524	2222222222222	Aleks Page		Aleks Page	page.aleks@gmail.com		Aleks Page	page.aleks@gmail.com	\N	Aleks Page		2019-08-07	2019-08-07 20:46:25.670581	2019-08-07 20:46:25.707657	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			f	Lethbridge
227	\N	\N	Super5	1010	1011	Supervisor5	k487231900@yahoo.com	222222													\N	2019-09-02 21:39:23.793662	2019-09-02 21:39:23.938683	approved	113	f	f	f	f	\N	f	f	f	\N	\N	\N	t	\N
218	\N	Astra Project Manager	Supervisor2	974	975	Supervisor2	tatyanakipot@yahoo.com	222222	(111) 111-1111												2019-07-19	2019-07-19 20:04:14.608648	2019-09-10 17:53:06.775479	approved	110	f	f	f	f	\N	f	f	f	\N			t	Breton
220	\N	Framing (Wood), Framing (Steel)	legal	982	983	Fred Dogan	peluhnya@outl45454ok.com	123231231232	(342) 342-3423	324234234234	Eugene Peluhnya		Eugene Peluhnya	peluhnya@outl45454ok.com		Eugene Peluhnya	peluhnya@outlook.com		Eugene Peluhnya		2019-07-25	2019-07-25 13:30:29.18919	2019-09-16 12:21:23.149587	archive	\N	f	f	f	f	\N	f	f	f	\N			f	Calgary, Edmonton, Red Deer, Brooks, Medicine hat
197	23232323232	\N		899	900	33333333	peluhnya@dfdfdfdf.com	1111111111			Eugene Peluhnya							\N	Eugene Peluhnya		2019-03-28	2019-03-28 15:21:29.642456	2019-03-28 15:23:35.495502	approved	97	\N	\N	\N	\N	\N	\N	\N	\N	\N			t	\N
213		Electrical, Data & Network, Security systems	Mark&Co	955	956	Mark	k4872319@ukr.net	111111	(222) 222-2222	2222222222222			Mark	k4872319@ukr.net		Mark	k4872319@ukr.net		Mark		2019-07-18	2019-07-17 22:07:31.905966	2019-07-19 14:08:00.569949	approved	106	f	f	f	f	\N	f	f	f	\N			f	Calgary
222	\N	Framing (Wood), Framing (Steel), Engineering / Consulting, Drain Cleaning, General Contractor, NEW TEST	Prestige Construction and Renovation Inc	990	991	legal	k4872319@gmail.com	111111	(222) 222-2222	222222222222			test	kk4872319@gmail.com		test	kk4872319@gmail.com		kk4872319@gmail.com		\N	2019-07-26 14:06:29.967039	2019-08-12 09:10:57.577543	approved	112	f	f	f	f	\N	f	f	f	\N			f	Calgary, Edmonton, Lethbridge
217	\N	Drain Cleaning, Heating & Ventilation, Electrical	Donna&Co	969	970	Donna	k4872319@yahoo.com	111111	(222) 222-2222	1111111111			Don	k4872319@yahoo.com	(111) 111-1111	Don	k4872319@yahoo.com		Donna TRED	director	2019-07-19	2019-07-19 19:51:51.912493	2019-07-19 19:58:19.339266	approved	109	f	f	f	f	\N	f	f	f	\N	(333) 333-3333	(222) 222-2222	f	Breton
219	\N	Framing (Wood)	legal	978	979	Garry dfdffd	peluhnya@outlook.com	2323232323	(121) 212-1212	23232323	Eugene Peluhnya		Eugene Peluhnya	c4stlerock@gmail.com		Eugene Peluhnya	peluhnya@outlook.com		Eugene Peluhnya		2019-07-20	2019-07-20 08:20:17.32248	2019-07-20 08:25:57.65814	approved	111	f	f	f	f	\N	f	f	f	\N			f	Barrhead
221	\N	Drain Cleaning	Legal	986	987	legal	kk4872319@gmail.com	111111	(222) 222-2222	222222222222			test	kk4872319@gmail.com		test	kk4872319@gmail.com	\N	kk4872319@gmail.com		2019-07-26	2019-07-26 14:04:51.353322	2019-07-26 14:04:51.372858	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			f	Calgary, Edmonton, Lethbridge, Red Deer, Brooks, Wetaskiwin, Medicine hat, Camrose
224	\N	Framing (Wood), Framing (Steel)	line	998	999	Homyak123	naboka88@gmail.com	123321	(123) 312-1323	321	Aleks Page		Aleks Page	page.aleks@gmail.com		Aleks Page	page.aleks@gmail.com	\N	Aleks Page		2019-08-06	2019-08-06 19:40:03.578981	2019-08-06 19:40:03.62041	pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			f	Calgary
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.devices (id, owner_id, token, created_at, updated_at) FROM stdin;
1282	112	dYO5UDhU9qo:APA91bE1FFifeFPb4kX_Jygntg8bFV4CrYXNKGy9ID7GTmcJxAU7L13Meqvf-jVQJaa6FyDW_R2iT0SbZRGw8KraAPWsAn6MLuWhrSWnlkY9RH8eTBinc7G8r3evvFBvQSMQiLbIRb0w	2019-10-04 13:43:29.19754	2019-10-04 13:43:29.19754
945	82	eNrefnr5GkM:APA91bEAX3J_RGkiUUDheXb4ZG8U1qnp-LkGCEbxKTWpuwIe8xpEgPc5yBaVg0pIafR3AfqX1RNSp2VBIaQpJdJn-LjPXO3vcoZUfxoYNQ881MsQe77FhhgTDKB037z8iifL9t8-tyj9	2019-02-11 21:55:05.482073	2019-02-11 21:55:05.482073
953	82	cWF7zWprPiw:APA91bEo-LLrLlWiEfRLKCnl1uiWI_BlH_bYGzTKRWeVppXtkA6-waBPnFrN7_QAy_X2HCRwffXODsNE7QDEm1xysR1tksW20LfNuAixqdefzTX0fLpBQHN8UxhuFtAsRKjpVw7Z_EF9	2019-02-12 21:35:39.837445	2019-02-12 21:35:39.837445
955	82	dMpmRFjgGiI:APA91bFSABjwDOUvGhzbuP0J8YyjUDNRDAenBr6yZHC5PG0BPVBmU1ezAWOeZDYE4FvsDIzyCayHZAR0La_ntWO7ofrEDvM_JSQ4MTW09co5Su__7JxYt8cNQZXBelRxXeRUSAUgzrul	2019-02-12 22:01:36.604749	2019-02-12 22:01:36.604749
894	82		2019-02-06 21:07:41.593754	2019-02-06 21:07:41.593754
957	82	ebUteDs8PVI:APA91bEqHoWK4SbQXsZtDzjVORNcksq2aEqSbqoxz1u9DAcWFGtNybRRnIrUTXL08MtOd5IEejaYR_z5OVONwmd-6FxOIt7eLBxkM6q7peZuDQcW0u5IejuQK_zA3w7xCAZkCvEPob6S	2019-02-13 07:54:57.37447	2019-02-13 07:54:57.37447
960	82	fejP4jxRWLs:APA91bFdQiUlo_LWmm8ra3FcW9mhagNHH8VkBBX0P8xFVkrP9NpAqK7ebGQd-xdb7gi0NSaFOUZMo7WLIBM4SSuzzY0r40L_Y29BU3jbPgfeifmuVWOEnKTwwKHl83bboO5gcW2wGuwN	2019-02-13 20:00:43.212076	2019-02-13 20:00:43.212076
1171	82	dWhAVr4EFJA:APA91bH7-jFT52m9_Ei9bTzNjJkrUUsipWhgq4Dvn3PEhELHsXimLmoPuVN3iYGKPs_m7pGW99L9DV94qqxHGQvGz3XYvx5v7EeG8pwtW1KUi9Yj7LXpHS52pl63XKhaqW8jCfkwNpMI	2019-03-25 16:24:21.703463	2019-03-25 16:24:21.703463
964	82	drdgYaU9glo:APA91bHJs8ateGbXf5_dRbtAvKsDvv57NkJXVsfpWsCbp4IPnlW-B4pro4vPnAF9QTTVLpTFuAHUHZd7qVL-OexIOGG-dIzkxAhulNaCl_DasGeXSQ1XTswTKJPua8AvgQbOjfARLRO_	2019-02-13 21:04:44.688474	2019-02-13 21:04:44.688474
967	82	cheDm3QCDTc:APA91bHHsQEP71msVmuyN7Ncoyb-TSCkIzMgZBAG9PpGPQxkR1Za9oIjr8814OJcun8In95nKynfQNUG0ayR4YmofPjH3vtLa9xB_4rY0UFTUzFXDKIXbHKECmuXXAK5Tt_U0ySZ3DNP	2019-02-14 08:32:31.517364	2019-02-14 08:32:31.517364
968	82	etqv3RoKoLI:APA91bHhd9yvDcblnBQjghju4cyev3TKlGC8v_4UtffWbUFEOspA7DDPtZg0wW1lXaqqYINN5zEF8pUnN38rLva_lUlHyQH87ehDUlDCULlEhAhQdnrfEjhgXu_Rzw3TuIkxXcj9kaUp	2019-02-14 08:41:33.765949	2019-02-14 08:41:33.765949
1215	110	d06WMY5dkyg:APA91bG6JlN7bJz76lqZDl9YhwV81z0IVjlQQ1P3cW8td7TjkGz1FzVzKDWuqGSFUVEncTtrbIUjR66MSkTP3lBgkUmwUAwjWveFpzq7_QYBLFSLK17QFo6rvA_Si2VKsq6QJN537XsC	2019-08-09 08:09:27.761233	2019-08-09 08:09:27.761233
973	82	c9RmGhN8ksU:APA91bEkK9H-b2LwTx0DNpx3UCUA571GwF2BZVt-Jgqb688r_aTGOABy1ugP42ZbIADFvf7SnexWAAbUSeRxTgxVcKknwERzfHcmm8BHsHXBEvf6nl7o6wm3t6GxepAsZLhH7Krrk6at	2019-02-17 18:55:28.178558	2019-02-17 18:55:28.178558
1182	82	cmKaozUvmu0:APA91bE0-cSAAQYPaPngDUbMOPBoEVMo11rho-4GwtYuRSLhkvNFxn7dTaK0MujVAcFjYu6sB4ADzIAgLV8Gbk2b7AW4SURc8pPQoZHEhCl0gPj5FO5A-A36-wDs5qwPzF43kVTxwz3S	2019-03-31 20:38:22.124389	2019-03-31 20:38:22.124389
976	82	eKkd7NuXwxI:APA91bE9gdgMfbcBeOJBdO0vBrombPCYzRMbEfKKOwWyZMXfjIPAeuHlQQKn2X3J2-UuOMZ7DfbNxAFNGPvf99wkTq0zblhMZAltxVfuP7xpmMU6KmtPC0BI-kieZeYfoASl6jhrChVe	2019-02-18 19:04:20.780098	2019-02-18 19:04:20.780098
925	82	e93yggQzLqs:APA91bFl3OdDy1lb8ge0bURWsycjQ6HuHxAzeHjcI1ysskBvYeCnQLvGB-L65baBV6iZxQkdl6qs9fnJPrcZfqbh1rajTFS0Cyto--Kw8HXyBT7eFJT7vyTnwqvoIwigKGqd49MSXBqb	2019-02-08 21:57:34.436752	2019-02-08 21:57:34.436752
983	82	eMkV_A5-BwQ:APA91bGlfmkv37zUcH5WOELIdf6i3zuXnpAeMml5cihxXX_Yyx4QUpe-tuSW2Ucgmv1ngj2Q27umvQYymRAYcXeDrrc5YgnyE_6IhoahXo77-eWnNNti0fi8oRbEqp7hZjACcPM1Ix6Z	2019-02-19 00:09:48.5054	2019-02-19 00:09:48.5054
1236	110	fRwZity5odI:APA91bE5M79Iyw8KYa5JlUxJGTb9-lhMuEDvDJmF94TND-CF9IJX1da6C9igJHvvedH-IWK3I0C4lLKb145OIB77AbwgQtigTQBvmXta-wN28ZlXU3PYCi6lfCGFPhHghu3S7AJjhj1h	2019-08-17 19:21:31.814615	2019-08-17 19:21:31.814615
1237	109	eAhutL2p3cA:APA91bENx6hTdIUNqM1Cxpl98PFEQahEUx3PKL3JO5Ys8WyZ0qD-Sc-h_4r6aghHMrAt-Tsc4iEZi-wa6CgIBWceLHwJBoes3bNSf-ofm8zytlBVV4Dza7N-BCnoh31zd_3JG3ql40Pw	2019-08-19 15:38:50.735986	2019-08-19 15:38:50.735986
987	82	dmRSDgH7Ua0:APA91bFlipPj_bKvAIcwLKPwUQnvpX3iiMv0pkf_0ZBRbl8oe7W2gsDJxgmOGjKQgX31qwKczFPSSF42iZG3QoZ2qFyViHbtpXqVV558u_xopX_oLTnJdsRTdGMbduvYG2PdR4ht96xu	2019-02-19 16:18:35.880918	2019-02-19 16:18:35.880918
1001	82	fe6El2S46Uo:APA91bE6xTHog-gamg2irHuNHaCBp14dnZCbA_ppPu5i-aQPx85dhJmo5a8NLLEN9eLmMTLyoB-I-wqjA-cmTsjbrlAhXLwovI0Us9wp3CKmXjAe3i-XnGlOg0YEhbeMjTluxy2oWrdD	2019-02-20 19:46:27.806896	2019-02-20 19:46:27.806896
1239	82	fKiagchmmBs:APA91bEd8j4aNHV54p7nWbkDANljf0qDtEllfY5FHzAahrGyo3Gn_JustN4210MmupMpNefwSlBX7SS2XqcOJ7BYAYF1Hq37-G7Xu4zCk5o9cCkxnYjMTTmc65unv0AUqr5rb01iZ2XT	2019-08-19 20:23:53.74505	2019-08-19 20:23:53.74505
1014	82	fJ0eTcJX0Ws:APA91bH3Q62MF82IUf7zsyzESqZmYsFLYp2wI_Pi-rQm8p0oZK_R0IzSlD7SrdDHoNOh96hla78acVWY1Xh46rSbUteSqg8MAB_oNEDCB1b26TYYKz8L6q7_J58oY-kqBcIlMRB3pxL2	2019-02-21 22:25:38.406316	2019-02-21 22:25:38.406316
1016	82	fNBt4MKXvSs:APA91bHN2eKbZAzSkHzS6-lerMw6aUN7-cxrTlGsM1r1fMsNFrmoNfZI9zMSfKZmCBcSS8VVviMbhJajuCW__aWnV1Z3QxVBrW53U2ayA_3g8PtCAYEZSMK6bdbmdUUjWYFXOILswqfb	2019-02-21 22:49:30.875221	2019-02-21 22:49:30.875221
1022	82	d_Vphz1yCg8:APA91bF7xjKgmkanP5RYq2F3ciwbEeV9TAEd7r7qBBuy2kGRnzvD-y7ebR1WjjLtSjWfheUIXRlERfmcGR8HVgv-vU9Xz7AuGhPwpuIMkeNYBo1Ifs7F8UPvs72RzktKBOfKJiNsNz5s	2019-02-22 22:23:22.786659	2019-02-22 22:23:22.786659
1027	82	evHpUp1L0lI:APA91bEFobFdl0ikuSdsND3Ks7BoY_RSBG9vsfeWiBoyi2rt34vdHSkQmPpIyOKgiHArxM0vZb_c_EIlpDzO7-Iofgosjxqjyx8AJvEOUd7t1vevF0ohCEy7BgovOojtOoS9kZQyyvQ-	2019-02-24 10:05:26.419628	2019-02-24 10:05:26.419628
1259	110	cJJ4KCdsmZw:APA91bFJz5MzW_z9wCwQF81GUoW3V7m-nybIf6OrgFjIGRr0VkiOp4gln5IwIKE3aa-Rikmn2Fz9XrDF4jeES3JV2SeHwSDc61WfLbyFMNKzRhl4ljBGndBgeOSv7H-Qd7b8sMUl_nsH	2019-09-09 11:38:58.217931	2019-09-09 11:38:58.217931
1262	110	fiTK_I9l0tU:APA91bFUdsKFWFZctSECwlk3oltHoBnpNpyesu8fXm8NIWRRAJFeNKD-N6acHZO8RwtLncxnoJV6g7jOLEw99__mjlM3tn_UdDkGJfQAvHCLpShkUvWBdMiYxXA3UbcoPkn3__jpcRla	2019-09-10 17:52:17.41403	2019-09-10 17:52:17.41403
1263	112	dVePeQL_F1I:APA91bGzepqgMeKX0ZoA7El51SJVN9oP8q32LSYZIqsz_DR5E-B7HpRcdp1uJ6JhlD3G4w1I9tnIypYxq2St0GpQ445HKGi2XKw2WajEspAwkULgIcpmi782z1oC_pNh_ngtbwCLrhRI	2019-09-24 13:06:32.689289	2019-09-24 13:06:32.689289
1269	112	ckSY9SQlg64:APA91bGCQF4t108dpaEsaCwFNSnB-fW96i-X_9akMXL83a-YGC5srn2yt70RkvT9YIjdcVdys2TYexUALNaT_8FMIRJOr-obngC9HzT9MgMN_T5GRMXvhxSMgktDLU55sq3Xy54wFHjq	2019-09-25 19:30:38.913357	2019-09-25 19:30:38.913357
1271	112	f6SpVRENRwo:APA91bGWSwf2bdQw851lzCblnVBAtLKgw3G3c2Havpfn9IvHE3BuK2VoWoRtG8u2NeDiFL5EjgmXvBBI1yurIlIR3OqPj9db4tZ1o_sCVqA9WL9ZmhToRgwwmWC9t1SDyB3kK6p24Ecg	2019-10-01 07:28:13.624482	2019-10-01 07:28:13.624482
1026	82	dxXcWE1d0FY:APA91bEA3ZvCsF9pOEny7dCPJ5yMg1GYsIyN-IU23runmaUSwsYH-yKval4HMCVp_RI9km-WXI53uHN_YarYDj2usdDI0SmXwk_V188R-ciaISfsQTudpC6n1RtTz5F19KDDGcpWoNJG	2019-02-23 09:14:36.357742	2019-02-23 09:14:36.357742
1028	82	cLcxCxwR5OM:APA91bGMCR8O53RmtPY4Kynsvw7MuqKHriNMXxAjZNyfrL-_Dvu_oIrbMmdiMuN-HquvK3jo06LfdQjda2t6hd1VdVUmwEGHGhqkBZx8x75LKBS94SFKwwFDyDow3mydvQ9s608oXRsd	2019-02-24 10:21:37.680451	2019-02-24 10:21:37.680451
1207	109	dC8FQJtP7xM:APA91bHOFwOgmUpk5l6gFHR8a8rc8neWdmeRDwRJ1WZuAaDwkhKtQn75G5rWPBx3LATy2JeNALc57BM4oMRrabjhrgY9X7nT4hQZyN_qaGmvU0FJa00fWojl6MJOZlvNzCIpKw5zXtqf	2019-07-19 21:35:01.511159	2019-07-19 21:35:01.511159
1033	82	fVkFbveLDt4:APA91bGAnJ18jqvpa4DhX4pYK0WjkQw0LOJTc4p35A6d82qsoZdV9ZpTJUL2wAJpEOYAP58-W9Eld9CAlhWfLBPj2JIaNOmFrU-xKviSEt6qJLJhotFXP0FOXE36dG7CGrcsnSUhOOsE	2019-02-24 17:03:13.414414	2019-02-24 17:03:13.414414
1034	82	cTXiN7hmkw8:APA91bGnhCOjbYMUy18pxa6E3COVzcW3mBH_w_Q7E2b8lB843eLAcrb63_7BRe3I7wY1GXVONDhJgWoyD3f-t6snZIQtQDhgAdkQb6Iua0pUXDBK5-sA49v87Z5VxiLqgoHlq_R31JIT	2019-02-24 17:08:44.409651	2019-02-24 17:08:44.409651
1037	82	ejpYqhfNnno:APA91bGEDZMFPhwScGnRDrpbpk5bl819GYMoCmYyHC5rLj2A8f-jkhTmq0uTpQLvj9YbO3x4RG3ero2c-sTRck_B5gckugXfGwdFGPWWzyLzgO5CV5E3OK18yOxm8Qm4JYTK9wvNoHOP	2019-02-24 19:00:54.463981	2019-02-24 19:00:54.463981
1172	82	fmoug2utX-A:APA91bH5irVelR5GWDAfbUYaz6BTDdffoZCC60pJSfnsgPtfYkT2PMo-T3sTnxLwo-vnUBK--UPuUrlmC8Kw-VdbiWWbNOrCGiwk2sYPd94CAlMqasVw6Jk7c2TTdw9FKy1B-okDTloX	2019-03-25 17:50:14.074732	2019-03-25 17:50:14.074732
1045	82	dUY2JJFUu_Q:APA91bHeWHp8m4Gw10ar14WXErSc9NlxO6PB1SAHGUNcEg3GL6a2qV0iPx3LxSnv8R4Mih3A8FGBgXN9Qbvt9o4WoeTCf4Ln33MSourvL1MJO7o2CIG3P5AKc70vJMUy236TtPw2NXYe	2019-02-24 21:06:23.869684	2019-02-24 21:06:23.869684
1049	82	dOPnHyxqIMY:APA91bH3sgwldYHo9c24gfx4S5Y_vC_LTt358G4PZ_-AB2VU9hDY4qLfaWIBce0jZtIRuuzZQNhYOqSl00hSJwsnj5B7I7CtMdHgY7w10IZn_skphQltnd7x-m3odcvJg_eSzJHa-BiI	2019-02-24 22:03:38.353584	2019-02-24 22:03:38.353584
1051	82	dRKMHfNX1Y8:APA91bEznqgMDLknOsBoruJRbvYmCxYl1QXeAIX5c67A5wzexHr6woQnlSv-r7ONkL0fPK2GjIZ2UVXS00O0NCu4VZJX8ue6mrkFWVBPHrC8XKjgpQ5m6KjhSou3eoptT9T2ryH2q-y0	2019-02-24 22:17:10.82497	2019-02-24 22:17:10.82497
1064	82	cY853Pwx_ts:APA91bGF5ylN2mFOyZ7uhzop_47mTvH4It8DY9Dtzzt-snhwXKSqW_BqM4O5Dca1y_L7qlJRZv3Z-Pkw2Im4w-7DFP9V0-1cDsDubBzHqGzKnKFPq33sWoG27BwagXX6Lkn8qAOr3Gxx	2019-02-26 19:57:19.997823	2019-02-26 19:57:19.997823
1065	82	fxB8pjEyt2E:APA91bF956sTmrtETV4zO41sjOMoNqz8Uzex73FDP0WNvZkJ3KQQQgCjiFxjyiMKZq_sFLHR2UJTwPth1h2rl3FcRmTQXR0jZAXJypWIoXgIG_dCpkMHJuzVMEqx4exL13YQRRbw3q_k	2019-02-26 20:06:07.137149	2019-02-26 20:06:07.137149
1066	82	diuduTnJnSM:APA91bHgIbI1feNXMDvQYL_JukORaJmsxNFWw2V77alv-ZC-XfxbwN2-rNLTJaHACGg3AAtfCVMsmuSQhfcaquu0UFH1HghrQa-fELBfHdvddoevXohzXI-IyRtXaKugTXzvMCHz4yR4	2019-02-26 20:21:16.61254	2019-02-26 20:21:16.61254
1069	82	caBg73pdO1A:APA91bEVOor-GG2d6ypbnhIdTEO1OHGn_zQ0oUTQgSZxhSWGO3aVM-1tb41G2OG-WZszCE6lrhvyMxvFS9NekVyjqufpo5wpLLsFhjN64kcK8QLX1ZZJKS8RCdKxfZ16qPosjfEPn66Y	2019-02-26 22:30:19.448268	2019-02-26 22:30:19.448268
1241	110	dxt5o1-ORlk:APA91bEpNr6gLZF92-JfAZLz-8XnFFF48FmJrHINTMeKN1icCvDOs3GGHexzbg-LQK_A-6MGEqdaRz5BrXIw4LzLt5XOggce_ioVq0osRYzXaq0gnjj43wwszP7rv0B-iXlPi3xLRGnX	2019-08-22 08:45:20.889708	2019-08-22 08:45:20.889708
1073	82	c1U0BD6uPa4:APA91bGh7p5WdiPEz0TXtMKTURYP-qnkpQOWhdafyByRK3QqP3SD1LZl0-mW7DItChhKYPJIgXl-LWe-mZYoTltoo2lsclHvnLnF5aD0VGM_a0QCIrIA3TeoRK8jB0fA1f3i7GlhwecC	2019-02-27 11:59:50.63113	2019-02-27 11:59:50.63113
1074	82	drYSAwL3q-Y:APA91bGrV8Z3qEl9IqjEBJFF3GYlAIzASiUCHfzpHzsjacm-nqPZlmL6Xfst0LjpdCkg1dsRI9hqOFjDykuDWPrTFqhg6Q5GOtUrqy9vgoGCsUArXjytxlLVSCFnuHI-NKR50MdflU6j	2019-02-27 12:08:01.102819	2019-02-27 12:08:01.102819
1077	82	fsUXmJO90Bk:APA91bGIXeq23qVFAEXkK_tuBtRPgDtagc1WPFcgRY3Bny3n790MORodFyK8Gsl-6YKHTGfRSaEnoNXLu7qegpbS6Xj9Ol6oEt5MLKfB_BnPLD0Bv3VWLdEGVDISVaj_MVF73mFuV0N_	2019-02-27 13:50:02.200515	2019-02-27 13:50:02.200515
1090	82	cGjmBHyP-Ms:APA91bFcUecAklm1OcJIwKo6wMcLd8yFLRFxoPZO5a1zx8Su2rcmssC9ZCfdfrk5W7WB4vFpNqvuT-iX95VzGTfVP-WMoFPsZpvlzjs-8yLtmOx5oPLy5wcLEyl_KMW8QgUULR85Kyir	2019-02-27 19:36:02.950389	2019-02-27 19:36:02.950389
1095	82	c_mq69nF5jE:APA91bHlTUL1-P33209DaOQqh2x8X_FzOnBZ5ViwFrnw4h9CkK4Gt058UPsy6zlU3j1kv1v7R4ElmyNwL7EYnh4dNFe0VnH9_6AJkpBwXDxHz8WQRBW4NDQakz1V4hQIPMQg8bHTiYA3	2019-02-28 08:47:20.746437	2019-02-28 08:47:20.746437
1096	82	cIvM5B2yis4:APA91bGbteAQnDogT19_XwaIRYQr11mEx6Z3fICq7QaJOCM8YaJdd7h0w4eSStLX4JHsyPBfSoTqbU5I8xEuOv8LZt1dfxZbK9xOpY-3nIz2bWKhCaBaxR2MyyqKw8yx_ClW5rYDRfBP	2019-02-28 10:31:08.577538	2019-02-28 10:31:08.577538
1260	110	cWZE0PQ98zo:APA91bHw26LpauguOTXTLqHdNnlrJuHg3KOBO5YfGNgxo-xQ8PeAVGJR_pWClXkbnjIExpd7qhn7l1AEY1hD0-wQMPaUEQ4e0p6Ynj9N53UNubVf0NIekxmuj3fFxejmfGnzu4QLVVUu	2019-09-09 16:13:59.887416	2019-09-09 16:13:59.887416
1101	82	fyr6A6v8p9I:APA91bGaDGaASAhP1C4xprItpFjjQgsKF63QKjS87BTODljWqEycL0dH0F2FVp48RpMBkZr0-zKMpgAKuxd1MOOn4hzo-1fBRkrLlxkSGLU_8Dmzol91pijwP3O03LwPqoY6znKHsokI	2019-02-28 18:18:33.749624	2019-02-28 20:55:22.70002
1272	82	cyzdVOIFqFw:APA91bH9__VZoMu_-D338Ixqzs9D7rxAjHTII6uB95jTkii_VYd_Q_jWC2dHUbt3N6c-2sQ_MPf51WNY77Nct2O_ktAERf1Mg84Kmj1Ut1-DsC48DDIAYK_5ZS6lJ784a1pZk_cygQyI	2019-10-03 21:06:33.1973	2019-10-03 21:06:33.1973
1145	82	doJE8WCj828:APA91bHUPhoBwv3Nj-oaVnZ3z0-vFAe7dnhT8l3ODAphB0g4Gg9YMHKRpp_BaM39Wzrh9p9TQE6S8J0J50vbFrpGXF9yn6gMkV346yTkByqLHqbqesLQZWfDHhccRkLgP5Rk5HmHdd-W	2019-03-05 20:24:54.940864	2019-03-05 20:24:54.940864
1146	82	dx7yZdOMuxY:APA91bG8I9I0s4iLIAC7sV1tP051VUYue5PIvUmcXA0He7TX9tFKK9efnlC3D16suYePuoKgGEuhx2jAsq3DKXJavpv7GZsyTWRg43L4aD35cUuAp0dkFkrGHLwdG7uyiE4tdwyBBEY5	2019-03-05 21:54:03.473349	2019-03-05 21:54:03.473349
1147	82	d7Kd0QNJZW8:APA91bGwdPgLhw-8JczFCN50uevdOJ4LOBRBlgiX2ZsW8QxLlsmowXbl6amGKa1WbmTWSjuVVE02KN0jkSsTUfLwqR19OtnzLfoThXrTejVz3eJqX_aptZPeqTlEP5izEAKNo9bAN5u0	2019-03-05 22:06:20.533921	2019-03-05 22:06:20.533921
1110	82	da0FU3SyL6Q:APA91bGZfT6GiXGgR9dUtVvyTg62piWQU8Ec2OXux8rg4OX8TemT3HfVr7oqZ319teOAd1Hr8mnfTxD48fgEI34H6RpxSQq_t-jskrQMZq3v5ixjiIPEzo9oKqqEU6WG2mUqtPOJG-YQ	2019-02-28 21:55:05.427767	2019-02-28 21:55:05.427767
1183	111	eK4EdFJDCmM:APA91bF6Vwk38Av66y9Mf_0r_CsvsHv2Rz9PXtwGmfKnTzw_i2xtDNzk7ZIRbd4m9adi6g_zCG21yIUCYyLEEiCoMX36PFz-zMCkfZkDGUIanaDe6ZjerLzcDrG2-SDn54tmVSPw2mym	2019-07-17 20:10:17.695792	2019-07-20 08:33:57.223481
1122	82	dfhVgUhUdgA:APA91bFYhfRefpq2HgztoEV5gpn-bjhH6e5mgzJRc2a0VTrUVyVwlmVpMCpTevM3Uq46WVUheuU_ALt-wy63vE2V_JyB4lghW7ITiUlUF_kaw77pCgQ9aSewPPa7kBonepZJKsLtNc69	2019-03-01 19:20:13.372675	2019-03-01 19:20:13.372675
1123	82	eiKnhjsIo7o:APA91bFCgbave5bu9RXnIbeue5N48GM4GbMc6pFrE-JJxhDVQKWeqKgSe6-83ylUOvhEyRcujibjS5RiwaXCd5lNlwHQGkLC-9eWNxEMYqTp3X8Wh_SKfrd0cdOom4GEW1iJ7eZ4JlNO	2019-03-02 10:27:22.915999	2019-03-02 10:27:22.915999
1125	82	dkMoVmKE_fs:APA91bHvm7eAs5-pWZcQEB7dlM8stqtwvh0IYpmr5aEpStIcUtrmJEquVR_3YBV7lwf_kmTiLW9JfZvPxX5VhfYyC6hMuWzrwqO6qnxBJ6oFvhP7HoTTQ1YLfKiA0mt-XbaYZha1A_O3	2019-03-02 10:32:46.050042	2019-03-02 10:32:46.050042
1126	82	clao6Jigs5Q:APA91bGsiWUsN8aYFW9BZtudxSh8-pnISpdK1XvThx_eCnQKz_ntCKxJ9enzD2xR4GhAIAy7bbygVhUW5Me1xlyzKsAIQFQCrXr5jIGtpNMeHbxUJ7uplXdJMY3XwK4AkYfOPZDAn03V	2019-03-02 11:43:17.625903	2019-03-02 11:43:17.625903
1173	82	dvlJO9wnqUQ:APA91bEYJGv2-foFKxLuyqkHWre_osJtaDNUqgHvz0Twia_ZZfLlBG0UndOFiHg6l9fzCiV0y_ACRSN27qDrkD2RWQ2EKmDs08L0jKh88egcCmUJOX3ElJaFUrreSzztHgaXunIpFFcC	2019-03-25 21:59:54.050969	2019-03-25 21:59:54.050969
1131	82	e8TXrBPJKBg:APA91bGJEXCbIlRCwdu-Pb5uAqYS-hFTuOY8SPdNYB9NeG0IHjU5UWyU-lkraHMfTfjKRL6VtfrC3PHv85sOLbp_YBiStbzV39Efo3DYkFuhuqMMJZ4QU0yia6BTfX2hN-Qt36PSJiMo	2019-03-02 13:37:04.111817	2019-03-02 13:37:04.111817
1228	110	c2Sv8QcRo3Q:APA91bGZZpIO289HeeXGmzu7HtxNNfRutihiYrFW5RwIt61oQZ3Vhq4-FuRjPf1odcyfWPUtPbDT5FAB8k9lpoBc_UQ3WVVuo3oRKuUak7tnAE5pwbHqH60rNQDKhNO3L2bfU8sD3nBb	2019-08-15 18:26:01.52479	2019-08-15 18:26:01.52479
1134	82	enLqd08R_xs:APA91bGzTS7WF25-cdDwOnrpxDcNFcNe9HHHmQBerPec4zg98zntQ5BlMsNq9QMtxhcY6aE5NLAf5C4gV0d2GyOoWmPuL9Zo11tY86fOXzhaNgAFfxwK9v3QDWmEKHBzwPEJ-rIq7kXm	2019-03-02 21:29:00.908776	2019-03-02 21:29:00.908776
1138	82	cXWhIDxX1pU:APA91bG1NzNTISqMk9SVhH1hH-nqUuUDwSfYQ43s_XdntMQTuvnU3IDHvG8rGeyVmNjQ2vrcrhDSkuWJZHy0gbdhZ2jgwUtJnp1zVXrauNdsgJa4XYmK35HtiqBJyGUPzOQeAtu0B5-0	2019-03-03 18:23:17.368987	2019-03-03 18:23:17.368987
1233	110	fSFU_pQ6uz8:APA91bF6ypmss9N_PvQnmj1I-U0PlbPOSSW7K3igqoeu7tUH-C_-InTEDDR--mVIzciheBzWCPJC53wLYCZbZ_5_sN5YVX4tj5fMcu9mYLmG5AeiXuypLdRs_hBqfkUBAKa0oUIfhEGr	2019-08-15 20:55:43.031011	2019-08-15 20:55:43.031011
1242	110	dPWRYL05D1I:APA91bHxZcxPdtF5uBYeFKoJkK8aWORHlrrAFaMAjkz-PHno4coA35VfdYT_KKQ9eIHHF2FodCPxJWy_XlbeW7ri8fauCZCEeJM-DCYodGGhcbQ9OpKgtYIYE5PCRa6IB8yQE0EftA-D	2019-08-28 20:51:30.501929	2019-08-28 20:51:30.501929
1261	112	dKxlcLSJWOc:APA91bEBcUmVSbaEXMRqg6lb6en3KwxgUxix5cMlBg_hNOEsyxlGNDV0FfyBV2j8cXngT7e52qPWJ5l1LbCqdYVAeAvPBxgABf9Ws0pdwd4G2UXee-iDwaa2QzgRutm-FEHyY6HqFqdi	2019-09-09 17:25:13.680428	2019-09-23 19:57:31.877708
\.


--
-- Data for Name: dialogs; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.dialogs (id, suggestion_id, hire_id, concierge_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: estimator_types; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.estimator_types (id, name, admin_descr, active, widget, standard_field, email, created_at, updated_at) FROM stdin;
1	Avenue Living	Avenue Living	t	t	t		2019-08-19 14:40:43.135177	2019-09-02 16:11:14.540687
2	CHS	CHS	t	f	t		2019-09-15 05:21:34.210502	2019-09-15 05:21:34.210502
3	Work Order Process	Work Order Process	t	f	t		2019-09-21 13:13:26.849382	2019-09-29 10:23:05.634274
\.


--
-- Data for Name: estimators; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.estimators (id, city, address, name, phone, email, comment, created_at, updated_at, status, archive, status_work, work_order, project_task_id, supervisor_id, estimator_type_id) FROM stdin;
117	Calgary	calgary 3435	Eugene Peluhnya	(098) 204-6186	peluhnya@outlook.com	all good	2019-09-11 12:25:17.810352	2019-09-11 12:28:23.948512	approved	\N	in progress	1223232	15	113	1
119	Calgary	test1209	test	(111) 111-1111	k4872319@gmail.com	tetstik	2019-09-12 06:27:36.500852	2019-09-12 06:29:05.153979	approved	\N	in progress		13	113	1
118	Calgary	test2336	test	(111) 111-1111	k4872319@gmail.com	tesr	2019-09-12 06:19:11.512735	2019-09-12 06:43:38.317801	archive	\N	in progress	577	32	110	1
120	calgary	test1209	test	(111) 111-1111	k4872319@gmail.com	TEST	2019-09-12 06:46:11.084543	2019-09-12 06:46:11.084543	pending	\N	\N	\N	\N	\N	1
121	Calgary	test12093	test	(111) 111-1111	k4872319@gmail.com	TESTD	2019-09-12 06:59:04.434434	2019-09-12 06:59:41.23478	approved	\N	in progress		32	110	1
138	new1	new1	asdasdasdasd	(434) 232-3232	peluhnnay@oewwo.codsd	d sd sds . ds dsad sd sd as 	2019-10-09 19:01:51.948568	2019-10-09 19:08:41.110684	archive	\N	\N	\N	\N	\N	2
123	Calgary	test2336	Fred	(222) 222-2222	k4872319@gmail.com	tets	2019-09-12 12:22:30.06946	2019-09-12 22:04:59.686507	finished	\N	complete		32	113	1
125	Dipro	Andjekjdjdjdn ejejne	Alexander Naboka	(484) 848-3883	page.aleks@gmail.com	Дададабсь	2019-09-16 09:40:13.121038	2019-09-16 09:40:13.121038	pending	\N	\N	\N	\N	\N	1
126	Dnipro	Djjdjdnd	Alexander Naboka	(737) 383-8383	page.aleks@gmail.com	Hdhdjd	2019-09-16 09:44:28.762502	2019-09-16 09:44:28.762502	pending	\N	\N	\N	\N	\N	1
127	Calgary	AV 12sdfsf	Test	(000) 000-0000	test@test.com	dfsdf	2019-09-16 10:16:54.20816	2019-09-16 10:16:54.20816	pending	\N	\N	\N	\N	\N	1
129	Calgary	Calgary23	Calgary	(342) 323-2323	peluhnya@outlook.com	CalgaryCalgaryCalgaryCalgaryCalgaryCalgary	2019-09-16 13:13:58.018204	2019-09-16 13:15:04.850539	approved	\N	in progress	12	13	113	2
122	Calgary	test2336	test	(111) 111-1111	k4872319@gmail.com	tesrdd	2019-09-12 11:38:00.072959	2019-09-16 13:29:17.66156	approved	\N	in progress	432	13	113	1
139	new1	new1	asdasdasdasd	(434) 232-3232	peluhnnay@oewwo.codsd	d sd sds . ds dsad sd sd as 	2019-10-09 19:02:16.58905	2019-10-09 19:08:48.764609	archive	\N	\N	\N	\N	\N	2
128	Alberta	Peny Lane	Maria	(000) 000-0000	maria@test.com	test stes sets 	2019-09-16 12:11:17.434735	2019-09-16 14:27:05.107708	archive	\N	\N	\N	\N	\N	1
130	Calgary	Calgary3333	Calgary	(332) 323-2323	peluhnya@pfpdfd.com	sCalgaryCalgaryCalgaryCalgaryCalgary	2019-09-16 13:17:39.595098	2019-09-16 14:34:14.311719	approved	\N	in progress		13	113	1
131	Vancouver	Vancouver 123	Test Masha	(000) 000-0000	test@masha.com	Masha Masha	2019-09-16 14:35:25.867509	2019-09-16 14:35:40.805315	approved	\N	in progress		13	113	1
132	dnipro	pobeda	Aleks	(324) 233-2432	page.aleks@gmail.com	fjksdkfjdshfkjhds hsdfjkf hsdkjf k jdsfhkfjsdhkfjshdfkj sdfkjs sdfhsdkjfhsdkjfh . hdkjsfhsdkfjhds	2019-09-21 13:45:14.842784	2019-09-21 13:45:14.842784	pending	\N	\N	\N	\N	\N	3
133	Wrerrer	sdsdsdsdsds	seeese	(434) 343-4343	peliie@lfjjd.com	dg sdgs fsdf sdf	2019-09-21 13:45:25.946617	2019-09-21 13:45:25.946617	pending	\N	\N	\N	\N	\N	3
134	Wrerrer	sdsdsdsdsds	seeese	(434) 343-4343	peliie@lfjjd.com	dg sdgs fsdf sdf	2019-09-21 13:45:52.12803	2019-09-21 13:45:52.12803	pending	\N	\N	\N	\N	\N	3
135	dnipro	pobeda	Aleks	(324) 233-2432	page.aleks@gmail.com	fjksdkfjdshfkjhds hsdfjkf hsdkjf k jdsfhkfjsdhkfjshdfkj sdfkjs sdfhsdkjfhsdkjfh . hdkjsfhsdkfjhds	2019-09-21 13:47:54.443114	2019-09-21 13:47:54.443114	pending	\N	\N	\N	\N	\N	3
136	fdsjkhfkdsjhfk	dkjfhdskfjhds	2423	(324) 237-8498	page.aleks@gmail.com	dsfsdfds fds dsf fdsdsf	2019-09-21 13:53:04.87828	2019-09-22 21:02:50.939871	archive	\N	\N	\N	\N	\N	3
137	new	new	Eugene	(232) 323-2323	new@new.new	newnewnewnewnew	2019-10-09 16:55:53.82819	2019-10-09 16:55:53.82819	pending	\N	\N	\N	\N	\N	2
140	new1	new1	asdasdasdasd	(434) 232-3232	peluhnnay@oewwo.codsd	d sd sds . ds dsad sd sd as 	2019-10-09 19:06:21.798188	2019-10-09 19:08:53.86197	archive	\N	\N	\N	\N	\N	2
141	new1	new1	asdasdasdasd	(434) 232-3232	peluhnnay@oewwo.codsd	d sd sds . ds dsad sd sd as 	2019-10-09 19:07:23.541593	2019-10-09 19:09:04.844186	archive	\N	\N	\N	\N	\N	2
142	new1	new1	asdasdasdasd	(434) 232-3232	peluhnnay@oewwo.codsd	d sd sds . ds dsad sd sd as 	2019-10-09 19:08:21.256515	2019-10-09 19:09:34.549037	approved	\N	in progress	ererer	13	113	2
124	TEst	TEstTEst	Eugene Peluhnya	(234) 423-4234	peluhnya@outlook.com	sdsdsdasdadasdasd	2019-09-16 09:34:26.309826	2019-10-12 19:42:16.168907	approved	\N	in progress	321	15	113	1
\.


--
-- Data for Name: favorite_tasks; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.favorite_tasks (id, user_id, task_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: feed_notifications; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.feed_notifications (id, owner_id, user_id, notification_type, created_at, updated_at, task_title, message, task_id, suggestion_id, sent, task_owner_id) FROM stdin;
2246	\N	83	new_task	2019-02-06 10:01:10.528679	2019-02-06 10:01:10.528679	first	dsfdsf dsf df sdfsd fsd fsd	329	\N	0	82
2247	\N	\N	new_task	2019-02-06 10:08:24.560124	2019-02-06 10:08:24.560124	second	second	330	\N	0	82
2248	83	82	new_message	2019-02-06 12:59:22.28794	2019-02-06 12:59:22.28794	first	mmm  has accepted your work offer	329	216	0	82
2249	83	82	new_message	2019-02-06 12:59:34.242145	2019-02-06 12:59:34.242145	first	jdjjdjfjfjfjff	329	216	0	82
2250	83	82	new_message	2019-02-06 12:59:38.170462	2019-02-06 12:59:38.170462	first	hhhhhfjhfhfjf	329	216	0	82
2251	83	82	new_message	2019-02-06 12:59:41.933616	2019-02-06 12:59:41.933616	first	vvbxhdjd	329	216	0	82
2252	83	82	new_message	2019-02-06 12:59:45.5309	2019-02-06 12:59:45.5309	first	hdhhdbdbf	329	216	0	82
2253	83	82	new_message	2019-02-06 12:59:47.666413	2019-02-06 12:59:47.666413	first	jdjbdbdd	329	216	0	82
2254	83	82	new_message	2019-02-06 12:59:50.609168	2019-02-06 12:59:50.609168	first	jhhdjdnfb	329	216	0	82
2255	\N	80	new_task	2019-02-06 13:02:25.392913	2019-02-06 13:02:25.392913	task1	gfghhhjhjj	331	\N	0	82
2256	83	82	new_message	2019-02-06 13:02:31.654639	2019-02-06 13:02:31.654639	first	;;$;"-"	329	216	0	82
2257	83	82	new_message	2019-02-06 13:02:33.723727	2019-02-06 13:02:33.723727	first	hdhdhdh	329	216	0	82
2258	83	82	new_message	2019-02-06 13:02:35.213706	2019-02-06 13:02:35.213706	first	hdhdhfbd	329	216	0	82
2259	83	82	new_message	2019-02-06 13:02:36.919021	2019-02-06 13:02:36.919021	first	bbfhfhfhf	329	216	0	82
2260	83	82	new_message	2019-02-06 13:02:38.775335	2019-02-06 13:02:38.775335	first	hfhhfhfjf	329	216	0	82
2261	83	82	new_message	2019-02-06 13:02:40.450195	2019-02-06 13:02:40.450195	first	jdjjd	329	216	0	82
2262	83	82	new_message	2019-02-06 13:02:42.063864	2019-02-06 13:02:42.063864	first	eeeeer	329	216	0	82
2263	83	82	new_message	2019-02-06 13:02:44.295349	2019-02-06 13:02:44.295349	first	qqqqqq	329	216	0	82
2264	83	82	new_message	2019-02-06 13:02:47.278161	2019-02-06 13:02:47.278161	first	qqqqq	329	216	0	82
2265	83	82	new_message	2019-02-06 13:02:48.894547	2019-02-06 13:02:48.894547	first	qqqqq	329	216	0	82
2266	83	82	new_message	2019-02-06 13:02:50.234856	2019-02-06 13:02:50.234856	first	fggg	329	216	0	82
2267	83	82	new_message	2019-02-06 13:02:51.75654	2019-02-06 13:02:51.75654	first	gggggg	329	216	0	82
2268	83	82	new_message	2019-02-06 13:02:53.53455	2019-02-06 13:02:53.53455	first	gggghh	329	216	0	82
2269	83	82	new_message	2019-02-06 13:02:55.193817	2019-02-06 13:02:55.193817	first	ffgghh	329	216	0	82
2270	83	82	new_message	2019-02-06 13:02:56.606655	2019-02-06 13:02:56.606655	first	ffggh	329	216	0	82
2271	83	82	new_message	2019-02-06 13:02:59.513681	2019-02-06 13:02:59.513681	first	ghjklfdssfgh	329	216	0	82
2272	83	82	new_message	2019-02-06 13:03:03.024378	2019-02-06 13:03:03.024378	first	ggghhhh	329	216	0	82
2273	83	82	new_message	2019-02-06 13:03:08.684379	2019-02-06 13:03:08.684379	first	fffggg	329	216	0	82
2274	83	82	new_message	2019-02-06 13:03:13.414574	2019-02-06 13:03:13.414574	first	1111	329	216	0	82
2275	83	82	new_message	2019-02-06 13:03:17.087717	2019-02-06 13:03:17.087717	first	11111	329	216	0	82
2276	83	82	new_message	2019-02-06 13:03:55.593193	2019-02-06 13:03:55.593193	first	hhsbsswqqq	329	216	0	82
2277	80	82	new_message	2019-02-06 13:10:11.346956	2019-02-06 13:10:11.346956	task1	Tommy  has accepted your work offer	331	217	0	82
2278	\N	80	new_task	2019-02-06 13:11:55.609279	2019-02-06 13:11:55.609279	task12	gffgg	332	\N	0	82
2279	\N	80	new_message	2019-02-06 13:22:27.826531	2019-02-06 13:23:00.717446	task1	Please confirm the Change Order	331	217	1	82
2280	\N	82	new_message	2019-02-06 13:27:18.301393	2019-02-06 13:27:18.640406	task1	Budget has changed	331	217	1	82
2281	\N	80	new_message	2019-02-06 17:41:08.96826	2019-02-06 17:41:08.96826	task1	Please confirm the Change Order	331	217	0	82
2282	83	82	new_message	2019-02-06 17:41:20.069279	2019-02-06 17:41:20.069279	first	22222	329	216	0	82
2283	\N	80	new_message	2019-02-06 17:41:23.004826	2019-02-06 17:41:23.004826	task1	Please confirm the Change Order	331	217	0	82
2284	82	80	new_message	2019-02-06 17:42:00.407693	2019-02-06 17:42:00.407693	task1	fgbjk	331	217	0	82
2285	\N	82	new_message	2019-02-06 17:43:01.089727	2019-02-06 17:43:01.089727	task1	Budget has changed	331	217	0	82
2286	\N	82	new_message	2019-02-06 17:43:30.798244	2019-02-06 17:43:30.798244	task1	Budget has changed	331	217	0	82
2291	\N	83	new_task	2019-02-06 18:33:32.100675	2019-02-06 18:33:32.100675	newest task	Dujncdfhk vdsrhnc	333	\N	0	82
2292	\N	80	new_task	2019-02-06 21:58:38.999403	2019-02-06 21:58:38.999403	task113	рпрпрпрпрооооооооооооооооооооооооооооооорррррррррррррррррррррррррррррррррррррррррррррррррррррррррррррррррр	334	\N	0	82
2295	\N	80	new_message	2019-02-06 22:00:24.90601	2019-02-06 22:00:24.90601	task113	Please confirm the Change Order	334	220	0	82
2294	80	82	new_message	2019-02-06 22:00:02.193453	2019-02-06 22:02:17.774003	task113	Tommy  has accepted your work offer	334	220	1	82
2287	\N	80	new_message	2019-02-06 17:56:00.063764	2019-02-06 22:02:17.781661	task1	Please confirm the Change Order	331	217	1	82
2289	82	80	new_message	2019-02-06 18:09:32.899612	2019-02-06 22:02:17.786875	task1	приает	331	217	1	82
2293	\N	80	new_message	2019-02-06 21:59:45.552001	2019-02-06 22:02:17.789432	task113	Please confirm the Change Order	334	220	1	82
2288	\N	80	new_message	2019-02-06 17:57:28.135583	2019-02-06 22:02:17.802813	task1	Please confirm the Change Order	331	217	1	82
2290	83	80	new_message	2019-02-06 18:14:19.925115	2019-02-06 22:02:59.404537	task1	'test2'	331	217	1	82
2296	83	82	new_message	2019-02-08 08:36:35.908497	2019-02-08 08:36:35.908497	second	New Bid! mmm : . 	330	221	0	82
2297	\N	\N	new_task	2019-02-08 10:35:50.221048	2019-02-08 10:35:50.221048	dssd		335	\N	0	82
2298	\N	\N	destroy_task	2019-02-08 10:36:00.364254	2019-02-08 10:36:00.364254	\N	\N	335	\N	0	\N
2301	82	83	new_message	2019-02-08 21:49:12.256345	2019-02-08 21:49:12.256345	first	You have got a rating.	329	216	0	82
2302	83	82	new_message	2019-02-08 21:57:58.77578	2019-02-08 21:57:58.77578	newest task	mmm  has accepted your work offer	333	219	0	82
2303	83	82	new_message	2019-02-08 21:58:01.328679	2019-02-08 21:58:01.328679	newest task	mmm  has accepted your work offer	333	219	0	82
2304	\N	83	new_message	2019-02-08 21:58:30.367155	2019-02-08 21:58:30.367155	newest task	Please confirm the Change Order	333	219	0	82
2305	\N	82	new_message	2019-02-08 21:59:06.097852	2019-02-08 21:59:06.097852	newest task	Budget has changed	333	219	0	82
2306	\N	83	new_message	2019-02-08 21:59:25.807489	2019-02-08 21:59:25.807489	newest task	Back Charge	333	219	0	82
2307	83	82	new_message	2019-02-08 21:59:44.6671	2019-02-08 21:59:44.6671	newest task	mmm  — completed your task, please confirm	333	219	0	82
2300	82	83	new_message	2019-02-08 21:49:06.804307	2019-02-10 17:33:27.24928	first	mm : Has confirmed your work.	329	216	1	82
2299	83	82	new_message	2019-02-08 21:47:47.665238	2019-02-10 17:33:27.340058	first	mmm  — completed your task, please confirm	329	216	1	82
2308	82	83	new_message	2019-02-08 22:00:09.085453	2019-02-08 22:00:09.085453	newest task	mm : Has confirmed your work.	333	219	0	82
2309	80	82	new_message	2019-02-09 21:32:59.817817	2019-02-09 21:32:59.817817	task12	Tommy  has accepted your work offer	332	218	0	82
2313	82	80	new_message	2019-02-09 21:34:09.574734	2019-02-09 21:34:09.574734	task12	mm : Has confirmed your work.	332	218	0	82
2318	\N	\N	update_task	2019-02-10 13:23:19.68379	2019-02-10 13:23:19.68379	\N	\N	336	\N	0	\N
2319	\N	\N	update_task	2019-02-10 13:24:29.188741	2019-02-10 13:24:29.188741	\N	\N	336	\N	0	\N
2310	80	82	new_message	2019-02-09 21:33:02.220454	2019-02-10 17:33:27.329338	task12	Tommy  has accepted your work offer	332	218	1	82
2315	83	82	new_message	2019-02-10 13:10:10.622209	2019-02-10 17:33:27.335864	second	New Bid! mmm : Bid test chat. 	330	221	1	82
2312	80	82	new_message	2019-02-09 21:33:07.263574	2019-02-10 17:33:27.338275	task12	Tommy  — completed your task, please confirm	332	218	1	82
2317	\N	79	new_task	2019-02-10 13:22:40.481564	2019-02-10 17:33:46.730899	task for test chat	Sghgfer xgygsd stjgf fgfd ghgdt cghfse kkh guuh chknh cfyutg xse mkhrw zdyh dghgf chjnf cfyjjh xsty drewf deyuj xd mkgr fghh ftui gui gtedd ffeuii chuhfr fyuhf fhhv	336	\N	1	82
2325	\N	80	new_message	2019-02-10 15:10:44.614384	2019-02-10 17:33:46.732798	task100	Please confirm the Change Order	337	224	1	82
2324	\N	82	new_message	2019-02-10 15:09:01.641616	2019-02-10 17:33:46.765627	task100	Budget has changed	337	224	1	82
2322	80	82	new_message	2019-02-10 15:08:54.392231	2019-02-10 17:33:46.767611	task100	Tommy  has accepted your work offer	337	224	1	82
2326	\N	82	new_message	2019-02-10 15:11:29.766442	2019-02-10 17:33:46.769632	task100	Budget has changed	337	224	1	82
2321	\N	80	new_message	2019-02-10 14:57:40.964132	2019-02-10 17:33:46.837659	task100	Please confirm the Change Order	337	224	1	82
2316	83	82	new_message	2019-02-10 13:12:48.257461	2019-02-10 17:33:46.853394	second	Test messege chat from conractor	330	221	1	82
2314	82	80	new_message	2019-02-09 21:34:13.08247	2019-02-10 17:33:46.891597	task12	You have got a rating.	332	218	1	82
2311	80	82	new_message	2019-02-09 21:33:02.522354	2019-02-10 17:33:46.899096	task12	Tommy  has accepted your work offer	332	218	1	82
2323	80	82	new_message	2019-02-10 15:08:56.471956	2019-02-10 17:33:46.905153	task100	Tommy  has accepted your work offer	337	224	1	82
2320	\N	80	new_task	2019-02-10 14:54:00.900231	2019-02-10 17:33:46.920085	task100	папраепнпоррпоеаерппр	337	\N	1	82
2327	\N	80	new_message	2019-02-10 17:34:25.953139	2019-02-10 17:34:25.953139	task113	Please confirm the Change Order	334	220	0	82
2328	\N	83	new_message	2019-02-10 17:55:51.011121	2019-02-10 17:55:51.136844	task113	Please confirm the Change Order	334	220	1	82
2329	\N	83	new_task	2019-02-10 17:58:07.685625	2019-02-10 17:58:07.782703	ty22222		338	\N	1	82
2330	83	82	new_message	2019-02-10 17:58:18.849086	2019-02-10 17:58:18.958374	ty22222	mmm  has accepted your work offer	338	225	1	82
2331	\N	83	new_message	2019-02-10 17:59:10.176968	2019-02-10 17:59:10.256306	ty22222	Please confirm the Change Order	338	225	1	82
2332	\N	82	new_message	2019-02-10 17:59:52.238847	2019-02-10 17:59:52.238847	ty22222	Budget has changed	338	225	0	82
2333	83	82	new_message	2019-02-10 18:02:38.69018	2019-02-10 18:02:38.796485	ty22222	mmm  — completed your task, please confirm	338	225	1	82
2334	\N	82	new_message	2019-02-10 18:07:11.193489	2019-02-10 18:07:11.193489	task113	Budget has changed	334	220	0	82
2335	\N	82	new_message	2019-02-10 18:07:32.85361	2019-02-10 18:07:32.961588	task113	Budget has changed	334	220	1	82
2340	\N	80	new_message	2019-02-10 23:47:26.815223	2019-02-11 07:00:03.446248	task101	Please confirm the Change Order	339	226	1	82
2341	\N	82	new_message	2019-02-10 23:51:47.358884	2019-02-11 07:00:03.464889	task101	Budget has changed	339	226	1	82
2337	80	82	new_message	2019-02-10 23:43:32.659165	2019-02-11 07:00:03.468126	task101	Tommy  has accepted your work offer	339	226	1	82
2338	80	82	new_message	2019-02-10 23:43:34.50986	2019-02-11 07:00:03.472859	task101	Tommy  has accepted your work offer	339	226	1	82
2339	80	82	new_message	2019-02-10 23:43:36.568881	2019-02-11 07:00:03.485106	task101	Tommy  has accepted your work offer	339	226	1	82
2336	\N	80	new_task	2019-02-10 23:42:55.001402	2019-02-11 07:00:24.708516	task101	dgsdfgfdsggfs	339	\N	1	82
2342	83	82	new_message	2019-02-11 07:36:29.478496	2019-02-11 07:36:29.591583	second	message text	330	221	1	82
2343	\N	83	new_task	2019-02-11 10:06:18.229838	2019-02-11 13:24:33.715523	new tesk555	Fgvxdd	340	\N	1	82
2344	82	80	new_message	2019-02-11 21:56:19.374683	2019-02-11 22:05:33.517922	task12	hi	332	218	1	82
2345	82	83	new_message	2019-02-12 10:13:49.231301	2019-02-12 10:13:49.231301	second	Test message	330	221	0	82
2346	83	82	new_message	2019-02-12 10:54:57.114611	2019-02-12 10:54:57.114611	new tesk555	Hi messege for test	340	227	0	82
2347	83	82	new_message	2019-02-12 11:08:22.099158	2019-02-12 11:08:22.099158	new tesk555	mmm  has accepted your work offer	340	227	0	82
2349	83	82	new_message	2019-02-12 13:43:13.131345	2019-02-12 13:43:13.131345	new tesk555	\N	340	227	0	82
2348	82	83	new_message	2019-02-12 11:24:12.576219	2019-02-12 20:36:26.803516	new tesk555	From hire message	340	227	1	82
2351	82	83	new_message	2019-02-12 14:00:59.842589	2019-02-12 20:36:26.805446	new tesk555	mm : Has confirmed your work.	340	227	1	82
2350	83	82	new_message	2019-02-12 13:43:49.267494	2019-02-12 20:36:26.801507	new tesk555	mmm  — completed your task, please confirm	340	227	1	82
2352	82	83	new_message	2019-02-12 21:45:58.292575	2019-02-12 21:45:58.608694	ty22222	mm : Has confirmed your work.	338	225	1	82
2353	\N	83	new_task	2019-02-12 21:52:49.357589	2019-02-12 21:52:49.466227	test	Test	341	\N	1	82
2354	83	82	new_message	2019-02-12 21:52:58.89851	2019-02-12 21:52:59.00928	test	mmm  has accepted your work offer	341	228	1	82
2355	83	82	new_message	2019-02-12 21:53:01.334007	2019-02-12 21:53:01.462058	test	mmm  has accepted your work offer	341	228	1	82
2356	83	82	new_message	2019-02-12 21:53:11.628211	2019-02-12 21:53:11.755461	test	mmm  — completed your task, please confirm	341	228	1	82
2357	82	83	new_message	2019-02-12 21:53:34.678863	2019-02-12 21:53:34.78788	test	mm : Has confirmed your work.	341	228	1	82
2359	\N	80	new_task	2019-02-12 22:03:30.241914	2019-02-12 22:08:24.027522	dkdjfjcmmlsix	Xkxjcbnlxk jxn	342	\N	1	82
2360	\N	80	new_task	2019-02-12 22:06:30.581605	2019-02-12 22:08:24.035791	bsxjjxjxn	Xmdkxkkxkxkx	343	\N	1	82
2358	82	83	new_message	2019-02-12 22:01:37.97684	2019-02-12 22:08:24.054324	test	You have got a rating.	341	228	1	82
2361	80	82	new_message	2019-02-12 22:09:27.958984	2019-02-12 22:09:28.09663	dkdjfjcmmlsix	Tommy  has accepted your work offer	342	229	1	82
2362	82	80	new_message	2019-02-12 22:09:43.893317	2019-02-12 22:09:43.995652	dkdjfjcmmlsix	ythanks	342	229	1	82
2363	80	82	new_message	2019-02-12 22:11:12.408007	2019-02-12 22:11:12.546486	dkdjfjcmmlsix	мролд	342	229	1	82
2364	82	80	new_message	2019-02-12 22:11:27.109467	2019-02-12 22:11:27.369172	dkdjfjcmmlsix	\N	342	229	1	82
2365	80	82	new_message	2019-02-12 22:11:44.51751	2019-02-12 22:11:44.625368	dkdjfjcmmlsix	\N	342	229	1	82
2366	\N	80	new_message	2019-02-12 22:13:21.082393	2019-02-12 22:13:21.082393	dkdjfjcmmlsix	Please confirm the Change Order	342	229	0	82
2367	82	83	new_message	2019-02-12 22:13:51.560013	2019-02-12 22:13:51.683323	ty22222	hi	338	225	1	82
2368	82	83	new_message	2019-02-12 22:13:56.65869	2019-02-12 22:13:56.765113	ty22222	good	338	225	1	82
2369	82	83	new_message	2019-02-12 22:17:59.461109	2019-02-12 22:17:59.580478	ty22222	goog	338	225	1	82
2370	\N	82	new_message	2019-02-12 22:18:52.79145	2019-02-12 22:18:52.79145	dkdjfjcmmlsix	Budget has changed	342	229	0	82
2371	\N	80	new_message	2019-02-12 22:21:05.886352	2019-02-12 22:21:05.886352	dkdjfjcmmlsix	Please confirm the Change Order	342	229	0	82
2372	82	83	new_message	2019-02-12 22:21:56.645902	2019-02-12 22:21:56.769629	newest task	god	333	219	1	82
2378	\N	80	new_message	2019-02-12 22:36:38.306991	2019-02-12 22:36:38.306991	dkdjfjcmmlsix	Back Charge	342	229	0	82
2373	80	82	new_message	2019-02-12 22:23:15.815579	2019-02-12 22:23:15.927252	bsxjjxjxn	Tommy  has accepted your work offer	343	230	1	82
2374	82	83	new_message	2019-02-12 22:27:20.209758	2019-02-12 22:27:20.31803	newest task	good	333	219	1	82
2375	\N	82	new_message	2019-02-12 22:34:15.70745	2019-02-12 22:34:15.70745	dkdjfjcmmlsix	Budget has changed	342	229	0	82
2376	82	80	new_message	2019-02-12 22:36:18.744316	2019-02-12 22:36:18.82991	dkdjfjcmmlsix	dnnxjd	342	229	1	82
2377	80	82	new_message	2019-02-12 22:36:35.224335	2019-02-12 22:36:35.330075	dkdjfjcmmlsix	ее ку	342	229	1	82
2379	\N	80	new_message	2019-02-12 22:38:25.7781	2019-02-12 22:38:25.7781	dkdjfjcmmlsix	Back Charge	342	229	0	82
2380	82	80	new_message	2019-02-12 22:47:20.974987	2019-02-12 22:47:21.085156	dkdjfjcmmlsix	comone	342	229	1	82
2381	82	80	new_message	2019-02-12 22:47:29.466637	2019-02-12 22:47:29.554264	dkdjfjcmmlsix	комоне	342	229	1	82
2382	80	82	new_message	2019-02-12 22:48:17.854722	2019-02-12 22:48:17.96109	dkdjfjcmmlsix	Tommy  — completed your task, please confirm	342	229	1	82
2383	82	80	new_message	2019-02-12 22:48:38.07942	2019-02-12 22:48:38.503616	dkdjfjcmmlsix	mm : Has confirmed your work.	342	229	1	82
2384	\N	80	new_message	2019-02-12 23:19:36.918689	2019-02-12 23:19:37.205932	bsxjjxjxn	Please confirm the Change Order	343	230	1	82
2385	\N	82	new_message	2019-02-12 23:20:41.479819	2019-02-12 23:20:41.479819	bsxjjxjxn	Budget has changed	343	230	0	82
2386	\N	80	new_message	2019-02-12 23:24:17.039654	2019-02-12 23:24:17.039654	bsxjjxjxn	Back Charge	343	230	0	82
2387	\N	80	new_message	2019-02-12 23:25:49.390693	2019-02-12 23:25:49.390693	bsxjjxjxn	Please confirm the Change Order	343	230	0	82
2388	82	80	new_message	2019-02-12 23:35:18.750841	2019-02-12 23:35:18.84238	dkdjfjcmmlsix	ьаьчлчдвла	342	229	1	82
2389	82	80	new_message	2019-02-12 23:35:33.388511	2019-02-12 23:35:33.484525	bsxjjxjxn	алалладс	343	230	1	82
2390	82	80	new_message	2019-02-12 23:36:41.139701	2019-02-12 23:36:41.244758	bsxjjxjxn	Добрый	343	230	1	82
2391	80	82	new_message	2019-02-12 23:38:26.742413	2019-02-12 23:38:26.843644	bsxjjxjxn	Можно чендж?	343	230	1	82
2392	\N	82	new_message	2019-02-12 23:39:15.818769	2019-02-12 23:39:15.818769	bsxjjxjxn	Budget has changed	343	230	0	82
2393	\N	80	new_message	2019-02-12 23:40:04.352866	2019-02-12 23:40:04.438398	bsxjjxjxn	Please confirm the Change Order	343	230	1	82
2394	\N	82	new_message	2019-02-12 23:40:27.413103	2019-02-12 23:40:27.516997	bsxjjxjxn	Budget has changed	343	230	1	82
2395	\N	80	new_message	2019-02-12 23:41:12.437047	2019-02-12 23:41:12.437047	bsxjjxjxn	Back Charge	343	230	0	82
2396	\N	80	new_message	2019-02-12 23:43:25.992707	2019-02-12 23:43:26.093646	bsxjjxjxn	Back Charge	343	230	1	82
2397	80	82	new_message	2019-02-12 23:45:03.413277	2019-02-12 23:45:03.50936	bsxjjxjxn	Tommy  — completed your task, please confirm	343	230	1	82
2398	82	80	new_message	2019-02-12 23:45:36.363421	2019-02-12 23:45:36.451276	bsxjjxjxn	mm : Has confirmed your work.	343	230	1	82
2399	82	80	new_message	2019-02-12 23:45:36.659972	2019-02-12 23:45:36.805824	bsxjjxjxn	You have got a rating.	343	230	1	82
2400	82	80	new_message	2019-02-13 17:44:54.422719	2019-02-13 17:44:54.422719	dkdjfjcmmlsix	hi	342	229	0	82
2401	82	80	new_message	2019-02-13 17:53:55.075063	2019-02-13 17:53:55.075063	dkdjfjcmmlsix	You have got a rating.	342	229	0	82
2402	82	80	new_message	2019-02-13 17:54:34.731732	2019-02-13 17:54:34.731732	task101	You have got a rating.	339	226	0	82
2403	\N	80	new_message	2019-02-13 18:09:46.415413	2019-02-13 18:09:46.415413	task101	Back Charge	339	226	0	82
2409	\N	80	new_task	2019-02-13 19:35:09.977661	2019-02-13 19:37:53.782171	task301	eygryuewryegry	344	\N	1	82
2404	\N	80	new_message	2019-02-13 19:27:49.322197	2019-02-13 19:37:53.790825	task1	Please confirm the Change Order	331	217	1	82
2407	\N	80	new_message	2019-02-13 19:33:53.879421	2019-02-13 19:37:53.810504	task101	Please confirm the Change Order	339	226	1	82
2405	\N	80	new_message	2019-02-13 19:28:18.186681	2019-02-13 19:37:53.795422	task100	Please confirm the Change Order	337	224	1	82
2406	\N	80	new_message	2019-02-13 19:33:23.571696	2019-02-13 19:37:53.822786	task101	Please confirm the Change Order	339	226	1	82
2408	\N	80	new_message	2019-02-13 19:34:27.241452	2019-02-13 19:38:13.92672	task101	Back Charge	339	226	1	82
2410	80	82	new_message	2019-02-13 19:36:01.997476	2019-02-13 19:38:27.017338	task301	Tommy  has accepted your work offer	344	231	1	82
2411	\N	80	new_message	2019-02-13 19:36:29.292005	2019-02-13 19:38:46.931595	task301	Please confirm the Change Order	344	231	1	82
2412	\N	82	new_message	2019-02-13 19:41:22.50358	2019-02-13 19:41:22.648875	task101	Budget has changed	339	226	1	82
2413	\N	82	new_message	2019-02-13 19:41:26.654235	2019-02-13 19:41:26.654235	task101	Budget has changed	339	226	0	82
2414	\N	82	new_message	2019-02-13 19:43:40.639714	2019-02-13 19:43:40.639714	task301	Budget has changed	344	231	0	82
2415	\N	80	new_message	2019-02-13 19:44:11.438874	2019-02-13 19:44:11.533189	task101	Back Charge	339	226	1	82
2416	\N	80	new_message	2019-02-13 19:50:30.367174	2019-02-13 19:50:30.488802	task301	Back Charge	344	231	1	82
2417	80	82	new_message	2019-02-13 19:50:40.070333	2019-02-13 19:50:40.191741	task301	Tommy  — completed your task, please confirm	344	231	1	82
2418	\N	83	new_task	2019-02-13 20:00:24.832283	2019-02-13 20:00:24.983061	test	Descr	345	\N	1	82
2419	\N	\N	update_task	2019-02-13 20:00:44.676355	2019-02-13 20:00:44.676355	\N	\N	345	\N	0	\N
2420	82	80	new_message	2019-02-13 20:01:34.157726	2019-02-13 20:01:34.26505	task301	hi	344	231	1	82
2421	80	82	new_message	2019-02-13 20:01:45.891126	2019-02-13 20:01:46.022754	task301	иоьипр	344	231	1	82
2422	82	80	new_message	2019-02-13 20:02:17.198449	2019-02-13 20:02:17.305829	task301	mm : Has confirmed your work.	344	231	1	82
2423	82	80	new_message	2019-02-13 20:02:20.949141	2019-02-13 20:02:21.057509	task301	You have got a rating.	344	231	1	82
2424	82	83	new_message	2019-02-13 20:13:35.047629	2019-02-13 20:13:35.148585	ty22222	You have got a rating.	338	225	1	82
2425	83	82	new_message	2019-02-13 20:27:04.492886	2019-02-13 20:27:04.613091	test	New Bid! mmm : . 	345	232	1	82
2426	82	83	new_message	2019-02-13 20:27:45.985088	2019-02-13 20:27:46.097087	test	vivovmfj	345	232	1	82
2427	\N	83	new_task	2019-02-13 20:27:57.473755	2019-02-13 20:27:57.578133	y	Hh	346	\N	1	82
2428	83	82	new_message	2019-02-13 20:28:07.460832	2019-02-13 20:28:07.580894	y	mmm  has accepted your work offer	346	233	1	82
2429	83	82	new_message	2019-02-13 20:28:09.203462	2019-02-13 20:28:09.359625	y	mmm  has accepted your work offer	346	233	1	82
2430	83	82	new_message	2019-02-13 20:28:12.564896	2019-02-13 20:28:12.678198	y	mmm  — completed your task, please confirm	346	233	1	82
2431	82	83	new_message	2019-02-13 20:28:28.873882	2019-02-13 20:28:28.994144	y	mm : Has confirmed your work.	346	233	1	82
2432	82	83	new_message	2019-02-13 20:28:39.81842	2019-02-13 20:28:39.933825	y	You have got a rating.	346	233	1	82
2433	\N	83	new_task	2019-02-13 20:31:15.360985	2019-02-13 20:31:15.478042	pop1	Jh	347	\N	1	82
2434	\N	83	new_task	2019-02-13 20:31:46.925405	2019-02-13 20:31:47.04025	pop2	Fg	348	\N	1	82
2435	\N	83	new_task	2019-02-13 20:32:42.470457	2019-02-13 20:32:42.608628	pop3	Ff	349	\N	1	82
2436	83	82	new_message	2019-02-13 20:32:52.41891	2019-02-13 20:32:52.534539	pop3	mmm  has accepted your work offer	349	236	1	82
2437	83	82	new_message	2019-02-13 20:32:57.559087	2019-02-13 20:32:57.670824	pop3	mmm  — completed your task, please confirm	349	236	1	82
2438	83	82	new_message	2019-02-13 20:33:06.683418	2019-02-13 20:33:06.833512	pop2	mmm  has accepted your work offer	348	235	1	82
2439	83	82	new_message	2019-02-13 20:33:10.860786	2019-02-13 20:33:10.991407	pop2	mmm  — completed your task, please confirm	348	235	1	82
2440	83	82	new_message	2019-02-13 20:33:17.995385	2019-02-13 20:33:18.114663	pop1	mmm  has accepted your work offer	347	234	1	82
2441	83	82	new_message	2019-02-13 20:33:24.298236	2019-02-13 20:33:24.426654	pop1	mmm  — completed your task, please confirm	347	234	1	82
2442	82	83	new_message	2019-02-13 20:33:53.437829	2019-02-13 20:33:53.569442	pop1	mm : Has confirmed your work.	347	234	1	82
2443	82	83	new_message	2019-02-13 20:34:08.374248	2019-02-13 20:34:08.494367	pop1	hi	347	234	1	82
2444	82	83	new_message	2019-02-13 20:34:12.609094	2019-02-13 20:34:12.719988	pop1	You have got a rating.	347	234	1	82
2445	82	83	new_message	2019-02-13 20:35:21.801841	2019-02-13 20:35:21.9004	pop2	mm : Has confirmed your work.	348	235	1	82
2446	82	83	new_message	2019-02-13 20:35:46.250954	2019-02-13 20:35:46.36482	pop2	You have got a rating.	348	235	1	82
2447	82	83	new_message	2019-02-13 20:39:45.262067	2019-02-13 20:39:45.371924	pop3	mm : Has confirmed your work.	349	236	1	82
2448	82	83	new_message	2019-02-13 20:39:49.176815	2019-02-13 20:39:49.282334	pop3	You have got a rating.	349	236	1	82
2449	82	83	new_message	2019-02-13 20:40:37.853518	2019-02-13 20:40:37.962254	second	Congratulations! mmm : Your bid was accepted. 	330	221	1	82
2450	83	82	new_message	2019-02-13 20:40:57.619862	2019-02-13 20:40:57.721924	test	New Bid! mmm : fh. 	345	232	1	82
2451	83	82	new_message	2019-02-13 20:41:11.382807	2019-02-13 20:41:11.493662	second	mmm  — completed your task, please confirm	330	221	1	82
2452	82	83	new_message	2019-02-13 20:41:27.428777	2019-02-13 20:41:27.543153	second	mm : Has confirmed your work.	330	221	1	82
2453	82	83	new_message	2019-02-13 20:41:32.741839	2019-02-13 20:41:32.860255	second	You have got a rating.	330	221	1	82
2454	80	82	new_message	2019-02-13 21:02:15.599391	2019-02-13 21:02:15.744143	task101	Tommy  — completed your task, please confirm	339	226	1	82
2455	82	80	new_message	2019-02-13 21:02:57.551977	2019-02-13 21:02:57.658236	task101	mm : Has confirmed your work.	339	226	1	82
2456	80	82	new_message	2019-02-13 21:04:46.490934	2019-02-13 21:04:46.638544	task100	Tommy  — completed your task, please confirm	337	224	1	82
2457	82	80	new_message	2019-02-13 21:05:08.865147	2019-02-13 21:05:08.951005	task100	mm : Has confirmed your work.	337	224	1	82
2458	82	80	new_message	2019-02-13 21:05:13.423057	2019-02-13 21:05:13.509595	task100	You have got a rating.	337	224	1	82
2459	\N	80	new_task	2019-02-13 21:10:06.077398	2019-02-13 21:10:06.196062	jsjxnxnfn	Znnzjzjxmx	350	\N	1	82
2460	80	82	new_message	2019-02-13 21:10:14.553898	2019-02-13 21:10:14.670476	jsjxnxnfn	Tommy  has accepted your work offer	350	237	1	82
2461	\N	80	new_message	2019-02-13 21:10:34.079761	2019-02-13 21:10:34.079761	jsjxnxnfn	Please confirm the Change Order	350	237	0	82
2462	80	82	new_message	2019-02-13 21:10:57.838931	2019-02-13 21:10:57.97005	jsjxnxnfn	Tommy  — completed your task, please confirm	350	237	1	82
2463	82	80	new_message	2019-02-13 21:12:14.454236	2019-02-13 21:12:14.549547	jsjxnxnfn	mm : Has confirmed your work.	350	237	1	82
2464	82	80	new_message	2019-02-13 21:12:18.26344	2019-02-13 21:12:18.394724	jsjxnxnfn	You have got a rating.	350	237	1	82
2465	82	80	new_message	2019-02-13 21:17:43.804045	2019-02-13 21:17:43.91971	task113	jdndnc	334	220	1	82
2466	80	82	new_message	2019-02-13 21:18:10.348592	2019-02-13 21:18:10.471567	task113	итть	334	220	1	82
2467	80	82	new_message	2019-02-13 21:18:15.017184	2019-02-13 21:18:15.1452	task113	Tommy  — completed your task, please confirm	334	220	1	82
2468	\N	\N	new_task	2019-02-13 21:18:27.822483	2019-02-13 21:18:29.5227	xkxjdjnxmxmxnxmxnx	Xjnxnxkdkskaks sjsjdkdlf	351	\N	1	82
2469	80	82	new_message	2019-02-13 21:18:42.856768	2019-02-13 21:18:42.979962	xkxjdjnxmxmxnxmxnx	New Bid! Tommy : . 	351	238	1	82
2475	\N	\N	update_task	2019-02-13 21:28:20.88524	2019-02-13 21:28:20.88524	\N	\N	352	\N	0	\N
2470	80	82	new_message	2019-02-13 21:20:47.488067	2019-02-14 20:13:19.460201	xkxjdjnxmxmxnxmxnx	ау	351	238	1	82
2472	82	80	new_message	2019-02-13 21:23:04.656035	2019-02-14 20:13:19.482959	task113	You have got a rating.	334	220	1	82
2486	82	80	new_message	2019-02-13 21:54:45.889949	2019-02-14 20:13:19.611974	znndjdmxmxmx	Congratulations! Tommy : Your bid was accepted. 	353	240	1	82
2487	82	80	new_message	2019-02-13 21:58:13.302677	2019-02-14 20:13:19.614282	znndjdmxmxmx	jfhckg	353	240	1	82
2489	80	82	new_message	2019-02-13 21:59:21.106949	2019-02-14 20:13:19.626426	xkxjdjnxmxmxnxmxnx	Tommy  — completed your task, please confirm	351	238	1	82
2485	80	82	new_message	2019-02-13 21:46:20.092146	2019-02-14 20:13:19.645209	znndjdmxmxmx	New Bid! Tommy : . 	353	240	1	82
2488	82	80	new_message	2019-02-13 21:58:41.314877	2019-02-14 20:13:19.723482	xkxjdjnxmxmxnxmxnx	Congratulations! Tommy : Your bid was accepted. 	351	238	1	82
2490	\N	80	new_task	2019-02-13 22:01:05.981432	2019-02-14 20:13:19.858327	task*		354	\N	1	82
2491	82	80	new_message	2019-02-13 22:02:05.939163	2019-02-14 20:13:19.861062	xkxjdjnxmxmxnxmxnx	mm : Has confirmed your work.	351	238	1	82
2496	83	82	new_message	2019-02-14 20:04:22.781	2019-02-14 20:13:19.876595	test	hi	345	232	1	82
2495	83	82	new_message	2019-02-14 20:03:59.439756	2019-02-14 20:13:19.885532	second	hi	330	221	1	82
2494	\N	79	new_task	2019-02-14 18:03:46.187464	2019-02-14 20:13:19.987468	task1	tests	355	\N	1	82
2493	\N	80	new_message	2019-02-14 15:25:31.387618	2019-02-14 20:13:19.997667	task*	Please confirm the Change Order	354	241	1	82
2492	82	80	new_message	2019-02-13 22:02:07.608492	2019-02-14 20:13:20.007542	xkxjdjnxmxmxnxmxnx	You have got a rating.	351	238	1	82
2497	83	82	new_message	2019-02-14 20:04:44.122947	2019-02-14 20:13:20.036976	task1	hi	355	243	1	82
2498	83	82	new_message	2019-02-14 20:05:04.84632	2019-02-14 20:13:20.115545	task1	mmm  has accepted your work offer	355	242	1	82
2501	83	82	new_message	2019-02-14 20:07:03.20819	2019-02-14 20:13:20.333784	code	hi	356	244	1	82
2500	\N	83	new_task	2019-02-14 20:06:21.460707	2019-02-14 20:13:20.335485	code	Fh	356	\N	1	82
2503	83	82	new_message	2019-02-14 20:07:37.217641	2019-02-14 20:13:20.332076	code	jbj	356	244	1	82
2502	83	82	new_message	2019-02-14 20:07:30.96897	2019-02-14 20:13:20.360203	code	fvh	356	244	1	82
2499	83	82	new_message	2019-02-14 20:05:07.272814	2019-02-14 20:13:20.467344	task1	mmm  has accepted your work offer	355	242	1	82
2504	83	82	new_message	2019-02-14 20:09:20.586443	2019-02-14 20:13:20.578875	second	hbk	330	221	1	82
2473	\N	\N	new_task	2019-02-13 21:24:07.22788	2019-02-14 20:13:22.472258	jdjdnxmdmdm	Sndnxnxnxkkx	352	\N	1	82
2505	83	82	new_message	2019-02-14 20:13:30.81973	2019-02-14 20:13:30.935595	second	vj	330	221	1	82
2479	82	80	new_message	2019-02-13 21:35:05.220252	2019-02-14 20:13:35.257084	jdjdnxmdmdm	Congratulations! Tommy : Your bid was accepted. 	352	239	1	82
2481	82	80	new_message	2019-02-13 21:40:33.367282	2019-02-14 20:13:50.453602	jdjdnxmdmdm	dava	352	239	1	82
2484	80	82	new_message	2019-02-13 21:45:58.452071	2019-02-14 20:13:50.487027	znndjdmxmxmx	этот?	353	240	1	82
2478	82	80	new_message	2019-02-13 21:35:01.003958	2019-02-14 20:14:07.594794	jdjdnxmdmdm	dhigxkgx	352	239	1	82
2476	80	82	new_message	2019-02-13 21:29:06.204591	2019-02-14 20:14:07.619679	jdjdnxmdmdm	New Bid! Tommy : . 	352	239	1	82
2477	80	82	new_message	2019-02-13 21:29:39.309758	2019-02-14 20:14:07.622395	jdjdnxmdmdm	New Bid! Tommy : . 	352	239	1	82
2480	80	82	new_message	2019-02-13 21:39:13.709615	2019-02-14 20:14:07.626871	jdjdnxmdmdm	роль	352	239	1	82
2483	\N	\N	new_task	2019-02-13 21:41:14.36848	2019-02-14 20:14:08.871788	znndjdmxmxmx	Sjdjxnxmxkkx	353	\N	1	82
2506	83	82	new_message	2019-02-14 20:15:41.553762	2019-02-14 20:15:41.672186	second	ggg	330	221	1	82
2474	80	82	new_message	2019-02-13 21:25:09.753116	2019-02-14 20:13:19.481168	xkxjdjnxmxmxnxmxnx	New Bid! Tommy : . 	351	238	1	82
2471	82	80	new_message	2019-02-13 21:23:03.987519	2019-02-14 20:13:19.487396	task113	mm : Has confirmed your work.	334	220	1	82
2482	80	82	new_message	2019-02-13 21:41:08.755469	2019-02-14 20:13:50.489027	jdjdnxmdmdm	Tommy  — completed your task, please confirm	352	239	1	82
2507	83	82	new_message	2019-02-14 20:15:48.425664	2019-02-14 20:15:48.582188	second	bjk	330	221	1	82
2508	83	82	new_message	2019-02-14 20:18:44.62217	2019-02-14 20:18:44.742608	second	fdc	330	221	1	82
2509	83	82	new_message	2019-02-14 20:38:06.350451	2019-02-14 20:38:06.476782	second	hhh	330	221	1	82
2510	83	82	new_message	2019-02-14 20:38:18.31513	2019-02-14 20:38:18.428693	second	hgjj	330	221	1	82
2511	83	82	new_message	2019-02-14 20:38:30.575376	2019-02-14 20:38:30.692806	second	gbj	330	221	1	82
2512	83	82	new_message	2019-02-14 20:38:38.391708	2019-02-14 20:38:38.513713	second	hjiljujgh	330	221	1	82
2513	83	82	new_message	2019-02-14 20:38:58.061174	2019-02-14 20:38:58.186153	second	svjj	330	221	1	82
2514	83	82	new_message	2019-02-14 20:39:54.640598	2019-02-14 20:39:54.748418	second	bgfd	330	221	1	82
2515	82	83	new_message	2019-02-14 20:40:30.498752	2019-02-14 20:40:30.599977	second	hbjjjj	330	221	1	82
2516	82	83	new_message	2019-02-14 20:40:38.765531	2019-02-14 20:40:38.87886	second	jj	330	221	1	82
2517	82	83	new_message	2019-02-14 20:42:48.835076	2019-02-14 20:42:48.948432	second	хочурш	330	221	1	82
2518	82	83	new_message	2019-02-14 20:43:03.502597	2019-02-14 20:43:03.606704	second	рл	330	221	1	82
2523	83	82	new_message	2019-02-17 18:13:14.896267	2019-02-17 19:27:41.413157	test	hi	345	232	1	82
2519	\N	83	new_message	2019-02-15 16:56:21.493244	2019-02-17 19:27:41.415286	task1	Please confirm the Change Order	355	242	1	82
2527	83	82	new_message	2019-02-17 18:14:21.026408	2019-02-17 19:27:41.420757	code	hi	356	244	1	82
2525	83	82	new_message	2019-02-17 18:13:47.868389	2019-02-17 19:27:41.423655	code	hi	356	244	1	82
2520	\N	83	new_message	2019-02-15 16:57:13.746501	2019-02-17 19:27:41.426471	task1	Back Charge	355	242	1	82
2529	83	82	new_message	2019-02-17 18:17:28.678272	2019-02-17 19:28:18.085201	code	xxxhigggg	356	244	1	82
2530	83	82	new_message	2019-02-17 18:39:09.450011	2019-02-17 19:28:18.09159	code	hi	356	244	1	82
2524	83	82	new_message	2019-02-17 18:13:29.091524	2019-02-17 19:28:18.094041	task1	hi	355	243	1	82
2526	83	82	new_message	2019-02-17 18:14:05.631784	2019-02-17 19:28:18.110241	code	go	356	244	1	82
2522	82	80	new_message	2019-02-16 23:34:31.048376	2019-02-17 19:28:18.202636	xkxjdjnxmxmxnxmxnx	\N	351	238	1	82
2521	82	83	new_message	2019-02-16 23:32:27.916919	2019-02-17 19:28:18.232147	code	hi	356	244	1	82
2528	82	83	new_message	2019-02-17 18:16:19.856847	2019-02-17 19:28:18.234488	code	go	356	244	1	82
2531	83	82	new_message	2019-02-17 18:39:42.505656	2019-02-17 19:28:18.251296	code	poslug	356	244	1	82
2533	83	82	new_message	2019-02-17 18:49:31.11299	2019-02-17 19:28:18.255443	code	ggg	356	244	1	82
2532	82	83	new_message	2019-02-17 18:39:46.803625	2019-02-17 19:28:18.341364	code	u	356	244	1	82
2534	83	82	new_message	2019-02-17 19:41:07.032022	2019-02-17 19:41:07.35515	code	mmm  has accepted your work offer	356	244	1	82
2535	83	82	new_message	2019-02-17 19:41:09.881703	2019-02-17 19:41:10.007736	code	mmm  has accepted your work offer	356	244	1	82
2536	82	83	new_message	2019-02-17 19:43:35.248795	2019-02-17 19:43:35.359902	test	hi	345	232	1	82
2537	83	82	new_message	2019-02-17 19:44:51.688914	2019-02-17 19:44:51.80953	code	оеклдуододвапов	356	244	1	82
2538	83	82	new_message	2019-02-17 19:47:44.014131	2019-02-17 19:47:44.129229	code	mmm  — completed your task, please confirm	356	244	1	82
2539	82	80	new_message	2019-02-18 20:02:16.652718	2019-02-22 13:43:31.000243	jsjxnxnfn	hi	350	237	1	82
2540	82	80	new_message	2019-02-18 21:44:38.036593	2019-02-22 13:43:31.004606	task113	ggchyjnhu\nutfghjbgyuj\nuyhjilhtt	334	220	1	82
2542	\N	86	new_task	2019-02-18 23:53:18.899931	2019-02-22 13:43:31.006062	title	ugwuzgw uxgwuxvwuzgjexge gehdhehf hhcjjec uxhjexhoe hxiehfie hfiehfief jvjedvu3gdi3fhi3fh3i	357	\N	1	82
2541	82	83	new_message	2019-02-18 21:46:29.879864	2019-02-22 13:43:31.032217	second	\N	330	221	1	82
2546	82	83	new_message	2019-02-19 16:19:48.081158	2019-02-22 13:43:31.033678	second	djnxxndn	330	221	1	82
2545	\N	\N	new_task	2019-02-19 00:03:14.891882	2019-02-22 13:43:53.722593	tender2	gghh	360	\N	1	82
2551	82	79	new_message	2019-02-20 22:13:56.256917	2019-02-22 13:43:57.085259	task1	hi fjfj	355	242	1	82
2543	\N	86	new_task	2019-02-18 23:54:41.353502	2019-02-22 13:43:57.096457	ywhxhe	hrg2ud	358	\N	1	82
2548	82	79	new_message	2019-02-20 22:06:37.538824	2019-02-22 13:43:57.101329	task1	hsjxnd	355	242	1	82
2544	\N	86	new_task	2019-02-19 00:01:18.13884	2019-02-22 13:43:57.1095	tender	tfyfyf	359	\N	1	82
2549	82	79	new_message	2019-02-20 22:06:41.273191	2019-02-22 13:43:57.146008	task1	jxjxnxnfkizhx	355	242	1	82
2547	82	83	new_message	2019-02-20 22:03:02.199267	2019-02-22 13:43:57.221794	code	mm : Has confirmed your work.	356	244	1	82
2550	82	79	new_message	2019-02-20 22:13:47.261574	2019-02-22 13:44:15.507026	task1	xjjxndnd	355	242	1	82
2555	83	82	new_message	2019-02-21 18:48:01.987828	2019-02-22 13:43:31.163076	test	\N	345	232	1	82
2557	\N	82	new_message	2019-02-21 19:22:06.717544	2019-02-22 13:43:31.172858	task1	Budget has changed	355	242	1	82
2558	83	82	new_message	2019-02-21 19:47:55.039864	2019-02-22 13:43:31.184567	task1	go	355	243	1	82
2556	83	82	new_message	2019-02-21 18:48:29.348997	2019-02-22 13:43:31.189266	test	\N	345	232	1	82
2554	83	82	new_message	2019-02-21 18:42:02.489245	2019-02-22 13:43:31.195934	test	New Bid! mmm : 250. 	345	232	1	82
2562	83	82	new_message	2019-02-21 20:15:38.790789	2019-02-22 13:43:31.289392	wer	yfj	363	249	1	82
2561	82	83	new_message	2019-02-21 20:15:32.092428	2019-02-22 13:43:31.341109	wer	gggg	363	249	1	82
2559	\N	83	new_task	2019-02-21 20:14:46.394641	2019-02-22 13:43:31.343186	wer	rcbhj	363	\N	1	82
2563	83	82	new_message	2019-02-21 20:16:15.618165	2019-02-22 13:43:31.362687	wer	mmm  has accepted your work offer	363	249	1	82
2560	83	82	new_message	2019-02-21 20:15:07.554393	2019-02-22 13:43:31.366501	wer	hi	363	249	1	82
2565	83	82	new_message	2019-02-21 20:16:59.8421	2019-02-22 13:43:31.403736	wer	g	363	249	1	82
2564	\N	83	new_message	2019-02-21 20:16:45.545644	2019-02-22 13:43:31.506033	wer	Please confirm the Change Order	363	249	1	82
2568	\N	82	new_message	2019-02-21 20:18:10.127004	2019-02-22 13:43:31.507798	wer	Budget has changed	363	249	1	82
2566	\N	83	new_message	2019-02-21 20:17:53.372408	2019-02-22 13:43:31.51082	wer	Please confirm the Change Order	363	249	1	82
2569	\N	83	new_message	2019-02-21 20:18:47.693722	2019-02-22 13:43:31.551853	wer	Back Charge	363	249	1	82
2567	83	82	new_message	2019-02-21 20:18:00.90158	2019-02-22 13:43:31.619345	wer	g	363	249	1	82
2571	83	82	new_message	2019-02-21 22:31:37.787672	2019-02-22 13:43:31.647975	wer	yo	363	249	1	82
2573	83	82	new_message	2019-02-21 22:52:24.966043	2019-02-22 13:43:31.67523	fdssdfsdfsdfdsf	mmm  has accepted your work offer	364	250	1	82
2570	82	83	new_message	2019-02-21 20:20:29.891729	2019-02-22 13:43:31.694123	wer	ggggg	363	249	1	82
2572	\N	83	new_task	2019-02-21 22:51:32.064014	2019-02-22 13:43:31.697198	fdssdfsdfsdfdsf	dfsfsdfsdfsdfsf	364	\N	1	82
2574	83	82	new_message	2019-02-21 22:52:27.777739	2019-02-22 13:43:31.752022	fdssdfsdfsdfdsf	mmm  has accepted your work offer	364	250	1	82
2576	82	83	new_message	2019-02-21 22:54:31.456706	2019-02-22 13:43:31.798842	fdssdfsdfsdfdsf	свыаыв	364	250	1	82
2577	\N	83	new_message	2019-02-21 22:54:46.352682	2019-02-22 13:43:31.826005	fdssdfsdfsdfdsf	Please confirm the Change Order	364	250	1	82
2575	83	82	new_message	2019-02-21 22:52:33.722336	2019-02-22 13:43:31.831932	fdssdfsdfsdfdsf	dkkdnfmdkf	364	250	1	82
2578	\N	82	new_message	2019-02-21 22:55:21.313182	2019-02-22 13:43:31.849355	fdssdfsdfsdfdsf	Budget has changed	364	250	1	82
2579	\N	82	new_message	2019-02-21 22:55:23.274583	2019-02-22 13:43:31.880795	fdssdfsdfsdfdsf	Budget has changed	364	250	1	82
2580	83	83	new_message	2019-02-21 22:55:27.984813	2019-02-22 13:43:31.910855	fdssdfsdfsdfdsf	mmm  — completed your task, please confirm	364	250	1	82
2583	82	83	new_message	2019-02-21 22:57:26.13354	2019-02-22 13:43:31.990306	fdssdfsdfsdfdsf	You have got a rating.	364	250	1	82
2582	82	83	new_message	2019-02-21 22:57:16.903383	2019-02-22 13:43:31.992411	fdssdfsdfsdfdsf	mm : Has confirmed your work.	364	250	1	82
2581	82	83	new_message	2019-02-21 22:56:10.75292	2019-02-22 13:43:32.011136	fdssdfsdfsdfdsf	\N	364	250	1	82
2584	82	83	new_message	2019-02-21 22:57:31.558729	2019-02-22 13:43:32.016577	fdssdfsdfsdfdsf	авыаыва	364	250	1	82
2585	\N	80	new_task	2019-02-22 10:00:59.513059	2019-02-22 13:43:32.014128	task1	еуыеываываываыва	365	\N	1	82
2587	\N	80	new_message	2019-02-22 10:01:46.64361	2019-02-22 13:43:32.10096	task1	Please confirm the Change Order	365	251	1	82
2586	\N	80	new_message	2019-02-22 10:01:33.810975	2019-02-22 13:43:32.111864	task1	Back Charge	365	251	1	82
2588	\N	85	new_task	2019-02-22 13:34:10.409365	2019-02-22 13:43:32.146063	task001	cbvndfbnh khjn njhdjgnv rdgesrjdazrhfjsmzs	366	\N	1	82
2552	\N	80	new_task	2019-02-21 07:36:43.953723	2019-02-22 13:44:15.531626	task chat	fgvthcgcfh	361	\N	1	82
2553	\N	\N	new_task	2019-02-21 07:38:17.590294	2019-02-22 13:44:16.775855	task chat2	ffhvvghh ghjnbvg hggthvdghcggg ghhgg hvvgvbhbbh hvvvvvcvvvvvvvvvvvvvvvvvbbb	362	\N	1	82
3144	\N	104	new_task	2019-03-29 21:22:59.033257	2019-03-29 21:22:59.033257	task2903N		470	\N	0	82
2589	85	82	new_message	2019-02-22 13:47:46.469561	2019-02-22 13:47:46.596265	task001	BenCo  has accepted your work offer	366	252	1	82
2590	\N	85	new_message	2019-02-22 13:55:01.881551	2019-02-22 13:55:02.001764	task001	Please confirm the Change Order	366	252	1	82
2591	\N	82	new_message	2019-02-22 13:57:04.209669	2019-02-22 13:57:04.209669	task001	Budget has changed	366	252	0	82
2592	\N	85	new_message	2019-02-22 14:06:45.129431	2019-02-22 14:06:45.236966	task001	Please confirm the Change Order	366	252	1	82
2593	\N	82	new_message	2019-02-22 14:07:04.150276	2019-02-22 14:07:04.150276	task001	Budget has changed	366	252	0	82
2594	\N	85	new_message	2019-02-22 14:11:33.509958	2019-02-22 14:11:33.509958	task001	Please confirm the Change Order	366	252	0	82
2595	\N	82	new_message	2019-02-22 14:13:35.328772	2019-02-22 14:13:35.445191	task001	Budget has changed	366	252	1	82
2596	\N	85	new_message	2019-02-22 14:20:11.473639	2019-02-22 14:20:11.56739	task001	Please confirm the Change Order	366	252	1	82
2597	\N	82	new_message	2019-02-22 14:20:26.582309	2019-02-22 14:20:26.70261	task001	Budget has changed	366	252	1	82
2598	\N	85	new_message	2019-02-22 14:21:16.539493	2019-02-22 14:21:16.651694	task001	Please confirm the Change Order	366	252	1	82
2599	\N	85	new_message	2019-02-22 14:21:58.865933	2019-02-22 14:21:58.971484	task001	Back Charge	366	252	1	82
2600	8	85	new_message	2019-02-22 14:31:03.906961	2019-02-22 14:31:04.014493	task001	Admin Astra: Has confirmed your work.	366	252	1	82
2601	\N	\N	new_task	2019-02-22 15:10:26.26807	2019-02-22 15:10:31.366542	tender002	jbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhvjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjh	367	\N	1	82
2602	85	82	new_message	2019-02-22 15:13:10.116176	2019-02-22 15:13:10.247497	tender002	New Bid! BenCo : . 	367	253	1	82
2603	82	85	new_message	2019-02-22 15:15:01.472723	2019-02-22 15:15:01.567125	tender002	Congratulations! BenCo : Your bid was accepted. 	367	253	1	82
2604	\N	85	new_message	2019-02-22 15:24:51.075312	2019-02-22 15:24:51.075312	tender002	Please confirm the Change Order	367	253	0	82
2605	\N	82	new_message	2019-02-22 15:33:06.067275	2019-02-22 15:33:06.209004	tender002	Budget has changed	367	253	1	82
2606	\N	85	new_message	2019-02-22 15:34:43.940469	2019-02-22 15:34:44.050797	tender002	Back Charge	367	253	1	82
2607	8	85	new_message	2019-02-22 15:45:49.249196	2019-02-22 15:45:49.360241	tender002	Admin Astra: Has confirmed your work.	367	253	1	82
2660	85	82	new_message	2019-02-24 21:00:49.653354	2019-02-28 12:44:26.085905	tender2403	New Bid! BenCo : . 	374	260	1	82
2661	82	85	new_message	2019-02-24 21:03:08.445887	2019-02-28 12:44:26.128745	tender2403	Congratulations! BenCo : Your bid was accepted. 	374	260	1	82
2658	8	85	new_message	2019-02-24 20:51:45.573271	2019-02-28 12:44:26.184068	tas2402	Admin Astra: Has confirmed your work.	373	259	1	82
2659	\N	\N	new_task	2019-02-24 20:54:51.720599	2019-02-28 12:44:35.744251	tender2403		374	\N	1	82
2608	\N	85	new_task	2019-02-22 15:52:43.771047	2019-02-22 15:52:43.893143	task800	jbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhvjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhfkgjxkfjg kdjgxkj gjhjbjngkxhk kxfhgjxt lkjzgxtj hfkgjxkfjg kdjgxkj gjhjbjngkx	368	\N	1	82
2609	85	82	new_message	2019-02-22 15:53:02.368287	2019-02-22 15:53:02.495456	task800	BenCo  has accepted your work offer	368	254	1	82
2610	83	82	new_message	2019-02-22 17:30:09.692874	2019-02-22 17:30:09.835529	tender002	лто	367	255	1	82
2635	\N	\N	update_task	2019-02-24 12:16:11.430858	2019-02-24 12:16:11.430858	\N	\N	345	\N	0	\N
2636	\N	\N	update_task	2019-02-24 12:17:46.756853	2019-02-24 12:17:46.756853	\N	\N	345	\N	0	\N
2613	82	85	new_message	2019-02-22 22:32:00.789215	2019-02-28 12:44:24.500618	tender002	You have got a rating.	367	253	1	82
2614	82	83	new_message	2019-02-22 22:32:08.460333	2019-02-28 12:44:24.534778	tender002	hkgkgh	367	255	1	82
2612	83	82	new_message	2019-02-22 22:31:39.155039	2019-02-28 12:44:24.536347	future continuous	mmm  has accepted your work offer	369	256	1	82
2615	82	83	new_message	2019-02-22 22:32:45.824302	2019-02-28 12:44:24.539087	future continuous	kbhnn	369	256	1	82
2616	82	83	new_message	2019-02-22 22:34:04.864868	2019-02-28 12:44:24.562882	future continuous	jdjdnd	369	256	1	82
2624	83	83	new_message	2019-02-22 22:41:33.173214	2019-02-28 12:44:24.638824	future continuous	mmm  — completed your task, please confirm	369	256	1	82
2630	8	83	new_message	2019-02-22 23:13:16.110756	2019-02-28 12:44:24.687645	future continuous	Admin Astra: Has confirmed your work.	369	256	1	82
2629	82	83	new_message	2019-02-22 22:53:18.436506	2019-02-28 12:44:24.698167	future continuous	cu xkg	369	256	1	82
2631	82	83	new_message	2019-02-22 23:36:36.028765	2019-02-28 12:44:24.709924	future continuous	You have got a rating.	369	256	1	82
2632	82	83	new_message	2019-02-22 23:36:42.859912	2019-02-28 12:44:24.711887	future continuous	gxwx	369	256	1	82
2633	82	83	new_message	2019-02-22 23:42:54.184321	2019-02-28 12:44:24.770301	future continuous	zndjdkdndnicndx	369	256	1	82
2634	83	82	new_message	2019-02-23 08:38:49.680325	2019-02-28 12:44:24.858051	test	New Bid! mmm : hi hello. 	345	232	1	82
2642	83	82	new_message	2019-02-24 19:11:41.600729	2019-02-28 12:44:25.011543	test my best test	hi	371	257	1	82
2639	83	82	new_message	2019-02-24 19:09:16.735321	2019-02-28 12:44:25.042575	test my best test	New Bid! mmm : 19. 	371	257	1	82
2643	83	82	new_message	2019-02-24 19:11:46.363516	2019-02-28 12:44:25.044171	test my best test	thank	371	257	1	82
2644	83	82	new_message	2019-02-24 19:11:55.97643	2019-02-28 12:44:25.049794	test my best test	mmm  — completed your task, please confirm	371	257	1	82
2640	82	83	new_message	2019-02-24 19:10:52.087885	2019-02-28 12:44:25.137517	test my best test	hi	371	257	1	82
2646	82	83	new_message	2019-02-24 19:13:18.858487	2019-02-28 12:44:25.163534	test my best test	mm : Has confirmed your work.	371	257	1	82
2641	82	83	new_message	2019-02-24 19:11:01.182071	2019-02-28 12:44:25.186253	test my best test	Congratulations! mmm : Your bid was accepted. 	371	257	1	82
2645	82	83	new_message	2019-02-24 19:12:39.825778	2019-02-28 12:44:25.245168	test my best test	лчлаьпда	371	257	1	82
2648	83	82	new_message	2019-02-24 19:13:45.078248	2019-02-28 12:44:25.446944	test my best test	suppe	371	257	1	82
2652	85	82	new_message	2019-02-24 20:42:13.041544	2019-02-28 12:44:25.464135	task2401	BenCo  has accepted your work offer	372	258	1	82
2650	83	82	new_message	2019-02-24 19:14:25.116768	2019-02-28 12:44:25.470834	test my best test	херово что сообщение нельзя править	371	257	1	82
2649	83	82	new_message	2019-02-24 19:13:57.314585	2019-02-28 12:44:25.574145	test my best test	class	371	257	1	82
2647	82	83	new_message	2019-02-24 19:13:20.158313	2019-02-28 12:44:25.590826	test my best test	You have got a rating.	371	257	1	82
2651	\N	85	new_task	2019-02-24 20:41:44.061976	2019-02-28 12:44:25.5926	task2401	поорлбототнет рнпп оррн	372	\N	1	82
2654	8	85	new_message	2019-02-24 20:47:49.862324	2019-02-28 12:44:25.694622	task2401	Admin Astra: Has confirmed your work.	372	258	1	82
2653	\N	85	new_message	2019-02-24 20:46:19.886632	2019-02-28 12:44:25.786031	task2401	Please confirm the Change Order	372	258	1	82
2655	\N	85	new_task	2019-02-24 20:50:23.434326	2019-02-28 12:44:25.96527	tas2402	тлотюотолтолд	373	\N	1	82
2656	85	82	new_message	2019-02-24 20:51:07.128251	2019-02-28 12:44:25.991711	tas2402	BenCo  has accepted your work offer	373	259	1	82
2657	85	82	new_message	2019-02-24 20:51:09.566697	2019-02-28 12:44:25.997004	tas2402	BenCo  has accepted your work offer	373	259	1	82
2638	\N	\N	new_task	2019-02-24 19:08:09.824524	2019-02-28 12:44:35.309994	test my best test	ndjcjfnmxx djdjndnrdjrnf fnfjmfmfmf fmfnmfmfnd xndmdmmdd dmdmdmmd	371	\N	1	82
2637	\N	\N	new_task	2019-02-24 12:25:50.388498	2019-02-28 12:44:37.707573	colouring	colouring wall	370	\N	1	82
2611	\N	83	new_task	2019-02-22 22:31:04.57918	2019-02-28 12:44:50.189046	future continuous	jddjjdksjxjd djdjjdnaobd djrbsoalspfnr kxkxoajshshrne dmdkflf fjdkd dkdks	369	\N	1	82
2622	\N	82	new_message	2019-02-22 22:40:34.944147	2019-02-28 12:44:50.256669	future continuous	Budget has changed	369	256	1	82
2620	82	83	new_message	2019-02-22 22:40:06.081543	2019-02-28 12:44:50.298878	future continuous	jdjd	369	256	1	82
2617	\N	83	new_message	2019-02-22 22:39:24.168892	2019-02-28 12:44:50.42545	future continuous	Back Charge	369	256	1	82
2621	83	82	new_message	2019-02-22 22:40:27.259936	2019-02-28 12:44:50.445806	future continuous	пвапвпва	369	256	1	82
2618	82	83	new_message	2019-02-22 22:39:32.993231	2019-02-28 12:44:58.543256	future continuous	mznz	369	256	1	82
2623	82	83	new_message	2019-02-22 22:41:20.981069	2019-02-28 12:44:58.58796	future continuous	\N	369	256	1	82
2619	\N	83	new_message	2019-02-22 22:40:00.5283	2019-02-28 12:44:58.616544	future continuous	Please confirm the Change Order	369	256	1	82
2626	82	83	new_message	2019-02-22 22:42:47.775175	2019-02-28 12:44:58.666377	future continuous	dkkd	369	256	1	82
2628	82	83	new_message	2019-02-22 22:43:57.506042	2019-02-28 12:44:58.696225	future continuous	xjdj	369	256	1	82
2627	82	85	new_message	2019-02-22 22:43:20.786953	2019-02-28 12:45:12.492877	task001	You have got a rating.	366	252	1	82
2625	82	83	new_message	2019-02-22 22:41:45.495005	2019-02-28 12:45:12.518228	future continuous	ndnd	369	256	1	82
2691	\N	83	new_task	2019-02-25 16:04:51.909568	2019-02-25 16:04:51.909568	test1	test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test 	378	\N	0	82
2692	\N	83	new_message	2019-02-25 16:05:26.207389	2019-02-25 16:05:26.207389	test1	Back Charge	378	265	0	82
2693	\N	83	new_message	2019-02-25 16:05:38.788636	2019-02-25 16:05:38.788636	test1	Please confirm the Change Order	378	265	0	82
2665	82	83	new_message	2019-02-24 21:04:45.824914	2019-02-28 12:44:26.646832	Jdjdmjxdhnd	nxnc	375	261	1	82
2666	82	85	new_message	2019-02-24 21:06:34.236754	2019-02-28 12:44:26.752603	tas2402	You have got a rating.	373	259	1	82
2663	83	82	new_message	2019-02-24 21:03:56.381839	2019-02-28 12:44:26.871995	Jdjdmjxdhnd	New Bid! mmm : jddjdjdnfhf. 	375	261	1	82
2673	\N	83	new_message	2019-02-24 21:34:44.459995	2019-02-28 12:44:35.435417	Ndndnxmxkxkxnx	Back Charge	376	262	1	82
2674	\N	82	new_message	2019-02-24 21:38:10.555851	2019-02-28 12:44:35.557213	Ndndnxmxkxkxnx	Budget has changed	376	262	1	82
2675	83	82	new_message	2019-02-24 22:06:45.467251	2019-02-28 12:44:35.676523	colouring	New Bid! mmm : 24fdssdfsdf. 	370	263	1	82
2676	82	83	new_message	2019-02-24 22:09:46.605539	2019-02-28 12:44:35.796996	colouring	Congratulations! mmm : Your bid was accepted. 	370	263	1	82
2677	\N	83	new_message	2019-02-24 22:10:04.65978	2019-02-28 12:44:35.852722	colouring	Please confirm the Change Order	370	263	1	82
2678	83	82	new_message	2019-02-24 22:10:09.146124	2019-02-28 12:44:35.915621	colouring	выаавы	370	263	1	82
2679	\N	82	new_message	2019-02-24 22:10:18.573389	2019-02-28 12:44:35.988338	colouring	Budget has changed	370	263	1	82
2680	\N	83	new_message	2019-02-24 22:10:33.868508	2019-02-28 12:44:36.04046	colouring	Back Charge	370	263	1	82
2681	83	82	new_message	2019-02-24 22:10:37.544642	2019-02-28 12:44:36.107218	colouring	выфвыфвфы	370	263	1	82
2682	8	83	new_message	2019-02-24 22:15:05.982318	2019-02-28 12:44:36.15182	colouring	Admin Astra: Has confirmed your work.	370	263	1	82
2683	82	83	new_message	2019-02-24 22:15:18.440675	2019-02-28 12:44:36.224656	colouring	You have got a rating.	370	263	1	82
2684	\N	85	new_task	2019-02-25 06:17:34.282256	2019-02-28 12:44:36.265814	task2404	иибь	377	\N	1	82
2686	\N	85	new_message	2019-02-25 06:20:24.223128	2019-02-28 12:44:36.374252	task2404	Please confirm the Change Order	377	264	1	82
2685	85	82	new_message	2019-02-25 06:19:44.506115	2019-02-28 12:44:36.416946	task2404	BenCo  has accepted your work offer	377	264	1	82
2687	\N	82	new_message	2019-02-25 06:20:54.9374	2019-02-28 12:44:36.4934	task2404	Budget has changed	377	264	1	82
2688	\N	85	new_message	2019-02-25 06:21:22.334074	2019-02-28 12:44:36.537646	task2404	Please confirm the Change Order	377	264	1	82
2689	\N	82	new_message	2019-02-25 06:21:34.240071	2019-02-28 12:44:36.611732	task2404	Budget has changed	377	264	1	82
2694	\N	85	new_task	2019-02-25 21:01:52.607607	2019-02-28 12:44:36.781394	fdssdffdsfdfdf	dasdasda asd asd asdasd 	379	\N	1	82
2695	85	82	new_message	2019-02-25 21:04:36.985625	2019-02-28 12:44:36.802147	fdssdffdsfdfdf	BenCo  has accepted your work offer	379	266	1	82
2699	\N	85	new_message	2019-02-25 21:11:09.824399	2019-02-28 12:44:36.921272	fdssdffdsfdfdf	Please confirm the Change Order	379	266	1	82
2696	82	85	new_message	2019-02-25 21:08:53.736452	2019-02-28 12:44:36.922933	fdssdffdsfdfdf	yo	379	266	1	82
2698	82	85	new_message	2019-02-25 21:10:39.194748	2019-02-28 12:44:37.057737	fdssdffdsfdfdf	hi	379	266	1	82
2697	\N	85	new_message	2019-02-25 21:10:02.964777	2019-02-28 12:44:37.060148	fdssdffdsfdfdf	Back Charge	379	266	1	82
2700	82	85	new_message	2019-02-25 21:11:53.645027	2019-02-28 12:44:37.163734	fdssdffdsfdfdf	kdjd	379	266	1	82
2701	\N	85	new_message	2019-02-25 21:13:46.388269	2019-02-28 12:44:37.191668	fdssdffdsfdfdf	Please confirm the Change Order	379	266	1	82
2702	\N	82	new_message	2019-02-25 21:14:41.504804	2019-02-28 12:44:37.281131	fdssdffdsfdfdf	Budget has changed	379	266	1	82
2703	\N	82	new_message	2019-02-25 21:14:56.666936	2019-02-28 12:44:37.399572	fdssdffdsfdfdf	Budget has changed	379	266	1	82
2704	\N	85	new_message	2019-02-25 21:15:46.510257	2019-02-28 12:44:37.465957	fdssdffdsfdfdf	Please confirm the Change Order	379	266	1	82
2706	\N	82	new_message	2019-02-25 21:21:07.772395	2019-02-28 12:44:37.519241	fdssdffdsfdfdf	Budget has changed	379	266	1	82
2705	82	85	new_message	2019-02-25 21:20:51.981059	2019-02-28 12:44:37.568908	fdssdffdsfdfdf	mdndnd	379	266	1	82
2707	\N	82	new_message	2019-02-25 21:21:28.448896	2019-02-28 12:44:37.63909	task2404	Budget has changed	377	264	1	82
2708	82	85	new_message	2019-02-25 21:23:27.736367	2019-02-28 12:44:37.677413	fdssdffdsfdfdf	kgx	379	266	1	82
2709	82	85	new_message	2019-02-25 21:23:38.554986	2019-02-28 12:44:37.76088	fdssdffdsfdfdf	\N	379	266	1	82
2710	82	85	new_message	2019-02-25 21:23:57.082534	2019-02-28 12:44:37.784613	fdssdffdsfdfdf	jdjdjd	379	266	1	82
2711	85	82	new_message	2019-02-25 21:26:23.198377	2019-02-28 12:44:37.82813	fdssdffdsfdfdf	ить	379	266	1	82
2712	85	82	new_message	2019-02-25 21:26:38.329521	2019-02-28 12:44:37.879222	fdssdffdsfdfdf	\N	379	266	1	82
3233	\N	\N	destroy_task	2019-07-17 21:37:41.186647	2019-07-17 21:37:41.186647	\N	\N	340	\N	0	\N
2713	8	85	new_message	2019-02-25 21:29:35.970366	2019-02-28 12:44:37.89484	fdssdffdsfdfdf	Admin Astra: Has confirmed your work.	379	266	1	82
2714	82	85	new_message	2019-02-25 21:32:28.558903	2019-02-28 12:44:37.956094	fdssdffdsfdfdf	You have got a rating.	379	266	1	82
2716	82	85	new_message	2019-02-25 21:35:46.026379	2019-02-28 12:44:38.003192	fdssdffdsfdfdf	ifjfkf	379	266	1	82
2715	82	85	new_message	2019-02-25 21:32:33.29839	2019-02-28 12:44:38.020068	fdssdffdsfdfdf	jdjd	379	266	1	82
2717	82	85	new_message	2019-02-25 21:37:26.482789	2019-02-28 12:44:38.058041	fdssdffdsfdfdf	mxmdk	379	266	1	82
2719	85	82	new_message	2019-02-25 21:37:56.814408	2019-02-28 12:44:38.14107	fdssdffdsfdfdf	псеее	379	266	1	82
2718	85	82	new_message	2019-02-25 21:37:54.784196	2019-02-28 12:44:38.155408	fdssdffdsfdfdf	лрнмн	379	266	1	82
2720	85	82	new_message	2019-02-25 21:37:59.797986	2019-02-28 12:44:38.188468	fdssdffdsfdfdf	апрол	379	266	1	82
2722	82	85	new_message	2019-02-25 21:38:41.340481	2019-02-28 12:44:38.27833	fdssdffdsfdfdf	jdjd	379	266	1	82
2721	85	82	new_message	2019-02-25 21:38:05.972882	2019-02-28 12:44:38.286603	fdssdffdsfdfdf	мить	379	266	1	82
2662	\N	\N	new_task	2019-02-24 21:03:24.966626	2019-02-28 12:44:38.868015	Jdjdmjxdhnd	Mdndndmdmndn	375	\N	1	82
2668	\N	\N	new_task	2019-02-24 21:30:35.607147	2019-02-28 12:44:39.382377	Ndndnxmxkxkxnx	Xmxmxmmxmx	376	\N	1	82
2672	\N	83	new_message	2019-02-24 21:34:18.456518	2019-02-28 12:44:58.568882	Ndndnxmxkxkxnx	Please confirm the Change Order	376	262	1	82
2670	83	82	new_message	2019-02-24 21:31:49.755095	2019-02-28 12:44:58.611275	Ndndnxmxkxkxnx	oook	376	262	1	82
2671	82	83	new_message	2019-02-24 21:32:34.309202	2019-02-28 12:45:12.531401	Ndndnxmxkxkxnx	Congratulations! mmm : Your bid was accepted. 	376	262	1	82
2669	83	82	new_message	2019-02-24 21:31:42.279464	2019-02-28 12:45:35.029157	Ndndnxmxkxkxnx	New Bid! mmm : hiiiiii yes. 	376	262	1	82
2737	\N	\N	destroy_task	2019-02-26 10:41:46.061539	2019-02-26 10:41:46.061539	\N	\N	378	\N	0	\N
2726	85	82	new_message	2019-02-25 22:06:39.996998	2019-02-28 12:44:38.466371	task2501	BenCo  has accepted your work offer	380	267	1	82
2727	\N	85	new_message	2019-02-25 22:09:43.155502	2019-02-28 12:44:38.522781	task2501	Please confirm the Change Order	380	267	1	82
2728	\N	82	new_message	2019-02-25 22:12:37.005524	2019-02-28 12:44:38.556338	task2501	Budget has changed	380	267	1	82
2729	\N	85	new_message	2019-02-25 22:14:11.683977	2019-02-28 12:44:38.581532	task2501	Please confirm the Change Order	380	267	1	82
2730	\N	85	new_message	2019-02-25 22:14:29.73388	2019-02-28 12:44:38.633171	task2501	Please confirm the Change Order	380	267	1	82
2731	\N	82	new_message	2019-02-25 22:17:07.544773	2019-02-28 12:44:38.68244	task2501	Budget has changed	380	267	1	82
2732	\N	82	new_message	2019-02-25 22:17:21.331812	2019-02-28 12:44:38.711528	task2501	Budget has changed	380	267	1	82
2733	\N	80	new_message	2019-02-25 22:57:45.590768	2019-02-28 12:44:38.718791	znndjdmxmxmx	Please confirm the Change Order	353	240	1	82
2734	\N	85	new_message	2019-02-25 23:07:16.371629	2019-02-28 12:44:38.793955	task2404	Please confirm the Change Order	377	264	1	82
2736	\N	83	new_message	2019-02-25 23:14:52.337934	2019-02-28 12:44:38.870996	Ndndnxmxkxkxnx	Please confirm the Change Order	376	262	1	82
2735	\N	83	new_message	2019-02-25 23:14:31.039938	2019-02-28 12:44:38.87261	Ndndnxmxkxkxnx	Back Charge	376	262	1	82
2738	8	85	new_message	2019-02-26 10:53:23.733197	2019-02-28 12:44:38.905081	task2501	Admin Astra: Has confirmed your work.	380	267	1	82
2740	\N	83	new_message	2019-02-26 14:18:14.189034	2019-02-28 12:44:39.036148	task1000	Back Charge	381	268	1	82
2739	\N	83	new_task	2019-02-26 14:17:39.21574	2019-02-28 12:44:39.040777	task1000	task1000task1000task1000task1000task1000task1000task1000task1000task1000task1000task1000task1000	381	\N	1	82
2741	\N	83	new_message	2019-02-26 14:18:23.554247	2019-02-28 12:44:39.047131	task1000	Please confirm the Change Order	381	268	1	82
2744	\N	85	new_message	2019-02-26 16:00:37.771661	2019-02-28 12:44:39.172972	task2601	Please confirm the Change Order	382	269	1	82
2743	85	82	new_message	2019-02-26 15:52:35.09521	2019-02-28 12:44:39.176167	task2601	BenCo  has accepted your work offer	382	269	1	82
2745	\N	85	new_message	2019-02-26 16:04:52.516324	2019-02-28 12:44:39.17853	task2601	Please confirm the Change Order	382	269	1	82
2751	8	85	new_message	2019-02-26 16:17:00.334172	2019-02-28 12:44:39.30874	task2601	Admin Astra: Has confirmed your work.	382	269	1	82
2750	\N	82	new_message	2019-02-26 16:14:17.114381	2019-02-28 12:44:39.331647	task2601	Budget has changed	382	269	1	82
2747	\N	82	new_message	2019-02-26 16:07:47.503152	2019-02-28 12:44:39.339582	task2601	Budget has changed	382	269	1	82
2746	\N	82	new_message	2019-02-26 16:07:01.269036	2019-02-28 12:44:39.342195	task2601	Budget has changed	382	269	1	82
2748	\N	85	new_message	2019-02-26 16:12:05.030484	2019-02-28 12:44:39.43417	task2601	Please confirm the Change Order	382	269	1	82
2749	\N	85	new_message	2019-02-26 16:13:50.405037	2019-02-28 12:44:39.475087	task2601	Back Charge	382	269	1	82
2754	83	82	new_message	2019-02-26 19:33:31.652965	2019-02-28 12:44:39.510083	task1001	mmm  has accepted your work offer	381	268	1	82
2753	\N	83	new_message	2019-02-26 18:25:31.21604	2019-02-28 12:44:39.522588	task1000	Back Charge	381	268	1	82
2755	83	82	new_message	2019-02-26 19:33:33.153783	2019-02-28 12:44:39.562805	task1001	mmm  has accepted your work offer	381	268	1	82
2757	83	82	new_message	2019-02-26 19:33:46.9961	2019-02-28 12:44:39.591877	task1001	kvkvk	381	268	1	82
2759	83	82	new_message	2019-02-26 19:38:47.982095	2019-02-28 12:44:39.660772	tender 2602	New Bid! mmm : kdjdjdjdk. 	383	270	1	82
2756	83	82	new_message	2019-02-26 19:33:34.439029	2019-02-28 12:44:39.664851	task1001	mmm  has accepted your work offer	381	268	1	82
2758	8	83	new_message	2019-02-26 19:34:27.991595	2019-02-28 12:44:39.707416	task1001	Admin Astra: Has confirmed your work.	381	268	1	82
2760	83	82	new_message	2019-02-26 19:39:48.169272	2019-02-28 12:44:39.713025	tender 2602	jdjdjxjdkfjd djdndjkd djdndnd dndndnjf	383	270	1	82
2763	\N	85	new_task	2019-02-26 22:28:51.549417	2019-02-28 12:44:39.797835	task2702	впапчяпр	384	\N	1	82
2761	83	82	new_message	2019-02-26 19:40:02.928938	2019-02-28 12:44:39.809839	tender 2602	sksmskkskdkdkd dndndmdkkdkd ddnndndjdkdkd djdjjd djdn	383	270	1	82
2764	\N	85	new_task	2019-02-26 22:29:50.74146	2019-02-28 12:44:39.832083	5005	пиолдд	385	\N	1	82
2762	82	83	new_message	2019-02-26 20:31:05.667721	2019-02-28 12:44:39.846715	colouring	gvjgjejjrkdijrododl\nkdndjkfjfj\ndidnkd	370	263	1	82
2766	\N	85	new_message	2019-02-26 22:31:09.112835	2019-02-28 12:44:39.932301	5005	Please confirm the Change Order	385	272	1	82
2765	85	82	new_message	2019-02-26 22:30:45.066275	2019-02-28 12:44:39.943961	5005	BenCo  has accepted your work offer	385	272	1	82
2767	\N	85	new_message	2019-02-26 22:32:18.678346	2019-02-28 12:44:39.964204	5005	Please confirm the Change Order	385	272	1	82
2768	\N	83	new_task	2019-02-27 10:29:16.280033	2019-02-28 12:44:39.992932	igsigsjgz	itsigzjfzgk	386	\N	1	82
2769	\N	79	new_task	2019-02-27 12:06:53.344958	2019-02-28 12:44:40.018032	test	tttyytyt ttt t y y type ttt	387	\N	1	82
2771	83	82	new_message	2019-02-27 13:18:43.203708	2019-02-28 12:44:40.095319	igsigsjgz	mmm  has accepted your work offer	386	273	1	82
2770	83	82	new_message	2019-02-27 13:18:40.832788	2019-02-28 12:44:40.097238	igsigsjgz	mmm  has accepted your work offer	386	273	1	82
2772	83	82	new_message	2019-02-27 13:18:45.908145	2019-02-28 12:44:40.129867	igsigsjgz	mmm  has accepted your work offer	386	273	1	82
2773	83	82	new_message	2019-02-27 13:18:46.654266	2019-02-28 12:44:40.153633	igsigsjgz	mmm  has accepted your work offer	386	273	1	82
2774	8	83	new_message	2019-02-27 13:45:32.661715	2019-02-28 12:44:40.24666	igsigsjgz	Admin Astra: Has confirmed your work.	386	273	1	82
2776	\N	85	new_task	2019-02-27 16:45:39.004818	2019-02-28 12:44:40.258282	task27021	hygygsyugyfgyfdgfyedgd	389	\N	1	82
2777	85	82	new_message	2019-02-27 16:46:01.91072	2019-02-28 12:44:40.295344	task27021	BenCo  has accepted your work offer	389	275	1	82
2778	\N	85	new_task	2019-02-27 16:49:52.161749	2019-02-28 12:44:40.366784	task27022	fgzfgbxghx	390	\N	1	82
2781	85	82	new_message	2019-02-27 17:04:42.215726	2019-02-28 12:44:40.384818	task27023	BenCo  has accepted your work offer	391	277	1	82
2780	\N	85	new_task	2019-02-27 16:57:23.235953	2019-02-28 12:44:40.400661	task27023		391	\N	1	82
2779	85	82	new_message	2019-02-27 16:53:34.178973	2019-02-28 12:44:40.504895	task27022	BenCo  has accepted your work offer	390	276	1	82
2782	\N	85	new_message	2019-02-27 17:11:33.611792	2019-02-28 12:44:40.506707	task27022	Please confirm the Change Order	390	276	1	82
2783	\N	85	new_message	2019-02-27 17:17:12.929776	2019-02-28 12:44:40.54012	task27023	Please confirm the Change Order	391	277	1	82
2784	\N	82	new_message	2019-02-27 17:17:51.704364	2019-02-28 12:44:40.650864	task27023	Budget has changed	391	277	1	82
2752	\N	\N	new_task	2019-02-26 16:26:49.115274	2019-02-28 12:44:49.366098	tender 2602	hb,jbjmm	383	\N	1	82
2775	\N	\N	new_task	2019-02-27 13:58:46.426046	2019-02-28 12:44:49.729574	super test number one	djjdjdjd djd fjd ff f f g g. fjfnnfg	388	\N	1	82
2806	\N	\N	update_task	2019-02-27 21:16:58.172912	2019-02-27 21:16:58.172912	\N	\N	395	\N	0	\N
2813	\N	\N	new_task	2019-02-28 08:52:17.392283	2019-02-28 08:52:17.392283	ard	ddh	400	\N	0	82
2814	\N	\N	destroy_task	2019-02-28 08:52:58.754365	2019-02-28 08:52:58.754365	\N	\N	400	\N	0	\N
2815	\N	\N	destroy_task	2019-02-28 08:52:58.763162	2019-02-28 08:52:58.763162	\N	\N	400	\N	0	\N
2667	8	85	new_message	2019-02-24 21:07:16.884997	2019-02-28 12:44:26.42735	tender2403	Admin Astra: Has confirmed your work.	374	260	1	82
2690	\N	85	new_message	2019-02-25 06:22:26.179963	2019-02-28 12:44:36.647314	task2404	Please confirm the Change Order	377	264	1	82
2723	82	85	new_message	2019-02-25 21:50:49.36665	2019-02-28 12:44:38.307452	fdssdffdsfdfdf	nxnx	379	266	1	82
2725	\N	85	new_task	2019-02-25 22:04:26.762445	2019-02-28 12:44:38.414193	task2501	рпрроио	380	\N	1	82
2724	82	85	new_message	2019-02-25 22:00:17.820906	2019-02-28 12:44:38.415873	fdssdffdsfdfdf	orir	379	266	1	82
2742	\N	85	new_task	2019-02-26 15:50:18.594393	2019-02-28 12:44:39.011222	task2601	 уікекп уікекп уікекп уікекп уікекп уікекп уікекпм уікекпммм уікекп уікекп уікекпм уікекп уікекпмммм уікекп уікекп	382	\N	1	82
2785	\N	85	new_message	2019-02-27 17:23:57.092797	2019-02-28 12:44:40.638358	task27023	Back Charge	391	277	1	82
2787	8	85	new_message	2019-02-27 17:30:21.732521	2019-02-28 12:44:40.67729	task27022	Admin Astra: Has confirmed your work.	390	276	1	82
2786	8	85	new_message	2019-02-27 17:24:30.569515	2019-02-28 12:44:40.773046	task27023	Admin Astra: Has confirmed your work.	391	277	1	82
2791	82	85	new_message	2019-02-27 18:50:06.373955	2019-02-28 12:44:40.799613	tender27021	Congratulations! BenCo : Your bid was accepted. 	393	278	1	82
2790	85	82	new_message	2019-02-27 18:25:43.005636	2019-02-28 12:44:40.895777	tender27021	New Bid! BenCo : . 	393	278	1	82
2792	\N	85	new_message	2019-02-27 18:51:39.516636	2019-02-28 12:44:40.988423	tender27021	Please confirm the Change Order	393	278	1	82
2793	\N	85	new_message	2019-02-27 19:04:09.10273	2019-02-28 12:44:41.096661	tender27021	Please confirm the Change Order	393	278	1	82
2794	\N	82	new_message	2019-02-27 19:14:30.313336	2019-02-28 12:44:41.211292	tender27021	Budget has changed	393	278	1	82
2795	83	82	new_message	2019-02-27 19:34:44.002634	2019-02-28 12:44:41.332812	super test number one	New Bid! mmm : jdndndndk. 	388	279	1	82
2796	83	82	new_message	2019-02-27 19:34:50.351871	2019-02-28 12:44:41.45246	super test number one	yo	388	279	1	82
2797	83	82	new_message	2019-02-27 19:34:55.459684	2019-02-28 12:44:41.57212	super test number one	znhxnxndndndn dndnndnd nxnvnf	388	279	1	82
2798	82	83	new_message	2019-02-27 19:36:54.976826	2019-02-28 12:44:41.695859	super test number one	Congratulations! mmm : Your bid was accepted. 	388	279	1	82
2799	\N	83	new_message	2019-02-27 19:39:26.426026	2019-02-28 12:44:41.810869	super test number one	Back Charge	388	279	1	82
2800	\N	83	new_message	2019-02-27 19:40:25.926491	2019-02-28 12:44:41.929324	super test number one	Please confirm the Change Order	388	279	1	82
2801	\N	82	new_message	2019-02-27 19:43:29.694056	2019-02-28 12:44:42.050834	super test number one	Budget has changed	388	279	1	82
2802	8	83	new_message	2019-02-27 19:44:47.286103	2019-02-28 12:44:42.156849	super test number one	Admin Astra: Has confirmed your work.	388	279	1	82
2803	82	83	new_message	2019-02-27 20:17:50.80563	2019-02-28 12:44:42.263516	super test number one	You have got a rating.	388	279	1	82
2810	\N	79	new_task	2019-02-27 23:50:52.24144	2019-02-28 12:44:49.442094	dsadasdasda	sdasdasdas	398	\N	1	82
2811	8	85	new_message	2019-02-28 07:16:37.662312	2019-02-28 12:44:49.54479	5005	Admin Astra: Has confirmed your work.	385	272	1	82
2812	\N	86	new_task	2019-02-28 08:47:38.383636	2019-02-28 12:44:49.622783	tester_1	Tester start testing	399	\N	1	82
2816	\N	79	new_task	2019-02-28 09:09:56.159408	2019-02-28 12:44:49.725419	dsrtfserfserf		401	\N	1	82
2818	\N	79	new_message	2019-02-28 09:40:16.547686	2019-02-28 12:44:49.820702	dsrtfserfserf	Please confirm the Change Order	401	282	1	82
2817	\N	79	new_message	2019-02-28 09:13:25.614434	2019-02-28 12:44:49.834889	dsrtfserfserf	Back Charge	401	282	1	82
2819	\N	83	new_message	2019-02-28 12:40:12.35884	2019-02-28 12:44:49.93961	dsrtfserfserf	Please confirm the Change Order	401	282	1	82
2821	83	82	new_message	2019-02-28 12:41:18.43217	2019-02-28 12:44:50.019565	dsrtfserfserf	mmm  — completed your task, please confirm	401	282	1	82
2820	83	82	new_message	2019-02-28 12:40:40.440041	2019-02-28 12:44:50.063123	dsrtfserfserf	f	401	283	1	82
2822	\N	83	new_message	2019-02-28 12:43:18.354572	2019-02-28 12:44:50.133803	task1	Please confirm the Change Order	355	242	1	82
2788	\N	\N	new_task	2019-02-27 17:40:51.193155	2019-02-28 12:44:50.737491	tender27021	hhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfvvhhjfgzjzg fzdfvvhhjfgzjzg fzdfvhhjfgzjzg fzdfvvhhjfgzjzg fzdfvhhjfgzjzg fzdfv	392	\N	1	82
2789	\N	\N	new_task	2019-02-27 17:41:51.383389	2019-02-28 12:44:51.797199	tender27021		393	\N	1	82
2804	\N	\N	new_task	2019-02-27 21:07:16.943013	2019-02-28 12:44:53.259402	tender2702		394	\N	1	82
2664	82	83	new_message	2019-02-24 21:04:43.886736	2019-02-28 12:44:58.701627	Jdjdmjxdhnd	Congratulations! mmm : Your bid was accepted. 	375	261	1	82
2809	83	82	new_message	2019-02-27 22:41:46.478256	2019-02-28 12:45:12.477086	test	mmm  has accepted your work offer	387	274	1	82
2807	\N	\N	new_task	2019-02-27 21:50:23.300251	2019-02-28 12:45:40.347278	tender1111		396	\N	1	82
2808	\N	\N	new_task	2019-02-27 21:53:22.494296	2019-02-28 12:45:41.340612	tender app	cvnmk	397	\N	1	82
2805	\N	\N	new_task	2019-02-27 21:15:58.951957	2019-02-28 12:45:42.067152	small floor	arr	395	\N	1	82
2823	83	82	new_message	2019-02-28 12:46:31.890851	2019-02-28 12:46:32.012731	task1	ff	355	243	1	82
2824	\N	83	new_message	2019-02-28 12:50:49.535104	2019-02-28 12:50:49.650752	task1	Please confirm the Change Order	355	242	1	82
2825	\N	83	new_task	2019-02-28 12:57:25.354211	2019-02-28 12:57:25.476155	Новый тест	ваыаывавыаыва	402	\N	1	82
2826	83	82	new_message	2019-02-28 12:57:36.159875	2019-02-28 12:57:36.273971	Новый тест	mmm  has accepted your work offer	402	284	1	82
2827	\N	83	new_message	2019-02-28 12:58:07.242704	2019-02-28 12:58:07.356933	Новый тест	Please confirm the Change Order	402	284	1	82
2828	\N	83	new_message	2019-02-28 12:58:46.475297	2019-02-28 12:58:46.604758	Новый тест	Please confirm the Change Order	402	284	1	82
2829	\N	82	new_message	2019-02-28 13:01:10.764868	2019-02-28 13:01:10.890833	Новый тест	Budget has changed	402	284	1	82
3234	\N	\N	destroy_task	2019-07-17 21:37:41.241288	2019-07-17 21:37:41.241288	\N	\N	329	\N	0	\N
2831	\N	85	new_task	2019-02-28 17:36:43.372997	2019-02-28 17:40:37.785864	task0002	vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg vxfgtgf dfgrxg 	404	\N	1	82
2830	\N	85	new_task	2019-02-28 17:31:32.950929	2019-02-28 17:40:37.79029	task0001	1212132 jkhgjf	403	\N	1	82
2832	85	82	new_message	2019-02-28 17:40:16.619497	2019-02-28 17:40:37.821065	task0002	BenCo  has accepted your work offer	404	286	1	82
2833	85	82	new_message	2019-02-28 17:40:19.612756	2019-02-28 17:40:37.826892	task0002	BenCo  has accepted your work offer	404	286	1	82
2834	\N	\N	new_task	2019-02-28 17:47:12.58345	2019-02-28 17:47:17.806744	tendr0001	 hmj hjmv 	405	\N	1	82
2835	85	82	new_message	2019-02-28 17:47:52.937344	2019-02-28 17:47:53.073381	tendr0001	New Bid! BenCo : . 	405	287	1	82
2836	\N	83	new_task	2019-02-28 17:50:18.647893	2019-02-28 17:50:18.77426	task0003	лотлюльлб	406	\N	1	82
2837	\N	85	new_task	2019-02-28 17:55:19.284345	2019-02-28 17:55:19.400036	task0004	тиитить	407	\N	1	82
2838	85	82	new_message	2019-02-28 17:55:44.511219	2019-02-28 17:55:44.645261	task0004	BenCo  has accepted your work offer	407	289	1	82
2839	\N	85	new_message	2019-02-28 17:58:41.937517	2019-02-28 17:58:41.937517	task0004	Please confirm the Change Order	407	289	0	82
2840	\N	85	new_message	2019-02-28 18:00:18.849908	2019-02-28 18:00:18.963274	task0004	Back Charge	407	289	1	82
2841	\N	85	new_message	2019-02-28 18:00:54.03065	2019-02-28 18:00:54.03065	task0004	Please confirm the Change Order	407	289	0	82
2842	\N	85	new_message	2019-02-28 18:05:57.721792	2019-02-28 18:05:57.826286	task0004	Please confirm the Change Order	407	289	1	82
2843	\N	82	new_message	2019-02-28 18:09:36.061119	2019-02-28 18:09:36.061119	task0004	Budget has changed	407	289	0	82
2844	\N	85	new_message	2019-02-28 18:11:20.885507	2019-02-28 18:11:20.974532	task0004	Back Charge	407	289	1	82
2845	8	85	new_message	2019-02-28 18:16:54.948267	2019-02-28 18:16:55.06441	task0004	Admin Astra: Has confirmed your work.	407	289	1	82
2846	\N	\N	new_task	2019-02-28 19:24:25.238812	2019-02-28 19:24:30.431112	Testing task 1900	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s	408	\N	1	82
2847	83	82	new_message	2019-02-28 19:26:44.871455	2019-02-28 19:26:45.021003	Testing task 1900	yo	408	290	1	82
2848	83	82	new_message	2019-02-28 19:26:53.518867	2019-02-28 19:26:53.668746	Testing task 1900	New Bid! mmm : jzbdndlfkfn. 	408	290	1	82
2849	82	83	new_message	2019-02-28 19:33:38.289157	2019-02-28 19:33:38.411646	Testing task 1900	Congratulations! mmm : Your bid was accepted. 	408	290	1	82
2850	\N	83	new_message	2019-02-28 19:34:38.670011	2019-02-28 19:34:38.670011	Testing task 1900	Back Charge	408	290	0	82
2851	83	82	new_message	2019-02-28 19:37:05.193003	2019-02-28 19:37:05.33433	Testing task 1900	\N	408	290	1	82
2852	83	82	new_message	2019-02-28 19:37:19.923163	2019-02-28 19:37:20.092203	Testing task 1900	\N	408	290	1	82
2853	83	82	new_message	2019-02-28 19:37:21.227127	2019-02-28 19:37:21.391688	Testing task 1900	yo	408	290	1	82
2854	\N	83	new_message	2019-02-28 19:38:30.387142	2019-02-28 19:38:30.387142	Testing task 1900	Please confirm the Change Order	408	290	0	82
2855	\N	83	new_message	2019-02-28 19:38:58.51094	2019-02-28 19:38:58.637284	Testing task 1900	Back Charge	408	290	1	82
2856	\N	82	new_message	2019-02-28 19:39:06.830576	2019-02-28 19:39:06.830576	Testing task 1900	Budget has changed	408	290	0	82
2857	\N	83	new_message	2019-02-28 19:43:14.015644	2019-02-28 19:43:14.439004	Testing task 1900	Please confirm the Change Order	408	290	1	82
2858	\N	83	new_message	2019-02-28 19:43:26.861895	2019-02-28 19:43:26.987849	Testing task 1900	Please confirm the Change Order	408	290	1	82
2859	\N	82	new_message	2019-02-28 19:43:40.270474	2019-02-28 19:43:40.415207	Testing task 1900	Budget has changed	408	290	1	82
2860	\N	83	new_message	2019-02-28 19:52:24.387318	2019-02-28 19:52:24.387318	Testing task 1900	Please confirm the Change Order	408	290	0	82
2861	\N	83	new_message	2019-02-28 19:58:57.864175	2019-02-28 19:58:58.015584	Testing task 1900	Back Charge	408	290	1	82
2862	\N	83	new_task	2019-02-28 20:35:58.071585	2019-02-28 20:35:58.195053	fdsfdsfsdfds	fdsfdsfsd	409	\N	1	82
2863	83	82	new_message	2019-02-28 20:36:25.919225	2019-02-28 20:36:26.056575	fdsfdsfsdfds	mmm  has accepted your work offer	409	291	1	82
2864	83	82	new_message	2019-02-28 20:36:28.189487	2019-02-28 20:36:28.338398	fdsfdsfsdfds	mmm  has accepted your work offer	409	291	1	82
2865	83	82	new_message	2019-02-28 20:36:30.62414	2019-02-28 20:36:30.756044	fdsfdsfsdfds	mmm  has accepted your work offer	409	291	1	82
2866	83	82	new_message	2019-02-28 20:36:31.752572	2019-02-28 20:36:31.873311	fdsfdsfsdfds	mmm  has accepted your work offer	409	291	1	82
2867	\N	83	new_message	2019-02-28 20:37:01.473439	2019-02-28 20:37:01.601151	fdsfdsfsdfds	Please confirm the Change Order	409	291	1	82
2868	\N	82	new_message	2019-02-28 20:37:12.181226	2019-02-28 20:37:12.326656	fdsfdsfsdfds	Budget has changed	409	291	1	82
2869	\N	83	new_task	2019-02-28 20:41:50.398166	2019-02-28 20:41:50.557276	426387231687263	fdsjflsjdl kjsdlkfjsldjsdl lfdjfl skdj	410	\N	1	82
2870	83	82	new_message	2019-02-28 20:41:57.287956	2019-02-28 20:41:57.42744	426387231687263	зозьм	410	292	1	82
2871	83	82	new_message	2019-02-28 20:42:04.040541	2019-02-28 20:42:04.16514	426387231687263	mmm  has accepted your work offer	410	292	1	82
2872	83	82	new_message	2019-02-28 20:42:05.689128	2019-02-28 20:42:05.944812	426387231687263	mmm  has accepted your work offer	410	292	1	82
2873	83	82	new_message	2019-02-28 20:42:06.767094	2019-02-28 20:42:06.903596	426387231687263	mmm  has accepted your work offer	410	292	1	82
2874	\N	83	new_message	2019-02-28 20:43:20.4828	2019-02-28 20:43:20.4828	426387231687263	Please confirm the Change Order	410	292	0	82
2875	83	82	new_message	2019-02-28 20:43:30.020617	2019-02-28 20:43:30.198243	426387231687263	орлор	410	292	1	82
2876	82	83	new_message	2019-02-28 20:44:04.422909	2019-02-28 20:44:04.558144	426387231687263	fdsf	410	292	1	82
2877	\N	82	new_message	2019-02-28 20:46:15.578399	2019-02-28 20:46:15.693555	426387231687263	Budget has changed	410	292	1	82
2878	82	83	new_message	2019-02-28 20:46:32.411905	2019-02-28 20:46:32.539442	426387231687263	fdsfsd	410	292	1	82
2879	8	83	new_message	2019-02-28 20:48:57.586768	2019-02-28 20:48:57.70956	426387231687263	Admin Astra: Has confirmed your work.	410	292	1	82
2880	82	83	new_message	2019-02-28 20:49:09.323407	2019-02-28 20:49:09.440437	426387231687263	выаы	410	292	1	82
2881	83	82	new_message	2019-02-28 20:49:58.983253	2019-02-28 20:49:59.120457	fdsfdsfsdfds	mmm  — completed your task, please confirm	409	291	1	82
2882	82	83	new_message	2019-02-28 20:50:10.271598	2019-02-28 20:50:10.385175	426387231687263	You have got a rating.	410	292	1	82
2883	82	83	new_message	2019-02-28 20:50:33.798255	2019-02-28 20:50:33.922389	fdsfdsfsdfds	mm : Has confirmed your work.	409	291	1	82
2884	82	83	new_message	2019-02-28 20:50:36.0398	2019-02-28 20:50:36.177507	fdsfdsfsdfds	You have got a rating.	409	291	1	82
2885	\N	80	new_task	2019-02-28 21:02:27.052495	2019-02-28 21:02:27.144805	Plumb		411	\N	1	82
2886	\N	85	new_task	2019-02-28 21:05:13.765561	2019-02-28 21:05:13.893251	task1app	ccebhe	412	\N	1	82
2887	\N	\N	update_task	2019-02-28 21:07:03.736749	2019-02-28 21:07:03.736749	\N	\N	412	\N	0	\N
2888	\N	\N	update_task	2019-02-28 21:11:14.835328	2019-02-28 21:11:14.835328	\N	\N	412	\N	0	\N
2889	82	83	new_message	2019-02-28 21:19:59.903116	2019-02-28 21:20:00.025194	fdsfdsfsdfds	fdsfds	409	291	1	82
2890	82	83	new_message	2019-02-28 21:20:27.069799	2019-02-28 21:20:27.18977	fdsfdsfsdfds	dsds	409	291	1	82
2891	82	83	new_message	2019-02-28 21:20:41.188589	2019-02-28 21:20:41.331727	426387231687263	sds	410	292	1	82
2892	85	82	new_message	2019-02-28 21:28:41.372068	2019-02-28 21:28:41.508079	task1app	BenCo  has accepted your work offer	412	294	1	82
2893	85	82	new_message	2019-02-28 21:29:13.93889	2019-02-28 21:29:14.057795	task1app	рпорир	412	294	1	82
2894	82	85	new_message	2019-02-28 21:30:16.303588	2019-02-28 21:30:16.41755	task1app	рроь	412	294	1	82
2895	85	82	new_message	2019-02-28 21:30:34.160105	2019-02-28 21:30:34.288113	task1app	рооро	412	294	1	82
2896	82	85	new_message	2019-02-28 21:31:02.58156	2019-02-28 21:31:02.690855	task1app	ппоо	412	294	1	82
2897	82	85	new_message	2019-02-28 21:33:09.263733	2019-02-28 21:33:09.377314	task1app	прооо	412	294	1	82
2898	85	82	new_message	2019-02-28 21:33:21.428767	2019-02-28 21:33:21.563495	task1app	роболрототолольльл	412	294	1	82
2899	\N	85	new_message	2019-02-28 21:35:33.66016	2019-02-28 21:35:33.66016	task1app	Please confirm the Change Order	412	294	0	82
2900	\N	85	new_message	2019-02-28 21:36:28.67082	2019-02-28 21:36:28.67082	task1app	Please confirm the Change Order	412	294	0	82
2901	82	85	new_message	2019-02-28 21:36:32.451984	2019-02-28 21:36:32.571613	task1app	ртьл	412	294	1	82
2902	\N	85	new_message	2019-02-28 21:40:50.910042	2019-02-28 21:40:51.015765	task1app	Back Charge	412	294	1	82
2903	\N	82	new_message	2019-02-28 21:41:11.98073	2019-02-28 21:41:12.110561	task1app	Budget has changed	412	294	1	82
2904	85	82	new_message	2019-02-28 21:41:35.367417	2019-02-28 21:41:35.493779	task1app	тиртьит	412	294	1	82
2905	82	85	new_message	2019-02-28 21:41:45.076703	2019-02-28 21:41:45.186293	task1app	проо	412	294	1	82
2906	85	82	new_message	2019-02-28 21:46:43.677304	2019-02-28 21:46:43.805543	task1app	BenCo  — completed your task, please confirm	412	294	1	82
2907	82	85	new_message	2019-02-28 21:47:00.347429	2019-02-28 21:47:00.446854	task1app	mm : Has confirmed your work.	412	294	1	82
2908	82	85	new_message	2019-02-28 21:47:31.732969	2019-02-28 21:47:31.842648	task1app	You have got a rating.	412	294	1	82
2909	\N	\N	new_task	2019-02-28 21:48:37.700321	2019-02-28 21:48:42.119525	tender app	chjjbvc	413	\N	1	82
2910	\N	85	new_task	2019-02-28 21:55:25.094468	2019-02-28 21:55:25.192921	task2354	vghj	414	\N	1	82
2911	85	82	new_message	2019-02-28 21:58:40.448036	2019-02-28 21:58:40.564193	task2354	BenCo  has accepted your work offer	414	295	1	82
2912	82	85	new_message	2019-02-28 21:59:27.565906	2019-02-28 21:59:27.695706	task2354	hjshfhf	414	295	1	82
2913	85	82	new_message	2019-02-28 21:59:37.144171	2019-02-28 21:59:37.273028	task2354	ghmbcf	414	295	1	82
2914	\N	85	new_message	2019-02-28 21:59:58.73383	2019-02-28 21:59:58.73383	task2354	Please confirm the Change Order	414	295	0	82
2915	\N	85	new_message	2019-02-28 22:00:11.045571	2019-02-28 22:00:11.160866	task2354	Back Charge	414	295	1	82
2916	\N	85	new_message	2019-02-28 22:00:35.849919	2019-02-28 22:00:35.95834	task2354	Please confirm the Change Order	414	295	1	82
2917	\N	82	new_message	2019-02-28 22:00:55.103024	2019-02-28 22:00:55.222863	task2354	Budget has changed	414	295	1	82
2918	82	85	new_message	2019-02-28 22:02:32.112046	2019-02-28 22:02:32.223439	task2354	hujk	414	295	1	82
2919	\N	83	new_task	2019-02-28 22:07:04.711651	2019-02-28 22:07:04.837434	Не трогать	не трогать	415	\N	1	82
2920	83	82	new_message	2019-02-28 22:07:19.49314	2019-02-28 22:07:19.61469	Не трогать	mmm  has accepted your work offer	415	296	1	82
2921	\N	\N	new_task	2019-02-28 22:07:23.910419	2019-02-28 22:07:28.203083	tender0006	b.nbmn	416	\N	1	82
2922	85	82	new_message	2019-02-28 22:07:58.492981	2019-02-28 22:07:58.619233	tender0006	New Bid! BenCo : . 	416	297	1	82
2923	\N	83	new_message	2019-02-28 22:09:04.86054	2019-02-28 22:09:04.86054	Не трогать	Please confirm the Change Order	415	296	0	82
2924	85	82	new_message	2019-02-28 22:09:07.471012	2019-02-28 22:09:07.595084	tender0006	New Bid! BenCo : . 	416	297	1	82
2925	82	85	new_message	2019-02-28 22:09:22.332661	2019-02-28 22:09:22.467931	tender0006	Congratulations! BenCo : Your bid was accepted. 	416	297	1	82
2926	82	85	new_message	2019-02-28 22:09:41.451885	2019-02-28 22:09:41.588826	tender0006	jnjnmnm	416	297	1	82
2927	85	82	new_message	2019-02-28 22:09:50.095379	2019-02-28 22:09:50.236441	tender0006	проол	416	297	1	82
2928	\N	85	new_message	2019-02-28 22:10:09.008737	2019-02-28 22:10:09.115502	tender0006	Please confirm the Change Order	416	297	1	82
2929	83	82	new_message	2019-02-28 22:10:22.755541	2019-02-28 22:10:22.892388	Не трогать	hi	415	296	1	82
2930	\N	82	new_message	2019-02-28 22:10:26.551483	2019-02-28 22:10:26.551483	tender0006	Budget has changed	416	297	0	82
2931	\N	82	new_message	2019-02-28 22:11:18.433949	2019-02-28 22:11:18.543759	Не трогать	Budget has changed	415	296	1	82
2932	\N	85	new_message	2019-02-28 22:11:59.957486	2019-02-28 22:12:00.090136	tender0006	Back Charge	416	297	1	82
2933	85	82	new_message	2019-02-28 22:14:10.082939	2019-02-28 22:14:10.206321	tender0006	BenCo  — completed your task, please confirm	416	297	1	82
2934	82	85	new_message	2019-02-28 22:14:41.13229	2019-02-28 22:14:41.263959	tender0006	mm : Has confirmed your work.	416	297	1	82
2935	82	85	new_message	2019-02-28 22:14:47.66845	2019-02-28 22:14:47.781928	tender0006	You have got a rating.	416	297	1	82
2936	\N	85	new_task	2019-02-28 22:16:28.428582	2019-02-28 22:16:28.546788	0016	jjjjk	417	\N	1	82
2937	85	82	new_message	2019-02-28 22:16:42.471057	2019-02-28 22:16:42.604404	0016	BenCo  has accepted your work offer	417	298	1	82
2938	85	82	new_message	2019-02-28 22:16:45.644348	2019-02-28 22:16:45.767467	0016	BenCo  has accepted your work offer	417	298	1	82
2939	82	85	new_message	2019-02-28 22:18:18.761265	2019-02-28 22:18:18.871772	0016	rgrggr	417	298	1	82
2940	85	82	new_message	2019-02-28 22:18:27.847601	2019-02-28 22:18:27.983049	0016	BenCo  — completed your task, please confirm	417	298	1	82
2941	82	85	new_message	2019-02-28 22:18:39.420663	2019-02-28 22:18:39.526857	0016	mm : Has confirmed your work.	417	298	1	82
2942	82	85	new_message	2019-02-28 22:18:46.603021	2019-02-28 22:18:46.709192	0016	You have got a rating.	417	298	1	82
2943	\N	85	new_task	2019-02-28 22:29:04.101223	2019-02-28 22:29:04.216364	task0028	daff	418	\N	1	82
2944	85	82	new_message	2019-02-28 22:29:21.304509	2019-02-28 22:29:21.461901	task0028	BenCo  has accepted your work offer	418	299	1	82
2945	\N	85	new_message	2019-02-28 22:30:03.303495	2019-02-28 22:30:03.303495	task0028	Please confirm the Change Order	418	299	0	82
2946	\N	85	new_message	2019-02-28 22:31:23.200264	2019-02-28 22:31:23.307491	task0028	Please confirm the Change Order	418	299	1	82
2947	\N	82	new_message	2019-02-28 22:31:45.884736	2019-02-28 22:31:45.884736	task0028	Budget has changed	418	299	0	82
2948	85	82	new_message	2019-02-28 22:32:50.028694	2019-02-28 22:32:50.153067	task0028	BenCo  — completed your task, please confirm	418	299	1	82
2949	8	85	new_message	2019-02-28 22:33:01.539256	2019-02-28 22:33:01.651292	task0028	Admin Astra: Has confirmed your work.	418	299	1	82
2950	\N	\N	new_task	2019-02-28 22:34:06.5861	2019-02-28 22:34:10.96474	task0033	каяапы	419	\N	1	82
2951	\N	\N	new_task	2019-02-28 22:34:56.942207	2019-02-28 22:35:00.939761	task0034		420	\N	1	82
2952	85	82	new_message	2019-02-28 22:35:07.60552	2019-02-28 22:35:07.738796	task0034	New Bid! BenCo : . 	420	300	1	82
2953	\N	85	new_task	2019-02-28 22:36:04.570225	2019-02-28 22:36:04.676339	task0035		421	\N	1	82
2954	85	82	new_message	2019-02-28 22:36:19.299795	2019-02-28 22:36:19.436439	task0035	BenCo  has accepted your work offer	421	301	1	82
2955	\N	85	new_message	2019-02-28 22:36:34.536251	2019-02-28 22:36:34.636912	task0035	Please confirm the Change Order	421	301	1	82
2956	\N	82	new_message	2019-02-28 22:36:45.412145	2019-02-28 22:36:45.538672	task0035	Budget has changed	421	301	1	82
2957	82	85	new_message	2019-02-28 22:41:35.535621	2019-02-28 22:41:35.654363	task0028	You have got a rating.	418	299	1	82
2958	\N	85	new_task	2019-02-28 22:48:04.832629	2019-02-28 22:48:05.288647	task0047	fffgg	422	\N	1	82
2959	85	82	new_message	2019-02-28 22:48:44.970227	2019-02-28 22:48:45.099267	task0047	BenCo  has accepted your work offer	422	302	1	82
3113	\N	\N	destroy_task	2019-03-28 14:50:48.646316	2019-03-28 14:50:48.646316	\N	\N	357	\N	0	\N
2960	85	82	new_message	2019-02-28 22:48:47.854814	2019-02-28 22:48:47.983164	task0047	BenCo  has accepted your work offer	422	302	1	82
2961	\N	85	new_message	2019-02-28 22:49:52.569441	2019-02-28 22:49:52.656159	task0047	Please confirm the Change Order	422	302	1	82
2962	\N	85	new_message	2019-02-28 22:50:41.809937	2019-02-28 22:50:41.897386	task0047	Back Charge	422	302	1	82
2963	\N	82	new_message	2019-02-28 22:51:40.796079	2019-02-28 22:51:40.796079	task0047	Budget has changed	422	302	0	82
2964	\N	83	new_task	2019-02-28 22:55:38.197275	2019-02-28 22:55:38.330674	Не трогать 2		423	\N	1	82
2965	83	82	new_message	2019-02-28 22:55:47.506812	2019-02-28 22:55:47.628293	Не трогать 2	mmm  has accepted your work offer	423	303	1	82
2966	83	82	new_message	2019-02-28 22:55:58.300002	2019-02-28 22:55:58.425957	Не трогать 2	хи	423	303	1	82
2967	\N	83	new_message	2019-02-28 22:56:37.97051	2019-02-28 22:56:37.97051	Не трогать 2	Please confirm the Change Order	423	303	0	82
2968	83	82	new_message	2019-02-28 22:57:08.077534	2019-02-28 22:57:08.203677	Не трогать 2	п	423	303	1	82
2969	\N	82	new_message	2019-02-28 22:57:37.963277	2019-02-28 22:57:37.963277	Не трогать 2	Budget has changed	423	303	0	82
2970	\N	83	new_message	2019-02-28 23:08:12.574794	2019-02-28 23:08:13.064316	Не трогать 2	Please confirm the Change Order	423	303	1	82
2971	\N	82	new_message	2019-02-28 23:08:35.09074	2019-02-28 23:08:35.206111	Не трогать 2	Budget has changed	423	303	1	82
2972	\N	83	new_task	2019-02-28 23:19:55.945575	2019-02-28 23:19:56.076648	JIFdjfospfjsdo k	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s	424	\N	1	82
2973	83	82	new_message	2019-02-28 23:22:35.990311	2019-02-28 23:22:36.122542	JIFdjfospfjsdo k	mmm  has accepted your work offer	424	304	1	82
2974	83	82	new_message	2019-02-28 23:22:38.63928	2019-02-28 23:22:38.792072	JIFdjfospfjsdo k	mmm  has accepted your work offer	424	304	1	82
2975	\N	83	new_message	2019-02-28 23:23:01.747238	2019-02-28 23:23:01.747238	JIFdjfospfjsdo k	Please confirm the Change Order	424	304	0	82
2976	83	82	new_message	2019-02-28 23:23:09.973173	2019-02-28 23:23:10.112635	JIFdjfospfjsdo k	fuogohx	424	304	1	82
2977	\N	82	new_message	2019-02-28 23:23:26.029371	2019-02-28 23:23:26.159162	JIFdjfospfjsdo k	Budget has changed	424	304	1	82
2978	\N	83	new_message	2019-02-28 23:23:44.830472	2019-02-28 23:23:44.950144	JIFdjfospfjsdo k	Please confirm the Change Order	424	304	1	82
2979	8	83	new_message	2019-02-28 23:28:04.168247	2019-02-28 23:28:04.693355	JIFdjfospfjsdo k	Admin Astra: Has confirmed your work.	424	304	1	82
2989	8	83	new_message	2019-03-01 15:58:37.400547	2019-03-14 22:49:59.0061	dsadasdasda	Admin Astra: Has confirmed your work.	398	280	1	82
2981	83	82	new_message	2019-03-01 15:50:39.777449	2019-03-14 22:49:59.014221	dsadasdasda	mmm  has accepted your work offer	398	280	1	82
2982	\N	83	new_message	2019-03-01 15:51:42.806397	2019-03-14 22:49:59.020069	dsadasdasda	Back Charge	398	280	1	82
2984	\N	83	new_message	2019-03-01 15:52:41.910518	2019-03-14 22:49:59.021682	dsadasdasda	Please confirm the Change Order	398	280	1	82
2988	83	82	new_message	2019-03-01 15:53:40.237614	2019-03-14 22:49:59.026678	dsadasdasda	fdsfdsfds	398	305	1	82
3001	8	83	new_message	2019-03-02 13:34:48.285107	2019-03-14 22:49:59.202292	fsgfg sfsdfsfsdfsdf sdfsfsd fsd	mm : Has confirmed your work.	426	307	1	82
3003	\N	83	new_task	2019-03-02 13:38:53.165834	2019-03-14 22:49:59.226295	first		427	\N	1	82
3002	83	82	new_message	2019-03-02 13:35:15.055203	2019-03-14 22:49:59.242882	fsgfg sfsdfsfsdfsdf sdfsfsd fsd	vvvb	426	307	1	82
2997	83	82	new_message	2019-03-02 13:27:37.700405	2019-03-14 22:49:59.244664	Не трогать!!!	gffggg	425	306	1	82
3000	83	82	new_message	2019-03-02 13:34:35.201749	2019-03-14 22:49:59.253747	fsgfg sfsdfsfsdfsdf sdfsfsd fsd	hhhh	426	307	1	82
3006	83	82	new_message	2019-03-02 13:52:26.202442	2019-03-14 22:49:59.410767	first	nxnxnekdif	427	308	1	82
3005	82	83	new_message	2019-03-02 13:45:24.022893	2019-03-14 22:49:59.423261	first	авыаываааыв	427	308	1	82
3004	83	82	new_message	2019-03-02 13:39:15.81972	2019-03-14 22:49:59.463449	first	mmm  has accepted your work offer	427	308	1	82
2986	83	82	new_message	2019-03-01 15:53:14.484083	2019-03-14 22:50:37.658437	dsadasdasda	da	398	305	1	82
2985	83	82	new_message	2019-03-01 15:53:07.624471	2019-03-14 22:50:37.785937	dsadasdasda	fdfd	398	305	1	82
2983	83	82	new_message	2019-03-01 15:51:58.59757	2019-03-14 22:50:37.92744	dsadasdasda	fdsffsd	398	305	1	82
2992	83	82	new_message	2019-03-02 13:21:16.429087	2019-03-14 22:50:38.052277	tender 2602	mmm  has accepted your work offer	383	0	1	82
2995	83	82	new_message	2019-03-02 13:27:12.210876	2019-03-14 22:50:38.174903	Не трогать!!!	mmm  has accepted your work offer	425	306	1	82
2987	\N	83	new_message	2019-03-01 15:53:25.379947	2019-03-14 22:50:38.283724	dsadasdasda	Please confirm the Change Order	398	280	1	82
2993	83	82	new_message	2019-03-02 13:21:28.270151	2019-03-14 22:50:38.41184	tender 2602	jhg	383	270	1	82
2994	\N	83	new_task	2019-03-02 13:26:42.255826	2019-03-14 22:50:38.552012	Не трогать!!!		425	\N	1	82
2980	83	82	new_message	2019-03-01 15:50:37.128537	2019-03-14 22:50:38.631205	dsadasdasda	mmm  has accepted your work offer	398	280	1	82
2991	82	85	new_message	2019-03-02 13:16:57.592443	2019-03-14 22:50:38.638779	5005	You have got a rating.	385	272	1	82
2996	8	83	new_message	2019-03-02 13:27:28.439758	2019-03-14 22:50:38.749722	Не трогать!!!	Admin Astra: Has confirmed your work.	425	306	1	82
2990	82	83	new_message	2019-03-02 12:57:18.827812	2019-03-14 22:50:38.769112	dsadasdasda	You have got a rating.	398	280	1	82
2998	\N	83	new_task	2019-03-02 13:34:00.980505	2019-03-14 22:50:48.918634	fsgfg sfsdfsfsdfsdf sdfsfsd fsd		426	\N	1	82
2999	83	82	new_message	2019-03-02 13:34:23.502804	2019-03-14 22:50:49.017897	fsgfg sfsdfsfsdfsdf sdfsfsd fsd	mmm  has accepted your work offer	426	307	1	82
3008	83	82	new_message	2019-03-02 13:54:03.742115	2019-03-14 22:49:59.326497	first	f	427	308	1	82
3009	\N	82	new_message	2019-03-02 13:54:09.112825	2019-03-14 22:49:59.478322	first	Budget has changed	427	308	1	82
3012	8	83	new_message	2019-03-02 13:54:40.764535	2019-03-14 22:49:59.572073	first	mm : Has confirmed your work.	427	308	1	82
3010	\N	83	new_message	2019-03-02 13:54:30.259039	2019-03-14 22:49:59.597342	first	Back Charge	427	308	1	82
3011	83	82	new_message	2019-03-02 13:54:30.984785	2019-03-14 22:49:59.614721	first	t	427	308	1	82
3014	\N	83	new_message	2019-03-03 23:33:50.265771	2019-03-14 22:49:59.629055	Не трогать 2	Back Charge	423	303	1	82
3017	\N	85	new_task	2019-03-05 19:07:04.921142	2019-03-14 22:49:59.684413	task0502		429	\N	1	82
3013	83	82	new_message	2019-03-02 13:54:48.184242	2019-03-14 22:49:59.699383	first	r	427	308	1	82
3015	8	83	new_message	2019-03-04 00:08:45.418832	2019-03-14 22:49:59.939798	Не трогать 2	mm : Has confirmed your work.	423	303	1	82
3021	\N	85	new_message	2019-03-05 19:18:57.734458	2019-03-14 22:50:00.091447	task0501	Please confirm the Change Order	428	309	1	82
3025	\N	82	new_message	2019-03-05 19:39:46.305005	2019-03-14 22:50:00.140933	task0501	Budget has changed	428	309	1	82
3019	85	82	new_message	2019-03-05 19:16:55.847198	2019-03-14 22:50:00.143162	task0501	BenCo  has accepted your work offer	428	309	1	82
3024	\N	85	new_task	2019-03-05 19:27:04.150065	2019-03-14 22:50:00.19018	task101		433	\N	1	82
3027	82	85	new_message	2019-03-05 20:35:07.700951	2019-03-14 22:50:00.238586	task27021	mm : Has confirmed your work.	389	275	1	82
3020	\N	85	new_message	2019-03-05 19:17:30.02258	2019-03-14 22:50:00.255217	task0501	Back Charge	428	309	1	82
3026	8	85	new_message	2019-03-05 19:40:21.727553	2019-03-14 22:50:00.331482	task0501	mm : Has confirmed your work.	428	309	1	82
3028	82	85	new_message	2019-03-05 20:42:16.412536	2019-03-14 22:50:00.540198	tender27021	mm : Has confirmed your work.	393	278	1	82
3029	82	83	new_message	2019-03-05 20:47:39.555602	2019-03-14 22:50:00.570742	Новый тест	mm : Has confirmed your work.	402	284	1	82
3033	82	80	new_message	2019-03-05 20:55:38.031477	2019-03-14 22:50:00.623581	task1	mm : Has confirmed your work.	331	217	1	82
3034	82	80	new_message	2019-03-05 20:55:59.058482	2019-03-14 22:50:00.656701	jdjdnxmdmdm	mm : Has confirmed your work.	352	239	1	82
3032	82	85	new_message	2019-03-05 20:50:23.593195	2019-03-14 22:50:00.711583	task0002	mm : Has confirmed your work.	404	286	1	82
3030	82	85	new_message	2019-03-05 20:49:46.067902	2019-03-14 22:50:00.745453	task0047	mm : Has confirmed your work.	422	302	1	82
3031	82	85	new_message	2019-03-05 20:50:11.279207	2019-03-14 22:50:00.794995	task0035	mm : Has confirmed your work.	421	301	1	82
3035	82	85	new_message	2019-03-05 21:12:24.664035	2019-03-14 22:50:00.962661	task2404	mm : Has confirmed your work.	377	264	1	82
3040	\N	83	new_message	2019-03-05 22:02:19.570745	2019-03-14 22:50:00.987245	tender 2602	Please confirm the Change Order	383	0	1	82
3039	82	83	new_message	2019-03-05 21:23:31.747442	2019-03-14 22:50:01.132365	Ndndnxmxkxkxnx	mm : Has confirmed your work.	376	262	1	82
3036	82	83	new_message	2019-03-05 21:12:39.932891	2019-03-14 22:50:01.162104	Jdjdmjxdhnd	mm : Has confirmed your work.	375	261	1	82
3038	82	80	new_message	2019-03-05 21:21:25.749473	2019-03-14 22:50:01.215804	znndjdmxmxmx	mm : Has confirmed your work.	353	240	1	82
3037	82	83	new_message	2019-03-05 21:13:55.196629	2019-03-14 22:50:01.268436	Testing task 1900	mm : Has confirmed your work.	408	290	1	82
3041	\N	83	new_message	2019-03-05 22:02:50.156324	2019-03-14 22:50:01.322491	tender 2602	Please confirm the Change Order	383	0	1	82
3048	\N	82	new_message	2019-03-05 22:32:17.37064	2019-03-14 22:50:01.641432	New test title task 54fd	Budget has changed	434	312	1	82
3043	85	82	new_message	2019-03-05 22:17:27.102783	2019-03-14 22:50:01.643722	New test title task 54fd	BenCo  has accepted your work offer	434	312	1	82
3047	\N	85	new_message	2019-03-05 22:30:41.836836	2019-03-14 22:50:01.78204	New test title task 54fd	Please confirm the Change Order	434	312	1	82
3045	\N	85	new_message	2019-03-05 22:20:31.297263	2019-03-14 22:50:01.806637	New test title task 54fd	Please confirm the Change Order	434	312	1	82
3044	\N	85	new_message	2019-03-05 22:20:17.607026	2019-03-14 22:50:01.883682	New test title task 54fd	Back Charge	434	312	1	82
3046	\N	82	new_message	2019-03-05 22:25:42.953552	2019-03-14 22:50:01.970408	New test title task 54fd	Budget has changed	434	312	1	82
3042	\N	85	new_task	2019-03-05 22:16:33.837048	2019-03-14 22:50:01.993075	New test title task 54fd	dsffds ds fs df ds fsd f	434	\N	1	82
3049	82	85	new_message	2019-03-05 22:33:08.877344	2019-03-14 22:50:02.112791	New test title task 54fd	mm : Has confirmed your work.	434	312	1	82
3050	82	85	new_message	2019-03-05 22:33:14.075249	2019-03-14 22:50:02.137883	New test title task 54fd	You have got a rating.	434	312	1	82
3052	85	82	new_message	2019-03-05 22:46:26.029087	2019-03-14 22:50:02.293029	4324234234	New Bid! BenCo : . 	435	313	1	82
3053	82	85	new_message	2019-03-05 22:51:36.496603	2019-03-14 22:50:02.397237	4324234234	Congratulations! BenCo : Your bid was accepted. 	435	313	1	82
3054	82	83	new_message	2019-03-06 18:32:27.764174	2019-03-14 22:50:02.516107	wer	mm : Has confirmed your work.	363	249	1	82
3055	82	83	new_message	2019-03-06 18:32:57.200909	2019-03-14 22:50:02.655455	wer	You have got a rating.	363	249	1	82
3056	\N	87	new_task	2019-03-07 22:06:35.242388	2019-03-14 22:50:02.748458	task101		436	\N	1	82
3057	87	82	new_message	2019-03-07 22:08:11.726727	2019-03-14 22:50:02.898638	task101	tester  has accepted your work offer	436	314	1	82
3018	\N	\N	new_task	2019-03-05 19:13:33.323647	2019-03-14 22:50:17.772175	tender0503		430	\N	1	82
3023	\N	\N	new_task	2019-03-05 19:26:12.250067	2019-03-14 22:50:19.409319	tender5035		432	\N	1	82
3051	\N	\N	new_task	2019-03-05 22:42:13.419998	2019-03-14 22:50:19.881749	4324234234	432432423423	435	\N	1	82
3058	\N	\N	new_task	2019-03-07 22:08:58.684895	2019-03-14 22:50:23.824324	task101222		437	\N	1	82
3022	\N	\N	new_task	2019-03-05 19:21:18.558248	2019-03-14 22:50:26.046076	вававава		431	\N	1	82
3063	82	87	new_message	2019-03-07 22:15:47.758237	2019-03-14 22:50:38.510395	тендер	Congratulations! tester : Your bid was accepted. 	438	316	1	82
3060	\N	87	new_task	2019-03-07 22:14:10.066609	2019-03-14 22:50:38.847253	task200	отроачпргрчапе	439	\N	1	82
3067	8	87	new_message	2019-03-07 22:33:16.448895	2019-03-14 22:50:48.974528	task200	mm : Has confirmed your work.	439	315	1	82
3064	\N	87	new_message	2019-03-07 22:20:02.153982	2019-03-14 22:50:48.976259	task200	Please confirm the Change Order	439	315	1	82
3065	\N	87	new_message	2019-03-07 22:20:12.972187	2019-03-14 22:50:49.07157	task200	Back Charge	439	315	1	82
3062	87	82	new_message	2019-03-07 22:15:01.347798	2019-03-14 22:50:49.077614	тендер	New Bid! tester : . 	438	316	1	82
3061	87	82	new_message	2019-03-07 22:14:50.465298	2019-03-14 22:50:49.079475	task200	tester  has accepted your work offer	439	315	1	82
3066	\N	82	new_message	2019-03-07 22:29:04.073484	2019-03-14 22:50:49.14092	task200	Budget has changed	439	315	1	82
3059	\N	\N	new_task	2019-03-07 22:10:10.032687	2019-03-14 22:50:57.805823	тендер	оэждьаопрлчжтотпашлдчкарн	438	\N	1	82
3068	\N	85	new_message	2019-03-10 13:29:53.639522	2019-03-14 22:51:04.482076	task800	Please confirm the Change Order	368	254	1	82
3007	\N	83	new_message	2019-03-02 13:53:55.848168	2019-03-14 22:49:59.419723	first	Please confirm the Change Order	427	308	1	82
3016	\N	85	new_task	2019-03-05 19:06:07.241316	2019-03-14 22:49:59.735008	task0501	zfdgxfdh fhcjckclkfhlikl, zfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxfzfdgxfdh fhcjckclkfhlikl, dfbhzgfhxf	428	\N	1	82
3072	\N	83	new_task	2019-03-12 19:07:50.748871	2019-03-14 22:50:17.891999	тест время старта	моль	440	\N	1	82
3073	\N	85	new_task	2019-03-14 20:17:55.246758	2019-03-14 22:50:17.98996	task1403		441	\N	1	82
3075	\N	87	new_task	2019-03-14 21:17:57.823095	2019-03-14 22:50:19.492917	task14032		443	\N	1	82
3077	\N	89	new_task	2019-03-14 21:37:14.252213	2019-03-14 22:50:19.964849	task14033	ASTRA Group is your local general contractor and property-management company in Calgary. We offer total construction, restoration, and renovation services for commercial, residential, and industrial clients. We build and upgrade custom houses, multifamily complexes, and commercial properties in Calgary.	445	\N	1	82
3080	\N	89	new_message	2019-03-14 21:50:53.562944	2019-03-14 22:50:23.905112	task14033	Back Charge	445	320	1	82
3081	\N	89	new_message	2019-03-14 21:51:03.364946	2019-03-14 22:50:23.987402	task14033	Please confirm the Change Order	445	320	1	82
3082	\N	82	new_message	2019-03-14 21:51:34.860258	2019-03-14 22:50:24.110618	task14033	Budget has changed	445	320	1	82
3083	8	89	new_message	2019-03-14 21:55:08.698418	2019-03-14 22:50:24.188873	task14033	mm : Has confirmed your work.	445	320	1	82
3084	89	82	new_message	2019-03-14 21:58:27.584274	2019-03-14 22:50:24.313597	tender14033	New Bid! Den : . 	446	321	1	82
3086	82	89	new_message	2019-03-14 21:59:29.112524	2019-03-14 22:50:26.124106	tender14033	Congratulations! Den : Your bid was accepted. 	446	321	1	82
3087	\N	85	new_task	2019-03-14 22:07:45.033764	2019-03-14 22:50:26.211135	task1403!!!	ASTRA Group is your local general contractor and property-management company in Calgary. We offer total construction, restoration, and renovation services for commercial, residential, and industrial clients. We build and upgrade custom houses, multifamily complexes, and commercial properties in Calgary.\r\n\r\n	448	\N	1	82
3074	\N	\N	new_task	2019-03-14 20:59:21.289626	2019-03-14 22:50:37.454256	tender1403		442	\N	1	82
3076	\N	\N	new_task	2019-03-14 21:19:10.186386	2019-03-14 22:50:38.433756	tender14032		444	\N	1	82
3078	\N	\N	new_task	2019-03-14 21:46:49.199782	2019-03-14 22:50:39.624252	tender14033	ASTRA Group is your local general contractor and property-management company in Calgary. We offer total construction, restoration, and renovation services for commercial, residential, and industrial clients. We build and upgrade custom houses, multifamily complexes, and commercial properties in Calgary.	446	\N	1	82
3085	\N	\N	new_task	2019-03-14 21:58:54.855903	2019-03-14 22:50:41.500851	vxvcxvxcvxcvxcv		447	\N	1	82
3088	\N	\N	new_task	2019-03-14 22:09:33.410003	2019-03-14 22:50:44.603836	tender14035	ASTRA Group is your local general contractor and property-management company in Calgary. We offer total construction, restoration, and renovation services for commercial, residential, and industrial clients. We build and upgrade custom houses, multifamily complexes, and commercial properties in Calgary.\r\n\r\n	449	\N	1	82
3070	\N	85	new_message	2019-03-10 13:33:34.231413	2019-03-14 22:50:48.923834	task800	Back Charge	368	254	1	82
3069	\N	82	new_message	2019-03-10 13:30:56.552692	2019-03-14 22:50:49.209316	wer	Budget has changed	363	249	1	82
3071	8	85	new_message	2019-03-10 13:34:33.46347	2019-03-14 22:51:04.515566	task800	mm : Has confirmed your work.	368	254	1	82
3089	85	82	new_message	2019-03-14 22:15:14.569752	2019-03-14 22:51:04.548281	task1403!!!	BenCo  has accepted your work offer	448	322	1	82
3079	89	82	new_message	2019-03-14 21:48:53.844965	2019-03-14 22:51:04.557235	task14033	Den  has accepted your work offer	445	320	1	82
3091	85	82	new_message	2019-03-14 22:34:21.059723	2019-03-14 22:51:04.610079	task1403	BenCo  has accepted your work offer	441	318	1	82
3090	\N	85	new_message	2019-03-14 22:15:28.079642	2019-03-14 22:51:26.048854	task1403!!!	Please confirm the Change Order	448	322	1	82
3093	8	89	new_message	2019-03-14 22:38:59.75567	2019-03-14 22:51:26.052127	tender14033	mm : Has confirmed your work.	446	321	1	82
3092	8	85	new_message	2019-03-14 22:34:52.719122	2019-03-14 22:51:26.061573	task1403	mm : Has confirmed your work.	441	318	1	82
3094	\N	\N	new_task	2019-03-14 22:52:33.928028	2019-03-14 22:53:32.587738	tender		450	\N	1	82
3095	\N	83	new_task	2019-03-14 22:55:39.785916	2019-03-14 22:55:39.785916	test apartment	ygh	451	\N	0	82
3096	\N	\N	update_task	2019-03-14 22:59:57.33488	2019-03-14 22:59:57.33488	\N	\N	451	\N	0	\N
3097	\N	\N	update_task	2019-03-14 23:01:19.95259	2019-03-14 23:01:19.95259	\N	\N	451	\N	0	\N
3098	\N	83	new_task	2019-03-14 23:06:25.631074	2019-03-14 23:06:25.631074	test apartment2	yh	452	\N	0	82
3099	\N	\N	update_task	2019-03-14 23:08:47.977612	2019-03-14 23:08:47.977612	\N	\N	452	\N	0	\N
3100	\N	\N	update_task	2019-03-14 23:19:48.084227	2019-03-14 23:19:48.084227	\N	\N	452	\N	0	\N
3101	\N	\N	new_task	2019-03-22 13:26:43.724254	2019-03-22 13:26:43.724254	task22031	vftf,jvcddhgfghv bgftfj gghgj 	453	\N	0	82
3102	\N	89	new_task	2019-03-22 13:27:59.390881	2019-03-22 13:27:59.390881	task22032	mchylhlijj tyyh.hkj jkh.l jkhougf	454	\N	0	82
3103	\N	80	new_task	2019-03-22 13:28:51.237745	2019-03-22 13:28:51.237745	task22033	kdfgmjhf.h.ghjk	455	\N	0	82
3104	\N	86	new_task	2019-03-22 13:29:57.089656	2019-03-22 13:29:57.089656	task22034	cjgfvhj,h yglhikj jhuhi/olj	456	\N	0	82
3105	\N	\N	new_task	2019-03-22 13:31:00.776494	2019-03-22 13:31:00.776494	task22035	gtgtfgv,hg uyjhgygh	457	\N	0	82
3106	\N	89	new_task	2019-03-22 13:32:53.100925	2019-03-22 13:32:53.100925	task22036	cmcgcdfcjh f.khgfg f,yhgf.hg glyjhghyg	458	\N	0	82
3107	\N	86	new_task	2019-03-22 13:34:04.065491	2019-03-22 13:34:04.065491	task22037	uyfyhg  jgyh,g, jg,.kjbj	459	\N	0	82
3108	\N	85	new_task	2019-03-22 13:35:20.70619	2019-03-22 13:35:20.70619	task22038		460	\N	0	82
3109	85	82	new_message	2019-03-22 14:01:13.329958	2019-03-22 14:01:13.329958	task22038	BenCo  has accepted your work offer	460	330	0	82
3110	89	82	new_message	2019-03-22 20:29:58.718487	2019-03-22 20:29:58.718487	task22032	Den  has accepted your work offer	454	325	0	82
3111	89	82	new_message	2019-03-22 20:30:11.144427	2019-03-22 20:30:11.144427	task22036	Den  has accepted your work offer	458	328	0	82
3112	8	85	new_message	2019-03-22 20:32:10.350775	2019-03-22 20:32:10.350775	task1403!!!	mm : Has confirmed your work.	448	322	0	82
3114	\N	\N	destroy_task	2019-03-28 14:50:48.713273	2019-03-28 14:50:48.713273	\N	\N	358	\N	0	\N
3115	\N	\N	destroy_task	2019-03-28 14:50:48.764252	2019-03-28 14:50:48.764252	\N	\N	359	\N	0	\N
3116	\N	\N	destroy_task	2019-03-28 14:50:48.80433	2019-03-28 14:50:48.80433	\N	\N	399	\N	0	\N
3117	\N	\N	destroy_task	2019-03-28 14:50:48.845483	2019-03-28 14:50:48.845483	\N	\N	456	\N	0	\N
3118	\N	\N	destroy_task	2019-03-28 14:50:48.898737	2019-03-28 14:50:48.898737	\N	\N	459	\N	0	\N
3119	\N	85	new_task	2019-03-28 17:00:33.023934	2019-03-28 17:00:33.023934	task1	gygyv	461	\N	0	98
3120	\N	\N	destroy_task	2019-03-28 20:55:26.764789	2019-03-28 20:55:26.764789	\N	\N	461	\N	0	\N
3121	\N	85	new_task	2019-03-28 21:56:22.833242	2019-03-28 21:56:22.833242	task28031		462	\N	0	103
3122	\N	104	new_task	2019-03-28 22:00:09.938822	2019-03-28 22:00:09.938822	task28032		463	\N	0	82
3123	104	82	new_message	2019-03-28 22:09:11.530286	2019-03-28 22:09:11.530286	task28032	Garry  has accepted your work offer	463	333	0	82
3124	\N	\N	new_task	2019-03-28 22:13:48.794096	2019-03-28 22:13:48.794096	tender28032	dfzgsjxsj tyastuytu	464	\N	0	103
3125	\N	104	new_message	2019-03-28 22:18:39.657661	2019-03-28 22:18:39.657661	task28032	Please confirm the Change Order	463	333	0	82
3126	\N	82	new_message	2019-03-28 22:19:36.930144	2019-03-28 22:19:36.930144	task28032	Budget has changed	463	333	0	82
3127	\N	104	new_message	2019-03-28 22:20:46.136853	2019-03-28 22:20:46.136853	task28032	Back Charge	463	333	0	82
3128	\N	104	new_task	2019-03-28 22:30:13.218098	2019-03-28 22:30:13.218098	task28033		465	\N	0	103
3129	104	103	new_message	2019-03-28 22:30:24.46859	2019-03-28 22:30:24.46859	task28033	Garry  has accepted your work offer	465	334	0	103
3130	\N	\N	new_task	2019-03-29 20:08:03.719952	2019-03-29 20:08:03.719952	tender29031		466	\N	0	103
3131	\N	\N	new_task	2019-03-29 20:09:54.555665	2019-03-29 20:09:54.555665	tender2903		467	\N	0	103
3132	\N	104	new_task	2019-03-29 20:13:45.995823	2019-03-29 20:13:45.995823	task2903		468	\N	0	103
3133	104	103	new_message	2019-03-29 20:15:30.889719	2019-03-29 20:15:30.889719	task2903	Garry  has accepted your work offer	468	335	0	103
3134	\N	104	new_message	2019-03-29 20:19:10.215023	2019-03-29 20:19:10.215023	task2903	Please confirm the Change Order	468	335	0	103
3135	\N	103	new_message	2019-03-29 20:19:29.435321	2019-03-29 20:19:29.435321	task2903	Budget has changed	468	335	0	103
3136	\N	104	new_message	2019-03-29 20:20:44.104207	2019-03-29 20:20:44.104207	task2903	Back Charge	468	335	0	103
3137	8	104	new_message	2019-03-29 20:23:15.831164	2019-03-29 20:23:15.831164	task2903	Garry : Has confirmed your work.	468	335	0	103
3138	104	103	new_message	2019-03-29 20:30:52.021612	2019-03-29 20:30:52.021612	tender2903	New Bid! Garry : . 	467	336	0	103
3139	104	103	new_message	2019-03-29 20:30:53.277814	2019-03-29 20:30:53.277814	tender2903	New Bid! Garry : . 	467	336	0	103
3140	104	103	new_message	2019-03-29 20:30:53.750355	2019-03-29 20:30:53.750355	tender2903	New Bid! Garry : . 	467	336	0	103
3141	\N	104	new_task	2019-03-29 20:32:44.586391	2019-03-29 20:32:44.586391	task29033		469	\N	0	103
3142	104	103	new_message	2019-03-29 20:32:57.339031	2019-03-29 20:32:57.339031	task29033	Garry  has accepted your work offer	469	337	0	103
3143	8	104	new_message	2019-03-29 20:33:51.764958	2019-03-29 20:33:51.764958	task29033	Garry : Has confirmed your work.	469	337	0	103
3145	104	82	new_message	2019-03-29 21:23:25.088907	2019-03-29 21:23:25.088907	task2903N	Garry  has accepted your work offer	470	338	0	82
3146	104	82	new_message	2019-03-29 21:23:27.47278	2019-03-29 21:23:27.47278	task2903N	Garry  has accepted your work offer	470	338	0	82
3147	\N	104	new_task	2019-03-29 21:24:05.924207	2019-03-29 21:24:05.924207	task2903NN		471	\N	0	103
3148	104	103	new_message	2019-03-29 21:24:19.676931	2019-03-29 21:24:19.676931	task2903NN	Garry  has accepted your work offer	471	339	0	103
3149	103	104	new_message	2019-03-29 21:28:19.965872	2019-03-29 21:28:19.965872	task2903NN	Garry : Has confirmed your work.	471	339	0	103
3150	\N	89	new_task	2019-03-30 20:43:38.514272	2019-03-30 20:43:38.514272	task3003	ghkkbh	472	\N	0	103
3151	\N	80	new_task	2019-03-30 20:44:58.802825	2019-03-30 20:44:58.802825	task30032	gj	473	\N	0	103
3152	\N	85	new_task	2019-03-30 22:03:23.782795	2019-03-30 22:03:23.782795	task3103		474	\N	0	82
3153	\N	79	new_task	2019-07-16 19:40:04.154363	2019-07-16 19:40:04.154363	New test title task320009	іваіва ваів аів авіваіаіваіва іав івавіаівааві	475	\N	0	103
3154	\N	85	new_task	2019-07-16 20:46:39.711084	2019-07-16 20:46:39.711084	task0406	xfgfdgd	476	\N	0	103
3155	\N	85	new_task	2019-07-16 20:51:16.63904	2019-07-16 20:51:16.63904	task1607	gzdfgf	477	\N	0	103
3156	\N	85	new_task	2019-07-17 19:53:31.49407	2019-07-17 19:53:31.49407	task1707	testttttttttttt	478	\N	0	103
3157	\N	85	new_task	2019-07-17 20:44:57.366167	2019-07-17 20:44:57.366167	task17072		479	\N	0	103
3158	85	103	new_message	2019-07-17 20:46:32.595236	2019-07-17 20:46:32.595236	task17072	BenCo  has accepted your work offer	479	347	0	103
3159	\N	85	new_task	2019-07-17 20:50:25.045925	2019-07-17 20:50:25.045925	task17073		480	\N	0	103
3160	\N	88	new_task	2019-07-17 20:55:33.738129	2019-07-17 20:55:33.738129	dsdsdsdsd		481	\N	0	103
3161	85	103	new_message	2019-07-17 20:56:47.383689	2019-07-17 20:56:47.383689	task17073	BenCo  has accepted your work offer	480	348	0	103
3162	\N	85	new_task	2019-07-17 21:00:44.436823	2019-07-17 21:00:44.436823	task17074		482	\N	0	103
3163	\N	85	new_task	2019-07-17 21:19:36.664505	2019-07-17 21:19:36.664505	task17075		483	\N	0	103
3164	85	103	new_message	2019-07-17 21:21:06.188895	2019-07-17 21:21:06.188895	task17074	BenCo  has accepted your work offer	482	350	0	103
3165	85	103	new_message	2019-07-17 21:21:17.638202	2019-07-17 21:21:17.638202	task17075	BenCo  has accepted your work offer	483	351	0	103
3166	\N	\N	destroy_task	2019-07-17 21:37:39.750699	2019-07-17 21:37:39.750699	\N	\N	469	\N	0	\N
3167	\N	\N	destroy_task	2019-07-17 21:37:39.771141	2019-07-17 21:37:39.771141	\N	\N	470	\N	0	\N
3168	\N	\N	destroy_task	2019-07-17 21:37:39.808834	2019-07-17 21:37:39.808834	\N	\N	463	\N	0	\N
3169	\N	\N	destroy_task	2019-07-17 21:37:39.832851	2019-07-17 21:37:39.832851	\N	\N	465	\N	0	\N
3170	\N	\N	destroy_task	2019-07-17 21:37:39.847399	2019-07-17 21:37:39.847399	\N	\N	471	\N	0	\N
3171	\N	\N	destroy_task	2019-07-17 21:37:39.865724	2019-07-17 21:37:39.865724	\N	\N	468	\N	0	\N
3172	\N	\N	destroy_task	2019-07-17 21:37:39.884268	2019-07-17 21:37:39.884268	\N	\N	445	\N	0	\N
3173	\N	\N	destroy_task	2019-07-17 21:37:39.903756	2019-07-17 21:37:39.903756	\N	\N	446	\N	0	\N
3174	\N	\N	destroy_task	2019-07-17 21:37:39.917087	2019-07-17 21:37:39.917087	\N	\N	454	\N	0	\N
3175	\N	\N	destroy_task	2019-07-17 21:37:39.929052	2019-07-17 21:37:39.929052	\N	\N	458	\N	0	\N
3176	\N	\N	destroy_task	2019-07-17 21:37:39.940218	2019-07-17 21:37:39.940218	\N	\N	472	\N	0	\N
3177	\N	\N	destroy_task	2019-07-17 21:37:39.951081	2019-07-17 21:37:39.951081	\N	\N	473	\N	0	\N
3178	\N	\N	destroy_task	2019-07-17 21:37:39.994704	2019-07-17 21:37:39.994704	\N	\N	438	\N	0	\N
3179	\N	\N	destroy_task	2019-07-17 21:37:40.022441	2019-07-17 21:37:40.022441	\N	\N	439	\N	0	\N
3180	\N	\N	destroy_task	2019-07-17 21:37:40.036965	2019-07-17 21:37:40.036965	\N	\N	436	\N	0	\N
3181	\N	\N	destroy_task	2019-07-17 21:37:40.073654	2019-07-17 21:37:40.073654	\N	\N	443	\N	0	\N
3182	\N	\N	destroy_task	2019-07-17 21:37:40.086211	2019-07-17 21:37:40.086211	\N	\N	481	\N	0	\N
3183	\N	\N	destroy_task	2019-07-17 21:37:40.123486	2019-07-17 21:37:40.123486	\N	\N	367	\N	0	\N
3184	\N	\N	destroy_task	2019-07-17 21:37:40.148874	2019-07-17 21:37:40.148874	\N	\N	366	\N	0	\N
3185	\N	\N	destroy_task	2019-07-17 21:37:40.16207	2019-07-17 21:37:40.16207	\N	\N	372	\N	0	\N
3186	\N	\N	destroy_task	2019-07-17 21:37:40.176746	2019-07-17 21:37:40.176746	\N	\N	374	\N	0	\N
3187	\N	\N	destroy_task	2019-07-17 21:37:40.190887	2019-07-17 21:37:40.190887	\N	\N	373	\N	0	\N
3188	\N	\N	destroy_task	2019-07-17 21:37:40.211519	2019-07-17 21:37:40.211519	\N	\N	380	\N	0	\N
3189	\N	\N	destroy_task	2019-07-17 21:37:40.242974	2019-07-17 21:37:40.242974	\N	\N	379	\N	0	\N
3190	\N	\N	destroy_task	2019-07-17 21:37:40.270477	2019-07-17 21:37:40.270477	\N	\N	382	\N	0	\N
3191	\N	\N	destroy_task	2019-07-17 21:37:40.293132	2019-07-17 21:37:40.293132	\N	\N	377	\N	0	\N
3192	\N	\N	destroy_task	2019-07-17 21:37:40.312868	2019-07-17 21:37:40.312868	\N	\N	384	\N	0	\N
3193	\N	\N	destroy_task	2019-07-17 21:37:40.33072	2019-07-17 21:37:40.33072	\N	\N	385	\N	0	\N
3194	\N	\N	destroy_task	2019-07-17 21:37:40.345756	2019-07-17 21:37:40.345756	\N	\N	393	\N	0	\N
3195	\N	\N	destroy_task	2019-07-17 21:37:40.364534	2019-07-17 21:37:40.364534	\N	\N	403	\N	0	\N
3196	\N	\N	destroy_task	2019-07-17 21:37:40.379146	2019-07-17 21:37:40.379146	\N	\N	391	\N	0	\N
3197	\N	\N	destroy_task	2019-07-17 21:37:40.392623	2019-07-17 21:37:40.392623	\N	\N	390	\N	0	\N
3198	\N	\N	destroy_task	2019-07-17 21:37:40.421045	2019-07-17 21:37:40.421045	\N	\N	412	\N	0	\N
3199	\N	\N	destroy_task	2019-07-17 21:37:40.456844	2019-07-17 21:37:40.456844	\N	\N	406	\N	0	\N
3200	\N	\N	destroy_task	2019-07-17 21:37:40.474649	2019-07-17 21:37:40.474649	\N	\N	414	\N	0	\N
3201	\N	\N	destroy_task	2019-07-17 21:37:40.492154	2019-07-17 21:37:40.492154	\N	\N	407	\N	0	\N
3202	\N	\N	destroy_task	2019-07-17 21:37:40.505645	2019-07-17 21:37:40.505645	\N	\N	421	\N	0	\N
3203	\N	\N	destroy_task	2019-07-17 21:37:40.521446	2019-07-17 21:37:40.521446	\N	\N	416	\N	0	\N
3204	\N	\N	destroy_task	2019-07-17 21:37:40.535087	2019-07-17 21:37:40.535087	\N	\N	417	\N	0	\N
3205	\N	\N	destroy_task	2019-07-17 21:37:40.549031	2019-07-17 21:37:40.549031	\N	\N	418	\N	0	\N
3206	\N	\N	destroy_task	2019-07-17 21:37:40.56314	2019-07-17 21:37:40.56314	\N	\N	389	\N	0	\N
3207	\N	\N	destroy_task	2019-07-17 21:37:40.574289	2019-07-17 21:37:40.574289	\N	\N	429	\N	0	\N
3208	\N	\N	destroy_task	2019-07-17 21:37:40.589491	2019-07-17 21:37:40.589491	\N	\N	434	\N	0	\N
3209	\N	\N	destroy_task	2019-07-17 21:37:40.604632	2019-07-17 21:37:40.604632	\N	\N	422	\N	0	\N
3210	\N	\N	destroy_task	2019-07-17 21:37:40.615425	2019-07-17 21:37:40.615425	\N	\N	433	\N	0	\N
3211	\N	\N	destroy_task	2019-07-17 21:37:40.626879	2019-07-17 21:37:40.626879	\N	\N	474	\N	0	\N
3212	\N	\N	destroy_task	2019-07-17 21:37:40.64059	2019-07-17 21:37:40.64059	\N	\N	428	\N	0	\N
3213	\N	\N	destroy_task	2019-07-17 21:37:40.655234	2019-07-17 21:37:40.655234	\N	\N	404	\N	0	\N
3214	\N	\N	destroy_task	2019-07-17 21:37:40.668418	2019-07-17 21:37:40.668418	\N	\N	441	\N	0	\N
3215	\N	\N	destroy_task	2019-07-17 21:37:40.685661	2019-07-17 21:37:40.685661	\N	\N	435	\N	0	\N
3216	\N	\N	destroy_task	2019-07-17 21:37:40.707191	2019-07-17 21:37:40.707191	\N	\N	368	\N	0	\N
3217	\N	\N	destroy_task	2019-07-17 21:37:40.725165	2019-07-17 21:37:40.725165	\N	\N	460	\N	0	\N
3218	\N	\N	destroy_task	2019-07-17 21:37:40.74295	2019-07-17 21:37:40.74295	\N	\N	448	\N	0	\N
3219	\N	\N	destroy_task	2019-07-17 21:37:40.759434	2019-07-17 21:37:40.759434	\N	\N	462	\N	0	\N
3220	\N	\N	destroy_task	2019-07-17 21:37:40.776497	2019-07-17 21:37:40.776497	\N	\N	478	\N	0	\N
3221	\N	\N	destroy_task	2019-07-17 21:37:40.810978	2019-07-17 21:37:40.810978	\N	\N	479	\N	0	\N
3222	\N	\N	destroy_task	2019-07-17 21:37:40.84972	2019-07-17 21:37:40.84972	\N	\N	476	\N	0	\N
3223	\N	\N	destroy_task	2019-07-17 21:37:40.878762	2019-07-17 21:37:40.878762	\N	\N	477	\N	0	\N
3224	\N	\N	destroy_task	2019-07-17 21:37:40.911775	2019-07-17 21:37:40.911775	\N	\N	480	\N	0	\N
3225	\N	\N	destroy_task	2019-07-17 21:37:40.942543	2019-07-17 21:37:40.942543	\N	\N	482	\N	0	\N
3226	\N	\N	destroy_task	2019-07-17 21:37:40.970769	2019-07-17 21:37:40.970769	\N	\N	483	\N	0	\N
3227	\N	\N	destroy_task	2019-07-17 21:37:41.012947	2019-07-17 21:37:41.012947	\N	\N	341	\N	0	\N
3228	\N	\N	destroy_task	2019-07-17 21:37:41.039936	2019-07-17 21:37:41.039936	\N	\N	333	\N	0	\N
3229	\N	\N	destroy_task	2019-07-17 21:37:41.059761	2019-07-17 21:37:41.059761	\N	\N	347	\N	0	\N
3230	\N	\N	destroy_task	2019-07-17 21:37:41.08055	2019-07-17 21:37:41.08055	\N	\N	348	\N	0	\N
3231	\N	\N	destroy_task	2019-07-17 21:37:41.106365	2019-07-17 21:37:41.106365	\N	\N	349	\N	0	\N
3232	\N	\N	destroy_task	2019-07-17 21:37:41.136507	2019-07-17 21:37:41.136507	\N	\N	346	\N	0	\N
3235	\N	\N	destroy_task	2019-07-17 21:37:41.279542	2019-07-17 21:37:41.279542	\N	\N	338	\N	0	\N
3236	\N	\N	destroy_task	2019-07-17 21:37:41.340442	2019-07-17 21:37:41.340442	\N	\N	330	\N	0	\N
3237	\N	\N	destroy_task	2019-07-17 21:37:41.391461	2019-07-17 21:37:41.391461	\N	\N	356	\N	0	\N
3238	\N	\N	destroy_task	2019-07-17 21:37:41.43904	2019-07-17 21:37:41.43904	\N	\N	355	\N	0	\N
3239	\N	\N	destroy_task	2019-07-17 21:37:41.500036	2019-07-17 21:37:41.500036	\N	\N	363	\N	0	\N
3240	\N	\N	destroy_task	2019-07-17 21:37:41.530314	2019-07-17 21:37:41.530314	\N	\N	364	\N	0	\N
3241	\N	\N	destroy_task	2019-07-17 21:37:41.564197	2019-07-17 21:37:41.564197	\N	\N	369	\N	0	\N
3242	\N	\N	destroy_task	2019-07-17 21:37:41.590248	2019-07-17 21:37:41.590248	\N	\N	376	\N	0	\N
3243	\N	\N	destroy_task	2019-07-17 21:37:41.616804	2019-07-17 21:37:41.616804	\N	\N	371	\N	0	\N
3244	\N	\N	destroy_task	2019-07-17 21:37:41.649779	2019-07-17 21:37:41.649779	\N	\N	370	\N	0	\N
3245	\N	\N	destroy_task	2019-07-17 21:37:41.674991	2019-07-17 21:37:41.674991	\N	\N	381	\N	0	\N
3246	\N	\N	destroy_task	2019-07-17 21:37:41.693415	2019-07-17 21:37:41.693415	\N	\N	383	\N	0	\N
3247	\N	\N	destroy_task	2019-07-17 21:37:41.709234	2019-07-17 21:37:41.709234	\N	\N	386	\N	0	\N
3248	\N	\N	destroy_task	2019-07-17 21:37:41.728172	2019-07-17 21:37:41.728172	\N	\N	387	\N	0	\N
3249	\N	\N	destroy_task	2019-07-17 21:37:41.747453	2019-07-17 21:37:41.747453	\N	\N	388	\N	0	\N
3250	\N	\N	destroy_task	2019-07-17 21:37:41.766862	2019-07-17 21:37:41.766862	\N	\N	398	\N	0	\N
3251	\N	\N	destroy_task	2019-07-17 21:37:41.787021	2019-07-17 21:37:41.787021	\N	\N	409	\N	0	\N
3252	\N	\N	destroy_task	2019-07-17 21:37:41.801474	2019-07-17 21:37:41.801474	\N	\N	402	\N	0	\N
3253	\N	\N	destroy_task	2019-07-17 21:37:41.825615	2019-07-17 21:37:41.825615	\N	\N	408	\N	0	\N
3254	\N	\N	destroy_task	2019-07-17 21:37:41.8392	2019-07-17 21:37:41.8392	\N	\N	415	\N	0	\N
3255	\N	\N	destroy_task	2019-07-17 21:37:41.857339	2019-07-17 21:37:41.857339	\N	\N	410	\N	0	\N
3256	\N	\N	destroy_task	2019-07-17 21:37:41.874831	2019-07-17 21:37:41.874831	\N	\N	401	\N	0	\N
3257	\N	\N	destroy_task	2019-07-17 21:37:41.889292	2019-07-17 21:37:41.889292	\N	\N	375	\N	0	\N
3258	\N	\N	destroy_task	2019-07-17 21:37:41.907162	2019-07-17 21:37:41.907162	\N	\N	424	\N	0	\N
3259	\N	\N	destroy_task	2019-07-17 21:37:41.920167	2019-07-17 21:37:41.920167	\N	\N	425	\N	0	\N
3260	\N	\N	destroy_task	2019-07-17 21:37:41.931657	2019-07-17 21:37:41.931657	\N	\N	440	\N	0	\N
3261	\N	\N	destroy_task	2019-07-17 21:37:41.946478	2019-07-17 21:37:41.946478	\N	\N	426	\N	0	\N
3262	\N	\N	destroy_task	2019-07-17 21:37:41.962475	2019-07-17 21:37:41.962475	\N	\N	427	\N	0	\N
3263	\N	\N	destroy_task	2019-07-17 21:37:41.980969	2019-07-17 21:37:41.980969	\N	\N	423	\N	0	\N
3264	\N	\N	destroy_task	2019-07-17 21:37:42.004038	2019-07-17 21:37:42.004038	\N	\N	332	\N	0	\N
3265	\N	\N	destroy_task	2019-07-17 21:37:42.021559	2019-07-17 21:37:42.021559	\N	\N	344	\N	0	\N
3266	\N	\N	destroy_task	2019-07-17 21:37:42.04656	2019-07-17 21:37:42.04656	\N	\N	343	\N	0	\N
3267	\N	\N	destroy_task	2019-07-17 21:37:42.080115	2019-07-17 21:37:42.080115	\N	\N	342	\N	0	\N
3268	\N	\N	destroy_task	2019-07-17 21:37:42.102937	2019-07-17 21:37:42.102937	\N	\N	334	\N	0	\N
3269	\N	\N	destroy_task	2019-07-17 21:37:42.121678	2019-07-17 21:37:42.121678	\N	\N	350	\N	0	\N
3270	\N	\N	destroy_task	2019-07-17 21:37:42.143377	2019-07-17 21:37:42.143377	\N	\N	339	\N	0	\N
3271	\N	\N	destroy_task	2019-07-17 21:37:42.162159	2019-07-17 21:37:42.162159	\N	\N	337	\N	0	\N
3272	\N	\N	destroy_task	2019-07-17 21:37:42.182704	2019-07-17 21:37:42.182704	\N	\N	351	\N	0	\N
3273	\N	\N	destroy_task	2019-07-17 21:37:42.197549	2019-07-17 21:37:42.197549	\N	\N	354	\N	0	\N
3274	\N	\N	destroy_task	2019-07-17 21:37:42.21003	2019-07-17 21:37:42.21003	\N	\N	361	\N	0	\N
3275	\N	\N	destroy_task	2019-07-17 21:37:42.231323	2019-07-17 21:37:42.231323	\N	\N	331	\N	0	\N
3276	\N	\N	destroy_task	2019-07-17 21:37:42.247335	2019-07-17 21:37:42.247335	\N	\N	353	\N	0	\N
3277	\N	\N	destroy_task	2019-07-17 21:37:42.268474	2019-07-17 21:37:42.268474	\N	\N	365	\N	0	\N
3278	\N	\N	destroy_task	2019-07-17 21:37:42.283214	2019-07-17 21:37:42.283214	\N	\N	411	\N	0	\N
3279	\N	\N	destroy_task	2019-07-17 21:37:42.303482	2019-07-17 21:37:42.303482	\N	\N	352	\N	0	\N
3280	\N	\N	destroy_task	2019-07-17 21:37:42.319388	2019-07-17 21:37:42.319388	\N	\N	455	\N	0	\N
3281	\N	\N	destroy_task	2019-07-17 21:37:42.333368	2019-07-17 21:37:42.333368	\N	\N	475	\N	0	\N
3282	\N	\N	destroy_task	2019-07-17 21:45:56.50981	2019-07-17 21:45:56.50981	\N	\N	467	\N	0	\N
3283	\N	\N	destroy_task	2019-07-17 21:45:56.550733	2019-07-17 21:45:56.550733	\N	\N	464	\N	0	\N
3284	\N	\N	destroy_task	2019-07-17 21:45:56.557846	2019-07-17 21:45:56.557846	\N	\N	466	\N	0	\N
3312	\N	\N	update_task	2019-07-18 09:04:04.582817	2019-07-18 09:04:04.582817	\N	\N	491	\N	0	\N
3286	106	108	new_message	2019-07-17 22:41:56.510599	2019-07-19 14:04:12.438537	task1807	Mark  has accepted your work offer	484	352	1	108
3290	\N	106	new_task	2019-07-18 05:26:31.862332	2019-07-19 14:04:12.454553	task1807	app	486	\N	1	107
3289	106	108	new_message	2019-07-17 22:45:16.348058	2019-07-19 14:04:12.501642	task1807	Mark  has accepted your work offer	485	353	1	108
3292	106	107	new_message	2019-07-18 05:31:52.555934	2019-07-19 14:04:12.525299	tender1807	rtt	487	355	1	107
3293	106	107	new_message	2019-07-18 05:31:56.56712	2019-07-19 14:04:12.537072	tender1807	\N	487	355	1	107
3296	\N	106	new_task	2019-07-18 05:51:20.210383	2019-07-19 14:04:12.544161	task18073	admin	488	\N	1	108
3295	106	107	new_message	2019-07-18 05:32:58.512199	2019-07-19 14:04:12.60682	task1807	Mark  has accepted your work offer	486	354	1	107
3297	\N	106	new_task	2019-07-18 05:53:54.926309	2019-07-19 14:04:12.629398	task18073	admin	489	\N	1	108
3298	\N	106	new_task	2019-07-18 05:56:49.585153	2019-07-19 14:04:12.640349	task18076	app	490	\N	1	108
3294	106	107	new_message	2019-07-18 05:32:36.189386	2019-07-19 14:04:12.64533	tender1807	New Bid! \n I'll do it . 	487	355	1	107
3303	106	108	new_message	2019-07-18 06:36:15.423567	2019-07-19 14:04:12.725783	task18076	Mark  has accepted your work offer	490	358	1	108
3299	\N	106	new_task	2019-07-18 05:58:15.184027	2019-07-19 14:04:12.727064	task18079		491	\N	1	108
3302	106	108	new_message	2019-07-18 06:35:55.782837	2019-07-19 14:04:12.719461	tender18077	New Bid! \n уе по има. 	492	360	1	108
3301	106	108	new_message	2019-07-18 06:34:27.865505	2019-07-19 14:04:12.755998	task18079	Mark  has accepted your work offer	491	359	1	108
3304	107	106	new_message	2019-07-18 06:37:48.15943	2019-07-19 14:04:12.900307	tender1807	Congratulations! Mark : Your bid was accepted. 	487	355	1	107
3306	106	108	new_message	2019-07-18 06:40:55.757302	2019-07-19 14:04:13.439451	tender3	New Bid! \n кепм. 	493	361	1	108
3308	\N	106	new_task	2019-07-18 08:47:32.834607	2019-07-19 14:04:13.465886	task180710		494	\N	1	107
3307	107	106	new_message	2019-07-18 06:46:29.664672	2019-07-19 14:04:13.525385	tender3	Congratulations! Mark : Your bid was accepted. 	493	361	1	107
3310	8	106	new_message	2019-07-18 09:03:18.13431	2019-07-19 14:04:13.557364	task180710	super0 : Has confirmed your work.	494	362	1	107
3309	106	107	new_message	2019-07-18 08:47:59.790941	2019-07-19 14:04:13.630919	task180710	Mark  has accepted your work offer	494	362	1	107
3311	107	106	new_message	2019-07-18 09:03:45.893084	2019-07-19 14:04:13.676368	task180710	You have got a rating.	494	362	1	107
3313	107	106	new_message	2019-07-18 09:04:13.701745	2019-07-19 14:04:13.790975	task18079	super0 : Has confirmed your work.	491	359	1	107
3317	106	107	new_message	2019-07-18 09:06:25.480483	2019-07-19 14:04:14.180609	tender1807	Mark  — completed your task, please confirm	487	355	1	107
3315	107	106	new_message	2019-07-18 09:05:17.561733	2019-07-19 14:04:14.394547	tender3	super0 : Has confirmed your work.	493	361	1	107
3314	107	106	new_message	2019-07-18 09:04:20.032727	2019-07-19 14:04:14.515999	task18079	You have got a rating.	491	359	1	107
3316	107	106	new_message	2019-07-18 09:05:21.076743	2019-07-19 14:04:14.57698	tender3	You have got a rating.	493	361	1	107
3300	\N	\N	new_task	2019-07-18 06:32:37.559456	2019-07-19 14:04:15.247608	tender18077		492	\N	1	108
3291	\N	\N	new_task	2019-07-18 05:27:38.279457	2019-07-19 14:04:15.653319	tender1807	app	487	\N	1	107
3305	\N	\N	new_task	2019-07-18 06:40:26.872197	2019-07-19 14:04:16.278797	tender3		493	\N	1	108
3320	\N	\N	update_task	2019-07-18 20:38:05.313486	2019-07-18 20:38:05.313486	\N	\N	486	\N	0	\N
3321	\N	\N	new_task	2019-07-19 06:05:41.94886	2019-07-19 06:05:41.94886	fsdfsdf		496	\N	0	108
3323	\N	\N	destroy_task	2019-07-19 06:14:25.207959	2019-07-19 06:14:25.207959	\N	\N	496	\N	0	\N
3288	\N	106	new_task	2019-07-17 22:45:05.158751	2019-07-19 14:04:12.405806	task1807		485	\N	1	108
3285	\N	106	new_task	2019-07-17 22:39:57.509686	2019-07-19 14:04:12.406907	task1807		484	\N	1	108
3287	106	108	new_message	2019-07-17 22:41:59.116592	2019-07-19 14:04:12.412295	task1807	Mark  has accepted your work offer	484	352	1	108
3319	\N	\N	new_task	2019-07-18 19:05:18.232022	2019-07-19 14:04:14.090648	test		495	\N	1	108
3318	107	106	new_message	2019-07-18 09:07:44.089423	2019-07-19 14:04:14.458032	tender1807	You have got a rating.	487	355	1	107
3322	\N	\N	new_task	2019-07-19 06:10:31.585761	2019-07-19 14:04:14.476196	mytesttask		497	\N	1	108
3324	\N	\N	new_task	2019-07-19 06:21:29.387267	2019-07-19 14:04:14.723503	mytest3		498	\N	1	108
3325	\N	\N	new_task	2019-07-19 13:56:36.470278	2019-07-19 14:04:16.920321	task30032	dfsdfdsfdsfsd	499	\N	1	108
3326	\N	\N	new_task	2019-07-19 14:06:26.620562	2019-07-19 14:06:28.155797	dfgdfgdfgdfg	fgfdgfdgdfgdfg	500	\N	1	108
3327	\N	\N	destroy_task	2019-07-19 19:46:52.697248	2019-07-19 19:46:52.697248	\N	\N	484	\N	0	\N
3328	\N	\N	destroy_task	2019-07-19 19:46:52.721169	2019-07-19 19:46:52.721169	\N	\N	498	\N	0	\N
3329	\N	\N	destroy_task	2019-07-19 19:46:52.742956	2019-07-19 19:46:52.742956	\N	\N	485	\N	0	\N
3330	\N	\N	destroy_task	2019-07-19 19:46:52.750256	2019-07-19 19:46:52.750256	\N	\N	499	\N	0	\N
3331	\N	\N	destroy_task	2019-07-19 19:46:52.760765	2019-07-19 19:46:52.760765	\N	\N	488	\N	0	\N
3332	\N	\N	destroy_task	2019-07-19 19:46:52.770554	2019-07-19 19:46:52.770554	\N	\N	489	\N	0	\N
3333	\N	\N	destroy_task	2019-07-19 19:46:52.776949	2019-07-19 19:46:52.776949	\N	\N	495	\N	0	\N
3334	\N	\N	destroy_task	2019-07-19 19:46:52.786852	2019-07-19 19:46:52.786852	\N	\N	490	\N	0	\N
3335	\N	\N	destroy_task	2019-07-19 19:46:52.803997	2019-07-19 19:46:52.803997	\N	\N	492	\N	0	\N
3336	\N	\N	destroy_task	2019-07-19 19:46:52.810454	2019-07-19 19:46:52.810454	\N	\N	497	\N	0	\N
3337	\N	\N	destroy_task	2019-07-19 19:46:52.816898	2019-07-19 19:46:52.816898	\N	\N	500	\N	0	\N
3338	\N	109	new_task	2019-07-19 20:07:43.706111	2019-07-19 20:07:43.768518	task191	app	501	\N	1	110
3339	109	110	new_message	2019-07-19 20:10:39.172673	2019-07-19 20:10:39.242701	task191	Donna  has accepted your work offer	501	363	1	110
3340	\N	\N	update_task	2019-07-19 20:12:20.934494	2019-07-19 20:12:20.934494	\N	\N	501	\N	0	\N
3341	\N	\N	new_task	2019-07-19 20:16:33.82578	2019-07-19 20:16:35.336502	tender19072	app	502	\N	1	110
3342	109	110	new_message	2019-07-19 20:18:03.424011	2019-07-19 20:18:03.46795	tender19072	New Bid! \n app. 	502	364	1	110
3343	110	109	new_message	2019-07-19 20:20:00.443272	2019-07-19 20:20:00.489492	tender19072	Congratulations! Donna : Your bid was accepted. 	502	364	1	110
3344	\N	109	new_task	2019-07-19 20:25:34.044906	2019-07-19 20:25:34.094628	task1907	admin	503	\N	1	110
3345	109	110	new_message	2019-07-19 20:27:03.76064	2019-07-19 20:27:03.803566	task1907	Donna  has accepted your work offer	503	365	1	110
3346	8	109	new_message	2019-07-19 20:30:40.829103	2019-07-19 20:30:40.886698	task1907	Supervisor2 : Has confirmed your work.	503	365	1	110
3347	\N	109	new_task	2019-07-19 20:33:24.762461	2019-07-19 20:33:24.811212	task19075	admin	504	\N	1	110
3348	109	110	new_message	2019-07-19 20:33:39.837029	2019-07-19 20:33:39.887847	task19075	Donna  has accepted your work offer	504	366	1	110
3349	109	110	new_message	2019-07-19 20:33:42.339436	2019-07-19 20:33:42.382574	task19075	Donna  has accepted your work offer	504	366	1	110
3350	\N	\N	new_task	2019-07-19 20:43:28.68699	2019-07-19 20:43:30.142709	tender19078	admin	505	\N	1	110
3351	\N	109	new_task	2019-07-19 20:49:31.989336	2019-07-19 20:49:32.048487	task19079	admin	506	\N	1	110
3352	109	110	new_message	2019-07-19 20:51:37.178147	2019-07-19 20:51:37.231751	task19079	Donna  has accepted your work offer	506	367	1	110
3353	\N	109	new_task	2019-07-19 20:54:02.130521	2019-07-19 20:54:02.179381	task25-5		507	\N	1	110
3354	109	110	new_message	2019-07-19 20:54:18.598387	2019-07-19 20:54:18.653267	task25-5	Donna  has accepted your work offer	507	368	1	110
3355	109	110	new_message	2019-07-19 20:55:24.395543	2019-07-19 20:55:24.447255	tender19078	New Bid! \n app. 	505	369	1	110
3356	110	109	new_message	2019-07-19 20:56:07.191746	2019-07-19 20:56:07.251205	tender19078	Congratulations! Donna : Your bid was accepted. 	505	369	1	110
3357	8	109	new_message	2019-07-19 20:58:42.555346	2019-07-19 20:58:42.60647	tender19078	Supervisor2 : Has confirmed your work.	505	369	1	110
3358	\N	111	new_task	2019-07-20 08:29:31.774263	2019-07-20 08:29:31.819962	peluhnya	dasdasdasdasddsa	508	\N	1	110
3359	111	110	new_message	2019-07-20 08:34:15.949045	2019-07-20 08:34:16.00013	peluhnya	Garry dfdffd  has accepted your work offer	508	370	1	110
3360	\N	111	new_message	2019-07-20 08:46:40.717737	2019-07-20 08:46:40.788984	peluhnya	Please confirm the Change Order	508	370	1	110
3361	\N	109	new_task	2019-07-21 19:58:14.522253	2019-07-21 19:58:14.579533	231231312	312321312132	509	\N	1	110
3362	\N	109	new_task	2019-07-22 18:14:33.228619	2019-07-22 18:14:33.302514	task2207		510	\N	1	107
3363	109	107	new_message	2019-07-22 18:14:50.675108	2019-07-22 18:14:50.733059	task2207	Donna  has accepted your work offer	510	372	1	107
3364	109	107	new_message	2019-07-22 18:14:53.25139	2019-07-22 18:14:53.306297	task2207	Donna  has accepted your work offer	510	372	1	107
3365	\N	\N	new_task	2019-07-22 18:29:46.693196	2019-07-22 18:29:47.836333	city	city yest	511	\N	1	82
3366	\N	\N	new_task	2019-07-22 18:44:49.763422	2019-07-22 18:44:51.025133	city2	city2 desk	512	\N	1	82
3367	\N	\N	new_task	2019-07-22 18:55:42.726385	2019-07-22 18:55:43.811666	city 33333	fgu	513	\N	1	82
3368	\N	\N	update_task	2019-07-22 19:14:54.622121	2019-07-22 19:14:54.622121	\N	\N	513	\N	0	\N
3369	\N	\N	update_task	2019-07-22 19:15:34.185975	2019-07-22 19:15:34.185975	\N	\N	513	\N	0	\N
3370	\N	\N	update_task	2019-07-22 19:17:12.276313	2019-07-22 19:17:12.276313	\N	\N	513	\N	0	\N
3371	\N	\N	update_task	2019-07-22 19:18:26.515609	2019-07-22 19:18:26.515609	\N	\N	513	\N	0	\N
3372	\N	\N	update_task	2019-07-22 19:18:42.35894	2019-07-22 19:18:42.35894	\N	\N	513	\N	0	\N
3373	\N	\N	update_task	2019-07-22 19:19:24.272691	2019-07-22 19:19:24.272691	\N	\N	513	\N	0	\N
3374	\N	\N	update_task	2019-07-22 19:27:56.977625	2019-07-22 19:27:56.977625	\N	\N	513	\N	0	\N
3375	\N	\N	update_task	2019-07-22 19:46:06.54328	2019-07-22 19:46:06.54328	\N	\N	513	\N	0	\N
3376	\N	111	new_task	2019-07-22 19:50:56.459335	2019-07-22 19:50:56.518827	New test title task 34sdf3	fdsfsdfds sdf dsf sd f ds	514	\N	1	110
3377	\N	\N	update_task	2019-07-22 19:54:02.359082	2019-07-22 19:54:02.359082	\N	\N	513	\N	0	\N
3378	\N	\N	update_task	2019-07-22 19:57:43.177219	2019-07-22 19:57:43.177219	\N	\N	513	\N	0	\N
3379	\N	\N	update_task	2019-07-22 19:59:02.85182	2019-07-22 19:59:02.85182	\N	\N	452	\N	0	\N
3380	\N	\N	update_task	2019-07-22 19:59:24.864416	2019-07-22 19:59:24.864416	\N	\N	452	\N	0	\N
3381	\N	\N	update_task	2019-07-22 19:59:59.627068	2019-07-22 19:59:59.627068	\N	\N	512	\N	0	\N
3382	\N	\N	update_task	2019-07-22 20:00:15.530699	2019-07-22 20:00:15.530699	\N	\N	512	\N	0	\N
3383	\N	109	new_task	2019-07-22 20:31:00.689533	2019-07-22 20:31:00.749525	task2330		515	\N	1	107
3384	109	107	new_message	2019-07-22 20:31:15.363978	2019-07-22 20:31:15.41377	task2330	Donna  has accepted your work offer	515	374	1	107
3385	\N	109	new_task	2019-07-22 20:34:01.198217	2019-07-22 20:34:01.251866	task2333	adm	516	\N	1	107
3386	109	107	new_message	2019-07-22 20:34:52.565255	2019-07-22 20:34:52.614509	task2333	Donna  has accepted your work offer	516	375	1	107
3387	\N	109	new_task	2019-07-22 20:43:37.355874	2019-07-22 20:43:37.408813	task2343	app	517	\N	1	107
3388	109	107	new_message	2019-07-22 20:44:14.654974	2019-07-22 20:44:14.702971	task2343	Donna  has accepted your work offer	517	376	1	107
3389	\N	109	new_task	2019-07-22 20:49:11.729198	2019-07-22 20:49:11.782066	task2348		518	\N	1	107
3390	\N	\N	new_task	2019-07-22 20:52:46.053738	2019-07-22 20:52:47.367192	tender2352		519	\N	1	107
3391	\N	109	new_task	2019-07-22 21:35:14.165041	2019-07-22 21:35:14.229786	task	app	520	\N	1	107
3392	\N	111	new_task	2019-07-23 09:30:59.486471	2019-07-23 09:30:59.542264	4324234234		521	\N	1	110
3393	\N	107	new_task	2019-08-06 21:27:48.590254	2019-08-06 21:27:48.590254	task test	vccbmgjhjcmnjhb	522	\N	0	110
3394	\N	107	new_task	2019-08-06 21:30:55.434544	2019-08-06 21:30:55.434544	task	gshjhd	523	\N	0	107
3395	\N	107	new_task	2019-08-06 21:34:52.527865	2019-08-06 21:34:52.527865	task034	xzczfsdgvfdbhgxgdfc	524	\N	0	110
3396	109	110	new_message	2019-08-06 21:36:23.929027	2019-08-06 21:36:23.929027	task034	Donna  has accepted your work offer	524	382	0	110
3397	109	110	new_message	2019-08-06 21:36:25.837631	2019-08-06 21:36:25.837631	task034	Donna  has accepted your work offer	524	382	0	110
3398	107	110	new_message	2019-08-06 21:37:01.508712	2019-08-06 21:37:01.508712	task test	super0  has accepted your work offer	522	380	0	110
3399	\N	107	new_task	2019-08-09 08:16:24.662565	2019-08-09 08:16:24.662565	task1113	rfghj gyjvf hffhjj hhjgghj	525	\N	0	110
3400	\N	111	new_task	2019-08-12 08:44:40.267595	2019-08-12 08:44:40.267595	task25-5	српоспно	526	\N	0	110
3401	\N	\N	destroy_task	2019-08-12 08:47:13.811385	2019-08-12 08:47:13.811385	\N	\N	526	\N	0	\N
3402	\N	107	new_task	2019-08-12 08:48:01.690144	2019-08-12 08:48:01.690144	task25-5	FHXTYGFJXG	527	\N	0	110
3403	\N	107	new_task	2019-08-12 08:50:05.587494	2019-08-12 08:50:05.587494	task25-4	ZDRGTR	528	\N	0	110
3426	\N	107	new_task	2019-08-12 09:01:48.423764	2019-08-12 09:01:48.423764	task25-5	fcjcghyui	529	\N	0	110
3427	\N	\N	destroy_task	2019-08-12 09:01:50.777675	2019-08-12 09:01:50.777675	\N	\N	522	\N	0	\N
3428	\N	\N	destroy_task	2019-08-12 09:01:50.810183	2019-08-12 09:01:50.810183	\N	\N	525	\N	0	\N
3429	\N	\N	destroy_task	2019-08-12 09:01:50.835886	2019-08-12 09:01:50.835886	\N	\N	529	\N	0	\N
3430	\N	\N	destroy_task	2019-08-12 09:01:50.858881	2019-08-12 09:01:50.858881	\N	\N	527	\N	0	\N
3431	\N	\N	destroy_task	2019-08-12 09:01:50.890151	2019-08-12 09:01:50.890151	\N	\N	523	\N	0	\N
3432	\N	\N	destroy_task	2019-08-12 09:01:50.912872	2019-08-12 09:01:50.912872	\N	\N	528	\N	0	\N
3433	\N	\N	destroy_task	2019-08-12 09:01:50.951655	2019-08-12 09:01:50.951655	\N	\N	494	\N	0	\N
3434	\N	\N	destroy_task	2019-08-12 09:01:50.982025	2019-08-12 09:01:50.982025	\N	\N	491	\N	0	\N
3435	\N	\N	destroy_task	2019-08-12 09:01:51.058546	2019-08-12 09:01:51.058546	\N	\N	487	\N	0	\N
3436	\N	\N	destroy_task	2019-08-12 09:01:51.086137	2019-08-12 09:01:51.086137	\N	\N	515	\N	0	\N
3437	\N	\N	destroy_task	2019-08-12 09:01:51.12014	2019-08-12 09:01:51.12014	\N	\N	486	\N	0	\N
3438	\N	\N	destroy_task	2019-08-12 09:01:51.146618	2019-08-12 09:01:51.146618	\N	\N	516	\N	0	\N
3439	\N	\N	destroy_task	2019-08-12 09:01:51.172184	2019-08-12 09:01:51.172184	\N	\N	517	\N	0	\N
3440	\N	\N	destroy_task	2019-08-12 09:01:51.195625	2019-08-12 09:01:51.195625	\N	\N	518	\N	0	\N
3441	\N	\N	destroy_task	2019-08-12 09:01:51.21126	2019-08-12 09:01:51.21126	\N	\N	519	\N	0	\N
3442	\N	\N	destroy_task	2019-08-12 09:01:51.241867	2019-08-12 09:01:51.241867	\N	\N	493	\N	0	\N
3443	\N	\N	destroy_task	2019-08-12 09:01:51.264751	2019-08-12 09:01:51.264751	\N	\N	520	\N	0	\N
3444	\N	\N	destroy_task	2019-08-12 09:01:51.290802	2019-08-12 09:01:51.290802	\N	\N	510	\N	0	\N
3445	\N	\N	destroy_task	2019-08-12 09:01:51.294817	2019-08-12 09:01:51.294817	\N	\N	522	\N	0	\N
3446	\N	\N	destroy_task	2019-08-12 09:01:51.297215	2019-08-12 09:01:51.297215	\N	\N	525	\N	0	\N
3447	\N	\N	destroy_task	2019-08-12 09:01:51.299565	2019-08-12 09:01:51.299565	\N	\N	529	\N	0	\N
3448	\N	\N	destroy_task	2019-08-12 09:01:51.301898	2019-08-12 09:01:51.301898	\N	\N	527	\N	0	\N
3449	\N	\N	destroy_task	2019-08-12 09:01:51.304146	2019-08-12 09:01:51.304146	\N	\N	523	\N	0	\N
3450	\N	\N	destroy_task	2019-08-12 09:01:51.306389	2019-08-12 09:01:51.306389	\N	\N	528	\N	0	\N
3451	\N	112	new_task	2019-08-12 09:17:03.909962	2019-08-12 09:17:03.909962	task25-5	bgfthfgh	530	\N	0	110
3452	112	110	new_message	2019-08-12 09:17:55.569345	2019-08-12 09:17:55.569345	task25-5	legal  has accepted your work offer	530	388	0	110
3453	\N	112	new_message	2019-08-12 09:18:40.995082	2019-08-12 09:18:40.995082	task25-5	Please confirm the Change Order	530	388	0	110
3454	\N	112	new_message	2019-08-12 09:19:33.647851	2019-08-12 09:19:33.647851	task25-5	Back Charge	530	388	0	110
3455	\N	110	new_message	2019-08-12 09:19:58.15457	2019-08-12 09:19:58.15457	task25-5	Budget has changed	530	388	0	110
3456	8	109	new_message	2019-08-12 15:56:34.314447	2019-08-12 15:56:34.314447	task19079	Supervisor2 : Has confirmed your work.	506	367	0	110
3457	\N	109	new_task	2019-08-12 16:10:12.521234	2019-08-12 16:10:12.521234	task1904		531	\N	0	110
3458	109	110	new_message	2019-08-12 16:11:21.609152	2019-08-12 16:11:21.609152	task1904	Donna  has accepted your work offer	531	389	0	110
3459	8	109	new_message	2019-08-12 16:15:57.515395	2019-08-12 16:15:57.515395	task1904	Supervisor2 : Has confirmed your work.	531	389	0	110
3460	\N	109	new_task	2019-08-12 16:28:47.528069	2019-08-12 16:28:47.528069	task1928	рекрек	532	\N	0	110
3461	\N	\N	new_task	2019-08-12 16:29:32.210076	2019-08-12 16:29:32.210076	tender1929		533	\N	0	110
3462	109	110	new_message	2019-08-12 17:11:15.136901	2019-08-12 17:11:15.136901	task1928	Donna  has accepted your work offer	532	390	0	110
3463	109	110	new_message	2019-08-12 17:11:18.966773	2019-08-12 17:11:18.966773	task1928	Donna  has accepted your work offer	532	390	0	110
3464	109	110	new_message	2019-08-12 17:11:33.795871	2019-08-12 17:11:33.795871	task1928	Donna  — completed your task, please confirm	532	390	0	110
3465	109	110	new_message	2019-08-12 17:11:54.489358	2019-08-12 17:11:54.489358	tender1929	New Bid! \n . 	533	391	0	110
3466	110	109	new_message	2019-08-12 17:12:46.376651	2019-08-12 17:12:46.376651	tender1929	Congratulations! Donna : Your bid was accepted. 	533	391	0	110
3467	110	109	new_message	2019-08-12 17:13:07.091913	2019-08-12 17:13:07.091913	tender1929	Supervisor2 : Has confirmed your work.	533	391	0	110
3468	110	109	new_message	2019-08-12 17:13:09.587643	2019-08-12 17:13:09.587643	tender1929	You have got a rating.	533	391	0	110
3469	\N	112	new_task	2019-08-13 08:24:13.041716	2019-08-13 08:24:13.041716	task25-5	jhkg,red	534	\N	0	110
3470	112	110	new_message	2019-08-13 08:29:00.02944	2019-08-13 08:29:00.02944	task25-5	legal  has accepted your work offer	534	392	0	110
3471	\N	112	new_message	2019-08-13 08:30:36.805996	2019-08-13 08:30:36.805996	task25-5	Please confirm the Change Order	534	392	0	110
3472	\N	112	new_message	2019-08-13 08:30:49.553575	2019-08-13 08:30:49.553575	task25-5	Back Charge	534	392	0	110
3473	\N	110	new_message	2019-08-13 08:32:23.739535	2019-08-13 08:32:23.739535	task25-5	Budget has changed	534	392	0	110
3474	8	112	new_message	2019-08-13 08:35:49.061673	2019-08-13 08:35:49.061673	task25-5	Supervisor2 : Has confirmed your work.	534	392	0	110
3475	\N	112	new_task	2019-08-13 11:38:15.994285	2019-08-13 11:38:15.994285	task1437	fdgfrfg	535	\N	0	110
3476	\N	\N	new_task	2019-08-13 11:38:59.3564	2019-08-13 11:38:59.3564	tesnder1438	vsdfdse	536	\N	0	110
3477	109	110	new_message	2019-08-13 11:40:02.92196	2019-08-13 11:40:02.92196	tesnder1438	New Bid! \n . 	536	394	0	110
3478	109	110	new_message	2019-08-13 11:42:28.828022	2019-08-13 11:42:28.828022	task1437	Donna  has accepted your work offer	535	393	0	110
3479	109	110	new_message	2019-08-13 11:42:31.056803	2019-08-13 11:42:31.056803	task1437	Donna  has accepted your work offer	535	393	0	110
3480	110	109	new_message	2019-08-13 11:45:17.696102	2019-08-13 11:45:17.696102	tesnder1438	Congratulations! Donna : Your bid was accepted. 	536	394	0	110
3481	8	109	new_message	2019-08-13 11:45:34.98992	2019-08-13 11:45:34.98992	task1437	Supervisor2 : Has confirmed your work.	535	393	0	110
3482	110	109	new_message	2019-08-13 11:46:12.654169	2019-08-13 11:46:12.654169	tesnder1438	Supervisor2 : Has confirmed your work.	536	394	0	110
3483	110	109	new_message	2019-08-13 11:46:14.717796	2019-08-13 11:46:14.717796	tesnder1438	You have got a rating.	536	394	0	110
3484	\N	109	new_task	2019-08-13 21:27:43.091024	2019-08-13 21:27:43.091024	task0026	zdfgthuy	537	\N	0	110
3485	\N	\N	destroy_task	2019-08-13 21:27:50.983589	2019-08-13 21:27:50.983589	\N	\N	537	\N	0	\N
3486	\N	109	new_task	2019-08-13 21:28:29.840159	2019-08-13 21:28:29.840159	task0022	xgfhgh	538	\N	0	110
3487	109	110	new_message	2019-08-13 21:29:00.220589	2019-08-13 21:29:00.220589	task0022	Donna  has accepted your work offer	538	396	0	110
3488	\N	109	new_message	2019-08-13 21:30:39.169932	2019-08-13 21:30:39.169932	task0022	Please confirm the Change Order	538	396	0	110
3489	\N	109	new_message	2019-08-13 21:30:49.852979	2019-08-13 21:30:49.852979	task0022	Back Charge	538	396	0	110
3490	\N	110	new_message	2019-08-13 21:31:49.19766	2019-08-13 21:31:49.19766	task0022	Budget has changed	538	396	0	110
3491	8	109	new_message	2019-08-13 21:34:29.705476	2019-08-13 21:34:29.705476	task0022	Supervisor2 : Has confirmed your work.	538	396	0	110
3492	\N	\N	new_task	2019-08-13 21:36:53.465752	2019-08-13 21:36:53.465752	tender0036	eadsasdf	539	\N	0	110
3493	109	110	new_message	2019-08-13 21:37:33.68748	2019-08-13 21:37:33.68748	tender0036	New Bid! \n . 	539	397	0	110
3494	109	110	new_message	2019-08-13 21:37:42.49375	2019-08-13 21:37:42.49375	tender0036	New Bid! \n . 	539	397	0	110
3495	\N	\N	new_task	2019-08-13 21:38:41.257302	2019-08-13 21:38:41.257302	task0406		540	\N	0	110
3496	\N	109	new_task	2019-08-13 21:39:20.468864	2019-08-13 21:39:20.468864	tas3	dasdeefdew	541	\N	0	110
3497	\N	\N	destroy_task	2019-08-13 21:41:33.303541	2019-08-13 21:41:33.303541	\N	\N	541	\N	0	\N
3498	\N	109	new_task	2019-08-13 21:42:00.68208	2019-08-13 21:42:00.68208	task25-5		542	\N	0	110
3499	\N	109	new_message	2019-08-13 21:43:00.367575	2019-08-13 21:43:00.367575	task19075	Please confirm the Change Order	504	366	0	110
3500	\N	109	new_message	2019-08-13 21:43:10.056975	2019-08-13 21:43:10.056975	task19075	Back Charge	504	366	0	110
3501	\N	109	new_task	2019-08-13 21:45:03.808262	2019-08-13 21:45:03.808262	task0406		543	\N	0	110
3502	109	110	new_message	2019-08-13 21:45:51.72579	2019-08-13 21:45:51.72579	task0406	Donna  has accepted your work offer	543	400	0	110
3503	\N	109	new_message	2019-08-13 21:46:32.8177	2019-08-13 21:46:32.8177	task0406	Please confirm the Change Order	543	400	0	110
3504	\N	\N	update_task	2019-08-14 21:03:44.536832	2019-08-14 21:03:44.536832	\N	\N	457	\N	0	\N
3505	\N	\N	update_task	2019-08-14 21:04:35.174529	2019-08-14 21:04:35.174529	\N	\N	457	\N	0	\N
3506	\N	\N	update_task	2019-08-14 21:06:01.313639	2019-08-14 21:06:01.313639	\N	\N	336	\N	0	\N
3507	\N	109	new_task	2019-08-15 08:27:08.724332	2019-08-15 08:27:08.724332	task1508admin		544	\N	0	110
3508	\N	109	new_task	2019-08-15 08:33:37.428977	2019-08-15 08:33:37.428977	task1508	fdgfghfgh	545	\N	0	110
3509	109	110	new_message	2019-08-15 08:45:53.912205	2019-08-15 08:45:53.912205	task1508admin	Donna  has accepted your work offer	544	401	0	110
3510	\N	\N	new_task	2019-08-15 08:46:51.701196	2019-08-15 08:46:51.701196	tender1508	ewfawgfatr	546	\N	0	110
3511	\N	\N	new_task	2019-08-15 08:47:38.635259	2019-08-15 08:47:38.635259	tender15082	faerferfter	547	\N	0	110
3512	109	110	new_message	2019-08-15 08:49:25.246593	2019-08-15 08:49:25.246593	tender15082	New Bid! \n амррр. 	547	403	0	110
3513	109	110	new_message	2019-08-15 08:57:29.64094	2019-08-15 08:57:29.64094	tender1508	New Bid! \n . 	546	404	0	110
3514	\N	109	new_task	2019-08-15 08:59:20.931364	2019-08-15 08:59:20.931364	task	cghh	548	\N	0	110
3515	109	110	new_message	2019-08-15 09:02:48.344436	2019-08-15 09:02:48.344436	task	Donna  has accepted your work offer	548	405	0	110
3516	\N	109	new_message	2019-08-15 09:03:44.772401	2019-08-15 09:03:44.772401	task	Please confirm the Change Order	548	405	0	110
3517	\N	109	new_message	2019-08-15 09:04:03.61946	2019-08-15 09:04:03.61946	task	Back Charge	548	405	0	110
3518	\N	109	new_task	2019-08-15 09:05:05.515456	2019-08-15 09:05:05.515456	task	hhccf	549	\N	0	110
3519	\N	\N	update_task	2019-08-15 09:06:09.055136	2019-08-15 09:06:09.055136	\N	\N	549	\N	0	\N
3520	\N	\N	new_task	2019-08-15 19:00:32.166698	2019-08-15 19:00:32.166698	testgj	hv	550	\N	0	82
3521	\N	109	new_task	2019-08-15 20:38:46.422962	2019-08-15 20:38:46.422962	task123	gffgg	551	\N	0	110
3522	\N	\N	new_task	2019-08-15 20:40:01.564338	2019-08-15 20:40:01.564338	tender	fgghhj	552	\N	0	110
3523	109	110	new_message	2019-08-15 20:44:17.544837	2019-08-15 20:44:17.544837	task123	Donna  has accepted your work offer	551	407	0	110
3524	\N	109	new_message	2019-08-15 20:45:14.868275	2019-08-15 20:45:14.868275	task123	Please confirm the Change Order	551	407	0	110
3525	\N	109	new_message	2019-08-15 20:46:27.212355	2019-08-15 20:46:27.212355	task123	Back Charge	551	407	0	110
3526	\N	\N	new_task	2019-08-15 20:47:27.383231	2019-08-15 20:47:27.383231	tender2	gvhhj	553	\N	0	110
3527	109	110	new_message	2019-08-15 20:53:48.323365	2019-08-15 20:53:48.323365	tender	New Bid! \n rdfg. 	552	408	0	110
3528	109	110	new_message	2019-08-15 20:54:06.649852	2019-08-15 20:54:06.649852	tender2	New Bid! \n rgghhh. 	553	409	0	110
3529	\N	109	new_task	2019-08-15 20:58:16.961399	2019-08-15 20:58:16.961399	task	ffghh	554	\N	0	110
3530	\N	109	new_task	2019-08-15 21:20:21.958064	2019-08-15 21:20:21.958064	tas	fvbj	555	\N	0	110
3531	\N	109	new_message	2019-08-15 21:23:46.251197	2019-08-15 21:23:46.251197	task123	Please confirm the Change Order	551	407	0	110
3532	\N	109	new_message	2019-08-15 21:25:08.20335	2019-08-15 21:25:08.20335	task123	Please confirm the Change Order	551	407	0	110
3533	\N	109	new_message	2019-08-15 21:26:51.310864	2019-08-15 21:26:51.310864	task123	Please confirm the Change Order	551	407	0	110
3534	\N	109	new_message	2019-08-15 21:28:47.054843	2019-08-15 21:28:47.054843	task123	Please confirm the Change Order	551	407	0	110
3535	\N	109	new_message	2019-08-15 21:29:07.941816	2019-08-15 21:29:07.941816	task123	Please confirm the Change Order	551	407	0	110
3536	\N	109	new_message	2019-08-15 21:29:53.49814	2019-08-15 21:29:53.49814	task123	Please confirm the Change Order	551	407	0	110
3537	\N	109	new_message	2019-08-15 21:33:12.719538	2019-08-15 21:33:12.719538	task123	Back Charge	551	407	0	110
3538	8	109	new_message	2019-08-15 21:41:16.800533	2019-08-15 21:41:16.800533	task123	Supervisor2 : Has confirmed your work.	551	407	0	110
3539	\N	109	new_task	2019-08-17 20:20:02.650642	2019-08-17 20:20:02.650642	task2319	tfghhh	556	\N	0	110
3544	109	82	new_message	2019-08-19 15:48:45.959308	2019-08-19 15:48:50.393793	task for test chat	Добрый	336	413	1	82
3543	82	109	new_message	2019-08-19 15:48:41.749885	2019-08-19 15:48:50.395298	task for test chat	привет	336	413	1	82
3542	109	82	new_message	2019-08-19 15:48:32.150651	2019-08-19 15:48:50.40027	task for test chat	Привет	336	413	1	82
3541	109	82	new_message	2019-08-19 15:42:05.564594	2019-08-19 15:48:50.391226	task for test chat	Как дела?	336	413	1	82
3540	109	82	new_message	2019-08-19 15:41:02.702792	2019-08-19 15:48:50.40446	task for test chat	Привет	336	413	1	82
3545	109	82	new_message	2019-08-19 15:49:54.94079	2019-08-19 15:49:54.995184	task for test chat	Город	336	413	1	82
3546	82	109	new_message	2019-08-19 15:50:17.908227	2019-08-19 15:50:17.969737	task for test chat	тт	336	413	1	82
3547	109	82	new_message	2019-08-19 15:50:29.763274	2019-08-19 15:50:29.835987	task for test chat	Ррр	336	413	1	82
3550	82	109	new_message	2019-08-19 16:17:28.678572	2019-08-19 16:18:08.807762	task for test chat	шгг	336	413	1	82
3549	82	109	new_message	2019-08-19 16:17:24.617628	2019-08-19 16:18:08.814581	task for test chat	пол	336	413	1	82
3551	109	82	new_message	2019-08-19 16:17:41.434738	2019-08-19 16:18:08.818105	task for test chat	555	336	413	1	82
3548	109	82	new_message	2019-08-19 16:17:20.541629	2019-08-19 16:18:08.805677	task for test chat	Шрлш	336	413	1	82
3552	109	82	new_message	2019-08-19 16:18:19.914658	2019-08-19 16:18:19.980963	task for test chat	Оолл	336	413	1	82
3553	109	82	new_message	2019-08-19 16:18:23.63391	2019-08-19 16:18:23.684842	task for test chat	7оош	336	413	1	82
3554	109	82	new_message	2019-08-19 16:18:25.801445	2019-08-19 16:18:25.86766	task for test chat	7олл	336	413	1	82
3555	82	109	new_message	2019-08-19 16:18:35.946951	2019-08-19 16:18:35.999407	task for test chat	гаргро	336	413	1	82
3556	82	109	new_message	2019-08-19 16:18:45.615671	2019-08-19 16:18:45.666712	task for test chat	пилш	336	413	1	82
3557	109	82	new_message	2019-08-19 16:18:48.938878	2019-08-19 16:18:49.017444	task for test chat	Ррол	336	413	1	82
3558	82	109	new_message	2019-08-19 16:27:11.598471	2019-08-19 16:27:11.670973	task for test chat	оо	336	413	1	82
3559	109	82	new_message	2019-08-19 16:27:17.968877	2019-08-19 16:27:18.022773	task for test chat	Моо	336	413	1	82
3560	109	82	new_message	2019-08-19 16:28:44.38598	2019-08-19 16:28:44.452728	task for test chat	Нг	336	413	1	82
3561	82	109	new_message	2019-08-19 16:28:49.010732	2019-08-19 16:28:49.059783	task for test chat	пи	336	413	1	82
3562	109	82	new_message	2019-08-19 17:08:12.120449	2019-08-19 17:08:12.20557	task for test chat	Нроош	336	413	1	82
3563	109	82	new_message	2019-08-19 17:08:15.723408	2019-08-19 17:08:15.772439	task for test chat	Нггг	336	413	1	82
3567	82	109	new_message	2019-08-19 19:50:09.82833	2019-08-19 19:51:29.220702	task for test chat	ррл	336	413	1	82
3565	82	109	new_message	2019-08-19 19:49:27.779965	2019-08-19 19:51:29.217751	task for test chat	нрг	336	413	1	82
3566	109	82	new_message	2019-08-19 19:49:46.017205	2019-08-19 19:51:29.21432	task for test chat	Гощщ	336	413	1	82
3568	82	109	new_message	2019-08-19 19:50:14.734962	2019-08-19 19:51:29.247562	task for test chat	олл	336	413	1	82
3564	82	109	new_message	2019-08-19 19:48:53.881238	2019-08-19 19:51:29.244592	task for test chat	орш	336	413	1	82
3569	82	109	new_message	2019-08-19 19:50:57.614379	2019-08-19 19:51:29.327306	task for test chat	сс	336	413	1	82
3570	109	82	new_message	2019-08-19 19:51:00.720882	2019-08-19 19:51:29.331591	task for test chat	54 ате	336	413	1	82
3571	109	82	new_message	2019-08-19 20:22:56.376273	2019-08-19 20:22:56.454873	task for test chat	Гоолп	336	413	1	82
3572	109	82	new_message	2019-08-19 20:23:07.494018	2019-08-19 20:23:07.550541	task for test chat	Пн	336	413	1	82
3573	109	82	new_message	2019-08-19 20:23:11.211666	2019-08-19 20:23:11.265408	task for test chat	55555	336	413	1	82
3574	109	82	new_message	2019-08-19 20:23:19.215897	2019-08-19 20:23:19.274419	task for test chat	Ррроо	336	413	1	82
3575	109	82	new_message	2019-08-19 20:24:05.429464	2019-08-19 20:24:05.541344	task for test chat	Еен	336	413	1	82
3576	109	82	new_message	2019-08-19 20:24:13.762893	2019-08-19 20:24:13.813121	task for test chat	Нрош	336	413	1	82
3577	82	109	new_message	2019-08-21 18:20:56.312756	2019-09-02 13:56:36.887851	task for test chat	рол	336	413	1	82
3578	109	82	new_message	2019-08-21 18:21:23.426759	2019-09-02 13:56:36.891594	task for test chat	New Bid! \n 25.88 	336	413	1	82
3583	\N	109	new_message	2019-08-21 18:37:38.879609	2019-09-02 13:56:36.894547	task for test chat	Please confirm the Change Order	336	413	1	82
3582	\N	109	new_message	2019-08-21 18:32:31.427447	2019-09-02 13:56:36.895578	task for test chat	Please confirm the Change Order	336	413	1	82
3585	\N	109	new_message	2019-08-21 19:16:27.719636	2019-09-02 13:56:36.964257	task for test chat	Please confirm the Change Order	336	413	1	82
3586	\N	109	new_message	2019-08-21 19:16:28.58954	2019-09-02 13:56:36.965307	task for test chat	Please confirm the Change Order	336	413	1	82
3581	\N	109	new_message	2019-08-21 18:30:17.415337	2019-09-02 13:56:36.966195	task for test chat	Please confirm the Change Order	336	413	1	82
3579	109	82	new_message	2019-08-21 18:23:29.68924	2019-09-02 13:56:36.967887	task for test chat	New Bid! \n 100 	336	413	1	82
3584	\N	109	new_message	2019-08-21 18:39:35.928123	2019-09-02 13:56:36.961293	task for test chat	Please confirm the Change Order	336	413	1	82
3589	\N	109	new_message	2019-08-21 19:21:28.2245	2019-09-02 13:56:37.034625	task for test chat	Please confirm the Change Order	336	413	1	82
3590	\N	109	new_message	2019-08-21 19:27:52.442788	2019-09-02 13:56:37.038129	task for test chat	Please confirm the Change Order	336	413	1	82
3588	\N	109	new_message	2019-08-21 19:18:42.123843	2019-09-02 13:56:37.03917	task for test chat	Please confirm the Change Order	336	413	1	82
3587	\N	109	new_message	2019-08-21 19:17:12.437743	2019-09-02 13:56:37.037015	task for test chat	Please confirm the Change Order	336	413	1	82
3591	\N	109	new_message	2019-08-21 19:28:09.030901	2019-09-02 13:56:37.047183	task for test chat	Please confirm the Change Order	336	413	1	82
3595	\N	112	new_message	2019-08-28 20:52:01.880387	2019-09-02 13:56:37.109648	tender 5 edit	Please confirm the Change Order	557	414	1	110
3593	112	110	new_message	2019-08-22 08:39:41.4623	2019-09-02 13:56:37.111699	tender 5 edit	New Bid! \n description  	557	414	1	110
3594	110	112	new_message	2019-08-22 08:45:33.1686	2019-09-02 13:56:37.114956	tender 5 edit	Congratulations! legal : Your bid was accepted. 	557	414	1	110
3596	\N	112	new_message	2019-08-28 20:52:15.306752	2019-09-02 13:56:37.128706	tender 5 edit	Back Charge	557	414	1	110
3598	\N	\N	new_task	2019-09-02 06:43:25.304591	2019-09-02 13:56:37.181266	Lay floor tiles		558	\N	1	110
3597	8	112	new_message	2019-09-01 20:44:21.619325	2019-09-02 13:56:37.23784	tender 5 edit	Supervisor2 : Has confirmed your work.	557	414	1	110
3599	\N	112	new_task	2019-09-02 10:15:42.935479	2019-09-02 13:56:37.287399	task02091	test	559	\N	1	110
3600	112	110	new_message	2019-09-02 10:18:02.551357	2019-09-02 13:56:37.315804	task02091	legal  has accepted your work offer	559	\N	1	110
3592	\N	\N	new_task	2019-08-22 08:37:31.411652	2019-09-02 13:56:37.978205	tender 5 edit	test	557	\N	1	110
3580	82	109	new_message	2019-08-21 18:29:20.911265	2019-09-02 13:56:36.890062	task for test chat	Congratulations! Donna : Your bid was accepted. 	336	413	1	82
3601	112	110	new_message	2019-09-02 10:18:52.913906	2019-09-02 13:56:37.329084	task02091	legal  has accepted your work offer	559	\N	1	110
3603	112	110	new_message	2019-09-02 10:24:33.641362	2019-09-02 13:56:37.36396	task02091	legal  has accepted your work offer	559	0	1	110
3602	112	110	new_message	2019-09-02 10:24:32.061146	2019-09-02 13:56:37.375219	task02091	legal  has accepted your work offer	559	0	1	110
3605	\N	112	new_task	2019-09-02 11:12:19.137795	2019-09-02 13:56:37.584676	afasdadadad	adasdasdasdasd	561	\N	1	110
3606	112	110	new_message	2019-09-02 11:13:37.607756	2019-09-02 13:56:37.594986	tender02092	New Bid! \n test 	560	417	1	110
3607	112	110	new_message	2019-09-02 11:13:55.588376	2019-09-02 13:56:37.651592	tender02092	New Bid! \n test 	560	417	1	110
3608	110	112	new_message	2019-09-02 11:19:04.718148	2019-09-02 13:56:37.657748	tender02092	Congratulations! legal : Your bid was accepted. 	560	417	1	110
3614	109	110	new_message	2019-09-02 13:40:06.272254	2019-09-02 13:56:37.85442	task02093	Donna  has accepted your work offer	562	0	1	110
3611	110	112	new_message	2019-09-02 11:20:39.162225	2019-09-02 13:56:37.869721	tender02092	Congratulations! legal : Your bid was accepted. 	560	417	1	110
3609	110	112	new_message	2019-09-02 11:19:18.84106	2019-09-02 13:56:38.01135	tender02092	Congratulations! legal : Your bid was accepted. 	560	417	1	110
3610	110	112	new_message	2019-09-02 11:19:21.610429	2019-09-02 13:56:38.013042	tender02092	Congratulations! legal : Your bid was accepted. 	560	417	1	110
3616	109	110	new_message	2019-09-02 13:44:46.43297	2019-09-02 13:56:38.0675	tender02094	New Bid! \n  	563	419	1	110
3613	\N	109	new_task	2019-09-02 13:39:07.86871	2019-09-02 13:56:38.069357	task02093	test	562	\N	1	110
3612	110	112	new_message	2019-09-02 11:20:41.187054	2019-09-02 13:56:38.070316	tender02092	Congratulations! legal : Your bid was accepted. 	560	417	1	110
3604	\N	\N	new_task	2019-09-02 11:09:32.62383	2019-09-02 13:56:38.093309	tender02092	test	560	\N	1	110
3617	110	109	new_message	2019-09-02 13:45:15.152027	2019-09-02 13:56:38.123972	tender02094	Congratulations! Donna : Your bid was accepted. 	563	419	1	110
3615	\N	\N	new_task	2019-09-02 13:44:20.076413	2019-09-02 13:56:38.128593	tender02094		563	\N	1	110
3618	\N	109	new_task	2019-09-02 20:26:51.983335	2019-09-02 20:26:52.184344	task02095	test	564	\N	1	110
3619	109	110	new_message	2019-09-02 20:27:25.152762	2019-09-02 20:27:25.190484	task02095	Donna  has accepted your work offer	564	\N	1	110
3620	\N	\N	new_task	2019-09-02 20:31:55.270817	2019-09-02 20:31:55.459509	tender02096	tesr	565	\N	1	110
3621	109	110	new_message	2019-09-02 20:33:47.581398	2019-09-02 20:33:47.621323	tender02096	New Bid! \n  	565	421	1	110
3622	109	110	new_message	2019-09-02 20:34:04.245445	2019-09-02 20:34:04.28722	task02095	Donna  — completed your task, please confirm	564	\N	1	110
3623	8	109	new_message	2019-09-02 20:35:03.657944	2019-09-02 20:35:03.698951	task02095	Supervisor2 : Has confirmed your work.	564	\N	1	110
3624	110	109	new_message	2019-09-02 20:37:21.993165	2019-09-02 20:37:22.03429	tender02096	Congratulations! Donna : Your bid was accepted. 	565	421	1	110
3625	110	109	new_message	2019-09-02 20:39:06.938046	2019-09-02 20:39:06.982287	tender02096	Congratulations! Donna : Your bid was accepted. 	565	421	1	110
3626	110	109	new_message	2019-09-02 20:39:09.649766	2019-09-02 20:39:09.691517	tender02096	Congratulations! Donna : Your bid was accepted. 	565	421	1	110
3627	\N	112	new_task	2019-09-04 15:54:47.034651	2019-09-04 15:54:47.338637	task04091	test	566	\N	1	110
3628	112	110	new_message	2019-09-04 15:56:14.198269	2019-09-04 15:56:14.244583	task04091	legal  has accepted your work offer	566	0	1	110
3629	112	110	new_message	2019-09-04 15:57:11.049214	2019-09-04 15:57:11.100532	task04091	legal  has accepted your work offer	566	\N	1	110
3630	112	110	new_message	2019-09-04 16:00:12.857	2019-09-04 16:00:12.902659	task04091	legal  — completed your task, please confirm	566	\N	1	110
3631	\N	112	new_task	2019-09-04 16:01:39.243217	2019-09-04 16:01:39.288569	task04092	test	567	\N	1	110
3632	112	110	new_message	2019-09-04 16:02:05.150096	2019-09-04 16:02:05.195479	task04092	legal  has accepted your work offer	567	0	1	110
3633	\N	\N	new_task	2019-09-04 16:07:33.642197	2019-09-04 16:07:33.982523	tender 04093	test	568	\N	1	110
3634	112	110	new_message	2019-09-04 16:08:18.72815	2019-09-04 16:08:18.774716	tender 04093	New Bid! \n  	568	424	1	110
3635	110	112	new_message	2019-09-04 16:08:48.268316	2019-09-04 16:08:48.328899	tender 04093	Congratulations! legal : Your bid was accepted. 	568	424	1	110
3636	8	112	new_message	2019-09-04 16:09:46.602555	2019-09-04 16:09:46.644764	tender 04093	Supervisor2 : Has confirmed your work.	568	424	1	110
3637	110	112	new_message	2019-09-04 16:19:38.443228	2019-09-04 16:19:38.49709	tender 04093	You have got a rating.	568	424	1	110
3638	\N	112	new_task	2019-09-04 17:50:29.759906	2019-09-04 17:50:30.210209	task04095	test	569	\N	1	110
3639	112	110	new_message	2019-09-04 17:51:06.070282	2019-09-04 17:51:06.125413	task04095	legal  has accepted your work offer	569	425	1	110
3640	112	110	new_message	2019-09-04 17:52:19.969106	2019-09-04 17:52:20.025157	task04095	legal  — completed your task, please confirm	569	425	1	110
3641	8	112	new_message	2019-09-04 17:52:48.05435	2019-09-04 17:52:48.114526	task04095	Supervisor2 : Has confirmed your work.	569	425	1	110
3642	\N	112	new_task	2019-09-04 18:05:03.342523	2019-09-04 18:05:03.399458	task04097	Test	570	\N	1	110
3643	\N	\N	new_task	2019-09-04 18:05:54.1055	2019-09-04 18:05:54.401844	tender04098	Yest	571	\N	1	110
3644	112	110	new_message	2019-09-04 18:06:40.670727	2019-09-04 18:06:40.716607	task04097	legal  has accepted your work offer	570	426	1	110
3645	112	110	new_message	2019-09-04 18:07:57.758022	2019-09-04 18:07:57.800936	tender04098	New Bid! \n  	571	427	1	110
3646	110	112	new_message	2019-09-04 18:08:22.406139	2019-09-04 18:08:22.456669	tender04098	Congratulations! legal : Your bid was accepted. 	571	427	1	110
3647	8	112	new_message	2019-09-09 10:24:20.259016	2019-09-09 11:34:38.882102	tender04098	Supervisor2 : Has confirmed your work.	571	427	1	110
3651	112	110	new_message	2019-09-09 11:30:40.927778	2019-09-09 11:34:38.879405	task09091	legal  has accepted your work offer	572	428	1	110
3652	112	110	new_message	2019-09-09 11:30:43.821074	2019-09-09 11:34:38.888992	task09091	legal  has accepted your work offer	572	428	1	110
3653	110	112	new_message	2019-09-09 11:31:23.764038	2019-09-09 11:34:38.896595	task09091	Supervisor2 : Has confirmed your work.	572	428	1	110
3650	\N	112	new_task	2019-09-09 11:30:17.728158	2019-09-09 11:34:38.947169	task09091	test	572	\N	1	110
3654	110	112	new_message	2019-09-09 11:31:25.752691	2019-09-09 11:34:39.007398	task09091	You have got a rating.	572	428	1	110
3648	8	112	new_message	2019-09-09 11:10:43.730018	2019-09-09 11:34:39.011353	task04097	Supervisor2 : Has confirmed your work.	570	426	1	110
3649	112	110	new_message	2019-09-09 11:28:57.429245	2019-09-09 11:34:39.019328	task04092	legal  has accepted your work offer	567	0	1	110
3655	\N	112	new_task	2019-09-09 11:34:55.281597	2019-09-09 11:34:55.340049	task09092	test	573	\N	1	110
3656	\N	\N	new_task	2019-09-09 11:35:45.595322	2019-09-09 11:35:46.711412	task09093		574	\N	1	110
3657	\N	112	new_task	2019-09-09 11:37:23.683205	2019-09-09 11:37:23.716614	task 09093app	app	575	\N	1	110
3658	112	110	new_message	2019-09-09 11:37:53.372866	2019-09-09 11:37:53.408107	task 09093app	legal  has accepted your work offer	575	430	1	110
3659	112	110	new_message	2019-09-09 11:38:09.846221	2019-09-09 11:38:09.880768	task09093	New Bid! \n  	574	431	1	110
3660	112	110	new_message	2019-09-09 11:38:28.143769	2019-09-09 11:38:28.178909	task09092	legal  has accepted your work offer	573	429	1	110
3661	8	112	new_message	2019-09-09 11:48:18.117875	2019-09-09 11:48:18.180743	task09092	Supervisor2 : Has confirmed your work.	573	429	1	110
3662	110	112	new_message	2019-09-09 12:03:17.131146	2019-09-09 12:03:17.167317	task 09093app	Supervisor2 : Has confirmed your work.	575	430	1	110
3663	110	112	new_message	2019-09-09 12:03:26.148749	2019-09-09 12:03:26.193207	task 09093app	You have got a rating.	575	430	1	110
3664	\N	112	new_task	2019-09-10 19:35:03.35334	2019-09-10 19:41:32.887529	task1009	test	576	\N	1	110
3665	112	110	new_message	2019-09-10 19:35:58.046466	2019-09-10 19:41:32.881509	task1009	legal  has accepted your work offer	576	432	1	110
3666	8	112	new_message	2019-09-10 19:36:23.242458	2019-09-10 19:41:32.951552	task1009	Supervisor2 : Has confirmed your work.	576	432	1	110
3667	\N	112	new_task	2019-09-11 09:22:38.702162	2019-09-11 09:22:39.035916	task11091	test	577	\N	1	110
3668	112	110	new_message	2019-09-11 09:25:12.167324	2019-09-11 09:25:12.246295	task11091	legal  has accepted your work offer	577	433	1	110
3669	8	112	new_message	2019-09-11 09:25:45.698432	2019-09-11 09:25:45.752227	task11091	Supervisor2 : Has confirmed your work.	577	433	1	110
3680	\N	\N	destroy_task	2019-09-16 20:30:02.540089	2019-09-16 20:30:02.540089	\N	\N	501	\N	0	\N
3670	\N	\N	new_task	2019-09-11 12:30:50.834056	2019-09-24 12:51:50.453118	Stairs Nosings & Materials	QTY: 23\r\nDoors\r\nQTY: 24\r\nStairs Nosings & Materials\r\n	578	\N	1	113
3672	\N	112	new_task	2019-09-12 07:02:45.417736	2019-09-24 12:51:50.570308	Final Clean and Garbage Removal	QTY: 0.0\r\nNew Kitchen\r\nQTY: 0.0\r\nPaint Existing Kitchen\r\nQTY: 10\r\nDoors\r\nQTY: 10\r\nStairs Nosings & Materials\r\nQTY: 10\r\nCloset Doors\r\nQTY: 10\r\nsqft\r\nQTY: 10\r\nDemolition & Disposal\r\nQTY: 10\r\nPaint all walls, doors, trim & Kitchen\r\nQTY: 10\r\nFlooring  - Supply & Install\r\nQTY: 10\r\nLight\r\nQTY: 10\r\nSwitches / Receptacles\r\nQTY: 1.0\r\nFinal Clean and Garbage Removal\r\n	580	\N	1	113
3676	8	112	new_message	2019-09-12 07:06:23.774173	2019-09-24 12:51:50.563705	New Kitchen	Supervisor2 : Has confirmed your work.	579	434	1	110
3675	8	112	new_message	2019-09-12 07:05:49.600539	2019-09-24 12:51:50.638694	Final Clean and Garbage Removal	Supervisor5 : Has confirmed your work.	580	435	1	113
3673	112	110	new_message	2019-09-12 07:04:29.857176	2019-09-24 12:51:50.655799	New Kitchen	legal  has accepted your work offer	579	434	1	110
3678	112	113	new_message	2019-09-12 12:25:19.850802	2019-09-24 12:51:50.678607	Final Clean and Garbage Removal	legal  has accepted your work offer	581	436	1	113
3671	\N	112	new_task	2019-09-12 06:42:17.200223	2019-09-24 12:51:50.714517	New Kitchen	QTY: 1.0\r\nNew Kitchen	579	\N	1	110
3677	\N	112	new_task	2019-09-12 12:24:58.064908	2019-09-24 12:51:50.741231	Final Clean and Garbage Removal	QTY: 1.0\r\nNew Kitchen\r\nQTY: 0.0\r\nPaint Existing Kitchen\r\nQTY: 10\r\nDoors\r\nQTY: 10\r\nStairs Nosings & Materials\r\nQTY: 10\r\nCloset Doors\r\nQTY: 10\r\nsqft\r\nQTY: 10\r\nDemolition & Disposal\r\nQTY: 10\r\nPaint all walls, doors, trim & Kitchen\r\nQTY: 10\r\nFlooring  - Supply & Install\r\nQTY: 10\r\nLight\r\nQTY: 10\r\nSwitches / Receptacles\r\nQTY: 1.0\r\nTub Surround & New Drywall\r\nQTY: 1.0\r\nSupply and Install Vanity, sink and faucet \r\nQTY: 1.0\r\nAccessories\r\nQTY: 1.0\r\nToilet\r\nQTY: 1.0\r\nFinal Clean and Garbage Removal\r\n	581	\N	1	113
3674	112	113	new_message	2019-09-12 07:05:29.152196	2019-09-24 12:51:50.75276	Final Clean and Garbage Removal	legal  has accepted your work offer	580	435	1	113
3679	8	112	new_message	2019-09-12 12:25:44.589625	2019-09-24 12:51:50.819337	Final Clean and Garbage Removal	Supervisor5 : Has confirmed your work.	581	436	1	113
3681	\N	112	new_task	2019-09-24 13:08:07.588302	2019-09-24 13:08:07.709847	task24-1	ddsafdefr	582	\N	1	110
3682	\N	112	new_task	2019-09-24 13:09:00.699158	2019-09-24 13:09:00.776047	task242	tesst	583	\N	1	110
3683	\N	112	new_task	2019-09-24 13:09:50.028798	2019-09-24 13:09:50.10715	task243	retertrr	584	\N	1	110
3684	112	110	new_message	2019-09-24 13:11:02.907151	2019-09-24 13:11:02.994609	task24-1	legal  has accepted your work offer	582	437	1	110
3685	112	110	new_message	2019-09-24 13:11:06.916764	2019-09-24 13:11:06.979185	task24-1	legal  has accepted your work offer	582	437	1	110
3686	\N	\N	new_task	2019-09-24 13:11:49.966848	2019-09-24 13:11:52.01475	tender2444	rystyhtyr	585	\N	1	110
3687	\N	\N	new_task	2019-09-24 13:13:14.027037	2019-09-24 13:13:15.756521	tendre245		586	\N	1	110
3688	112	110	new_message	2019-09-24 13:13:31.510082	2019-09-24 13:13:31.550593	tendre245	New Bid! \n  	586	440	1	110
3689	112	110	new_message	2019-09-24 13:13:40.511813	2019-09-24 13:13:40.67682	tendre245	New Bid! \n rtghg 	586	440	1	110
3690	112	110	new_message	2019-09-24 13:14:24.697285	2019-09-24 13:14:24.73881	task243	legal  has accepted your work offer	584	439	1	110
3691	\N	112	new_message	2019-09-24 13:14:53.523419	2019-09-24 13:14:53.523419	task243	Please confirm the Change Order	584	439	0	110
3692	\N	112	new_message	2019-09-24 13:15:07.24287	2019-09-24 13:15:07.24287	task243	Please confirm the Change Order	584	439	0	110
3693	\N	112	new_message	2019-09-24 13:15:19.085311	2019-09-24 13:15:19.085311	task243	Back Charge	584	439	0	110
3694	8	112	new_message	2019-09-24 13:15:27.387551	2019-09-24 13:15:27.477257	task243	Supervisor2 : Has confirmed your work.	584	439	1	110
3701	112	113	new_message	2019-09-25 20:07:29.287036	2019-09-25 21:08:06.776945	Invoice test name	legal  has accepted your work offer	587	442	1	113
3702	112	113	new_message	2019-09-25 20:07:32.703453	2019-09-25 21:08:06.779918	Invoice test name	legal  — completed your task, please confirm	587	442	1	113
3700	112	113	new_message	2019-09-25 20:07:26.999686	2019-09-25 21:08:06.773283	Invoice test name	legal  has accepted your work offer	587	442	1	113
3698	112	97	new_message	2019-09-25 19:32:00.609691	2019-09-25 21:08:06.846124	vxvcxvxcvxcvxcv	legal  has accepted your work offer	447	0	1	97
3707	8	112	new_message	2019-09-25 20:26:26.24071	2019-09-25 21:08:06.850534	Test invoice 	Supervisor5 : Has confirmed your work.	588	443	1	113
3697	112	97	new_message	2019-09-25 19:31:57.887723	2019-09-25 21:08:06.853278	vxvcxvxcvxcvxcv	legal  has accepted your work offer	447	0	1	97
3695	112	82	new_message	2019-09-25 19:26:57.972192	2019-09-25 21:08:06.881843	task22035	New Bid! \n xfhxss 	457	441	1	82
3699	\N	112	new_task	2019-09-25 20:06:49.482798	2019-09-25 21:08:06.890586	Invoice test name	Invoice test name	587	\N	1	113
3696	112	97	new_message	2019-09-25 19:31:54.811413	2019-09-25 21:08:06.930949	vxvcxvxcvxcvxcv	legal  has accepted your work offer	447	0	1	97
3706	112	113	new_message	2019-09-25 20:26:12.585306	2019-09-25 21:08:06.941975	Test invoice 	legal  — completed your task, please confirm	588	443	1	113
3703	8	112	new_message	2019-09-25 20:08:24.759008	2019-09-25 21:08:06.969042	Invoice test name	Supervisor5 : Has confirmed your work.	587	442	1	113
3705	112	113	new_message	2019-09-25 20:26:06.801253	2019-09-25 21:08:06.984798	Test invoice 	legal  has accepted your work offer	588	443	1	113
3704	\N	112	new_task	2019-09-25 20:25:47.891887	2019-09-25 21:08:07.03338	Test invoice 	There are many variations of passages	588	\N	1	113
3708	\N	112	new_task	2019-09-25 21:22:57.791938	2019-09-25 21:22:57.878334	280228022802	280228022802	589	\N	1	113
3709	112	113	new_message	2019-09-25 21:23:12.064354	2019-09-25 21:23:12.106432	280228022802	legal  has accepted your work offer	589	444	1	113
3710	112	113	new_message	2019-09-25 21:23:21.993462	2019-09-25 21:23:22.030838	280228022802	legal  — completed your task, please confirm	589	444	1	113
3711	8	112	new_message	2019-09-25 21:23:32.936424	2019-09-25 21:23:33.013841	280228022802	Supervisor5 : Has confirmed your work.	589	444	1	113
3712	\N	112	new_task	2019-09-26 21:51:10.060169	2019-09-30 09:39:28.936175	task2709	test	590	\N	1	110
3713	112	110	new_message	2019-09-26 21:51:24.871394	2019-09-30 09:39:29.013757	task2709	legal  has accepted your work offer	590	445	1	110
3717	8	112	new_message	2019-09-26 21:57:28.186629	2019-09-30 09:39:28.930159	task27095	Supervisor2 : Has confirmed your work.	591	446	1	110
3714	8	112	new_message	2019-09-26 21:51:43.957302	2019-09-30 09:39:28.93289	task2709	Supervisor2 : Has confirmed your work.	590	445	1	110
3716	112	110	new_message	2019-09-26 21:57:00.818896	2019-09-30 09:39:29.012612	task27095	legal  has accepted your work offer	591	446	1	110
3715	\N	112	new_task	2019-09-26 21:56:47.156976	2019-09-30 09:39:29.057172	task27095	test	591	\N	1	110
3718	\N	112	new_task	2019-10-01 07:31:51.474151	2019-10-01 07:31:51.82166	task01101	DescriptionDescriptionvvvDescription	592	\N	1	110
3719	112	110	new_message	2019-10-01 07:35:29.81886	2019-10-01 07:35:29.918693	task01101	legal  has accepted your work offer	592	447	1	110
3720	112	110	new_message	2019-10-01 07:35:33.369617	2019-10-01 07:35:33.429683	task01101	legal  has accepted your work offer	592	447	1	110
3721	112	110	new_message	2019-10-01 07:35:36.931899	2019-10-01 07:35:36.986144	task01101	legal  has accepted your work offer	592	447	1	110
3722	\N	112	new_message	2019-10-01 08:00:17.567628	2019-10-01 08:00:17.676446	task01101	Please confirm the Change Order	592	447	1	110
3723	\N	112	new_message	2019-10-01 08:01:41.769302	2019-10-01 08:01:41.769302	task01101	Back Charge	592	447	0	110
3724	\N	112	new_message	2019-10-01 08:02:16.796245	2019-10-01 08:02:16.796245	task01101	Back Charge	592	447	0	110
3725	\N	112	new_task	2019-10-04 08:03:18.713695	2019-10-04 08:03:18.839348	task0410	test	593	\N	1	110
3726	112	110	new_message	2019-10-04 08:03:52.973056	2019-10-04 08:03:53.115083	task0410	legal  has accepted your work offer	593	448	1	110
3727	112	110	new_message	2019-10-04 08:03:56.75531	2019-10-04 08:03:56.798978	task0410	legal  has accepted your work offer	593	448	1	110
3728	8	112	new_message	2019-10-04 08:04:07.975217	2019-10-04 08:04:08.065963	task0410	Supervisor2 : Has confirmed your work.	593	448	1	110
3729	\N	\N	new_task	2019-10-04 08:06:31.20796	2019-10-04 08:06:33.536226	tender04102	tesr	594	\N	1	110
3730	112	110	new_message	2019-10-04 08:06:48.419721	2019-10-04 08:06:48.506425	tender04102	New Bid! \n rfg 	594	449	1	110
3731	110	112	new_message	2019-10-04 08:07:33.309317	2019-10-04 08:07:33.429401	tender04102	Congratulations! legal : Your bid was accepted. 	594	449	1	110
3732	\N	112	new_message	2019-10-04 08:08:07.533035	2019-10-04 08:08:07.533035	tender04102	Please confirm the Change Order	594	449	0	110
3733	\N	112	new_message	2019-10-04 08:08:23.77855	2019-10-04 08:08:23.77855	tender04102	Back Charge	594	449	0	110
3734	\N	110	new_message	2019-10-04 08:09:50.510104	2019-10-04 08:09:50.510104	tender04102	Budget has changed	594	449	0	110
3735	\N	112	new_task	2019-10-04 08:11:39.019	2019-10-04 08:11:39.101714	task04103	app	595	\N	1	110
3736	112	110	new_message	2019-10-04 08:12:50.2463	2019-10-04 08:12:50.355518	task04103	legal  has accepted your work offer	595	450	1	110
3737	8	112	new_message	2019-10-04 08:13:21.712681	2019-10-04 08:13:21.787717	task04103	Supervisor2 : Has confirmed your work.	595	450	1	110
3738	110	112	new_message	2019-10-04 08:13:32.208518	2019-10-04 08:13:32.273534	task04103	You have got a rating.	595	450	1	110
3739	110	112	new_message	2019-10-04 08:13:49.676616	2019-10-04 08:13:49.849702	tender04102	Supervisor2 : Has confirmed your work.	594	449	1	110
3740	110	112	new_message	2019-10-04 08:13:52.619047	2019-10-04 08:13:52.689507	tender04102	You have got a rating.	594	449	1	110
3741	\N	112	new_task	2019-10-04 09:08:39.377034	2019-10-04 09:08:39.486976	Test Invoice PDF		596	\N	1	113
3742	\N	112	new_task	2019-10-04 11:55:34.873759	2019-10-04 11:55:35.003333	task04104	test admin	597	\N	1	110
3743	\N	\N	new_task	2019-10-04 11:56:52.068629	2019-10-04 11:56:54.139826	ttendre04105	admin	598	\N	1	110
3744	112	110	new_message	2019-10-04 11:57:33.208461	2019-10-04 11:57:33.278143	ttendre04105	New Bid! \n 34 	598	453	1	110
3745	112	110	new_message	2019-10-04 12:01:00.29425	2019-10-04 12:01:00.362569	task04104	legal  — completed your task, please confirm	597	452	1	110
3751	\N	110	new_message	2019-10-04 13:30:41.560433	2019-10-04 13:32:39.678823	task04106	Budget has changed	599	454	1	110
3749	\N	112	new_message	2019-10-04 13:29:59.770929	2019-10-04 13:32:39.705773	task04106	Please confirm the Change Order	599	454	1	110
3750	\N	112	new_message	2019-10-04 13:30:22.55814	2019-10-04 13:32:39.707082	task04106	Back Charge	599	454	1	110
3748	112	110	new_message	2019-10-04 13:29:10.25394	2019-10-04 13:32:39.754491	task04106	legal  has accepted your work offer	599	454	1	110
3746	\N	112	new_task	2019-10-04 13:26:26.716743	2019-10-04 13:32:39.778083	task04106	test	599	\N	1	110
3747	\N	\N	new_task	2019-10-04 13:28:15.252169	2019-10-04 13:32:42.609445	tender04107	test	600	\N	1	110
3752	8	112	new_message	2019-10-04 13:30:56.64162	2019-10-04 13:32:39.780634	task04106	Supervisor2 : Has confirmed your work.	599	454	1	110
3753	112	110	new_message	2019-10-04 13:42:28.225319	2019-10-04 13:42:28.305739	tender04107	New Bid! \n trert 	600	455	1	110
3754	110	112	new_message	2019-10-04 13:43:07.684715	2019-10-04 13:43:07.768578	tender04107	Congratulations! legal : Your bid was accepted. 	600	455	1	110
3755	112	110	new_message	2019-10-04 13:43:50.081786	2019-10-04 13:43:50.121241	tender04107	legal  — completed your task, please confirm	600	455	1	110
3756	8	112	new_message	2019-10-04 13:44:08.829745	2019-10-04 13:44:08.90153	tender04107	Supervisor2 : Has confirmed your work.	600	455	1	110
3757	\N	112	new_task	2019-10-06 18:37:15.046016	2019-10-06 18:37:15.046016	task0610	app	601	\N	0	110
3758	112	110	new_message	2019-10-06 18:37:40.920978	2019-10-06 18:37:40.920978	task0610	legal  has accepted your work offer	601	456	0	110
3759	8	112	new_message	2019-10-06 18:38:29.534211	2019-10-06 18:38:29.534211	task0610	Supervisor2 : Has confirmed your work.	601	456	0	110
3760	\N	112	new_task	2019-10-06 20:35:40.284345	2019-10-06 20:35:40.284345	task06102		602	\N	0	110
3761	112	110	new_message	2019-10-06 20:36:13.237939	2019-10-06 20:36:13.237939	task06102	legal  has accepted your work offer	602	457	0	110
3762	8	112	new_message	2019-10-06 20:36:40.972238	2019-10-06 20:36:40.972238	task06102	Supervisor2 : Has confirmed your work.	602	457	0	110
\.


--
-- Data for Name: field_estimators; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.field_estimators (id, fieldable_id, fieldable_type, name, name_scope, machine_name, active, type_field, "desc", default_value, astra_price, trade_price, ancestry, required, multiple, style_cls, created_at, updated_at, "position", field_estimator_id, option, depend_id) FROM stdin;
5	1	EstimatorType	Electrical	Electrical	electrical	t	one_group	 	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.460026	2019-09-06 08:36:30.083882	3	\N	""	\N
6	1	EstimatorType	Bathroom	Bathroom	bathroom	t	one_group	 	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.466413	2019-09-06 08:36:30.086292	4	\N	""	\N
12	1	EstimatorType	Tub Surround & New Drywall	Tub Surround & New Drywall	surround	t	yes_no_checkbox	     	0.00	45.00	56.00		\N	\N		2019-09-02 17:01:26.505601	2019-09-06 09:00:45.891433	0	6	{"dependent_id": "", "plus_percent": ""}	\N
27	2	EstimatorType	Project Manager	Project Manager	project_manager	t	text	 	\N	\N	\N	\N	t	\N	\N	2019-09-15 05:23:04.049751	2019-09-15 05:23:04.049751	6	\N	{"plus_percent": ""}	\N
28	2	EstimatorType	Flooring	Flooring	flooring_yesno	t	check_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-15 05:27:58.827616	2019-09-15 05:27:58.827616	7	\N	{"plus_percent": ""}	\N
16	1	EstimatorType	Sqft	sqft	sqft	t	integer	    	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.534995	2019-09-15 19:57:29.335937	0	4	{"plus_type": "on", "plus_value": "10", "hide_admin_list_task": "on"}	\N
31	1	EstimatorType	Baseboard	Baseboard	baseboard	t	decimal	  	\N	2.25	2.25	\N	\N	\N	\N	2019-09-16 08:53:48.31236	2019-09-16 08:54:35.087559	10	4	{"plus_only": "on", "plus_type": "on", "hide_front": "on", "plus_value": "33"}	16
19	1	EstimatorType	Light	Light	light	t	integer	   	0.00	45.00	45.00		\N	\N		2019-09-02 17:01:26.554301	2019-09-06 08:34:45.622271	0	5	{"dependent_id": "", "plus_percent": ""}	\N
24	1	EstimatorType	Total Doors	Doors	door	t	integer	   	0.00	225.00	225.00		\N	\N		2019-09-02 17:01:26.580413	2019-09-06 09:28:04.703461	0	4	{"dependent_id": "", "plus_percent": ""}	\N
15	1	EstimatorType	Total Stairs	Stairs Nosings & Materials	stair	t	integer	   	0.00	55.00	55.00		\N	\N		2019-09-02 17:01:26.52898	2019-09-06 09:29:52.363907	0	4	{"dependent_id": "", "plus_percent": ""}	\N
20	1	EstimatorType	Vanity	Supply and Install Vanity, sink and faucet 	vanity	t	yes_no_checkbox	   	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.563304	2019-09-06 08:35:53.013003	0	6	{"dependent_id": "", "plus_percent": ""}	\N
3	1	EstimatorType	Kitchen	Kitchen	kitchen	t	one_group	 	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.442906	2019-09-06 08:36:30.077949	1	\N	""	\N
4	1	EstimatorType	Interior Repairs (Flooring, Paint, Millwork)	Interior Repairs (Flooring, Paint, Millwork)	interior	t	one_group	 	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.453417	2019-09-06 08:36:30.081293	2	\N	""	\N
7	1	EstimatorType	Other	Other	other	t	one_group	 	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.472702	2019-09-06 08:36:30.088572	5	\N	""	\N
21	1	EstimatorType	Total Closet Doors	Closet Doors	closet_door	t	integer	   	0.00	350.00	350.00		\N	\N		2019-09-02 17:01:26.56774	2019-09-06 09:30:03.365431	0	4	{"dependent_id": "", "plus_percent": ""}	\N
13	1	EstimatorType	New Kitchen	New Kitchen	new_kitch	t	yes_no_checkbox	    	0.00	0.00	0.00		\N	\N		2019-09-02 17:01:26.512949	2019-09-06 08:38:51.232394	0	3	{"dependent_id": "", "plus_percent": ""}	\N
23	1	EstimatorType	Paint Existing Kitchen	Paint Existing Kitchen	paint_new_kitch	t	yes_no_checkbox	   	0.00	650.00	650.00		\N	\N		2019-09-02 17:01:26.576276	2019-09-06 08:39:12.162021	0	3	{"dependent_id": "", "plus_percent": ""}	\N
9	1	EstimatorType	Final Clean and Garbage Removal	Final Clean and Garbage Removal	cleanfinal	t	one_checkbox	   	0.00	350.00	350.00		\N	\N		2019-09-02 17:01:26.484836	2019-09-06 08:40:55.326221	0	7	{"dependent_id": "", "plus_percent": ""}	\N
10	1	EstimatorType	Accessories	Accessories	accessory	t	yes_no_checkbox	   	0.00	225.00	225.00		\N	\N		2019-09-02 17:01:26.490998	2019-09-06 08:41:14.620633	0	6	{"dependent_id": "", "plus_percent": ""}	\N
11	1	EstimatorType	Toilet	Toilet	toilet	t	yes_no_checkbox	   	0.00	350.00	350.00		\N	\N		2019-09-02 17:01:26.498065	2019-09-06 08:41:40.42314	0	6	{"dependent_id": "", "plus_percent": ""}	\N
14	1	EstimatorType	Switches / Receptacles	Switches / Receptacles	receptacle	t	integer	    	0.00	45.00	45.00		\N	\N		2019-09-02 17:01:26.522746	2019-09-06 08:59:20.235051	0	5	{"dependent_id": "", "plus_percent": ""}	\N
17	1	EstimatorType	Demolition & Disposal	Demolition & Disposal	sqftdemo	t	decimal	           	0.00	2.75	2.75		\N	\N		2019-09-02 17:01:26.541945	2019-09-11 12:22:07.170895	0	4	{"hide_front": "on", "plus_percent": ""}	16
18	1	EstimatorType	Paint all walls, doors, trim & Kitchen	Paint all walls, doors, trim & Kitchen	sqftkitch	t	decimal	        	0.00	2.65	2.65		\N	\N		2019-09-02 17:01:26.54754	2019-09-11 12:22:21.021201	0	4	{"hide_front": "on", "plus_percent": ""}	16
22	1	EstimatorType	Flooring  - Supply & Install	Flooring  - Supply & Install	sqftfloor	t	decimal	       	0.00	5.35	5.35		\N	\N		2019-09-02 17:01:26.571742	2019-09-11 12:22:39.978557	0	4	{"hide_front": "on", "plus_percent": ""}	16
34	2	EstimatorType	Supply, Deliver, Install LVT Tokyo Moonlight	Supply, Deliver, Install LVT Tokyo Moonlight	supply_deliver_install_lvt_tokyo_moonlight	t	decimal	  	0.00	4.65	4.65	\N	\N	\N	\N	2019-09-16 09:58:06.053956	2019-09-16 10:03:44.060269	13	28	{"hide_front": "on", "plus_value": ""}	32
35	2	EstimatorType	Supply and Install Plywood	Supply and Install Plywood	supply_and_install_plywood	t	decimal	 	0.00	1.75	1.75	\N	\N	\N	\N	2019-09-16 10:06:04.287126	2019-09-16 10:06:04.287126	14	28	{"plus_value": ""}	\N
36	2	EstimatorType	Total Stairs	Stairs Nosings & Materials	total_stairs	t	decimal	 	0.00	55.00	55.00	\N	\N	\N	\N	2019-09-16 10:07:48.872078	2019-09-16 10:07:48.872078	15	28	{"plus_value": "9"}	\N
40	2	EstimatorType	Demolition of Tub, Tile and Drywall	Demolition of Tub, Tile and Drywall	demolition_of_tub_tile_and_drywall	t	one_checkbox	 	\N	500.00	500.00	\N	\N	\N	\N	2019-09-16 10:11:32.297741	2019-09-16 10:11:32.297741	19	39	{"plus_value": ""}	\N
39	2	EstimatorType	Tub & Tile	Tub & Tile	tub_tile	t	check_group	  	\N	\N	\N	\N	\N	\N	\N	2019-09-16 10:10:39.657146	2019-09-16 10:29:55.914574	18	\N	{"plus_value": ""}	\N
33	2	EstimatorType	Demolition & Disposal of Flooring & Base	Demolition & Disposal of Flooring & Base	demolition_disposal_of_flooring_base	t	decimal	   	0.00	0.50	0.50	\N	\N	\N	\N	2019-09-16 09:56:34.819975	2019-09-16 10:30:11.62332	12	28	{"hide_front": "on", "plus_value": ""}	32
37	2	EstimatorType	Misc Accessories & Transition	Misc Accessories & Transition	misc_accessories_transition	t	one_checkbox	  	\N	110.00	110.00	\N	\N	\N	\N	2019-09-16 10:09:07.943452	2019-09-16 10:51:52.678194	16	28	{"plus_value": ""}	\N
38	2	EstimatorType	Plumbing Remove & Reinstall Toilet	Plumbing Remove & Reinstall Toilet	plumbing_remove_reinstall_toilet	t	yes_no_checkbox	  	\N	75.00	75.00	\N	\N	\N	\N	2019-09-16 10:10:07.433876	2019-09-16 10:52:02.994459	17	28	{"plus_only": "on", "plus_value": ""}	\N
29	2	EstimatorType	CODE	CODE	code	t	text	 	\N	\N	\N	\N	t	\N	\N	2019-09-15 17:01:21.096783	2019-09-16 12:37:15.660688	1	\N	{"plus_percent": "", "hide_admin_list_task": "on"}	\N
30	2	EstimatorType	Unit #	unit	unit_#	t	text	 	\N	\N	\N	\N	\N	\N	\N	2019-09-15 17:25:43.399799	2019-09-16 12:37:26.209014	2	\N	{"plus_percent": "", "hide_admin_list_task": "on"}	\N
32	2	EstimatorType	Total SQFT	Total SQFT	total_sqft	t	decimal	   	0.00	0.00	0.00	\N	\N	\N	\N	2019-09-16 09:41:37.417478	2019-09-16 12:58:12.201429	11	28	{"plus_type": "on", "plus_value": "10", "hide_admin_list_task": "on"}	\N
42	2	EstimatorType	TUB Supply and Install	TUB Supply and Install	tub_supply_and_install	t	yes_no_checkbox	 	\N	250.00	250.00	\N	\N	\N	\N	2019-09-16 10:19:15.628265	2019-09-16 10:19:15.628265	21	39	{"plus_value": ""}	\N
45	2	EstimatorType	Cabinetry	Cabinetry	cabinetry	t	check_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-16 10:21:59.98575	2019-09-16 10:21:59.98575	24	\N	{"plus_value": ""}	\N
47	2	EstimatorType	Kitchen (LFT)	Kitchen	kitchen_lft	t	decimal	 	0.00	139.00	139.00	\N	\N	\N	\N	2019-09-16 10:23:56.827773	2019-09-16 10:23:56.827773	26	45	{"plus_value": ""}	\N
48	2	EstimatorType	Laminate Counter Top (LFT)	Laminate Counter Top	laminate_counter_top_lft	t	decimal	 	0.00	6.40	6.40	\N	\N	\N	\N	2019-09-16 10:24:31.749023	2019-09-16 10:24:31.749023	27	45	{"plus_value": ""}	\N
41	2	EstimatorType	Bathroom (drywall & repairs)	Bathroom (drywall & repairs)	bathroom_drywall_repairs	t	one_checkbox	   	\N	375.00	375.00	\N	\N	\N	\N	2019-09-16 10:12:14.112044	2019-09-16 10:52:14.129511	20	39	{"plus_value": ""}	\N
44	2	EstimatorType	Plumbing Labor & Shower Valve, Trim and Drain	Plumbing Labor & Shower Valve, Trim and Drain	plumbing_labor_shower_valve_trim_and_drain	t	one_checkbox	  	\N	625.00	625.00	\N	\N	\N	\N	2019-09-16 10:21:38.967788	2019-09-16 10:52:26.121219	23	39	{"plus_value": ""}	\N
46	2	EstimatorType	Demolition & Disposal	Demolition & Disposal	demolition_disposal	t	one_checkbox	  	\N	600.00	600.00	\N	\N	\N	\N	2019-09-16 10:23:01.253674	2019-09-16 10:52:39.691198	25	45	{"plus_value": ""}	\N
49	2	EstimatorType	Vanity 1 & Sink + Plumbing	Vanity 1 & Sink + Plumbing	vanity_1_sink_plumbing	t	yes_no_checkbox	  	0.00	750.00	750.00	\N	\N	\N	\N	2019-09-16 10:25:40.231645	2019-09-16 10:52:48.409865	28	45	{"plus_value": ""}	\N
50	2	EstimatorType	Vanity 2 & Sink + Plumbing	Vanity 2 & Sink + Plumbing	vanity_2_sink_plumbing	t	yes_no_checkbox	 	\N	750.00	750.00	\N	\N	\N	\N	2019-09-16 10:57:07.238799	2019-09-16 10:57:07.238799	29	45	{"plus_value": ""}	\N
51	2	EstimatorType	Plumbing & Sink	Plumbing & Sink	plumbing_sink	t	one_checkbox	 	\N	575.00	575.00	\N	\N	\N	\N	2019-09-16 10:57:59.228676	2019-09-16 10:57:59.228676	30	45	{"plus_value": ""}	\N
52	2	EstimatorType	Kitchen Backsplash Supply & Install	Kitchen Backsplash Supply & Install	kitchen_backsplash_supply_install	t	one_checkbox	  	\N	363.00	363.00	\N	\N	\N	\N	2019-09-16 11:00:52.828365	2019-09-16 11:01:02.947004	31	45	{"plus_value": ""}	\N
53	2	EstimatorType	Supply and Install Ventilation for hood range	Supply and Install Ventilation for hood range	supply_and_install_ventilation_for_hood_range	t	yes_no_checkbox	 	\N	1.00	1.00	\N	\N	\N	\N	2019-09-16 11:02:00.503633	2019-09-16 11:02:00.503633	32	45	{"plus_value": ""}	\N
54	2	EstimatorType	Interior Repairs	Interior Repairs	interior_repairs	t	check_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-16 11:02:32.906071	2019-09-16 11:02:32.906071	33	\N	{"plus_value": ""}	\N
55	2	EstimatorType	Supply and Install Doors	Supply and Install Doors	supply_and_install_doors	t	decimal	 	0.00	225.00	225.00	\N	\N	\N	\N	2019-09-16 11:03:19.228792	2019-09-16 11:03:19.228792	34	54	{"plus_value": ""}	\N
56	2	EstimatorType	Total Closet Doors	Total Closet Doors	total_closet_doors	t	decimal	  	0.00	250.00	250.00	\N	\N	\N	\N	2019-09-16 11:03:54.734129	2019-09-16 11:04:03.462046	35	54	{"plus_value": ""}	\N
57	2	EstimatorType	Various (cold air returns, railings, etc)	Various (cold air returns, railings, etc)	various_cold_air_returns_railings_etc	t	one_checkbox	 	\N	189.00	189.00	\N	\N	\N	\N	2019-09-16 11:05:34.817629	2019-09-16 11:05:34.817629	36	54	{"plus_value": ""}	\N
59	2	EstimatorType	Switch / Receptacle	Switch / Receptacle	switch_receptacle	t	decimal	 	0.00	45.00	45.00	\N	\N	\N	\N	2019-09-16 11:07:20.535521	2019-09-16 11:07:20.535521	38	54	{"plus_value": ""}	\N
60	2	EstimatorType	Light Fixture	Light Fixture	light_fixture	t	decimal	 	0.00	45.00	45.00	\N	\N	\N	\N	2019-09-16 11:14:39.089155	2019-09-16 11:14:39.089155	39	54	{"plus_value": ""}	\N
61	2	EstimatorType	Misc Labor	Misc Labor	misc_labor	t	one_checkbox	 	\N	1.00	1.00	\N	\N	\N	\N	2019-09-16 11:15:30.834925	2019-09-16 11:15:30.834925	40	54	{"plus_value": ""}	\N
62	2	EstimatorType	Drywall Patching	Drywall Patching	drywall_patching	t	yes_no_checkbox	 	\N	250.00	250.00	\N	\N	\N	\N	2019-09-16 11:16:48.988784	2019-09-16 11:16:48.988784	41	54	{"plus_value": ""}	\N
63	2	EstimatorType	Accessories (Bathroom & Doors)	Accessories (Bathroom & Doors)	accessories_bathroom_doors	t	one_checkbox	 	\N	100.00	100.00	\N	\N	\N	\N	2019-09-16 11:17:31.231355	2019-09-16 11:17:31.231355	42	54	{"plus_value": ""}	\N
64	2	EstimatorType	Final Cleaning & Garbage Removal	Final Cleaning & Garbage Removal	final_cleaning_garbage_removal	t	one_checkbox	 	\N	350.00	350.00	\N	\N	\N	\N	2019-09-16 11:19:07.275166	2019-09-16 11:19:07.275166	43	54	{"plus_value": ""}	\N
65	2	EstimatorType	Paint	Paint	paint	t	check_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-16 11:19:59.515527	2019-09-16 11:19:59.515527	44	\N	{"plus_value": ""}	\N
67	2	EstimatorType	Wall Prep (patches, holes, corners, etc)	Wall Prep (patches, holes, corners, etc)	wall_prep_patches_holes_corners_etc	t	one_checkbox	  	\N	250.00	250.00	\N	\N	\N	\N	2019-09-16 11:22:05.574422	2019-09-16 11:22:15.381046	46	65	{"plus_value": ""}	\N
68	2	EstimatorType	Ceiling Prep, Repair and Paint	Ceiling Prep, Repair and Paint	ceiling_prep_repair_and_paint	t	decimal	 	0.00	1.00	1.00	\N	\N	\N	\N	2019-09-16 11:25:27.248322	2019-09-16 11:25:27.248322	47	65	{"plus_value": ""}	\N
69	2	EstimatorType	Appliances	Appliances	appliances	t	check_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-16 11:26:03.692354	2019-09-16 11:26:03.692354	48	\N	{"plus_value": ""}	\N
70	2	EstimatorType	Fridge	Fridge	fridge	t	yes_no_checkbox	 	\N	50.00	50.00	\N	\N	\N	\N	2019-09-16 11:26:42.076036	2019-09-16 11:26:42.076036	49	69	{"plus_value": ""}	\N
71	2	EstimatorType	Stove	Stove	stove	t	yes_no_checkbox	 	\N	50.00	50.00	\N	\N	\N	\N	2019-09-16 11:27:15.799924	2019-09-16 11:27:15.799924	50	69	{"plus_value": ""}	\N
72	2	EstimatorType	Hood Fan	Hood Fan	hood_fan	t	yes_no_checkbox	 	\N	50.00	50.00	\N	\N	\N	\N	2019-09-16 11:27:59.151773	2019-09-16 11:27:59.151773	51	69	{"plus_value": ""}	\N
73	2	EstimatorType	Dishwasher	Dishwasher	dishwasher	t	yes_no_checkbox	 	\N	50.00	50.00	\N	\N	\N	\N	2019-09-16 11:28:38.359302	2019-09-16 11:28:38.359302	52	69	{"plus_value": ""}	\N
74	2	EstimatorType	Abatement	Abatement	abatement	t	yes_no_checkbox	 	\N	50.00	50.00	\N	\N	\N	\N	2019-09-16 11:29:46.819858	2019-09-16 11:29:46.819858	53	\N	{"plus_value": ""}	\N
75	2	EstimatorType	Contractor Fee	Contractor Fee ( Potentially in Interior Repairs )	contractor_fee	t	decimal	 	1.00	2240.00	2240.00	\N	\N	\N	\N	2019-09-16 11:30:57.368213	2019-09-16 11:30:57.368213	54	54	{"hide_front": "on", "plus_value": ""}	\N
66	2	EstimatorType	Paint all walls, doors, trim	Paint all walls, doors, trim	paint_all_walls_doors_trim	t	decimal	  	0.00	2.14	2.14	\N	\N	\N	\N	2019-09-16 11:20:49.783688	2019-09-16 11:34:23.706489	45	65	{"plus_type": "on", "plus_value": "10"}	\N
43	2	EstimatorType	Bathroom Tub Surround Tile Supply and Install	Bathroom Tub Surround Tile Supply and Install	bathroom_tub_surround_tile_supply_and_install	t	yes_no_checkbox	  	\N	6.60	6.60	\N	\N	\N	\N	2019-09-16 10:20:47.538765	2019-09-16 11:34:56.660714	22	39	{"plus_only": "on", "plus_value": "95"}	\N
58	2	EstimatorType	Baseboards	Baseboards	baseboards	t	one_checkbox	  	\N	2.50	2.50	\N	\N	\N	\N	2019-09-16 11:06:31.888155	2019-09-16 11:36:03.015866	37	54	{"plus_only": "on", "plus_type": "on", "plus_value": "36"}	32
96	3	EstimatorType	Tub Recycling & Garbage Removal 	Tub Recycling & Garbage Removal 	tub_recycling_garbage_removal_	t	yes_no_checkbox	 	\N	110.00	110.00	\N	\N	\N	\N	2019-10-10 10:20:12.479105	2019-10-10 10:20:12.479105	75	89	{"plus_value": ""}	\N
97	3	EstimatorType	Rough in Plumbing	Rough in Plumbing	rough_in_plumbing	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:20:44.651549	2019-10-10 10:20:44.651549	76	88	{"plus_value": ""}	\N
98	3	EstimatorType	Supply and Install Tub ( Right or Left ) 	Supply and Install Tub ( Right or Left ) 	supply_and_install_tub_right_or_left_	t	yes_no_checkbox	 	\N	486.00	486.00	\N	\N	\N	\N	2019-10-10 10:21:29.744242	2019-10-10 10:21:29.744242	77	97	{"plus_value": ""}	\N
76	3	EstimatorType	ESTIMATOR	ESTIMATOR	estimator	t	one_group	   	\N	\N	\N	\N	\N	\N	\N	2019-09-21 13:20:14.305074	2019-09-29 10:26:36.491785	55	\N	{"plus_value": ""}	\N
82	3	EstimatorType	Flooring	Flooring	flooring	t	one_group	  	\N	\N	\N	\N	\N	\N	\N	2019-09-24 07:57:07.613432	2019-09-29 10:27:06.985912	61	76	{"plus_value": ""}	\N
78	3	EstimatorType	Demolition Labor of K3	Demolition Labor of K3	demolition_labor_of_k3	t	decimal	      	0.00	2.25	2.25	\N	\N	\N	\N	2019-09-21 13:43:37.954523	2019-09-29 10:34:35.248936	57	82	{"plus_type": "on", "plus_value": "1.16"}	\N
84	3	EstimatorType	Supply, Deliver, Install & LVT Tokyo Moonlight 	Supply, Deliver, Install & LVT Tokyo Moonlight 	supply_deliver_install_lvt_tokyo_moonlight_	t	decimal	 	0.00	4.65	4.65	\N	\N	\N	\N	2019-09-29 10:36:22.434069	2019-09-29 10:36:22.434069	63	82	{"plus_type": "on", "plus_value": "1.16"}	\N
83	3	EstimatorType	Supply and Install Plywood 	Supply and Install Plywood 	supply_and_install_plywood_	t	decimal	  	0.00	4.00	4.00	\N	\N	\N	\N	2019-09-29 10:35:21.649802	2019-09-29 10:36:52.704437	62	82	{"plus_type": "on", "plus_value": "1.16"}	\N
77	3	EstimatorType	Demolition Labor of Carpet	Demolition Labor of Carpet	demolition_labor_of_carpet	t	decimal	    	0.00	1.00	1.00	\N	t	\N	\N	2019-09-21 13:30:55.196997	2019-09-29 10:37:10.703174	56	82	{"plus_type": "on", "plus_value": "1.16"}	\N
85	3	EstimatorType	Stairs Nosings & Materials & Labor	Stairs Nosings & Materials & Labor	stairs_nosings_materials_labor	t	decimal	 	0.00	55.00	55.00	\N	\N	\N	\N	2019-09-29 10:40:26.161813	2019-09-29 10:40:26.161813	64	82	{"plus_type": "on", "plus_value": "15"}	\N
86	3	EstimatorType	Misc Accessories & Transition 	Misc Accessories & Transition 	misc_accessories_transition_	t	yes_no_checkbox	 	\N	110.00	110.00	\N	\N	\N	\N	2019-09-29 10:41:52.218867	2019-09-29 10:41:52.218867	65	82	{"plus_value": ""}	\N
87	3	EstimatorType	Disposal of Existing Flooring	Disposal of Existing Flooring	disposal_of_existing_flooring	t	decimal	 	0.00	0.35	0.35	\N	\N	\N	\N	2019-09-29 10:42:58.694653	2019-09-29 10:42:58.694653	66	82	{"plus_type": "on", "plus_value": "1.16"}	\N
88	3	EstimatorType	Bathroom 1: Tub & Tile	Bathroom 1: Tub & Tile	bathroom_1:_tub_tile	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-09-29 10:43:29.805744	2019-09-29 10:43:29.805744	67	\N	{"plus_value": ""}	\N
89	3	EstimatorType	Demolition	Demolition	demolition	t	one_group	  	\N	\N	\N	\N	\N	\N	\N	2019-09-29 10:44:51.67155	2019-09-29 10:45:09.403418	68	88	{"plus_value": ""}	\N
90	3	EstimatorType	Tub Surround Drywall & Tile	Tub Surround Drywall & Tile	tub_surround_drywall_tile	t	yes_no_checkbox	 	\N	200.00	200.00	\N	\N	\N	\N	2019-09-29 10:45:42.009088	2019-09-29 10:45:42.009088	69	89	{"plus_value": ""}	\N
91	3	EstimatorType	Existing Tub Removal	Existing Tub Removal 	existing_tub_removal	t	yes_no_checkbox	 	\N	100.00	100.00	\N	\N	\N	\N	2019-09-29 10:47:13.75894	2019-09-29 10:47:13.75894	70	89	{"plus_value": ""}	\N
93	3	EstimatorType	Mirror Removal	Mirror Removal 	mirror_removal	t	yes_no_checkbox	 	\N	35.00	35.00	\N	\N	\N	\N	2019-09-29 10:48:20.44203	2019-09-29 10:48:20.44203	72	89	{"plus_value": ""}	\N
92	3	EstimatorType	Vanity Removal	Vanity Removal 	vanity_removal	t	yes_no_checkbox	  	\N	65.00	65.00	\N	\N	\N	\N	2019-09-29 10:47:46.945149	2019-09-29 10:48:38.481071	71	89	{"plus_value": ""}	\N
94	3	EstimatorType	Toilet Removal	Toilet Removal	toilet_removal	t	yes_no_checkbox	 	\N	40.00	40.00	\N	\N	\N	\N	2019-09-29 10:49:33.275936	2019-09-29 10:49:33.275936	73	89	{"plus_value": ""}	\N
80	2	EstimatorType	Height	Height	height	t	text	  	\N	\N	\N	\N	\N	t	\N	2019-09-24 07:14:42.398371	2019-10-09 16:54:48.920123	59	79	{"plus_value": "", "horizont_class": "on"}	\N
81	2	EstimatorType	Width	Width	width	t	text	  	\N	\N	\N	\N	\N	t	\N	2019-09-24 07:15:09.714517	2019-10-09 16:54:57.346087	60	79	{"plus_value": "", "horizont_class": "on"}	\N
79	2	EstimatorType	Window Coverings	Window Coverings	window_coverings	t	scope_group	  	\N	50.00	50.00	\N	\N	\N	\N	2019-09-24 07:14:18.904141	2019-10-09 19:08:08.628854	58	\N	{"plus_value": ""}	\N
95	3	EstimatorType	Bathroom Accessories & Shower Rod	Bathroom Accessories & Shower Rod	bathroom_accessories_shower_rod	t	yes_no_checkbox	 	\N	15.00	15.00	\N	\N	\N	\N	2019-10-10 10:19:36.460824	2019-10-10 10:19:36.460824	74	89	{"plus_value": ""}	\N
99	3	EstimatorType	Supply and Install Shower Valve & Piping 	Supply and Install Shower Valve & Piping 	supply_and_install_shower_valve_piping_	t	yes_no_checkbox	 	\N	375.00	375.00	\N	\N	\N	\N	2019-10-10 10:23:34.134672	2019-10-10 10:23:34.134672	78	97	{"plus_value": ""}	\N
100	3	EstimatorType	New Shut of Valves & P-Trap for Vanity  	New Shut of Valves & P-Trap for Vanity  	new_shut_of_valves_p-trap_for_vanity_	t	yes_no_checkbox	 	\N	120.00	120.00	\N	\N	\N	\N	2019-10-10 10:24:02.124857	2019-10-10 10:24:02.124857	79	97	{"plus_value": ""}	\N
101	3	EstimatorType	Drywall & Tile	Drywall & Tile	drywall_tile	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:24:25.994759	2019-10-10 10:24:25.994759	80	88	{"plus_value": ""}	\N
102	3	EstimatorType	Supply and Install Drywall around the Tub	Supply and Install Drywall around the Tub	supply_and_install_drywall_around_the_tub	t	yes_no_checkbox	 	\N	550.00	550.00	\N	\N	\N	\N	2019-10-10 10:27:35.223095	2019-10-10 10:27:35.223095	81	101	{"plus_value": ""}	\N
103	3	EstimatorType	Supply and Install Ceramic Tile ( Tub & Vanity )	Supply and Install Ceramic Tile ( Tub & Vanity )	supply_and_install_ceramic_tile_tub_vanity_	t	decimal	 	0.00	6.60	6.60	\N	\N	\N	\N	2019-10-10 10:32:08.13328	2019-10-10 10:32:08.13328	82	101	{"plus_value": ""}	\N
104	3	EstimatorType	Finishing - Plumbing 	Finishing - Plumbing 	finishing_-_plumbing_	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:32:50.514519	2019-10-10 10:32:50.514519	83	88	{"plus_value": ""}	\N
105	3	EstimatorType	Supply and Install Vanity Sink and Faucet 	Supply and Install Vanity Sink and Faucet 	supply_and_install_vanity_sink_and_faucet_	t	yes_no_checkbox	 	\N	265.00	265.00	\N	\N	\N	\N	2019-10-10 10:33:57.535962	2019-10-10 10:33:57.535962	84	104	{"plus_value": ""}	\N
106	3	EstimatorType	Supply and Install Shower Head and Valve Trim 	Supply and Install Shower Head and Valve Trim 	supply_and_install_shower_head_and_valve_trim_	t	yes_no_checkbox	 	\N	155.00	155.00	\N	\N	\N	\N	2019-10-10 10:34:44.342431	2019-10-10 10:34:44.342431	85	104	{"plus_value": ""}	\N
107	3	EstimatorType	Re - Install Toilet	Re - Install Toilet	re_-_install_toilet	t	yes_no_checkbox	 	\N	75.00	75.00	\N	\N	\N	\N	2019-10-10 10:35:57.25638	2019-10-10 10:35:57.25638	86	104	{"plus_value": ""}	\N
108	3	EstimatorType	Supply and Install New Toilet 	Supply and Install New Toilet 	supply_and_install_new_toilet_	t	check_group	 	\N	305.00	305.00	\N	\N	\N	\N	2019-10-10 10:36:34.043117	2019-10-10 10:36:34.043117	87	104	{"plus_value": ""}	\N
109	3	EstimatorType	Other	Other	other	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:37:09.638427	2019-10-10 10:37:09.638427	88	88	{"plus_value": ""}	\N
110	3	EstimatorType	Supply and Install Mirror	Supply and Install Mirror	supply_and_install_mirror	t	yes_no_checkbox	 	\N	125.00	125.00	\N	\N	\N	\N	2019-10-10 10:37:50.465962	2019-10-10 10:37:50.465962	89	109	{"plus_value": ""}	\N
111	3	EstimatorType	Bathroom Accessories & Shower Rod	Bathroom Accessories & Shower Rod	bathroom_accessories_shower_rod	t	yes_no_checkbox	 	\N	135.00	135.00	\N	\N	\N	\N	2019-10-10 10:38:22.355821	2019-10-10 10:38:22.355821	90	109	{"plus_value": ""}	\N
112	3	EstimatorType	Cabinetry	Cabinetry	cabinetry	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:38:53.047017	2019-10-10 10:38:53.047017	91	\N	{"plus_value": ""}	\N
113	3	EstimatorType	Demolition of Existing Kitchen 	Demolition of Existing Kitchen 	demolition_of_existing_kitchen_	t	yes_no_checkbox	 	\N	675.00	675.00	\N	\N	\N	\N	2019-10-10 10:39:36.638675	2019-10-10 10:39:36.638675	92	112	{"plus_value": ""}	\N
114	3	EstimatorType	Kitchen 1	Kitchen 1	kitchen_1	t	decimal	 	0.00	139.00	139.00	\N	\N	\N	\N	2019-10-10 10:41:13.882198	2019-10-10 10:41:13.882198	93	112	{"plus_value": ""}	\N
115	3	EstimatorType	Laminate Counter Top	Laminate Counter Top	laminate_counter_top	t	decimal	 	0.00	26.40	26.40	\N	\N	\N	\N	2019-10-10 10:42:13.719925	2019-10-10 10:42:13.719925	94	112	{"plus_value": ""}	\N
116	3	EstimatorType	Vanity 1 & Sink + Plumbing 	Vanity 1 & Sink + Plumbing 	vanity_1_sink_plumbing_	t	yes_no_checkbox	 	\N	750.00	750.00	\N	\N	\N	\N	2019-10-10 10:43:40.779576	2019-10-10 10:43:40.779576	95	112	{"plus_value": ""}	\N
117	3	EstimatorType	Vanity 2 & Sink + Plumbing 	Vanity 2 & Sink + Plumbing 	vanity_2_sink_plumbing_	t	yes_no_checkbox	 	\N	625.00	625.00	\N	\N	\N	\N	2019-10-10 10:44:38.664093	2019-10-10 10:44:38.664093	96	112	{"plus_value": ""}	\N
118	3	EstimatorType	Kitchen Plumbing & Sink 	Kitchen Plumbing & Sink 	kitchen_plumbing_sink_	t	yes_no_checkbox	 	\N	625.00	625.00	\N	\N	\N	\N	2019-10-10 10:45:34.767943	2019-10-10 10:45:34.767943	97	112	{"plus_value": ""}	\N
119	3	EstimatorType	Kitchen & 2x Vanity Backsplash Supply & Install 	Kitchen & 2x Vanity Backsplash Supply & Install 	kitchen_2x_vanity_backsplash_supply_install_	t	yes_no_checkbox	 	\N	625.00	625.00	\N	\N	\N	\N	2019-10-10 10:46:35.840922	2019-10-10 10:46:35.840922	98	112	{"plus_value": ""}	\N
120	3	EstimatorType	Supply and Install Ventilation for hood range	Supply and Install Ventilation for hood range	supply_and_install_ventilation_for_hood_range	t	yes_no_checkbox	 	\N	1250.00	1250.00	\N	\N	\N	\N	2019-10-10 10:47:06.872994	2019-10-10 10:47:06.872994	99	112	{"plus_value": ""}	\N
121	3	EstimatorType	Interior Repairs	Interior Repairs	interior_repairs	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:48:52.218897	2019-10-10 10:48:52.218897	100	\N	{"plus_value": ""}	\N
122	3	EstimatorType	Doors ( Slab Measurement ) 	Doors ( Slab Measurement ) 	doors_slab_measurement_	t	scope_group	 	\N	165.00	160.00	\N	\N	t	\N	2019-10-10 10:49:51.30123	2019-10-10 10:49:51.30123	101	121	{"plus_value": ""}	\N
123	3	EstimatorType	Height	Height	height	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:50:17.229505	2019-10-10 10:50:17.229505	102	122	{"plus_value": "", "horizont_class": "on"}	\N
124	3	EstimatorType	Width	Width	width	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:50:42.850867	2019-10-10 10:50:42.850867	103	122	{"plus_value": "", "horizont_class": "on"}	\N
125	3	EstimatorType	R/H or L/H	R/H or L/H	rh_or_lh	t	yes_no_checkbox	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:51:12.03563	2019-10-10 10:51:12.03563	104	122	{"plus_value": "", "horizont_class": "on"}	\N
126	3	EstimatorType	Closet ( Rough Opneing Measurements )	Closet ( Rough Opneing Measurements )	closet_rough_opneing_measurements_	t	scope_group	 	\N	350.00	350.00	\N	\N	t	\N	2019-10-10 10:53:17.648013	2019-10-10 10:53:17.648013	105	121	{"plus_value": "", "horizont_class": "on"}	\N
127	3	EstimatorType	Height	Height	height	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:53:34.1939	2019-10-10 10:53:34.1939	106	126	{"plus_value": "", "horizont_class": "on"}	\N
128	3	EstimatorType	Width	Width	width	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:53:50.685448	2019-10-10 10:53:50.685448	107	126	{"plus_value": "", "horizont_class": "on"}	\N
129	3	EstimatorType	Window Screens ( Inside Measurement )	Window Screens ( Inside Measurement )	window_screens_inside_measurement_	t	scope_group	 	\N	165.00	165.00	\N	\N	t	\N	2019-10-10 10:55:07.523376	2019-10-10 10:55:07.523376	108	121	{"plus_value": "", "horizont_class": "on"}	\N
130	3	EstimatorType	Height	Height	height	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:55:51.119139	2019-10-10 10:55:51.119139	109	129	{"plus_value": "", "horizont_class": "on"}	\N
131	3	EstimatorType	Width	Width	width	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:56:22.736364	2019-10-10 10:56:22.736364	110	129	{"plus_value": "", "horizont_class": "on"}	\N
132	3	EstimatorType	3/8 , 5/8	3/8 , 5/8	38_58	t	yes_no_checkbox	 	\N	\N	\N	\N	\N	t	\N	2019-10-10 10:56:58.780453	2019-10-10 10:56:58.780453	111	129	{"plus_value": "", "horizont_class": "on"}	\N
133	3	EstimatorType	Trim	Trim	trim	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 10:57:28.608926	2019-10-10 10:57:28.608926	112	121	{"plus_value": ""}	\N
134	3	EstimatorType	Casing Supply and Install 	Casing Supply and Install 	casing_supply_and_install_	t	yes_no_checkbox	 	\N	3.00	3.00	\N	\N	\N	\N	2019-10-10 10:58:48.539645	2019-10-10 10:58:48.539645	113	133	{"plus_value": ""}	\N
135	3	EstimatorType	Casing Supply and Install 	Casing Supply and Install 	casing_supply_and_install_	t	yes_no_checkbox	 	\N	3.00	3.00	\N	\N	\N	\N	2019-10-10 10:58:48.791289	2019-10-10 10:58:48.791289	114	133	{"plus_value": ""}	\N
136	3	EstimatorType	Baseboards	Baseboards	baseboards	t	decimal	 	0.00	2.50	2.50	\N	\N	\N	\N	2019-10-10 10:59:40.518753	2019-10-10 10:59:40.518753	115	133	{"plus_type": "on", "plus_value": "1.16"}	\N
137	3	EstimatorType	Various ( cold air returns, railings, etc )	Various ( cold air returns, railings, etc )	various_cold_air_returns_railings_etc_	t	yes_no_checkbox	 	\N	189.00	189.00	\N	\N	\N	\N	2019-10-10 11:02:08.556361	2019-10-10 11:02:08.556361	116	133	{"plus_value": ""}	\N
138	3	EstimatorType	Electrical	Electrical	electrical	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-10 11:05:40.405739	2019-10-10 11:05:40.405739	117	121	{"plus_value": ""}	\N
139	3	EstimatorType	Install Lights & Bulbs	Install Lights & Bulbs 	install_lights_bulbs	t	decimal	 	0.00	45.00	45.00	\N	\N	\N	\N	2019-10-11 11:16:14.822305	2019-10-11 11:16:14.822305	118	138	{"plus_value": ""}	\N
140	3	EstimatorType	Install Vanity Light	Install Vanity Light 	install_vanity_light	t	yes_no_checkbox	 	\N	45.00	45.00	\N	\N	\N	\N	2019-10-11 11:25:07.785983	2019-10-11 11:25:07.785983	119	138	{"plus_value": ""}	\N
141	3	EstimatorType	Install Wall Scones Lights	Install Wall Scones Lights	install_wall_scones_lights	t	yes_no_checkbox	 	0.00	45.00	45.00	\N	\N	\N	\N	2019-10-11 11:36:56.107883	2019-10-11 11:36:56.107883	120	138	{"plus_value": ""}	\N
142	3	EstimatorType	Install & Supply Switches	Install & Supply Switches	install_supply_switches	t	decimal	 	0.00	16.00	16.00	\N	\N	\N	\N	2019-10-11 11:37:54.844852	2019-10-11 11:37:54.844852	121	138	{"plus_value": ""}	\N
143	3	EstimatorType	Insall & Supply Receptacles	Insall & Supply Receptacles 	insall_supply_receptacles	t	decimal	 	0.00	16.00	16.00	\N	\N	\N	\N	2019-10-11 11:38:48.210867	2019-10-11 11:38:48.210867	122	138	{"plus_value": ""}	\N
144	3	EstimatorType	Install Thermostat	Install Thermostat 	install_thermostat	t	yes_no_checkbox	 	\N	45.00	45.00	\N	\N	\N	\N	2019-10-11 11:39:35.542944	2019-10-11 11:39:35.542944	123	138	{"plus_value": ""}	\N
145	3	EstimatorType	Install Carbon Monoxide Detector	Install Carbon Monoxide Detector	install_carbon_monoxide_detector	t	yes_no_checkbox	 	\N	45.00	45.00	\N	\N	\N	\N	2019-10-11 11:40:43.811795	2019-10-11 11:40:43.811795	124	138	{"plus_value": ""}	\N
146	3	EstimatorType	Wire Dishwasher	Wire Dishwasher	wire_dishwasher	t	yes_no_checkbox	 	\N	75.00	75.00	\N	\N	\N	\N	2019-10-11 11:42:00.547922	2019-10-11 11:42:00.547922	125	138	{"plus_value": ""}	\N
147	3	EstimatorType	Wire Hood Fan	Wire Hood Fan	wire_hood_fan	t	yes_no_checkbox	 	\N	125.00	125.00	\N	\N	\N	\N	2019-10-11 11:42:41.095674	2019-10-11 11:42:41.095674	126	138	{"plus_value": ""}	\N
148	3	EstimatorType	Supply & Install GFI receptacles 	Supply & Install GFI receptacles 	supply_install_gfi_receptacles_	t	decimal	 	0.00	75.00	75.00	\N	\N	\N	\N	2019-10-11 11:43:28.449716	2019-10-11 11:43:28.449716	127	138	{"plus_value": ""}	\N
149	3	EstimatorType	Supply and Install ata & Phone Covers 	Supply and Install Data & Phone Covers 	supply_and_install_ata_phone_covers_	t	yes_no_checkbox	 	\N	55.00	55.00	\N	\N	\N	\N	2019-10-11 11:43:58.098398	2019-10-11 11:43:58.098398	128	138	{"plus_value": ""}	\N
150	3	EstimatorType	Final Cleaning & Garbage Removal 	Final Cleaning & Garbage Removal 	final_cleaning_garbage_removal_	t	yes_no_checkbox	 	\N	350.00	350.00	\N	\N	\N	\N	2019-10-11 11:44:46.7233	2019-10-11 11:44:46.7233	129	138	{"plus_value": ""}	\N
151	3	EstimatorType	Paint	Paint	paint	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-11 11:53:30.97031	2019-10-11 11:53:30.97031	130	\N	{"plus_value": ""}	\N
152	3	EstimatorType	Paint Ceiling	Paint Ceiling 	paint_ceiling	t	decimal	 	0.00	1.00	1.00	\N	\N	\N	\N	2019-10-11 12:01:48.593584	2019-10-11 12:01:48.593584	131	151	{"plus_type": "on", "plus_value": "1.16"}	\N
153	3	EstimatorType	Paint all walls, doors, trim	Paint all walls, doors, trim	paint_all_walls_doors_trim	t	decimal	 	0.00	2.14	2.14	\N	\N	\N	\N	2019-10-11 12:03:04.938078	2019-10-11 12:03:04.938078	132	151	{"plus_type": "on", "plus_value": "1.14"}	\N
154	3	EstimatorType	Wall Prep ( patches, holes, corners, etc )	Wall Prep ( patches, holes, corners, etc ) 	wall_prep_patches_holes_corners_etc_	t	yes_no_checkbox	 	\N	350.00	350.00	\N	\N	\N	\N	2019-10-11 12:23:10.892935	2019-10-11 12:23:10.892935	133	151	{"plus_value": ""}	\N
155	3	EstimatorType	Blinds	Blinds	blinds	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-11 12:25:29.215228	2019-10-11 12:25:29.215228	134	\N	{"plus_value": ""}	\N
156	3	EstimatorType	Blinds  ( Outside Measurement )	Blinds  ( Outside Measurement )	blinds__outside_measurement_	t	scope_group	 	0.00	225.00	225.00	\N	\N	\N	\N	2019-10-11 12:27:04.624857	2019-10-11 12:27:04.624857	135	155	{"plus_value": ""}	\N
157	3	EstimatorType	Height	Height	height	t	text	 	\N	\N	\N	\N	\N	t	\N	2019-10-11 12:27:40.197216	2019-10-11 12:27:40.197216	136	156	{"plus_value": "", "horizont_class": "on"}	\N
158	3	EstimatorType	Width	Width	width	t	text	 	\N	\N	\N	\N	\N	\N	\N	2019-10-11 12:30:23.31663	2019-10-11 12:30:23.31663	137	156	{"plus_value": ""}	\N
159	3	EstimatorType	3/8 , 5/8	3/8 , 5/8	38_58	t	yes_no_checkbox	  	\N	\N	\N	\N	\N	\N	\N	2019-10-11 12:31:24.560749	2019-10-11 12:31:43.100291	138	156	{"plus_value": ""}	\N
160	3	EstimatorType	Appliances	Appliances	appliances	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-11 12:32:02.739548	2019-10-11 12:32:02.739548	139	\N	{"plus_value": ""}	\N
161	3	EstimatorType	Stove Supply and Deliver 	Stove Supply and Deliver 	stove_supply_and_deliver_	t	yes_no_checkbox	 	\N	550.00	550.00	\N	\N	\N	\N	2019-10-11 12:32:52.376077	2019-10-11 12:32:52.376077	140	160	{"plus_value": ""}	\N
162	3	EstimatorType	Fridge Supply and Deliver ( 28 - 30 )	Fridge Supply and Deliver ( 28 - 30 )	fridge_supply_and_deliver_28_-_30_	t	yes_no_checkbox	 	\N	680.00	680.00	\N	\N	\N	\N	2019-10-11 12:33:20.50805	2019-10-11 12:33:20.50805	141	160	{"plus_value": ""}	\N
163	3	EstimatorType	Hood Fan Supply and Deliver ( 24 - 30 )	Hood Fan Supply and Deliver ( 24 - 30 )	hood_fan_supply_and_deliver_24_-_30_	t	yes_no_checkbox	 	\N	100.00	100.00	\N	\N	\N	\N	2019-10-11 12:33:59.072603	2019-10-11 12:33:59.072603	142	160	{"plus_value": ""}	\N
164	3	EstimatorType	Dishwasher Supply and Deliver	Dishwasher Supply and Deliver 	dishwasher_supply_and_deliver	t	yes_no_checkbox	 	\N	500.00	500.00	\N	\N	\N	\N	2019-10-11 12:34:34.778128	2019-10-11 12:34:34.778128	143	160	{"plus_value": ""}	\N
165	3	EstimatorType	Washer	Washer	washer	t	yes_no_checkbox	 	\N	600.00	600.00	\N	\N	\N	\N	2019-10-11 13:40:42.038846	2019-10-11 13:40:42.038846	144	160	{"plus_value": ""}	\N
166	3	EstimatorType	Dryer	Dryer	dryer	t	yes_no_checkbox	 	\N	400.00	400.00	\N	\N	\N	\N	2019-10-11 13:41:17.588351	2019-10-11 13:41:17.588351	145	160	{"plus_value": ""}	\N
167	3	EstimatorType	Other	Other	other	t	one_group	 	\N	\N	\N	\N	\N	\N	\N	2019-10-11 13:41:47.025719	2019-10-11 13:41:47.025719	146	\N	{"plus_value": ""}	\N
168	3	EstimatorType	Mold ( 1, 2 , 3 )	Mold ( 1, 2 , 3 ) 	mold_1_2_3_	t	yes_no_checkbox	 	\N	1000.00	1000.00	\N	\N	\N	\N	2019-10-11 13:44:24.615907	2019-10-11 13:44:24.615907	147	167	{"plus_value": ""}	\N
169	3	EstimatorType	Asbestos  ( 1, 2 , 3 )	Asbestos  ( 1, 2 , 3 ) 	asbestos__1_2_3_	t	yes_no_checkbox	 	\N	1000.00	1000.00	\N	\N	\N	\N	2019-10-11 13:44:51.347582	2019-10-11 13:44:51.347582	148	167	{"plus_value": ""}	\N
170	3	EstimatorType	Haz Mat ( 1, 2 , 3 )	Haz Mat ( 1, 2 , 3 ) 	haz_mat_1_2_3_	t	yes_no_checkbox	 	\N	1000.00	1000.00	\N	\N	\N	\N	2019-10-11 13:45:16.532465	2019-10-11 13:45:16.532465	149	167	{"plus_value": ""}	\N
171	3	EstimatorType	Contractor Fee	Contractor Fee	contractor_fee	t	one_checkbox	 	\N	2240.00	2240.00	\N	\N	\N	\N	2019-10-11 13:45:50.563788	2019-10-11 13:45:50.563788	150	\N	{"plus_value": ""}	\N
\.


--
-- Data for Name: financials; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.financials (id, contract_id, bank, addressc, contact, phone, email, acct, transist, institution, bonding_company, bc_limit, bc_address, bc_contact, bc_phone, bc_email, insurance_company, ic_address, ic_general_laibility, ic_expiry, ic_email, ic_wcb, other_work_astra, other_property_name, other_property_address, other_contact, other_phone, other_phone_alt, created_at, updated_at, ins_cert_file_name, ins_cert_content_type, ins_cert_file_size, ins_cert_updated_at, wcb_cert_file_name, wcb_cert_content_type, wcb_cert_file_size, wcb_cert_updated_at, bc_n_a, void_check_file_name, void_check_content_type, void_check_file_size, void_check_updated_at, ic_phone) FROM stdin;
196	197									\N	\N	\N		\N	\N			\N	\N			\N	\N	\N	\N	\N	\N	2019-03-28 15:21:29.664206	2019-03-28 15:21:29.664206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
218	219		Shevchenkoe2	dsdsd	(232) 323-2323	peluhnya@outlook.com				\N		\N	dssdsd	\N	\N	legal	Shevchenkoe2		\N	peluhnya@outlook.com		\N	\N	\N	\N	\N	\N	2019-07-20 08:20:17.328096	2019-07-20 08:25:57.655325	image_2019-07-16_12-05-26.png	image/png	38972	2019-07-20 08:20:17.303762	image_2019-07-16_12-05-26.png	image/png	38972	2019-07-20 08:20:17.308401	\N	image_2019-07-16_12-05-26.png	image/png	38972	2019-07-20 08:20:17.282344	(343) 434-3434
220	221			test	(111) 111-1111	kk4872319@gmail.com				\N	\N	\N	test	\N	\N	test		\N	\N	kk4872319@gmail.com		\N	\N	\N	\N	\N	\N	2019-07-26 14:04:51.361905	2019-07-26 14:04:51.361905	change_order_158.pdf	application/pdf	25087	2019-07-26 14:04:51.301471	change_order_158.pdf	application/pdf	25087	2019-07-26 14:04:51.336667	\N	purchase_order_301.pdf	application/pdf	24296	2019-07-26 14:04:51.281612	(111) 111-1111
212	213		k4872319@ukr.net	Bank	(222) 222-2222	peluhnya@outlook.com				\N		\N	Contact	\N	\N	Company			\N	k4872319@ukr.net		\N	\N	\N	\N	\N	\N	2019-07-17 22:07:31.915802	2019-07-19 14:08:00.563965	purchase_order_367.pdf	application/pdf	26250	2019-07-17 22:07:31.885637	purchase_order_368.pdf	application/pdf	26636	2019-07-17 22:07:31.889307	\N	purchase_order_342.pdf	application/pdf	25131	2019-07-17 22:07:31.867784	(222) 222-2222
216	217	Test	45G65	Doony	(444) 444-4444	k4872319@yahoo.com	1	2	3	\N	3	\N	Don	\N	\N	TESt	45G65	5	2023-01-20	k4872319@yahoo.com	123456789	\N	\N	\N	\N	\N	\N	2019-07-19 19:51:51.918283	2019-07-19 19:51:51.918283	purchase_order_342.pdf	application/pdf	25131	2019-07-19 19:51:51.880412	purchase_order_367.pdf	application/pdf	26250	2019-07-19 19:51:51.88395	\N	invoice_order_318888888888888888888888888888888888888888888888888888888888888888888888888888888888888.pdf	application/pdf	24693	2019-07-19 19:51:51.868065	(555) 555-5555
221	222			test	(111) 111-1111	kk4872319@gmail.com				\N		\N	test	\N	\N	test			\N	kk4872319@gmail.com		\N	\N	\N	\N	\N	\N	2019-07-26 14:06:29.971607	2019-07-26 14:07:59.613622	70c4397eb9599055da6e3ecefdc826b2.pdf	application/pdf	6378170	2019-07-26 14:06:29.945004	2019-08-16_maryya_tkachuk.pdf	application/pdf	312009	2019-07-26 14:06:29.949476	\N	70c4397eb9599055da6e3ecefdc826b2.pdf	application/pdf	6378170	2019-07-26 14:06:29.93861	(111) 111-1111
219	220		Shevchenko	dsdsd	(234) 234-2342	peluhnya@ouaewewwetlook.com				\N		\N	dssdsd	\N	\N	legal	Shevchenko		\N	peluhnya@outlook.com		\N	\N	\N	\N	\N	\N	2019-07-25 13:30:29.195002	2019-07-26 14:13:21.833662	візитка_1.pdf	application/pdf	1774935	2019-07-25 13:30:29.158996	візитка_1.pdf	application/pdf	1774935	2019-07-25 13:30:29.164875	\N	візитка_2.pdf	application/pdf	1505870	2019-07-25 13:30:29.135303	(234) 324-3242
222	223		Dnipro 112 street	Homyak	(888) 888-8888	page.aleks@gmail.com				\N	\N	\N	6786876	\N	\N	8687667867	pobeda	\N	\N	page.aleks@gmail.com		\N	\N	\N	\N	\N	\N	2019-08-06 19:06:31.309711	2019-08-06 19:06:31.309711	buttons.png	image/png	46313	2019-08-06 19:06:31.236626	buttons.png	image/png	46313	2019-08-06 19:06:31.239569	\N	buttons.png	image/png	46313	2019-08-06 19:06:31.22648	(678) 678-6786
223	224		pobeda	12132312132	(213) 123-3212	page.aleks@gmail.com				\N	\N	\N	1232132	\N	\N	line	pobeda	\N	\N	page.aleks@gmail.com		\N	\N	\N	\N	\N	\N	2019-08-06 19:40:03.592283	2019-08-06 19:40:03.592283	buttons.png	image/png	46313	2019-08-06 19:40:03.558472	buttons.png	image/png	46313	2019-08-06 19:40:03.56164	\N	buttons.png	image/png	46313	2019-08-06 19:40:03.54254	(213) 123-3211
224	225		3rd Street SW, 10th Floor Bankers Hall, West Tower	8768678	(898) 089-0980	aleks.page.gg@gmail.com				\N	\N	\N	bmnbmnb	\N	\N	Astra-Managment	Dnipro 112 street	\N	\N	page.aleks@gmail.com		\N	\N	\N	\N	\N	\N	2019-08-07 20:40:45.730975	2019-08-07 20:40:45.730975	buttons.png	image/png	46313	2019-08-07 20:40:45.679544	buttons.png	image/png	46313	2019-08-07 20:40:45.682363	\N	buttons.png	image/png	46313	2019-08-07 20:40:45.669821	(890) 908-9809
225	226		3rd Street SW, 10th Floor Bankers Hall, West Tower	Homyak	(234) 234-3244	aleks.page.gg@gmail.com				\N	\N	\N	asdadsadsads	\N	\N	Astra-Managment	3rd Street SW, 10th Floor Bankers Hall, West Tower	\N	\N	aleks.page.gg@gmail.com		\N	\N	\N	\N	\N	\N	2019-08-07 20:46:25.683353	2019-08-07 20:46:25.683353	buttons.png	image/png	46313	2019-08-07 20:46:25.652203	buttons.png	image/png	46313	2019-08-07 20:46:25.655011	\N	buttons.png	image/png	46313	2019-08-07 20:46:25.649019	(342) 342-4234
226	227									\N		\N		\N	\N				\N			\N	\N	\N	\N	\N	\N	2019-09-02 21:39:23.798995	2019-09-02 21:39:23.798995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
217	218									\N		\N		\N	\N				\N			\N	\N	\N	\N	\N	\N	2019-07-19 20:04:14.615282	2019-09-10 17:53:06.778069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.invoices (id, payable_type, payable_id, state, created_at, updated_at) FROM stdin;
1	Task	336	not_paid	2019-10-02 20:12:48.68773	2019-10-02 20:12:48.68773
2	Task	345	not_paid	2019-10-02 20:12:48.707237	2019-10-02 20:12:48.707237
3	Task	360	not_paid	2019-10-02 20:12:48.711564	2019-10-02 20:12:48.711564
4	Task	362	not_paid	2019-10-02 20:12:48.715301	2019-10-02 20:12:48.715301
5	Task	392	not_paid	2019-10-02 20:12:48.719028	2019-10-02 20:12:48.719028
6	Task	394	not_paid	2019-10-02 20:12:48.72278	2019-10-02 20:12:48.72278
7	Task	395	not_paid	2019-10-02 20:12:48.72633	2019-10-02 20:12:48.72633
8	Task	396	not_paid	2019-10-02 20:12:48.730174	2019-10-02 20:12:48.730174
9	Task	397	not_paid	2019-10-02 20:12:48.733794	2019-10-02 20:12:48.733794
10	Task	405	not_paid	2019-10-02 20:12:48.737351	2019-10-02 20:12:48.737351
11	Task	413	not_paid	2019-10-02 20:12:48.740877	2019-10-02 20:12:48.740877
12	Task	419	not_paid	2019-10-02 20:12:48.745994	2019-10-02 20:12:48.745994
13	Task	420	not_paid	2019-10-02 20:12:48.750213	2019-10-02 20:12:48.750213
14	Task	430	not_paid	2019-10-02 20:12:48.754293	2019-10-02 20:12:48.754293
15	Task	431	not_paid	2019-10-02 20:12:48.758346	2019-10-02 20:12:48.758346
16	Task	432	not_paid	2019-10-02 20:12:48.762388	2019-10-02 20:12:48.762388
17	Task	437	not_paid	2019-10-02 20:12:48.766504	2019-10-02 20:12:48.766504
18	Task	442	not_paid	2019-10-02 20:12:48.77028	2019-10-02 20:12:48.77028
19	Task	444	not_paid	2019-10-02 20:12:48.773994	2019-10-02 20:12:48.773994
20	Task	447	not_paid	2019-10-02 20:12:48.77804	2019-10-02 20:12:48.77804
21	Task	449	not_paid	2019-10-02 20:12:48.781904	2019-10-02 20:12:48.781904
22	Task	450	not_paid	2019-10-02 20:12:48.785697	2019-10-02 20:12:48.785697
23	Task	451	not_paid	2019-10-02 20:12:48.789361	2019-10-02 20:12:48.789361
24	Task	452	not_paid	2019-10-02 20:12:48.792993	2019-10-02 20:12:48.792993
25	Task	453	not_paid	2019-10-02 20:12:48.796741	2019-10-02 20:12:48.796741
26	Task	457	not_paid	2019-10-02 20:12:48.800504	2019-10-02 20:12:48.800504
27	Task	502	not_paid	2019-10-02 20:12:48.804247	2019-10-02 20:12:48.804247
28	Task	503	not_paid	2019-10-02 20:12:48.807961	2019-10-02 20:12:48.807961
29	Task	504	not_paid	2019-10-02 20:12:48.811634	2019-10-02 20:12:48.811634
30	Task	505	not_paid	2019-10-02 20:12:48.815459	2019-10-02 20:12:48.815459
31	Task	506	not_paid	2019-10-02 20:12:48.819331	2019-10-02 20:12:48.819331
32	Task	507	not_paid	2019-10-02 20:12:48.823613	2019-10-02 20:12:48.823613
33	Task	508	not_paid	2019-10-02 20:12:48.827319	2019-10-02 20:12:48.827319
34	Task	509	not_paid	2019-10-02 20:12:48.831002	2019-10-02 20:12:48.831002
35	Task	511	not_paid	2019-10-02 20:12:48.834662	2019-10-02 20:12:48.834662
36	Task	512	not_paid	2019-10-02 20:12:48.838307	2019-10-02 20:12:48.838307
37	Task	513	not_paid	2019-10-02 20:12:48.841986	2019-10-02 20:12:48.841986
38	Task	514	not_paid	2019-10-02 20:12:48.845657	2019-10-02 20:12:48.845657
39	Task	521	not_paid	2019-10-02 20:12:48.84959	2019-10-02 20:12:48.84959
40	Task	524	not_paid	2019-10-02 20:12:48.853341	2019-10-02 20:12:48.853341
41	Task	530	not_paid	2019-10-02 20:12:48.857183	2019-10-02 20:12:48.857183
42	Task	531	not_paid	2019-10-02 20:12:48.860989	2019-10-02 20:12:48.860989
43	Task	532	not_paid	2019-10-02 20:12:48.864772	2019-10-02 20:12:48.864772
44	Task	533	not_paid	2019-10-02 20:12:48.868968	2019-10-02 20:12:48.868968
45	Task	534	not_paid	2019-10-02 20:12:48.872731	2019-10-02 20:12:48.872731
46	Task	535	not_paid	2019-10-02 20:12:48.876507	2019-10-02 20:12:48.876507
47	Task	536	not_paid	2019-10-02 20:12:48.880244	2019-10-02 20:12:48.880244
48	Task	538	not_paid	2019-10-02 20:12:48.883934	2019-10-02 20:12:48.883934
49	Task	539	not_paid	2019-10-02 20:12:48.888105	2019-10-02 20:12:48.888105
50	Task	540	not_paid	2019-10-02 20:12:48.891893	2019-10-02 20:12:48.891893
51	Task	542	not_paid	2019-10-02 20:12:48.895551	2019-10-02 20:12:48.895551
52	Task	543	not_paid	2019-10-02 20:12:48.89926	2019-10-02 20:12:48.89926
53	Task	544	not_paid	2019-10-02 20:12:48.902902	2019-10-02 20:12:48.902902
54	Task	545	not_paid	2019-10-02 20:12:48.907338	2019-10-02 20:12:48.907338
55	Task	546	not_paid	2019-10-02 20:12:48.911055	2019-10-02 20:12:48.911055
56	Task	547	not_paid	2019-10-02 20:12:48.914898	2019-10-02 20:12:48.914898
57	Task	548	not_paid	2019-10-02 20:12:48.918638	2019-10-02 20:12:48.918638
58	Task	549	not_paid	2019-10-02 20:12:48.922852	2019-10-02 20:12:48.922852
59	Task	550	not_paid	2019-10-02 20:12:48.926645	2019-10-02 20:12:48.926645
60	Task	551	not_paid	2019-10-02 20:12:48.930422	2019-10-02 20:12:48.930422
61	Task	552	not_paid	2019-10-02 20:12:48.934157	2019-10-02 20:12:48.934157
62	Task	553	not_paid	2019-10-02 20:12:48.937818	2019-10-02 20:12:48.937818
63	Task	554	not_paid	2019-10-02 20:12:48.941562	2019-10-02 20:12:48.941562
64	Task	555	not_paid	2019-10-02 20:12:48.945299	2019-10-02 20:12:48.945299
65	Task	556	not_paid	2019-10-02 20:12:48.948922	2019-10-02 20:12:48.948922
66	Task	557	not_paid	2019-10-02 20:12:48.952553	2019-10-02 20:12:48.952553
67	Task	558	not_paid	2019-10-02 20:12:48.956262	2019-10-02 20:12:48.956262
68	Task	559	not_paid	2019-10-02 20:12:48.96003	2019-10-02 20:12:48.96003
69	Task	560	not_paid	2019-10-02 20:12:48.963801	2019-10-02 20:12:48.963801
70	Task	561	not_paid	2019-10-02 20:12:48.96758	2019-10-02 20:12:48.96758
71	Task	562	not_paid	2019-10-02 20:12:48.971151	2019-10-02 20:12:48.971151
72	Task	563	not_paid	2019-10-02 20:12:48.974742	2019-10-02 20:12:48.974742
73	Task	564	not_paid	2019-10-02 20:12:48.978511	2019-10-02 20:12:48.978511
74	Task	565	not_paid	2019-10-02 20:12:48.982159	2019-10-02 20:12:48.982159
75	Task	566	not_paid	2019-10-02 20:12:48.985823	2019-10-02 20:12:48.985823
76	Task	567	not_paid	2019-10-02 20:12:48.989494	2019-10-02 20:12:48.989494
77	Task	568	not_paid	2019-10-02 20:12:48.993158	2019-10-02 20:12:48.993158
78	Task	569	not_paid	2019-10-02 20:12:48.996804	2019-10-02 20:12:48.996804
79	Task	570	not_paid	2019-10-02 20:12:49.000399	2019-10-02 20:12:49.000399
80	Task	571	not_paid	2019-10-02 20:12:49.004064	2019-10-02 20:12:49.004064
81	Task	572	not_paid	2019-10-02 20:12:49.007818	2019-10-02 20:12:49.007818
82	Task	573	not_paid	2019-10-02 20:12:49.011608	2019-10-02 20:12:49.011608
83	Task	574	not_paid	2019-10-02 20:12:49.015456	2019-10-02 20:12:49.015456
84	Task	575	not_paid	2019-10-02 20:12:49.019266	2019-10-02 20:12:49.019266
85	Task	576	not_paid	2019-10-02 20:12:49.023829	2019-10-02 20:12:49.023829
86	Task	577	not_paid	2019-10-02 20:12:49.027787	2019-10-02 20:12:49.027787
87	Task	578	not_paid	2019-10-02 20:12:49.031631	2019-10-02 20:12:49.031631
88	Task	579	not_paid	2019-10-02 20:12:49.03553	2019-10-02 20:12:49.03553
89	Task	580	not_paid	2019-10-02 20:12:49.039386	2019-10-02 20:12:49.039386
90	Task	581	not_paid	2019-10-02 20:12:49.043273	2019-10-02 20:12:49.043273
91	Task	582	not_paid	2019-10-02 20:12:49.047061	2019-10-02 20:12:49.047061
92	Task	583	not_paid	2019-10-02 20:12:49.056673	2019-10-02 20:12:49.056673
93	Task	584	not_paid	2019-10-02 20:12:49.061607	2019-10-02 20:12:49.061607
94	Task	585	not_paid	2019-10-02 20:12:49.065581	2019-10-02 20:12:49.065581
95	Task	586	not_paid	2019-10-02 20:12:49.069446	2019-10-02 20:12:49.069446
98	Task	589	not_paid	2019-10-02 20:12:49.081031	2019-10-02 20:12:49.081031
101	Task	592	not_paid	2019-10-02 20:12:49.092993	2019-10-02 20:12:49.092993
102	Task	593	not_paid	2019-10-04 08:03:16.543586	2019-10-04 08:03:16.543586
97	Task	588	paid	2019-10-02 20:12:49.077282	2019-10-03 11:27:22.326621
100	Task	591	paid	2019-10-02 20:12:49.089081	2019-10-03 08:43:22.115836
96	Task	587	not_paid	2019-10-02 20:12:49.073361	2019-10-03 08:43:32.451363
99	Task	590	not_paid	2019-10-02 20:12:49.084882	2019-10-03 11:27:47.048146
103	Task	594	paid	2019-10-04 08:06:31.20118	2019-10-04 08:22:07.243743
105	Task	596	not_paid	2019-10-04 09:08:37.623191	2019-10-04 09:08:37.623191
104	Task	595	not_paid	2019-10-04 08:11:37.534104	2019-10-04 08:26:54.699848
106	Task	597	not_paid	2019-10-04 11:55:32.942352	2019-10-04 11:55:32.942352
107	Task	598	not_paid	2019-10-04 11:56:52.045223	2019-10-04 11:56:52.045223
109	Task	600	not_paid	2019-10-04 13:28:15.233211	2019-10-04 13:50:22.345557
108	Task	599	not_paid	2019-10-04 13:26:24.235404	2019-10-05 06:08:21.016214
110	Task	601	paid	2019-10-06 18:37:13.405511	2019-10-06 18:43:02.661743
111	Task	602	paid	2019-10-06 20:35:38.363254	2019-10-06 20:38:46.397027
\.


--
-- Data for Name: line_estimators; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.line_estimators (id, value, field_estimator_id, estimator_id, task_id, astra_total, trade_total, created_at, updated_at) FROM stdin;
5	false	20	117	\N	0.0	0.0	2019-09-11 12:25:17.842619	2019-09-11 12:25:17.842619
7	true	13	117	\N	0.0	0.0	2019-09-11 12:25:17.850385	2019-09-11 12:25:17.850385
8	false	23	117	\N	0.0	0.0	2019-09-11 12:25:17.854467	2019-09-11 12:25:17.854467
10	false	10	117	\N	0.0	0.0	2019-09-11 12:25:17.862894	2019-09-11 12:25:17.862894
17	true	12	118	\N	45.0	56.0	2019-09-12 06:19:11.52825	2019-09-12 06:19:11.52825
18	10	19	118	\N	450.0	450.0	2019-09-12 06:19:11.536077	2019-09-12 06:19:11.536077
19	10	24	118	\N	2250.0	2250.0	2019-09-12 06:19:11.543472	2019-09-12 06:19:11.543472
20	10	15	118	\N	550.0	550.0	2019-09-12 06:19:11.559806	2019-09-12 06:19:11.559806
21	true	20	118	\N	0.0	0.0	2019-09-12 06:19:11.566735	2019-09-12 06:19:11.566735
22	10	21	118	\N	3500.0	3500.0	2019-09-12 06:19:11.573413	2019-09-12 06:19:11.573413
23	true	13	118	\N	0.0	0.0	2019-09-12 06:19:11.579791	2019-09-12 06:19:11.579791
24	false	23	118	\N	0.0	0.0	2019-09-12 06:19:11.586039	2019-09-12 06:19:11.586039
25	true	9	118	\N	350.0	350.0	2019-09-12 06:19:11.592266	2019-09-12 06:19:11.592266
26	true	10	118	\N	225.0	225.0	2019-09-12 06:19:11.599124	2019-09-12 06:19:11.599124
27	true	11	118	\N	350.0	350.0	2019-09-12 06:19:11.605805	2019-09-12 06:19:11.605805
28	10	14	118	\N	450.0	450.0	2019-09-12 06:19:11.612376	2019-09-12 06:19:11.612376
29	10	16	118	\N	0.0	0.0	2019-09-12 06:19:11.621105	2019-09-12 06:19:11.621105
30	10	17	118	\N	27.5	27.5	2019-09-12 06:19:11.63256	2019-09-12 06:19:11.63256
31	10	18	118	\N	26.5	26.5	2019-09-12 06:19:11.682491	2019-09-12 06:19:11.682491
32	10	22	118	\N	53.5	53.5	2019-09-12 06:19:11.693927	2019-09-12 06:19:11.693927
33	true	12	119	\N	45.0	56.0	2019-09-12 06:27:36.511406	2019-09-12 06:27:36.511406
34	1	19	119	\N	45.0	45.0	2019-09-12 06:27:36.518054	2019-09-12 06:27:36.518054
35	1	24	119	\N	225.0	225.0	2019-09-12 06:27:36.524405	2019-09-12 06:27:36.524405
36	1	15	119	\N	55.0	55.0	2019-09-12 06:27:36.530362	2019-09-12 06:27:36.530362
37	true	20	119	\N	0.0	0.0	2019-09-12 06:27:36.539716	2019-09-12 06:27:36.539716
40	false	23	119	\N	0.0	0.0	2019-09-12 06:27:36.564974	2019-09-12 06:27:36.564974
41	true	9	119	\N	350.0	350.0	2019-09-12 06:27:36.572448	2019-09-12 06:27:36.572448
42	true	10	119	\N	225.0	225.0	2019-09-12 06:27:36.580365	2019-09-12 06:27:36.580365
43	true	11	119	\N	350.0	350.0	2019-09-12 06:27:36.588506	2019-09-12 06:27:36.588506
44	1	14	119	\N	45.0	45.0	2019-09-12 06:27:36.5963	2019-09-12 06:27:36.5963
45	1	16	119	\N	0.0	0.0	2019-09-12 06:27:36.602492	2019-09-12 06:27:36.602492
39	true	13	119	579	0.0	0.0	2019-09-12 06:27:36.556814	2019-09-12 06:42:15.418485
49	false	12	120	\N	0.0	0.0	2019-09-12 06:46:11.095886	2019-09-12 06:46:11.095886
55	true	13	120	\N	0.0	0.0	2019-09-12 06:46:11.186693	2019-09-12 06:46:11.186693
56	false	23	120	\N	0.0	0.0	2019-09-12 06:46:11.194004	2019-09-12 06:46:11.194004
59	false	11	120	\N	0.0	0.0	2019-09-12 06:46:11.220508	2019-09-12 06:46:11.220508
65	false	12	121	\N	0.0	0.0	2019-09-12 06:59:04.443279	2019-09-12 06:59:04.443279
74	false	10	121	\N	0.0	0.0	2019-09-12 06:59:04.501252	2019-09-12 06:59:04.501252
75	false	11	121	\N	0.0	0.0	2019-09-12 06:59:04.507349	2019-09-12 06:59:04.507349
71	false	13	121	580	0.0	0.0	2019-09-12 06:59:04.483211	2019-09-12 07:02:44.113961
72	false	23	121	580	0.0	0.0	2019-09-12 06:59:04.489072	2019-09-12 07:02:44.125556
67	10	24	121	580	2250.0	2250.0	2019-09-12 06:59:04.456928	2019-09-12 07:02:44.136446
68	10	15	121	580	550.0	550.0	2019-09-12 06:59:04.464579	2019-09-12 07:02:44.148436
70	10	21	121	580	3500.0	3500.0	2019-09-12 06:59:04.477188	2019-09-12 07:02:44.15568
77	10	16	121	580	0.0	0.0	2019-09-12 06:59:04.519127	2019-09-12 07:02:44.162638
66	10	19	121	580	450.0	450.0	2019-09-12 06:59:04.448914	2019-09-12 07:02:44.221076
76	10	14	121	580	450.0	450.0	2019-09-12 06:59:04.513199	2019-09-12 07:02:44.228994
73	true	9	121	580	350.0	350.0	2019-09-12 06:59:04.495146	2019-09-12 07:02:44.235875
81	false	12	122	\N	0.0	0.0	2019-09-12 11:38:00.089868	2019-09-12 11:38:00.089868
82	0	19	122	\N	0.0	0.0	2019-09-12 11:38:00.098217	2019-09-12 11:38:00.098217
83	0	24	122	\N	0.0	0.0	2019-09-12 11:38:00.105714	2019-09-12 11:38:00.105714
57	true	9	120	\N	0.0	0.0	2019-09-12 06:46:11.203183	2019-09-16 08:52:13.06223
63	122	18	120	\N	355.63	355.63	2019-09-12 06:46:11.252303	2019-09-15 20:04:30.171457
64	122	22	120	\N	717.97	717.97	2019-09-12 06:46:11.260834	2019-09-15 20:04:30.177746
50	100	19	120	\N	0.0	0.0	2019-09-12 06:46:11.104511	2019-09-16 08:52:13.013823
62	122	17	120	\N	369.05	369.05	2019-09-12 06:46:11.242889	2019-09-15 20:04:30.165348
51	100	24	120	\N	0.0	0.0	2019-09-12 06:46:11.112012	2019-09-16 08:52:13.022987
52	1000	15	120	\N	0.0	0.0	2019-09-12 06:46:11.119383	2019-09-16 08:52:13.030419
53	true	20	120	\N	0.0	0.0	2019-09-12 06:46:11.127738	2019-09-16 08:52:13.037698
54	100	21	120	\N	0.0	0.0	2019-09-12 06:46:11.136017	2019-09-16 08:52:13.044879
58	true	10	120	\N	0.0	0.0	2019-09-12 06:46:11.212638	2019-09-16 08:52:13.068719
60	100	14	120	\N	0.0	0.0	2019-09-12 06:46:11.228294	2019-09-16 08:52:13.079054
1	true	12	117	\N	0.0	0.0	2019-09-11 12:25:17.825424	2019-09-16 08:52:56.480714
14	1000	17	117	\N	3025.0	3025.0	2019-09-11 12:25:17.880967	2019-09-16 08:54:52.839036
2	243	19	117	\N	0.0	0.0	2019-09-11 12:25:17.83009	2019-09-16 08:52:56.491661
3	23	24	117	578	0.0	0.0	2019-09-11 12:25:17.834451	2019-09-16 08:52:56.496306
4	24	15	117	578	0.0	0.0	2019-09-11 12:25:17.838677	2019-09-16 08:52:56.503756
6	4	21	117	\N	0.0	0.0	2019-09-11 12:25:17.846333	2019-09-16 08:52:56.516366
9	true	9	117	\N	0.0	0.0	2019-09-11 12:25:17.858795	2019-09-16 08:52:56.534674
11	true	11	117	\N	0.0	0.0	2019-09-11 12:25:17.866982	2019-09-16 08:52:56.547673
12	2	14	117	\N	0.0	0.0	2019-09-11 12:25:17.871723	2019-09-16 08:52:56.555172
15	1000	18	117	\N	2915.0	2915.0	2019-09-11 12:25:17.888144	2019-09-16 08:54:52.845557
80	10	22	121	580	58.85	58.85	2019-09-12 06:59:04.54178	2019-09-16 13:29:28.374487
13	1000	16	117	\N	0.0	0.0	2019-09-11 12:25:17.875664	2019-09-16 08:54:52.772418
16	1000	22	117	\N	5885.0	5885.0	2019-09-11 12:25:17.893397	2019-09-16 08:54:52.766178
69	true	20	121	\N	0.0	0.0	2019-09-12 06:59:04.47087	2019-09-16 13:29:28.400616
78	10	17	121	580	30.25	30.25	2019-09-12 06:59:04.526551	2019-09-16 13:29:28.430225
79	10	18	121	580	29.15	29.15	2019-09-12 06:59:04.534032	2019-09-16 13:29:28.441789
48	1	22	119	\N	5.885	5.885	2019-09-12 06:27:36.629047	2019-09-16 13:29:51.093025
38	31	21	119	\N	10850.0	10850.0	2019-09-12 06:27:36.548557	2019-09-16 13:29:51.132497
46	1	17	119	\N	3.025	3.025	2019-09-12 06:27:36.610964	2019-09-16 13:29:51.164292
47	1	18	119	\N	2.915	2.915	2019-09-12 06:27:36.619921	2019-09-16 13:29:51.170467
84	0	15	122	\N	0.0	0.0	2019-09-12 11:38:00.112841	2019-09-12 11:38:00.112841
85	false	20	122	\N	0.0	0.0	2019-09-12 11:38:00.124574	2019-09-12 11:38:00.124574
86	0	21	122	\N	0.0	0.0	2019-09-12 11:38:00.131387	2019-09-12 11:38:00.131387
87	false	13	122	\N	0.0	0.0	2019-09-12 11:38:00.137102	2019-09-12 11:38:00.137102
88	false	23	122	\N	0.0	0.0	2019-09-12 11:38:00.142838	2019-09-12 11:38:00.142838
89	true	9	122	\N	350.0	350.0	2019-09-12 11:38:00.148351	2019-09-12 11:38:00.148351
90	false	10	122	\N	0.0	0.0	2019-09-12 11:38:00.153964	2019-09-12 11:38:00.153964
91	false	11	122	\N	0.0	0.0	2019-09-12 11:38:00.160706	2019-09-12 11:38:00.160706
92	0	14	122	\N	0.0	0.0	2019-09-12 11:38:00.167028	2019-09-12 11:38:00.167028
93	0	16	122	\N	0.0	0.0	2019-09-12 11:38:00.174266	2019-09-12 11:38:00.174266
94	0	17	122	\N	0.0	0.0	2019-09-12 11:38:00.18615	2019-09-12 11:38:00.18615
95	0	18	122	\N	0.0	0.0	2019-09-12 11:38:00.197299	2019-09-12 11:38:00.197299
96	0	22	122	\N	0.0	0.0	2019-09-12 11:38:00.208443	2019-09-12 11:38:00.208443
103	true	13	123	581	0.0	0.0	2019-09-12 12:22:30.112823	2019-09-12 12:24:56.450527
104	false	23	123	581	0.0	0.0	2019-09-12 12:22:30.11806	2019-09-12 12:24:56.457982
99	10	24	123	581	2250.0	2250.0	2019-09-12 12:22:30.091561	2019-09-12 12:24:56.464078
100	10	15	123	581	550.0	550.0	2019-09-12 12:22:30.097233	2019-09-12 12:24:56.469941
102	10	21	123	581	3500.0	3500.0	2019-09-12 12:22:30.107586	2019-09-12 12:24:56.47522
109	10	16	123	581	0.0	0.0	2019-09-12 12:22:30.148167	2019-09-12 12:24:56.481514
110	10	17	123	581	27.5	27.5	2019-09-12 12:22:30.154259	2019-09-12 12:24:56.487663
111	10	18	123	581	26.5	26.5	2019-09-12 12:22:30.161386	2019-09-12 12:24:56.493982
112	10	22	123	581	53.5	53.5	2019-09-12 12:22:30.170044	2019-09-12 12:24:56.50065
98	10	19	123	581	450.0	450.0	2019-09-12 12:22:30.08635	2019-09-12 12:24:56.507314
108	10	14	123	581	450.0	450.0	2019-09-12 12:22:30.14285	2019-09-12 12:24:56.513814
97	true	12	123	581	45.0	56.0	2019-09-12 12:22:30.080333	2019-09-12 12:24:56.519796
101	true	20	123	581	0.0	0.0	2019-09-12 12:22:30.102506	2019-09-12 12:24:56.52584
106	true	10	123	581	225.0	225.0	2019-09-12 12:22:30.129529	2019-09-12 12:24:56.531602
107	true	11	123	581	350.0	350.0	2019-09-12 12:22:30.136454	2019-09-12 12:24:56.536879
105	true	9	123	581	350.0	350.0	2019-09-12 12:22:30.123718	2019-09-12 12:24:56.542319
61	122	16	120	\N	0.0	0.0	2019-09-12 06:46:11.235235	2019-09-15 20:04:30.124281
113	1000	31	117	\N	742.5	742.5	2019-09-16 08:54:52.851306	2019-09-16 08:54:52.851306
114	1000	22	124	\N	5885.0	5885.0	2019-09-16 09:34:26.329831	2019-09-16 09:34:26.329831
115	1000	16	124	\N	0.0	0.0	2019-09-16 09:34:26.335666	2019-09-16 09:34:26.335666
116	false	12	124	\N	0.0	0.0	2019-09-16 09:34:26.341496	2019-09-16 09:34:26.341496
117	0	19	124	\N	0.0	0.0	2019-09-16 09:34:26.346237	2019-09-16 09:34:26.346237
118	299	24	124	\N	0.0	0.0	2019-09-16 09:34:26.352318	2019-09-16 09:34:26.352318
119	0	15	124	\N	0.0	0.0	2019-09-16 09:34:26.356939	2019-09-16 09:34:26.356939
120	false	20	124	\N	0.0	0.0	2019-09-16 09:34:26.361405	2019-09-16 09:34:26.361405
121	03	21	124	\N	0.0	0.0	2019-09-16 09:34:26.365584	2019-09-16 09:34:26.365584
122	true	13	124	\N	0.0	0.0	2019-09-16 09:34:26.369715	2019-09-16 09:34:26.369715
123	false	23	124	\N	0.0	0.0	2019-09-16 09:34:26.374257	2019-09-16 09:34:26.374257
124	true	9	124	\N	0.0	0.0	2019-09-16 09:34:26.378555	2019-09-16 09:34:26.378555
125	true	10	124	\N	0.0	0.0	2019-09-16 09:34:26.382812	2019-09-16 09:34:26.382812
126	false	11	124	\N	0.0	0.0	2019-09-16 09:34:26.386954	2019-09-16 09:34:26.386954
127	0	14	124	\N	0.0	0.0	2019-09-16 09:34:26.391127	2019-09-16 09:34:26.391127
128	1000	17	124	\N	3025.0	3025.0	2019-09-16 09:34:26.397035	2019-09-16 09:34:26.397035
129	1000	18	124	\N	2915.0	2915.0	2019-09-16 09:34:26.403393	2019-09-16 09:34:26.403393
130	1000	31	124	\N	742.5	742.5	2019-09-16 09:34:26.408554	2019-09-16 09:34:26.408554
131	900	22	125	\N	5296.5	5296.5	2019-09-16 09:40:13.16091	2019-09-16 09:40:13.16091
132	900	16	125	\N	0.0	0.0	2019-09-16 09:40:13.167152	2019-09-16 09:40:13.167152
133	false	12	125	\N	0.0	0.0	2019-09-16 09:40:13.17281	2019-09-16 09:40:13.17281
134	738	19	125	\N	0.0	0.0	2019-09-16 09:40:13.178188	2019-09-16 09:40:13.178188
135	8	24	125	\N	0.0	0.0	2019-09-16 09:40:13.183804	2019-09-16 09:40:13.183804
136	6	15	125	\N	0.0	0.0	2019-09-16 09:40:13.18939	2019-09-16 09:40:13.18939
137	false	20	125	\N	0.0	0.0	2019-09-16 09:40:13.194806	2019-09-16 09:40:13.194806
138	5	21	125	\N	0.0	0.0	2019-09-16 09:40:13.199927	2019-09-16 09:40:13.199927
139	false	13	125	\N	0.0	0.0	2019-09-16 09:40:13.205132	2019-09-16 09:40:13.205132
140	false	23	125	\N	0.0	0.0	2019-09-16 09:40:13.209859	2019-09-16 09:40:13.209859
141	true	9	125	\N	0.0	0.0	2019-09-16 09:40:13.214819	2019-09-16 09:40:13.214819
142	false	10	125	\N	0.0	0.0	2019-09-16 09:40:13.219948	2019-09-16 09:40:13.219948
143	true	11	125	\N	0.0	0.0	2019-09-16 09:40:13.225161	2019-09-16 09:40:13.225161
144	83	14	125	\N	0.0	0.0	2019-09-16 09:40:13.232446	2019-09-16 09:40:13.232446
145	900	17	125	\N	2722.5	2722.5	2019-09-16 09:40:13.239543	2019-09-16 09:40:13.239543
146	900	18	125	\N	2623.5	2623.5	2019-09-16 09:40:13.246477	2019-09-16 09:40:13.246477
147	900	31	125	\N	668.25	668.25	2019-09-16 09:40:13.252841	2019-09-16 09:40:13.252841
148	8389	22	126	\N	49369.265	49369.265	2019-09-16 09:44:28.772025	2019-09-16 09:44:28.772025
149	8389	16	126	\N	0.0	0.0	2019-09-16 09:44:28.77685	2019-09-16 09:44:28.77685
150	false	12	126	\N	0.0	0.0	2019-09-16 09:44:28.782199	2019-09-16 09:44:28.782199
151	739	19	126	\N	0.0	0.0	2019-09-16 09:44:28.78683	2019-09-16 09:44:28.78683
152	90	24	126	\N	0.0	0.0	2019-09-16 09:44:28.791389	2019-09-16 09:44:28.791389
153	87	15	126	\N	0.0	0.0	2019-09-16 09:44:28.795787	2019-09-16 09:44:28.795787
154	false	20	126	\N	0.0	0.0	2019-09-16 09:44:28.800164	2019-09-16 09:44:28.800164
155	9	21	126	\N	0.0	0.0	2019-09-16 09:44:28.804621	2019-09-16 09:44:28.804621
156	true	13	126	\N	0.0	0.0	2019-09-16 09:44:28.808977	2019-09-16 09:44:28.808977
157	false	23	126	\N	0.0	0.0	2019-09-16 09:44:28.813785	2019-09-16 09:44:28.813785
158	true	9	126	\N	0.0	0.0	2019-09-16 09:44:28.818461	2019-09-16 09:44:28.818461
159	true	10	126	\N	0.0	0.0	2019-09-16 09:44:28.822836	2019-09-16 09:44:28.822836
160	false	11	126	\N	0.0	0.0	2019-09-16 09:44:28.827439	2019-09-16 09:44:28.827439
161	3	14	126	\N	0.0	0.0	2019-09-16 09:44:28.831928	2019-09-16 09:44:28.831928
162	8389	17	126	\N	25376.725	25376.725	2019-09-16 09:44:28.837862	2019-09-16 09:44:28.837862
163	8389	18	126	\N	24453.935	24453.935	2019-09-16 09:44:28.843845	2019-09-16 09:44:28.843845
164	8389	31	126	\N	6228.8325	6228.8325	2019-09-16 09:44:28.84958	2019-09-16 09:44:28.84958
167	0	12	127	\N	0.0	0.0	2019-09-16 10:16:54.247157	2019-09-21 13:48:17.171704
166	0	16	127	\N	0.0	0.0	2019-09-16 10:16:54.24181	2019-09-21 13:48:17.181571
184	false	12	128	\N	0.0	0.0	2019-09-16 12:11:17.48648	2019-09-16 12:11:17.48648
188	false	20	128	\N	0.0	0.0	2019-09-16 12:11:17.5153	2019-09-16 12:11:17.5153
193	false	10	128	\N	0.0	0.0	2019-09-16 12:11:17.542816	2019-09-16 12:11:17.542816
194	false	11	128	\N	0.0	0.0	2019-09-16 12:11:17.548098	2019-09-16 12:11:17.548098
199	23	29	129	\N	0.0	0.0	2019-09-16 13:13:58.080004	2019-09-16 13:13:58.080004
200	34	30	129	\N	0.0	0.0	2019-09-16 13:13:58.091358	2019-09-16 13:13:58.091358
201	Calgary	27	129	\N	0.0	0.0	2019-09-16 13:13:58.097616	2019-09-16 13:13:58.097616
202	133	32	129	\N	0.0	0.0	2019-09-16 13:13:58.103899	2019-09-16 13:13:58.103899
203	133	33	129	\N	73.15	73.15	2019-09-16 13:13:58.11357	2019-09-16 13:13:58.11357
204	133	34	129	\N	680.295	680.295	2019-09-16 13:13:58.123445	2019-09-16 13:13:58.123445
206	10	36	129	\N	1045.0	1045.0	2019-09-16 13:13:58.135464	2019-09-16 13:13:58.135464
211	false	42	129	\N	0.0	0.0	2019-09-16 13:13:58.165312	2019-09-16 13:13:58.165312
212	true	43	129	\N	633.6	633.6	2019-09-16 13:13:58.171266	2019-09-16 13:13:58.171266
217	false	49	129	\N	0.0	0.0	2019-09-16 13:13:58.200573	2019-09-16 13:13:58.200573
221	false	53	129	\N	0.0	0.0	2019-09-16 13:13:58.218309	2019-09-16 13:13:58.218309
225	133	58	129	\N	119.7	119.7	2019-09-16 13:13:58.242459	2019-09-16 13:13:58.242459
229	false	62	129	\N	0.0	0.0	2019-09-16 13:13:58.259769	2019-09-16 13:13:58.259769
232	0.0	66	129	\N	0.0	0.0	2019-09-16 13:13:58.273681	2019-09-16 13:13:58.273681
234	0.0	68	129	\N	0.0	0.0	2019-09-16 13:13:58.282182	2019-09-16 13:13:58.282182
235	false	70	129	\N	0.0	0.0	2019-09-16 13:13:58.286438	2019-09-16 13:13:58.286438
237	false	72	129	\N	0.0	0.0	2019-09-16 13:13:58.29509	2019-09-16 13:13:58.29509
238	false	73	129	\N	0.0	0.0	2019-09-16 13:13:58.299461	2019-09-16 13:13:58.299461
241	111	22	130	\N	653.235	653.235	2019-09-16 13:17:39.609646	2019-09-16 13:17:39.609646
242	111	16	130	\N	0.0	0.0	2019-09-16 13:17:39.617207	2019-09-16 13:17:39.617207
243	true	12	130	\N	0.0	0.0	2019-09-16 13:17:39.624997	2019-09-16 13:17:39.624997
244	1	19	130	\N	0.0	0.0	2019-09-16 13:17:39.634263	2019-09-16 13:17:39.634263
245	1	24	130	\N	0.0	0.0	2019-09-16 13:17:39.662003	2019-09-16 13:17:39.662003
246	1	15	130	\N	0.0	0.0	2019-09-16 13:17:39.668926	2019-09-16 13:17:39.668926
247	true	20	130	\N	0.0	0.0	2019-09-16 13:17:39.676871	2019-09-16 13:17:39.676871
248	1	21	130	\N	0.0	0.0	2019-09-16 13:17:39.684027	2019-09-16 13:17:39.684027
249	true	13	130	\N	0.0	0.0	2019-09-16 13:17:39.689678	2019-09-16 13:17:39.689678
250	false	23	130	\N	0.0	0.0	2019-09-16 13:17:39.694938	2019-09-16 13:17:39.694938
251	true	9	130	\N	0.0	0.0	2019-09-16 13:17:39.699989	2019-09-16 13:17:39.699989
252	false	10	130	\N	0.0	0.0	2019-09-16 13:17:39.707846	2019-09-16 13:17:39.707846
253	true	11	130	\N	0.0	0.0	2019-09-16 13:17:39.71618	2019-09-16 13:17:39.71618
254	1	14	130	\N	0.0	0.0	2019-09-16 13:17:39.723785	2019-09-16 13:17:39.723785
207	true	37	129	\N	110.0	110.0	2019-09-16 13:13:58.141559	2019-09-16 13:26:50.959017
208	true	38	129	\N	75.0	75.0	2019-09-16 13:13:58.147478	2019-09-16 13:26:50.965701
209	true	40	129	\N	500.0	500.0	2019-09-16 13:13:58.153299	2019-09-16 13:26:50.971501
210	true	41	129	\N	375.0	375.0	2019-09-16 13:13:58.159144	2019-09-16 13:26:50.976415
213	true	44	129	\N	625.0	625.0	2019-09-16 13:13:58.177253	2019-09-16 13:26:50.990285
215	34	47	129	\N	4726.0	4726.0	2019-09-16 13:13:58.189092	2019-09-16 13:26:51.003896
216	4	48	129	\N	25.6	25.6	2019-09-16 13:13:58.195002	2019-09-16 13:26:51.010572
218	true	50	129	\N	750.0	750.0	2019-09-16 13:13:58.205004	2019-09-16 13:26:51.021916
219	true	51	129	\N	575.0	575.0	2019-09-16 13:13:58.209407	2019-09-16 13:26:51.028337
220	true	52	129	\N	363.0	363.0	2019-09-16 13:13:58.213833	2019-09-16 13:26:51.034979
222	55	55	129	\N	12375.0	12375.0	2019-09-16 13:13:58.222641	2019-09-16 13:26:51.046496
223	67	56	129	\N	16750.0	16750.0	2019-09-16 13:13:58.232388	2019-09-16 13:26:51.05327
224	true	57	129	\N	189.0	189.0	2019-09-16 13:13:58.237004	2019-09-16 13:26:51.0598
227	4	60	129	\N	180.0	180.0	2019-09-16 13:13:58.251123	2019-09-16 13:26:51.07976
228	true	61	129	\N	1.0	1.0	2019-09-16 13:13:58.255473	2019-09-16 13:26:51.086348
230	true	63	129	\N	100.0	100.0	2019-09-16 13:13:58.264022	2019-09-16 13:26:51.097516
231	true	64	129	\N	350.0	350.0	2019-09-16 13:13:58.268361	2019-09-16 13:26:51.104155
233	true	67	129	\N	250.0	250.0	2019-09-16 13:13:58.277896	2019-09-16 13:26:51.114922
236	true	71	129	\N	50.0	50.0	2019-09-16 13:13:58.290723	2019-09-16 13:26:51.131529
239	true	74	129	\N	50.0	50.0	2019-09-16 13:13:58.303664	2019-09-16 13:26:51.151833
240	\N	75	129	\N	2240.0	2240.0	2019-09-16 13:13:58.307881	2019-09-16 14:20:34.543141
187	0	15	128	\N	0.0	0.0	2019-09-16 12:11:17.509008	2019-09-16 14:24:56.971397
195	0	14	128	\N	0.0	0.0	2019-09-16 12:11:17.553348	2019-09-16 14:25:10.311151
190	false	13	128	\N	0.0	0.0	2019-09-16 12:11:17.526429	2019-09-16 14:24:28.274906
189	0	21	128	\N	0.0	0.0	2019-09-16 12:11:17.521295	2019-09-16 14:24:56.984778
197	0	18	128	\N	0.0	0.0	2019-09-16 12:11:17.567631	2019-09-16 14:24:57.036333
191	true	23	128	\N	650.0	650.0	2019-09-16 12:11:17.531988	2019-09-16 14:24:28.280028
192	true	9	128	\N	350.0	350.0	2019-09-16 12:11:17.537537	2019-09-16 14:24:08.669582
178	0	14	127	\N	0.0	0.0	2019-09-16 10:16:54.323159	2019-09-21 13:48:17.154364
198	0	31	128	\N	0.0	0.0	2019-09-16 12:11:17.574138	2019-09-16 14:24:57.044109
185	0	19	128	\N	0.0	0.0	2019-09-16 12:11:17.494306	2019-09-16 14:25:10.273741
186	0	24	128	\N	0.0	0.0	2019-09-16 12:11:17.502689	2019-09-16 14:24:28.259799
183	0	16	128	\N	0.0	0.0	2019-09-16 12:11:17.478616	2019-09-16 14:24:56.946401
180	0	18	127	\N	0.0	0.0	2019-09-16 10:16:54.337439	2019-09-21 13:48:17.192592
168	0	19	127	\N	0.0	0.0	2019-09-16 10:16:54.254553	2019-09-21 13:48:17.201998
169	0	24	127	\N	0.0	0.0	2019-09-16 10:16:54.264378	2019-09-21 13:48:17.211716
170	0	15	127	\N	0.0	0.0	2019-09-16 10:16:54.273648	2019-09-21 13:48:17.221933
171	0	20	127	\N	0.0	0.0	2019-09-16 10:16:54.282338	2019-09-21 13:48:17.231482
176	0	10	127	\N	0.0	0.0	2019-09-16 10:16:54.312766	2019-09-21 13:48:17.24105
177	0	11	127	\N	0.0	0.0	2019-09-16 10:16:54.317993	2019-09-21 13:48:17.278013
179	0	17	127	\N	0.0	0.0	2019-09-16 10:16:54.330634	2019-09-21 13:48:17.287351
172	0	21	127	\N	0.0	0.0	2019-09-16 10:16:54.289917	2019-09-21 13:48:17.293229
173	0	13	127	\N	0.0	0.0	2019-09-16 10:16:54.295561	2019-09-21 13:48:17.298656
174	0	23	127	\N	0.0	0.0	2019-09-16 10:16:54.301382	2019-09-21 13:48:17.304111
175	0	9	127	\N	0.0	0.0	2019-09-16 10:16:54.307032	2019-09-21 13:48:17.30956
181	0	31	127	\N	0.0	0.0	2019-09-16 10:16:54.346311	2019-09-21 13:48:17.316177
255	111	17	130	\N	335.775	335.775	2019-09-16 13:17:39.730827	2019-09-16 13:17:39.730827
256	111	18	130	\N	323.565	323.565	2019-09-16 13:17:39.738203	2019-09-16 13:17:39.738203
257	111	31	130	\N	82.4175	82.4175	2019-09-16 13:17:39.74615	2019-09-16 13:17:39.74615
205	12	35	129	\N	21.0	21.0	2019-09-16 13:13:58.129545	2019-09-16 13:26:50.946918
214	true	46	129	\N	600.0	600.0	2019-09-16 13:13:58.18327	2019-09-16 13:26:50.996943
226	4	59	129	\N	180.0	180.0	2019-09-16 13:13:58.246779	2019-09-16 13:26:51.07306
258	0	31	122	\N	0.0	0.0	2019-09-16 13:29:17.788014	2019-09-16 13:29:17.788014
259	10	31	121	\N	7.425	7.425	2019-09-16 13:29:28.45249	2019-09-16 13:29:28.45249
260	1	31	119	\N	0.7425	0.7425	2019-09-16 13:29:51.176989	2019-09-16 13:29:51.176989
182	0	22	128	\N	0.0	0.0	2019-09-16 12:11:17.468473	2019-09-16 14:24:56.938309
196	0	17	128	\N	0.0	0.0	2019-09-16 12:11:17.5609	2019-09-16 14:24:57.027781
261	500	22	131	\N	2942.5	2942.5	2019-09-16 14:35:25.884255	2019-09-16 14:35:25.884255
262	500	16	131	\N	0.0	0.0	2019-09-16 14:35:25.89352	2019-09-16 14:35:25.89352
263	false	12	131	\N	0.0	0.0	2019-09-16 14:35:25.901284	2019-09-16 14:35:25.901284
264	0	19	131	\N	0.0	0.0	2019-09-16 14:35:25.909728	2019-09-16 14:35:25.909728
265	0	24	131	\N	0.0	0.0	2019-09-16 14:35:25.919979	2019-09-16 14:35:25.919979
266	0	15	131	\N	0.0	0.0	2019-09-16 14:35:25.928262	2019-09-16 14:35:25.928262
267	false	20	131	\N	0.0	0.0	2019-09-16 14:35:25.936435	2019-09-16 14:35:25.936435
268	0	21	131	\N	0.0	0.0	2019-09-16 14:35:25.944147	2019-09-16 14:35:25.944147
269	false	13	131	\N	0.0	0.0	2019-09-16 14:35:25.951603	2019-09-16 14:35:25.951603
270	true	23	131	\N	650.0	650.0	2019-09-16 14:35:25.959474	2019-09-16 14:35:25.959474
271	true	9	131	\N	350.0	350.0	2019-09-16 14:35:25.967824	2019-09-16 14:35:25.967824
272	false	10	131	\N	0.0	0.0	2019-09-16 14:35:25.976419	2019-09-16 14:35:25.976419
273	false	11	131	\N	0.0	0.0	2019-09-16 14:35:25.985294	2019-09-16 14:35:25.985294
274	0	14	131	\N	0.0	0.0	2019-09-16 14:35:25.991695	2019-09-16 14:35:25.991695
275	500	17	131	\N	1512.5	1512.5	2019-09-16 14:35:26.002282	2019-09-16 14:35:26.002282
276	500	18	131	\N	1457.5	1457.5	2019-09-16 14:35:26.013262	2019-09-16 14:35:26.013262
277	500	31	131	\N	371.25	371.25	2019-09-16 14:35:26.023086	2019-09-16 14:35:26.023086
278	0	77	132	\N	0.0	0.0	2019-09-21 13:45:14.860455	2019-09-21 13:45:14.860455
279	0	77	133	\N	0.0	0.0	2019-09-21 13:45:25.956118	2019-09-21 13:45:25.956118
280	0	77	134	\N	0.0	0.0	2019-09-21 13:45:52.136706	2019-09-21 13:45:52.136706
281	0	78	134	\N	0.0	0.0	2019-09-21 13:45:52.143845	2019-09-21 13:45:52.143845
282	0	77	135	\N	0.0	0.0	2019-09-21 13:47:54.456204	2019-09-21 13:47:54.456204
283	0	78	135	\N	0.0	0.0	2019-09-21 13:47:54.467145	2019-09-21 13:47:54.467145
165	0	22	127	\N	0.0	0.0	2019-09-16 10:16:54.23447	2019-09-21 13:48:17.163963
284	0	77	136	\N	0.0	0.0	2019-09-21 13:53:04.88934	2019-09-21 13:53:04.88934
285	0	78	136	\N	0.0	0.0	2019-09-21 13:53:04.900173	2019-09-21 13:53:04.900173
286	true	28	129	\N	0.0	0.0	2019-10-09 06:57:59.125621	2019-10-09 06:57:59.125621
287	true	39	129	\N	0.0	0.0	2019-10-09 06:57:59.17205	2019-10-09 06:57:59.17205
288	true	45	129	\N	0.0	0.0	2019-10-09 06:57:59.198032	2019-10-09 06:57:59.198032
289	true	54	129	\N	0.0	0.0	2019-10-09 06:57:59.236352	2019-10-09 06:57:59.236352
290	true	65	129	\N	0.0	0.0	2019-10-09 06:57:59.282655	2019-10-09 06:57:59.282655
291	true	69	129	\N	0.0	0.0	2019-10-09 06:57:59.30091	2019-10-09 06:57:59.30091
292	{"code"=>"23", "unit_#"=>"34", "project_manager"=>"Calgary", "flooring_yesno"=>"true", "total_sqft"=>"133", "supply_and_install_plywood"=>"12", "total_stairs"=>"10", "misc_accessories_transition"=>"true", "plumbing_remove_reinstall_toilet"=>"true", "tub_tile"=>"true", "demolition_of_tub_tile_and_drywall"=>"true", "bathroom_drywall_repairs"=>"true", "tub_supply_and_install"=>"false", "bathroom_tub_surround_tile_supply_and_install"=>"true", "plumbing_labor_shower_valve_trim_and_drain"=>"true", "cabinetry"=>"true", "demolition_disposal"=>"true", "kitchen_lft"=>"34", "laminate_counter_top_lft"=>"4", "vanity_1_sink_plumbing"=>"false", "vanity_2_sink_plumbing"=>"true", "plumbing_sink"=>"true", "kitchen_backsplash_supply_install"=>"true", "supply_and_install_ventilation_for_hood_range"=>"false", "interior_repairs"=>"true", "supply_and_install_doors"=>"55", "total_closet_doors"=>"67", "various_cold_air_returns_railings_etc"=>"true", "baseboards"=>"true", "switch_receptacle"=>"4", "light_fixture"=>"4", "misc_labor"=>"true", "drywall_patching"=>"false", "accessories_bathroom_doors"=>"true", "final_cleaning_garbage_removal"=>"true", "paint"=>"true", "paint_all_walls_doors_trim"=>"0.0", "wall_prep_patches_holes_corners_etc"=>"true", "ceiling_prep_repair_and_paint"=>"0.0", "appliances"=>"true", "fridge"=>"false", "stove"=>"true", "hood_fan"=>"false", "dishwasher"=>"false", "abatement"=>"true", "height"=>"122", "width"=>"12"}	80	129	\N	0.0	0.0	2019-10-09 06:57:59.326806	2019-10-09 06:57:59.326806
293	{"code"=>"23", "unit_#"=>"34", "project_manager"=>"Calgary", "flooring_yesno"=>"true", "total_sqft"=>"133", "supply_and_install_plywood"=>"12", "total_stairs"=>"10", "misc_accessories_transition"=>"true", "plumbing_remove_reinstall_toilet"=>"true", "tub_tile"=>"true", "demolition_of_tub_tile_and_drywall"=>"true", "bathroom_drywall_repairs"=>"true", "tub_supply_and_install"=>"false", "bathroom_tub_surround_tile_supply_and_install"=>"true", "plumbing_labor_shower_valve_trim_and_drain"=>"true", "cabinetry"=>"true", "demolition_disposal"=>"true", "kitchen_lft"=>"34", "laminate_counter_top_lft"=>"4", "vanity_1_sink_plumbing"=>"false", "vanity_2_sink_plumbing"=>"true", "plumbing_sink"=>"true", "kitchen_backsplash_supply_install"=>"true", "supply_and_install_ventilation_for_hood_range"=>"false", "interior_repairs"=>"true", "supply_and_install_doors"=>"55", "total_closet_doors"=>"67", "various_cold_air_returns_railings_etc"=>"true", "baseboards"=>"true", "switch_receptacle"=>"4", "light_fixture"=>"4", "misc_labor"=>"true", "drywall_patching"=>"false", "accessories_bathroom_doors"=>"true", "final_cleaning_garbage_removal"=>"true", "paint"=>"true", "paint_all_walls_doors_trim"=>"0.0", "wall_prep_patches_holes_corners_etc"=>"true", "ceiling_prep_repair_and_paint"=>"0.0", "appliances"=>"true", "fridge"=>"false", "stove"=>"true", "hood_fan"=>"false", "dishwasher"=>"false", "abatement"=>"true", "height"=>"122", "width"=>"12"}	81	129	\N	0.0	0.0	2019-10-09 06:57:59.333536	2019-10-09 06:57:59.333536
294	new	29	137	\N	0.0	0.0	2019-10-09 16:55:53.857975	2019-10-09 16:55:53.857975
295	new	30	137	\N	0.0	0.0	2019-10-09 16:55:53.867553	2019-10-09 16:55:53.867553
296	new	27	137	\N	0.0	0.0	2019-10-09 16:55:53.87416	2019-10-09 16:55:53.87416
297	false	28	137	\N	0.0	0.0	2019-10-09 16:55:53.88071	2019-10-09 16:55:53.88071
298	0	32	137	\N	0.0	0.0	2019-10-09 16:55:53.889888	2019-10-09 16:55:53.889888
299	0	33	137	\N	0.0	0.0	2019-10-09 16:55:53.899177	2019-10-09 16:55:53.899177
300	0	34	137	\N	0.0	0.0	2019-10-09 16:55:53.907601	2019-10-09 16:55:53.907601
301	0	35	137	\N	0.0	0.0	2019-10-09 16:55:53.916623	2019-10-09 16:55:53.916623
302	0	36	137	\N	495.0	495.0	2019-10-09 16:55:53.926095	2019-10-09 16:55:53.926095
303	0	37	137	\N	0.0	0.0	2019-10-09 16:55:53.935866	2019-10-09 16:55:53.935866
304	0	38	137	\N	0.0	0.0	2019-10-09 16:55:53.945921	2019-10-09 16:55:53.945921
305	false	39	137	\N	0.0	0.0	2019-10-09 16:55:53.954724	2019-10-09 16:55:53.954724
306	0	40	137	\N	0.0	0.0	2019-10-09 16:55:53.963883	2019-10-09 16:55:53.963883
307	0	41	137	\N	0.0	0.0	2019-10-09 16:55:53.970932	2019-10-09 16:55:53.970932
308	0	42	137	\N	0.0	0.0	2019-10-09 16:55:53.978042	2019-10-09 16:55:53.978042
309	0	43	137	\N	627.0	627.0	2019-10-09 16:55:53.984983	2019-10-09 16:55:53.984983
310	0	44	137	\N	0.0	0.0	2019-10-09 16:55:53.994098	2019-10-09 16:55:53.994098
311	false	45	137	\N	0.0	0.0	2019-10-09 16:55:54.002665	2019-10-09 16:55:54.002665
312	0	46	137	\N	0.0	0.0	2019-10-09 16:55:54.010422	2019-10-09 16:55:54.010422
313	0	47	137	\N	0.0	0.0	2019-10-09 16:55:54.017899	2019-10-09 16:55:54.017899
314	0	48	137	\N	0.0	0.0	2019-10-09 16:55:54.024899	2019-10-09 16:55:54.024899
315	0	49	137	\N	0.0	0.0	2019-10-09 16:55:54.031695	2019-10-09 16:55:54.031695
316	0	50	137	\N	0.0	0.0	2019-10-09 16:55:54.038468	2019-10-09 16:55:54.038468
317	0	51	137	\N	0.0	0.0	2019-10-09 16:55:54.045841	2019-10-09 16:55:54.045841
318	0	52	137	\N	0.0	0.0	2019-10-09 16:55:54.052661	2019-10-09 16:55:54.052661
319	0	53	137	\N	0.0	0.0	2019-10-09 16:55:54.059335	2019-10-09 16:55:54.059335
320	false	54	137	\N	0.0	0.0	2019-10-09 16:55:54.064912	2019-10-09 16:55:54.064912
321	0	55	137	\N	0.0	0.0	2019-10-09 16:55:54.07185	2019-10-09 16:55:54.07185
322	0	56	137	\N	0.0	0.0	2019-10-09 16:55:54.078513	2019-10-09 16:55:54.078513
323	0	57	137	\N	0.0	0.0	2019-10-09 16:55:54.085441	2019-10-09 16:55:54.085441
324	0	58	137	\N	0.0	0.0	2019-10-09 16:55:54.093388	2019-10-09 16:55:54.093388
325	0	59	137	\N	0.0	0.0	2019-10-09 16:55:54.100039	2019-10-09 16:55:54.100039
326	0	60	137	\N	0.0	0.0	2019-10-09 16:55:54.106867	2019-10-09 16:55:54.106867
327	0	61	137	\N	0.0	0.0	2019-10-09 16:55:54.113789	2019-10-09 16:55:54.113789
328	0	62	137	\N	0.0	0.0	2019-10-09 16:55:54.120661	2019-10-09 16:55:54.120661
329	0	63	137	\N	0.0	0.0	2019-10-09 16:55:54.127605	2019-10-09 16:55:54.127605
330	0	64	137	\N	0.0	0.0	2019-10-09 16:55:54.13451	2019-10-09 16:55:54.13451
331	false	65	137	\N	0.0	0.0	2019-10-09 16:55:54.140514	2019-10-09 16:55:54.140514
332	0	66	137	\N	0.0	0.0	2019-10-09 16:55:54.147442	2019-10-09 16:55:54.147442
333	0	67	137	\N	0.0	0.0	2019-10-09 16:55:54.154603	2019-10-09 16:55:54.154603
334	0	68	137	\N	0.0	0.0	2019-10-09 16:55:54.161788	2019-10-09 16:55:54.161788
335	false	69	137	\N	0.0	0.0	2019-10-09 16:55:54.167586	2019-10-09 16:55:54.167586
336	0	70	137	\N	0.0	0.0	2019-10-09 16:55:54.174614	2019-10-09 16:55:54.174614
337	0	71	137	\N	0.0	0.0	2019-10-09 16:55:54.181646	2019-10-09 16:55:54.181646
338	0	72	137	\N	0.0	0.0	2019-10-09 16:55:54.188308	2019-10-09 16:55:54.188308
339	0	73	137	\N	0.0	0.0	2019-10-09 16:55:54.195088	2019-10-09 16:55:54.195088
340	true	74	137	\N	50.0	50.0	2019-10-09 16:55:54.200775	2019-10-09 16:55:54.200775
347	new1	29	138	\N	0.0	0.0	2019-10-09 19:01:51.969589	2019-10-09 19:01:51.969589
348	new1	30	138	\N	0.0	0.0	2019-10-09 19:01:51.977599	2019-10-09 19:01:51.977599
349	new1	27	138	\N	0.0	0.0	2019-10-09 19:01:51.986734	2019-10-09 19:01:51.986734
350	false	28	138	\N	0.0	0.0	2019-10-09 19:01:51.994849	2019-10-09 19:01:51.994849
351	0	32	138	\N	0.0	0.0	2019-10-09 19:01:52.002722	2019-10-09 19:01:52.002722
352	0	33	138	\N	0.0	0.0	2019-10-09 19:01:52.01145	2019-10-09 19:01:52.01145
353	0	34	138	\N	0.0	0.0	2019-10-09 19:01:52.020471	2019-10-09 19:01:52.020471
354	0	35	138	\N	0.0	0.0	2019-10-09 19:01:52.027861	2019-10-09 19:01:52.027861
355	0	36	138	\N	495.0	495.0	2019-10-09 19:01:52.034846	2019-10-09 19:01:52.034846
356	0	37	138	\N	0.0	0.0	2019-10-09 19:01:52.045587	2019-10-09 19:01:52.045587
357	0	38	138	\N	0.0	0.0	2019-10-09 19:01:52.052658	2019-10-09 19:01:52.052658
358	false	39	138	\N	0.0	0.0	2019-10-09 19:01:52.058565	2019-10-09 19:01:52.058565
359	0	40	138	\N	0.0	0.0	2019-10-09 19:01:52.065813	2019-10-09 19:01:52.065813
360	0	41	138	\N	0.0	0.0	2019-10-09 19:01:52.072643	2019-10-09 19:01:52.072643
361	0	42	138	\N	0.0	0.0	2019-10-09 19:01:52.079545	2019-10-09 19:01:52.079545
362	0	43	138	\N	627.0	627.0	2019-10-09 19:01:52.086436	2019-10-09 19:01:52.086436
363	0	44	138	\N	0.0	0.0	2019-10-09 19:01:52.09325	2019-10-09 19:01:52.09325
364	false	45	138	\N	0.0	0.0	2019-10-09 19:01:52.098869	2019-10-09 19:01:52.098869
365	0	46	138	\N	0.0	0.0	2019-10-09 19:01:52.105433	2019-10-09 19:01:52.105433
366	0	47	138	\N	0.0	0.0	2019-10-09 19:01:52.112262	2019-10-09 19:01:52.112262
367	0	48	138	\N	0.0	0.0	2019-10-09 19:01:52.119406	2019-10-09 19:01:52.119406
368	0	49	138	\N	0.0	0.0	2019-10-09 19:01:52.126555	2019-10-09 19:01:52.126555
369	0	50	138	\N	0.0	0.0	2019-10-09 19:01:52.133443	2019-10-09 19:01:52.133443
370	0	51	138	\N	0.0	0.0	2019-10-09 19:01:52.140542	2019-10-09 19:01:52.140542
371	0	52	138	\N	0.0	0.0	2019-10-09 19:01:52.14846	2019-10-09 19:01:52.14846
372	0	53	138	\N	0.0	0.0	2019-10-09 19:01:52.155488	2019-10-09 19:01:52.155488
373	false	54	138	\N	0.0	0.0	2019-10-09 19:01:52.16137	2019-10-09 19:01:52.16137
374	0	55	138	\N	0.0	0.0	2019-10-09 19:01:52.168427	2019-10-09 19:01:52.168427
375	0	56	138	\N	0.0	0.0	2019-10-09 19:01:52.17522	2019-10-09 19:01:52.17522
376	0	57	138	\N	0.0	0.0	2019-10-09 19:01:52.182232	2019-10-09 19:01:52.182232
377	0	58	138	\N	0.0	0.0	2019-10-09 19:01:52.190169	2019-10-09 19:01:52.190169
378	0	59	138	\N	0.0	0.0	2019-10-09 19:01:52.196886	2019-10-09 19:01:52.196886
379	0	60	138	\N	0.0	0.0	2019-10-09 19:01:52.203566	2019-10-09 19:01:52.203566
380	0	61	138	\N	0.0	0.0	2019-10-09 19:01:52.236624	2019-10-09 19:01:52.236624
381	0	62	138	\N	0.0	0.0	2019-10-09 19:01:52.243846	2019-10-09 19:01:52.243846
382	0	63	138	\N	0.0	0.0	2019-10-09 19:01:52.250642	2019-10-09 19:01:52.250642
383	0	64	138	\N	0.0	0.0	2019-10-09 19:01:52.257362	2019-10-09 19:01:52.257362
384	false	65	138	\N	0.0	0.0	2019-10-09 19:01:52.263094	2019-10-09 19:01:52.263094
385	0	66	138	\N	0.0	0.0	2019-10-09 19:01:52.269941	2019-10-09 19:01:52.269941
386	0	67	138	\N	0.0	0.0	2019-10-09 19:01:52.27665	2019-10-09 19:01:52.27665
387	0	68	138	\N	0.0	0.0	2019-10-09 19:01:52.283707	2019-10-09 19:01:52.283707
388	false	69	138	\N	0.0	0.0	2019-10-09 19:01:52.289336	2019-10-09 19:01:52.289336
389	0	70	138	\N	0.0	0.0	2019-10-09 19:01:52.296796	2019-10-09 19:01:52.296796
390	0	71	138	\N	0.0	0.0	2019-10-09 19:01:52.303529	2019-10-09 19:01:52.303529
391	0	72	138	\N	0.0	0.0	2019-10-09 19:01:52.310297	2019-10-09 19:01:52.310297
392	0	73	138	\N	0.0	0.0	2019-10-09 19:01:52.317015	2019-10-09 19:01:52.317015
393	false	74	138	\N	0.0	0.0	2019-10-09 19:01:52.322835	2019-10-09 19:01:52.322835
394	1	80	138	\N	0.0	0.0	2019-10-09 19:01:52.331519	2019-10-09 19:01:52.331519
395	2	81	138	\N	0.0	0.0	2019-10-09 19:01:52.337667	2019-10-09 19:01:52.337667
396	3	80	138	\N	0.0	0.0	2019-10-09 19:01:52.343861	2019-10-09 19:01:52.343861
397	4	81	138	\N	0.0	0.0	2019-10-09 19:01:52.349663	2019-10-09 19:01:52.349663
398	5	80	138	\N	0.0	0.0	2019-10-09 19:01:52.355723	2019-10-09 19:01:52.355723
399	6	81	138	\N	0.0	0.0	2019-10-09 19:01:52.361776	2019-10-09 19:01:52.361776
400	7	80	138	\N	0.0	0.0	2019-10-09 19:01:52.36769	2019-10-09 19:01:52.36769
401	8	81	138	\N	0.0	0.0	2019-10-09 19:01:52.373642	2019-10-09 19:01:52.373642
402	9	80	138	\N	0.0	0.0	2019-10-09 19:01:52.379826	2019-10-09 19:01:52.379826
403	10	81	138	\N	0.0	0.0	2019-10-09 19:01:52.386065	2019-10-09 19:01:52.386065
404	new1	29	139	\N	0.0	0.0	2019-10-09 19:02:16.603001	2019-10-09 19:02:16.603001
405	new1	30	139	\N	0.0	0.0	2019-10-09 19:02:16.612189	2019-10-09 19:02:16.612189
406	new1	27	139	\N	0.0	0.0	2019-10-09 19:02:16.62187	2019-10-09 19:02:16.62187
407	false	28	139	\N	0.0	0.0	2019-10-09 19:02:16.631559	2019-10-09 19:02:16.631559
408	0	32	139	\N	0.0	0.0	2019-10-09 19:02:16.642238	2019-10-09 19:02:16.642238
409	0	33	139	\N	0.0	0.0	2019-10-09 19:02:16.655821	2019-10-09 19:02:16.655821
410	0	34	139	\N	0.0	0.0	2019-10-09 19:02:16.668763	2019-10-09 19:02:16.668763
411	0	35	139	\N	0.0	0.0	2019-10-09 19:02:16.686661	2019-10-09 19:02:16.686661
412	0	36	139	\N	495.0	495.0	2019-10-09 19:02:16.698192	2019-10-09 19:02:16.698192
413	0	37	139	\N	0.0	0.0	2019-10-09 19:02:16.707858	2019-10-09 19:02:16.707858
414	0	38	139	\N	0.0	0.0	2019-10-09 19:02:16.715044	2019-10-09 19:02:16.715044
415	false	39	139	\N	0.0	0.0	2019-10-09 19:02:16.720995	2019-10-09 19:02:16.720995
416	0	40	139	\N	0.0	0.0	2019-10-09 19:02:16.728003	2019-10-09 19:02:16.728003
417	0	41	139	\N	0.0	0.0	2019-10-09 19:02:16.73491	2019-10-09 19:02:16.73491
418	0	42	139	\N	0.0	0.0	2019-10-09 19:02:16.743109	2019-10-09 19:02:16.743109
419	0	43	139	\N	627.0	627.0	2019-10-09 19:02:16.752347	2019-10-09 19:02:16.752347
420	0	44	139	\N	0.0	0.0	2019-10-09 19:02:16.76194	2019-10-09 19:02:16.76194
421	false	45	139	\N	0.0	0.0	2019-10-09 19:02:16.768306	2019-10-09 19:02:16.768306
422	0	46	139	\N	0.0	0.0	2019-10-09 19:02:16.775392	2019-10-09 19:02:16.775392
423	0	47	139	\N	0.0	0.0	2019-10-09 19:02:16.78329	2019-10-09 19:02:16.78329
424	0	48	139	\N	0.0	0.0	2019-10-09 19:02:16.795401	2019-10-09 19:02:16.795401
425	0	49	139	\N	0.0	0.0	2019-10-09 19:02:16.811909	2019-10-09 19:02:16.811909
426	0	50	139	\N	0.0	0.0	2019-10-09 19:02:16.82349	2019-10-09 19:02:16.82349
427	0	51	139	\N	0.0	0.0	2019-10-09 19:02:16.833211	2019-10-09 19:02:16.833211
428	0	52	139	\N	0.0	0.0	2019-10-09 19:02:16.842471	2019-10-09 19:02:16.842471
429	0	53	139	\N	0.0	0.0	2019-10-09 19:02:16.850718	2019-10-09 19:02:16.850718
430	false	54	139	\N	0.0	0.0	2019-10-09 19:02:16.857674	2019-10-09 19:02:16.857674
431	0	55	139	\N	0.0	0.0	2019-10-09 19:02:16.866626	2019-10-09 19:02:16.866626
432	0	56	139	\N	0.0	0.0	2019-10-09 19:02:16.87473	2019-10-09 19:02:16.87473
433	0	57	139	\N	0.0	0.0	2019-10-09 19:02:16.883401	2019-10-09 19:02:16.883401
434	0	58	139	\N	0.0	0.0	2019-10-09 19:02:16.892609	2019-10-09 19:02:16.892609
435	0	59	139	\N	0.0	0.0	2019-10-09 19:02:16.900573	2019-10-09 19:02:16.900573
436	0	60	139	\N	0.0	0.0	2019-10-09 19:02:16.911511	2019-10-09 19:02:16.911511
437	0	61	139	\N	0.0	0.0	2019-10-09 19:02:16.921479	2019-10-09 19:02:16.921479
438	0	62	139	\N	0.0	0.0	2019-10-09 19:02:16.929682	2019-10-09 19:02:16.929682
439	0	63	139	\N	0.0	0.0	2019-10-09 19:02:16.937361	2019-10-09 19:02:16.937361
440	0	64	139	\N	0.0	0.0	2019-10-09 19:02:16.944685	2019-10-09 19:02:16.944685
441	false	65	139	\N	0.0	0.0	2019-10-09 19:02:16.952364	2019-10-09 19:02:16.952364
442	0	66	139	\N	0.0	0.0	2019-10-09 19:02:16.961508	2019-10-09 19:02:16.961508
443	0	67	139	\N	0.0	0.0	2019-10-09 19:02:16.969298	2019-10-09 19:02:16.969298
444	0	68	139	\N	0.0	0.0	2019-10-09 19:02:16.99824	2019-10-09 19:02:16.99824
445	false	69	139	\N	0.0	0.0	2019-10-09 19:02:17.00456	2019-10-09 19:02:17.00456
446	0	70	139	\N	0.0	0.0	2019-10-09 19:02:17.011822	2019-10-09 19:02:17.011822
447	0	71	139	\N	0.0	0.0	2019-10-09 19:02:17.019754	2019-10-09 19:02:17.019754
448	0	72	139	\N	0.0	0.0	2019-10-09 19:02:17.027454	2019-10-09 19:02:17.027454
449	0	73	139	\N	0.0	0.0	2019-10-09 19:02:17.034415	2019-10-09 19:02:17.034415
450	false	74	139	\N	0.0	0.0	2019-10-09 19:02:17.040424	2019-10-09 19:02:17.040424
451	1	80	139	\N	0.0	0.0	2019-10-09 19:02:17.04901	2019-10-09 19:02:17.04901
452	2	81	139	\N	0.0	0.0	2019-10-09 19:02:17.055205	2019-10-09 19:02:17.055205
453	3	80	139	\N	0.0	0.0	2019-10-09 19:02:17.063173	2019-10-09 19:02:17.063173
454	4	81	139	\N	0.0	0.0	2019-10-09 19:02:17.069359	2019-10-09 19:02:17.069359
455	5	80	139	\N	0.0	0.0	2019-10-09 19:02:17.076325	2019-10-09 19:02:17.076325
456	6	81	139	\N	0.0	0.0	2019-10-09 19:02:17.086366	2019-10-09 19:02:17.086366
457	7	80	139	\N	0.0	0.0	2019-10-09 19:02:17.093441	2019-10-09 19:02:17.093441
458	8	81	139	\N	0.0	0.0	2019-10-09 19:02:17.099653	2019-10-09 19:02:17.099653
459	9	80	139	\N	0.0	0.0	2019-10-09 19:02:17.105843	2019-10-09 19:02:17.105843
460	10	81	139	\N	0.0	0.0	2019-10-09 19:02:17.111915	2019-10-09 19:02:17.111915
461	new1	29	140	\N	0.0	0.0	2019-10-09 19:06:21.847306	2019-10-09 19:06:21.847306
462	new1	30	140	\N	0.0	0.0	2019-10-09 19:06:21.854099	2019-10-09 19:06:21.854099
463	new1	27	140	\N	0.0	0.0	2019-10-09 19:06:21.859851	2019-10-09 19:06:21.859851
464	false	28	140	\N	0.0	0.0	2019-10-09 19:06:21.86576	2019-10-09 19:06:21.86576
465	0	32	140	\N	0.0	0.0	2019-10-09 19:06:21.873307	2019-10-09 19:06:21.873307
466	0	33	140	\N	0.0	0.0	2019-10-09 19:06:21.882212	2019-10-09 19:06:21.882212
467	0	34	140	\N	0.0	0.0	2019-10-09 19:06:21.891039	2019-10-09 19:06:21.891039
468	0	35	140	\N	0.0	0.0	2019-10-09 19:06:21.898236	2019-10-09 19:06:21.898236
469	0	36	140	\N	495.0	495.0	2019-10-09 19:06:21.904786	2019-10-09 19:06:21.904786
470	0	37	140	\N	0.0	0.0	2019-10-09 19:06:21.911747	2019-10-09 19:06:21.911747
471	0	38	140	\N	0.0	0.0	2019-10-09 19:06:21.918407	2019-10-09 19:06:21.918407
472	false	39	140	\N	0.0	0.0	2019-10-09 19:06:21.923989	2019-10-09 19:06:21.923989
473	0	40	140	\N	0.0	0.0	2019-10-09 19:06:21.930891	2019-10-09 19:06:21.930891
474	0	41	140	\N	0.0	0.0	2019-10-09 19:06:21.937405	2019-10-09 19:06:21.937405
475	0	42	140	\N	0.0	0.0	2019-10-09 19:06:21.944095	2019-10-09 19:06:21.944095
476	0	43	140	\N	627.0	627.0	2019-10-09 19:06:21.951587	2019-10-09 19:06:21.951587
477	0	44	140	\N	0.0	0.0	2019-10-09 19:06:21.958439	2019-10-09 19:06:21.958439
478	false	45	140	\N	0.0	0.0	2019-10-09 19:06:21.964223	2019-10-09 19:06:21.964223
479	0	46	140	\N	0.0	0.0	2019-10-09 19:06:21.971505	2019-10-09 19:06:21.971505
480	0	47	140	\N	0.0	0.0	2019-10-09 19:06:21.978815	2019-10-09 19:06:21.978815
481	0	48	140	\N	0.0	0.0	2019-10-09 19:06:21.990098	2019-10-09 19:06:21.990098
482	0	49	140	\N	0.0	0.0	2019-10-09 19:06:21.998479	2019-10-09 19:06:21.998479
483	0	50	140	\N	0.0	0.0	2019-10-09 19:06:22.008002	2019-10-09 19:06:22.008002
484	0	51	140	\N	0.0	0.0	2019-10-09 19:06:22.015901	2019-10-09 19:06:22.015901
485	0	52	140	\N	0.0	0.0	2019-10-09 19:06:22.024251	2019-10-09 19:06:22.024251
486	0	53	140	\N	0.0	0.0	2019-10-09 19:06:22.032638	2019-10-09 19:06:22.032638
487	false	54	140	\N	0.0	0.0	2019-10-09 19:06:22.03959	2019-10-09 19:06:22.03959
488	0	55	140	\N	0.0	0.0	2019-10-09 19:06:22.047325	2019-10-09 19:06:22.047325
489	0	56	140	\N	0.0	0.0	2019-10-09 19:06:22.054549	2019-10-09 19:06:22.054549
490	0	57	140	\N	0.0	0.0	2019-10-09 19:06:22.061443	2019-10-09 19:06:22.061443
491	0	58	140	\N	0.0	0.0	2019-10-09 19:06:22.069134	2019-10-09 19:06:22.069134
492	0	59	140	\N	0.0	0.0	2019-10-09 19:06:22.075764	2019-10-09 19:06:22.075764
493	0	60	140	\N	0.0	0.0	2019-10-09 19:06:22.082959	2019-10-09 19:06:22.082959
494	0	61	140	\N	0.0	0.0	2019-10-09 19:06:22.091448	2019-10-09 19:06:22.091448
495	0	62	140	\N	0.0	0.0	2019-10-09 19:06:22.099089	2019-10-09 19:06:22.099089
496	0	63	140	\N	0.0	0.0	2019-10-09 19:06:22.106517	2019-10-09 19:06:22.106517
497	0	64	140	\N	0.0	0.0	2019-10-09 19:06:22.114145	2019-10-09 19:06:22.114145
498	false	65	140	\N	0.0	0.0	2019-10-09 19:06:22.120433	2019-10-09 19:06:22.120433
499	0	66	140	\N	0.0	0.0	2019-10-09 19:06:22.130468	2019-10-09 19:06:22.130468
500	0	67	140	\N	0.0	0.0	2019-10-09 19:06:22.1455	2019-10-09 19:06:22.1455
501	0	68	140	\N	0.0	0.0	2019-10-09 19:06:22.154425	2019-10-09 19:06:22.154425
502	false	69	140	\N	0.0	0.0	2019-10-09 19:06:22.160518	2019-10-09 19:06:22.160518
503	0	70	140	\N	0.0	0.0	2019-10-09 19:06:22.168097	2019-10-09 19:06:22.168097
504	0	71	140	\N	0.0	0.0	2019-10-09 19:06:22.177025	2019-10-09 19:06:22.177025
505	0	72	140	\N	0.0	0.0	2019-10-09 19:06:22.183919	2019-10-09 19:06:22.183919
506	0	73	140	\N	0.0	0.0	2019-10-09 19:06:22.191005	2019-10-09 19:06:22.191005
507	false	74	140	\N	0.0	0.0	2019-10-09 19:06:22.19672	2019-10-09 19:06:22.19672
508	1	80	140	\N	0.0	0.0	2019-10-09 19:06:22.205315	2019-10-09 19:06:22.205315
509	2	81	140	\N	0.0	0.0	2019-10-09 19:06:22.211452	2019-10-09 19:06:22.211452
510	3	80	140	\N	0.0	0.0	2019-10-09 19:06:22.218168	2019-10-09 19:06:22.218168
511	4	81	140	\N	0.0	0.0	2019-10-09 19:06:22.224041	2019-10-09 19:06:22.224041
512	5	80	140	\N	0.0	0.0	2019-10-09 19:06:22.229883	2019-10-09 19:06:22.229883
513	6	81	140	\N	0.0	0.0	2019-10-09 19:06:22.235665	2019-10-09 19:06:22.235665
514	7	80	140	\N	0.0	0.0	2019-10-09 19:06:22.26712	2019-10-09 19:06:22.26712
515	8	81	140	\N	0.0	0.0	2019-10-09 19:06:22.273145	2019-10-09 19:06:22.273145
516	9	80	140	\N	0.0	0.0	2019-10-09 19:06:22.279353	2019-10-09 19:06:22.279353
517	10	81	140	\N	0.0	0.0	2019-10-09 19:06:22.28532	2019-10-09 19:06:22.28532
518	new1	29	141	\N	0.0	0.0	2019-10-09 19:07:23.54991	2019-10-09 19:07:23.54991
519	new1	30	141	\N	0.0	0.0	2019-10-09 19:07:23.555569	2019-10-09 19:07:23.555569
520	new1	27	141	\N	0.0	0.0	2019-10-09 19:07:23.560961	2019-10-09 19:07:23.560961
521	false	28	141	\N	0.0	0.0	2019-10-09 19:07:23.566395	2019-10-09 19:07:23.566395
522	0	32	141	\N	0.0	0.0	2019-10-09 19:07:23.573097	2019-10-09 19:07:23.573097
523	0	33	141	\N	0.0	0.0	2019-10-09 19:07:23.581443	2019-10-09 19:07:23.581443
524	0	34	141	\N	0.0	0.0	2019-10-09 19:07:23.589878	2019-10-09 19:07:23.589878
525	0	35	141	\N	0.0	0.0	2019-10-09 19:07:23.596572	2019-10-09 19:07:23.596572
526	0	36	141	\N	495.0	495.0	2019-10-09 19:07:23.603214	2019-10-09 19:07:23.603214
527	0	37	141	\N	0.0	0.0	2019-10-09 19:07:23.609677	2019-10-09 19:07:23.609677
528	0	38	141	\N	0.0	0.0	2019-10-09 19:07:23.616311	2019-10-09 19:07:23.616311
529	false	39	141	\N	0.0	0.0	2019-10-09 19:07:23.621937	2019-10-09 19:07:23.621937
530	0	40	141	\N	0.0	0.0	2019-10-09 19:07:23.628482	2019-10-09 19:07:23.628482
531	0	41	141	\N	0.0	0.0	2019-10-09 19:07:23.635171	2019-10-09 19:07:23.635171
532	0	42	141	\N	0.0	0.0	2019-10-09 19:07:23.641682	2019-10-09 19:07:23.641682
533	0	43	141	\N	627.0	627.0	2019-10-09 19:07:23.649006	2019-10-09 19:07:23.649006
534	0	44	141	\N	0.0	0.0	2019-10-09 19:07:23.655769	2019-10-09 19:07:23.655769
535	false	45	141	\N	0.0	0.0	2019-10-09 19:07:23.66259	2019-10-09 19:07:23.66259
536	0	46	141	\N	0.0	0.0	2019-10-09 19:07:23.672289	2019-10-09 19:07:23.672289
537	0	47	141	\N	0.0	0.0	2019-10-09 19:07:23.6788	2019-10-09 19:07:23.6788
538	0	48	141	\N	0.0	0.0	2019-10-09 19:07:23.6853	2019-10-09 19:07:23.6853
539	0	49	141	\N	0.0	0.0	2019-10-09 19:07:23.691911	2019-10-09 19:07:23.691911
540	0	50	141	\N	0.0	0.0	2019-10-09 19:07:23.698767	2019-10-09 19:07:23.698767
541	0	51	141	\N	0.0	0.0	2019-10-09 19:07:23.705369	2019-10-09 19:07:23.705369
542	0	52	141	\N	0.0	0.0	2019-10-09 19:07:23.711909	2019-10-09 19:07:23.711909
543	0	53	141	\N	0.0	0.0	2019-10-09 19:07:23.718871	2019-10-09 19:07:23.718871
544	false	54	141	\N	0.0	0.0	2019-10-09 19:07:23.725036	2019-10-09 19:07:23.725036
545	0	55	141	\N	0.0	0.0	2019-10-09 19:07:23.731677	2019-10-09 19:07:23.731677
546	0	56	141	\N	0.0	0.0	2019-10-09 19:07:23.738137	2019-10-09 19:07:23.738137
547	0	57	141	\N	0.0	0.0	2019-10-09 19:07:23.744892	2019-10-09 19:07:23.744892
548	0	58	141	\N	0.0	0.0	2019-10-09 19:07:23.752242	2019-10-09 19:07:23.752242
549	0	59	141	\N	0.0	0.0	2019-10-09 19:07:23.758781	2019-10-09 19:07:23.758781
550	0	60	141	\N	0.0	0.0	2019-10-09 19:07:23.76515	2019-10-09 19:07:23.76515
551	0	61	141	\N	0.0	0.0	2019-10-09 19:07:23.774819	2019-10-09 19:07:23.774819
552	0	62	141	\N	0.0	0.0	2019-10-09 19:07:23.783256	2019-10-09 19:07:23.783256
553	0	63	141	\N	0.0	0.0	2019-10-09 19:07:23.79054	2019-10-09 19:07:23.79054
554	0	64	141	\N	0.0	0.0	2019-10-09 19:07:23.797311	2019-10-09 19:07:23.797311
555	false	65	141	\N	0.0	0.0	2019-10-09 19:07:23.803041	2019-10-09 19:07:23.803041
556	0	66	141	\N	0.0	0.0	2019-10-09 19:07:23.809449	2019-10-09 19:07:23.809449
557	0	67	141	\N	0.0	0.0	2019-10-09 19:07:23.81617	2019-10-09 19:07:23.81617
558	0	68	141	\N	0.0	0.0	2019-10-09 19:07:23.822976	2019-10-09 19:07:23.822976
559	false	69	141	\N	0.0	0.0	2019-10-09 19:07:23.828458	2019-10-09 19:07:23.828458
560	0	70	141	\N	0.0	0.0	2019-10-09 19:07:23.835108	2019-10-09 19:07:23.835108
561	0	71	141	\N	0.0	0.0	2019-10-09 19:07:23.841583	2019-10-09 19:07:23.841583
562	0	72	141	\N	0.0	0.0	2019-10-09 19:07:23.852786	2019-10-09 19:07:23.852786
563	0	73	141	\N	0.0	0.0	2019-10-09 19:07:23.863284	2019-10-09 19:07:23.863284
564	false	74	141	\N	0.0	0.0	2019-10-09 19:07:23.872524	2019-10-09 19:07:23.872524
565	1	80	141	\N	0.0	0.0	2019-10-09 19:07:23.882475	2019-10-09 19:07:23.882475
566	2	81	141	\N	0.0	0.0	2019-10-09 19:07:23.889202	2019-10-09 19:07:23.889202
567	4	80	141	\N	0.0	0.0	2019-10-09 19:07:23.895604	2019-10-09 19:07:23.895604
568	3	81	141	\N	0.0	0.0	2019-10-09 19:07:23.906899	2019-10-09 19:07:23.906899
569	new1	29	142	\N	0.0	0.0	2019-10-09 19:08:21.296243	2019-10-09 19:08:21.296243
570	new1	30	142	\N	0.0	0.0	2019-10-09 19:08:21.306996	2019-10-09 19:08:21.306996
571	new1	27	142	\N	0.0	0.0	2019-10-09 19:08:21.315614	2019-10-09 19:08:21.315614
572	false	28	142	\N	0.0	0.0	2019-10-09 19:08:21.324483	2019-10-09 19:08:21.324483
573	0	32	142	\N	0.0	0.0	2019-10-09 19:08:21.335972	2019-10-09 19:08:21.335972
574	0	33	142	\N	0.0	0.0	2019-10-09 19:08:21.349008	2019-10-09 19:08:21.349008
575	0	34	142	\N	0.0	0.0	2019-10-09 19:08:21.361538	2019-10-09 19:08:21.361538
576	0	35	142	\N	0.0	0.0	2019-10-09 19:08:21.371367	2019-10-09 19:08:21.371367
577	0	36	142	\N	495.0	495.0	2019-10-09 19:08:21.381153	2019-10-09 19:08:21.381153
578	0	37	142	\N	0.0	0.0	2019-10-09 19:08:21.390899	2019-10-09 19:08:21.390899
579	0	38	142	\N	0.0	0.0	2019-10-09 19:08:21.400525	2019-10-09 19:08:21.400525
580	false	39	142	\N	0.0	0.0	2019-10-09 19:08:21.409852	2019-10-09 19:08:21.409852
581	0	40	142	\N	0.0	0.0	2019-10-09 19:08:21.420772	2019-10-09 19:08:21.420772
582	0	41	142	\N	0.0	0.0	2019-10-09 19:08:21.431822	2019-10-09 19:08:21.431822
583	0	42	142	\N	0.0	0.0	2019-10-09 19:08:21.443128	2019-10-09 19:08:21.443128
584	0	43	142	\N	627.0	627.0	2019-10-09 19:08:21.454208	2019-10-09 19:08:21.454208
585	0	44	142	\N	0.0	0.0	2019-10-09 19:08:21.465376	2019-10-09 19:08:21.465376
586	false	45	142	\N	0.0	0.0	2019-10-09 19:08:21.4745	2019-10-09 19:08:21.4745
587	0	46	142	\N	0.0	0.0	2019-10-09 19:08:21.485548	2019-10-09 19:08:21.485548
588	0	47	142	\N	0.0	0.0	2019-10-09 19:08:21.495973	2019-10-09 19:08:21.495973
589	0	48	142	\N	0.0	0.0	2019-10-09 19:08:21.506688	2019-10-09 19:08:21.506688
590	0	49	142	\N	0.0	0.0	2019-10-09 19:08:21.517276	2019-10-09 19:08:21.517276
591	0	50	142	\N	0.0	0.0	2019-10-09 19:08:21.528059	2019-10-09 19:08:21.528059
592	0	51	142	\N	0.0	0.0	2019-10-09 19:08:21.538495	2019-10-09 19:08:21.538495
593	0	52	142	\N	0.0	0.0	2019-10-09 19:08:21.547989	2019-10-09 19:08:21.547989
594	0	53	142	\N	0.0	0.0	2019-10-09 19:08:21.556592	2019-10-09 19:08:21.556592
595	false	54	142	\N	0.0	0.0	2019-10-09 19:08:21.566454	2019-10-09 19:08:21.566454
596	0	55	142	\N	0.0	0.0	2019-10-09 19:08:21.579763	2019-10-09 19:08:21.579763
597	0	56	142	\N	0.0	0.0	2019-10-09 19:08:21.588593	2019-10-09 19:08:21.588593
598	0	57	142	\N	0.0	0.0	2019-10-09 19:08:21.596076	2019-10-09 19:08:21.596076
599	0	58	142	\N	0.0	0.0	2019-10-09 19:08:21.635254	2019-10-09 19:08:21.635254
600	0	59	142	\N	0.0	0.0	2019-10-09 19:08:21.643924	2019-10-09 19:08:21.643924
601	0	60	142	\N	0.0	0.0	2019-10-09 19:08:21.65221	2019-10-09 19:08:21.65221
602	0	61	142	\N	0.0	0.0	2019-10-09 19:08:21.660007	2019-10-09 19:08:21.660007
603	0	62	142	\N	0.0	0.0	2019-10-09 19:08:21.667877	2019-10-09 19:08:21.667877
604	0	63	142	\N	0.0	0.0	2019-10-09 19:08:21.675173	2019-10-09 19:08:21.675173
605	0	64	142	\N	0.0	0.0	2019-10-09 19:08:21.683686	2019-10-09 19:08:21.683686
606	false	65	142	\N	0.0	0.0	2019-10-09 19:08:21.690885	2019-10-09 19:08:21.690885
607	0	66	142	\N	0.0	0.0	2019-10-09 19:08:21.697782	2019-10-09 19:08:21.697782
608	0	67	142	\N	0.0	0.0	2019-10-09 19:08:21.705336	2019-10-09 19:08:21.705336
609	0	68	142	\N	0.0	0.0	2019-10-09 19:08:21.712531	2019-10-09 19:08:21.712531
610	false	69	142	\N	0.0	0.0	2019-10-09 19:08:21.719131	2019-10-09 19:08:21.719131
611	0	70	142	\N	0.0	0.0	2019-10-09 19:08:21.728311	2019-10-09 19:08:21.728311
612	0	71	142	\N	0.0	0.0	2019-10-09 19:08:21.736018	2019-10-09 19:08:21.736018
613	0	72	142	\N	0.0	0.0	2019-10-09 19:08:21.74287	2019-10-09 19:08:21.74287
614	0	73	142	\N	0.0	0.0	2019-10-09 19:08:21.750329	2019-10-09 19:08:21.750329
615	false	74	142	\N	0.0	0.0	2019-10-09 19:08:21.760492	2019-10-09 19:08:21.760492
616	1	80	142	\N	0.0	0.0	2019-10-09 19:08:21.772127	2019-10-09 19:08:21.772127
617	2	81	142	\N	0.0	0.0	2019-10-09 19:08:21.780807	2019-10-09 19:08:21.780807
618	4	80	142	\N	0.0	0.0	2019-10-09 19:08:21.788974	2019-10-09 19:08:21.788974
619	3	81	142	\N	0.0	0.0	2019-10-09 19:08:21.795624	2019-10-09 19:08:21.795624
620	5	80	137	\N	0.0	0.0	2019-10-10 10:13:35.149274	2019-10-10 10:13:35.149274
621	6	81	137	\N	0.0	0.0	2019-10-10 10:13:35.156898	2019-10-10 10:13:35.156898
622	3	80	137	\N	0.0	0.0	2019-10-10 10:13:35.163512	2019-10-10 10:13:35.163512
623	4	81	137	\N	0.0	0.0	2019-10-10 10:13:35.169814	2019-10-10 10:13:35.169814
\.


--
-- Data for Name: line_tasks; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.line_tasks (id, title, budget, type_line, status, task_id, created_at, updated_at) FROM stdin;
310	1 из админки	200.00	Change Order	new	503	2019-07-19 20:29:03.019731	2019-07-19 20:29:03.019731
311	2	300.00	Back Charge	confirmed	503	2019-07-19 20:29:12.419303	2019-07-19 20:29:12.419303
312	ghfghfjhggk	3545.00	Back Charge	confirmed	508	2019-07-20 08:36:23.509711	2019-07-20 08:36:23.509711
313	ghfghfjhggk	21212.00	Change Order	new	508	2019-07-20 08:46:38.651499	2019-07-20 08:46:38.651499
315	bek	20.00	Back Charge	confirmed	530	2019-08-12 09:19:32.002424	2019-08-12 09:19:32.002424
314	change	100.00	Change Order	confirmed	530	2019-08-12 09:18:39.366144	2019-08-12 09:19:56.290138
317	2	20.53	Back Charge	confirmed	534	2019-08-13 08:30:48.206444	2019-08-13 08:30:48.206444
316	1 из админки	500.55	Change Order	confirmed	534	2019-08-13 08:30:35.296173	2019-08-13 08:32:22.278527
319	2	20.53	Back Charge	confirmed	538	2019-08-13 21:30:48.276263	2019-08-13 21:30:48.276263
318	1 из админки	100.23	Change Order	confirmed	538	2019-08-13 21:30:37.748783	2019-08-13 21:31:47.806784
320	1 из админки	100.20	Change Order	new	504	2019-08-13 21:42:58.882776	2019-08-13 21:42:58.882776
321	1 из админки	20.20	Back Charge	confirmed	504	2019-08-13 21:43:08.694374	2019-08-13 21:43:08.694374
322	1 из админки	100.25	Change Order	new	543	2019-08-13 21:46:31.504192	2019-08-13 21:46:31.504192
323	Ch1	25.85	Change Order	new	548	2019-08-15 09:03:43.068857	2019-08-15 09:03:43.068857
324	Back2	89.69	Back Charge	confirmed	548	2019-08-15 09:04:02.197992	2019-08-15 09:04:02.197992
325	Frthg	2580.96	Change Order	new	551	2019-08-15 20:45:13.144972	2019-08-15 20:45:13.144972
326	Ffgh	2589.96	Back Charge	confirmed	551	2019-08-15 20:46:25.835749	2019-08-15 20:46:25.835749
327	1	258889.97	Change Order	new	551	2019-08-15 21:23:44.611137	2019-08-15 21:23:44.611137
328	Tt	2588.96	Change Order	new	551	2019-08-15 21:25:06.834666	2019-08-15 21:25:06.834666
329	Rty	100.58	Change Order	new	551	2019-08-15 21:26:49.826008	2019-08-15 21:26:49.826008
330	1	258.00	Change Order	new	551	2019-08-15 21:28:45.664873	2019-08-15 21:28:45.664873
331	2	258.69	Change Order	new	551	2019-08-15 21:29:06.580683	2019-08-15 21:29:06.580683
332	3	369.66	Change Order	new	551	2019-08-15 21:29:52.134192	2019-08-15 21:29:52.134192
333	4	258.69	Back Charge	confirmed	551	2019-08-15 21:33:11.204294	2019-08-15 21:33:11.204294
334	11.11 вверх\n	11.11	Change Order	new	336	2019-08-21 18:30:15.812829	2019-08-21 18:30:15.812829
335	12.11 вверх	12.11	Change Order	new	336	2019-08-21 18:32:29.727485	2019-08-21 18:32:29.727485
336	18 ииии	18.00	Change Order	new	336	2019-08-21 18:37:37.353755	2019-08-21 18:37:37.353755
337	14ррр	14.00	Change Order	new	336	2019-08-21 18:39:33.495381	2019-08-21 18:39:33.495381
338	151.99 мрн	151.00	Change Order	new	336	2019-08-21 19:16:24.675112	2019-08-21 19:16:24.675112
339	151.99 мрн	151.00	Change Order	new	336	2019-08-21 19:16:26.113712	2019-08-21 19:16:26.113712
340	Еер	55.00	Change Order	new	336	2019-08-21 19:17:10.465195	2019-08-21 19:17:10.465195
341	Кмр	33.00	Change Order	new	336	2019-08-21 19:18:40.276657	2019-08-21 19:18:40.276657
342	12.01 должно	12.01	Change Order	new	336	2019-08-21 19:21:25.841225	2019-08-21 19:21:25.841225
343	01.01 тест	1.01	Change Order	new	336	2019-08-21 19:27:49.534479	2019-08-21 19:27:49.534479
344	01.01 тест	1.01	Change Order	new	336	2019-08-21 19:28:06.97384	2019-08-21 19:28:06.97384
345	1	2589.69	Change Order	new	557	2019-08-28 20:51:59.121029	2019-08-28 20:51:59.121029
346	2	3698.96	Back Charge	confirmed	557	2019-08-28 20:52:13.622406	2019-08-28 20:52:13.622406
347	1 из админки	1345.36	Change Order	new	584	2019-09-24 13:14:52.118115	2019-09-24 13:14:52.118115
348	2	1233.00	Change Order	new	584	2019-09-24 13:15:05.702341	2019-09-24 13:15:05.702341
349	3	2222.00	Back Charge	confirmed	584	2019-09-24 13:15:17.392922	2019-09-24 13:15:17.392922
350	1 из админки	1256.36	Change Order	new	592	2019-10-01 08:00:15.217646	2019-10-01 08:00:15.217646
351	2	1452.36	Back Charge	confirmed	592	2019-10-01 08:01:40.32396	2019-10-01 08:01:40.32396
352	3	1452.36	Back Charge	confirmed	592	2019-10-01 08:02:15.224336	2019-10-01 08:02:15.224336
354	2	1223.36	Back Charge	confirmed	594	2019-10-04 08:08:22.332236	2019-10-04 08:08:22.332236
353	1 из админки	4125.36	Change Order	confirmed	594	2019-10-04 08:08:06.033225	2019-10-04 08:09:48.955138
361	2	412.36	Back Charge	confirmed	599	2019-10-04 13:30:20.938416	2019-10-04 13:30:20.938416
360	1 из админки	256.36	Change Order	confirmed	599	2019-10-04 13:29:58.372483	2019-10-04 13:30:40.171445
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.messages (id, author_id, recipient_id, message_body, created_at, updated_at, task_id, suggestion_id, system, rating, points, give_a_rate, file_file_name, file_content_type, file_file_size, file_updated_at, type_message, id_line_task, title, budget, type_line, status, budget_task, total) FROM stdin;
2613	110	112	New Task	2019-08-12 09:17:03.898493	2019-08-12 09:17:03.898493	530	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2614	112	110	legal  has accepted your work offer	2019-08-12 09:17:55.563876	2019-08-12 09:17:55.563876	530	388	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2616	110	112	Back Charge	2019-08-12 09:19:33.641258	2019-08-12 09:19:33.641258	530	388	t	f	\N	f	\N	\N	\N	\N	back_charge	315	bek	20	Back Charge	confirmed	800	800.0
2615	110	112	Please confirm the Change Order	2019-08-12 09:18:40.988054	2019-08-12 09:19:58.136897	530	388	t	f	\N	f	\N	\N	\N	\N	change_order	314	change	100	Change Order	confirmed	800	800.0
2617	112	110	Budget has changed	2019-08-12 09:19:58.148533	2019-08-12 09:19:58.148533	530	388	t	f	\N	f	\N	\N	\N	\N	accept_line	314	change	100	Change Order	confirmed	800	800.0
2661	110	109	New Task	2019-08-15 08:33:37.41756	2019-08-15 08:33:37.41756	545	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2660	110	109	New Task	2019-08-15 08:27:08.702611	2019-08-15 08:45:55.059274	544	401	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2687	109	82	Привет	2019-08-19 15:41:02.675585	2019-08-19 15:41:02.675585	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2688	109	82	Как дела?	2019-08-19 15:42:05.555523	2019-08-19 15:42:05.555523	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2689	109	82	Привет	2019-08-19 15:48:32.14391	2019-08-19 15:48:32.14391	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2690	82	109	привет	2019-08-19 15:48:41.740787	2019-08-19 15:48:41.740787	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2691	109	82	Добрый	2019-08-19 15:48:45.942826	2019-08-19 15:48:45.942826	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2692	109	82	Город	2019-08-19 15:49:54.933061	2019-08-19 15:49:54.933061	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2693	82	109	тт	2019-08-19 15:50:17.899158	2019-08-19 15:50:17.899158	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2694	109	82	Ррр	2019-08-19 15:50:29.755435	2019-08-19 15:50:29.755435	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2695	109	82	Шрлш	2019-08-19 16:17:20.502266	2019-08-19 16:17:20.502266	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2696	82	109	пол	2019-08-19 16:17:24.61248	2019-08-19 16:17:24.61248	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2697	82	109	шгг	2019-08-19 16:17:28.671138	2019-08-19 16:17:28.671138	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2698	109	82	555	2019-08-19 16:17:41.410255	2019-08-19 16:17:41.410255	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2699	109	82	Оолл	2019-08-19 16:18:19.903553	2019-08-19 16:18:19.903553	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2700	109	82	7оош	2019-08-19 16:18:23.626703	2019-08-19 16:18:23.626703	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2701	109	82	7олл	2019-08-19 16:18:25.789154	2019-08-19 16:18:25.789154	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2702	82	109	гаргро	2019-08-19 16:18:35.941701	2019-08-19 16:18:35.941701	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2703	82	109	пилш	2019-08-19 16:18:45.608907	2019-08-19 16:18:45.608907	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2704	109	82	Ррол	2019-08-19 16:18:48.924387	2019-08-19 16:18:48.924387	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2705	82	109	оо	2019-08-19 16:27:11.569994	2019-08-19 16:27:11.569994	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2706	109	82	Моо	2019-08-19 16:27:17.962145	2019-08-19 16:27:17.962145	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2707	109	82	Нг	2019-08-19 16:28:44.379282	2019-08-19 16:28:44.379282	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2708	82	109	пи	2019-08-19 16:28:49.0037	2019-08-19 16:28:49.0037	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2709	109	82	Нроош	2019-08-19 17:08:12.105517	2019-08-19 17:08:12.105517	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2710	109	82	Нггг	2019-08-19 17:08:15.716483	2019-08-19 17:08:15.716483	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2711	82	109	орш	2019-08-19 19:48:53.866873	2019-08-19 19:48:53.866873	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2712	82	109	нрг	2019-08-19 19:49:27.774188	2019-08-19 19:49:27.774188	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2713	109	82	Гощщ	2019-08-19 19:49:46.009818	2019-08-19 19:49:46.009818	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2714	82	109	ррл	2019-08-19 19:50:09.820144	2019-08-19 19:50:09.820144	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2715	82	109	олл	2019-08-19 19:50:14.729636	2019-08-19 19:50:14.729636	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2716	82	109	сс	2019-08-19 19:50:57.608225	2019-08-19 19:50:57.608225	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2717	109	82	54 ате	2019-08-19 19:51:00.70925	2019-08-19 19:51:00.70925	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2754	110	112	Congratulations! legal : Your bid was accepted.	2019-09-02 11:19:21.568677	2019-09-02 11:19:21.568677	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2756	110	112	Congratulations! legal : Your bid was accepted.	2019-09-02 11:20:41.182106	2019-09-02 11:20:41.182106	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2787	110	112	Supervisor2 : Has confirmed your work.	2019-09-09 10:24:20.226974	2019-09-09 10:24:20.226974	571	427	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2819	110	112	New Task	2019-09-24 13:09:00.694734	2019-09-24 13:09:00.694734	583	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2821	112	110	legal  has accepted your work offer	2019-09-24 13:11:02.899148	2019-09-24 13:11:02.899148	582	437	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2818	110	112	New Task	2019-09-24 13:08:07.567973	2019-09-24 13:11:03.542505	582	437	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2823	112	110	New Bid!\n \n Bid: $2558.0	2019-09-24 13:13:31.501908	2019-09-24 13:13:31.501908	586	440	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2824	112	110	New Bid!\n rtghg\n Bid: $1256.96	2019-09-24 13:13:40.501029	2019-09-24 13:13:40.501029	586	440	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2825	112	110	legal  has accepted your work offer	2019-09-24 13:14:24.694148	2019-09-24 13:14:24.694148	584	439	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2820	110	112	New Task	2019-09-24 13:09:50.020766	2019-09-24 13:14:25.287707	584	439	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2826	110	112	Please confirm the Change Order	2019-09-24 13:14:53.521175	2019-09-24 13:14:53.521175	584	439	t	f	\N	f	\N	\N	\N	\N	change_order	347	1 из админки	1345	Change Order	new	1236	1236.36
2827	110	112	Please confirm the Change Order	2019-09-24 13:15:07.238979	2019-09-24 13:15:07.238979	584	439	t	f	\N	f	\N	\N	\N	\N	change_order	348	2	1233	Change Order	new	1236	1236.36
2828	110	112	Back Charge	2019-09-24 13:15:19.082567	2019-09-24 13:15:19.082567	584	439	t	f	\N	f	\N	\N	\N	\N	back_charge	349	3	2222	Back Charge	confirmed	1236	1236.36
2829	110	112	Supervisor2 : Has confirmed your work.	2019-09-24 13:15:27.38302	2019-09-24 13:15:27.38302	584	439	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2854	112	110	legal  has accepted your work offer	2019-10-01 07:35:29.815771	2019-10-01 07:35:29.815771	592	447	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2855	112	110	legal  has accepted your work offer	2019-10-01 07:35:33.365268	2019-10-01 07:35:33.365268	592	447	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2853	110	112	New Task	2019-10-01 07:31:51.447137	2019-10-01 07:35:33.812312	592	447	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2880	112	110	legal  has accepted your work offer	2019-10-04 13:29:10.250942	2019-10-04 13:29:10.250942	599	454	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2879	110	112	New Task	2019-10-04 13:26:26.697648	2019-10-04 13:29:10.813136	599	454	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2882	110	112	Back Charge	2019-10-04 13:30:22.555908	2019-10-04 13:30:22.555908	599	454	t	f	\N	f	\N	\N	\N	\N	back_charge	361	2	412	Back Charge	confirmed	1563	1563.36
2881	110	112	Please confirm the Change Order	2019-10-04 13:29:59.766793	2019-10-04 13:30:41.55207	599	454	t	f	\N	f	\N	\N	\N	\N	change_order	360	1 из админки	256	Change Order	confirmed	1563	1563.36
2883	112	110	Budget has changed	2019-10-04 13:30:41.558263	2019-10-04 13:30:41.558263	599	454	t	f	\N	f	\N	\N	\N	\N	accept_line	360	1 из админки	256	Change Order	confirmed	1563	1563.36
1729	82	79	New Task	2019-02-10 13:22:40.47595	2019-02-10 13:22:40.47595	336	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2884	110	112	Supervisor2 : Has confirmed your work.	2019-10-04 13:30:56.635711	2019-10-04 13:30:56.635711	599	454	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2618	110	109	Supervisor2 : Has confirmed your work.	2019-08-12 15:56:34.272302	2019-08-12 15:56:34.272302	506	367	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2662	109	110	Donna  has accepted your work offer	2019-08-15 08:45:53.903823	2019-08-15 08:45:53.903823	544	401	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2718	109	82	Гоолп	2019-08-19 20:22:56.355344	2019-08-19 20:22:56.355344	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2719	109	82	Пн	2019-08-19 20:23:07.484789	2019-08-19 20:23:07.484789	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2720	109	82	55555	2019-08-19 20:23:11.203437	2019-08-19 20:23:11.203437	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2721	109	82	Ррроо	2019-08-19 20:23:19.201551	2019-08-19 20:23:19.201551	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2722	109	82	Еен	2019-08-19 20:24:05.421829	2019-08-19 20:24:05.421829	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2723	109	82	Нрош	2019-08-19 20:24:13.755445	2019-08-19 20:24:13.755445	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2757	110	109	New Task	2019-09-02 13:39:07.80368	2019-09-02 13:40:06.981498	562	418	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2758	109	110	Donna  has accepted your work offer	2019-09-02 13:40:06.268273	2019-09-02 13:40:06.986591	562	418	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2601	110	111	New Task	2019-07-23 09:30:59.463217	2019-07-23 09:30:59.463217	521	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2759	109	110	New Bid!\n \n Bid: $2589.69	2019-09-02 13:44:46.422761	2019-09-02 13:44:46.422761	563	419	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2604	110	107	New Task	2019-08-06 21:34:52.516258	2019-08-06 21:34:52.516258	524	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2605	109	110	Donna  has accepted your work offer	2019-08-06 21:36:23.921128	2019-08-06 21:36:23.921128	524	382	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2760	110	109	Congratulations! Donna : Your bid was accepted.	2019-09-02 13:45:15.147782	2019-09-02 13:45:15.147782	563	419	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2788	110	112	Supervisor2 : Has confirmed your work.	2019-09-09 11:10:43.711235	2019-09-09 11:10:43.711235	570	426	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2822	112	110	legal  has accepted your work offer	2019-09-24 13:11:06.898949	2019-09-24 13:11:06.898949	582	437	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2856	112	110	legal  has accepted your work offer	2019-10-01 07:35:36.915061	2019-10-01 07:35:36.915061	592	447	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2885	112	110	New Bid!\n trert\n Bid: $3999.99	2019-10-04 13:42:28.21938	2019-10-04 13:42:28.21938	600	455	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2886	110	112	Congratulations! legal : Your bid was accepted.	2019-10-04 13:43:07.679262	2019-10-04 13:43:07.679262	600	455	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2887	112	110	legal  — completed your task, please confirm	2019-10-04 13:43:50.079301	2019-10-04 13:43:50.079301	600	455	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2888	110	112	Supervisor2 : Has confirmed your work.	2019-10-04 13:44:08.823581	2019-10-04 13:44:08.823581	600	455	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2619	110	109	New Task	2019-08-12 16:10:12.449768	2019-08-12 16:10:12.449768	531	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2620	109	110	Donna  has accepted your work offer	2019-08-12 16:11:21.602751	2019-08-12 16:11:21.602751	531	389	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2621	110	109	Supervisor2 : Has confirmed your work.	2019-08-12 16:15:57.490823	2019-08-12 16:15:57.490823	531	389	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2663	109	110	New Bid!\n амррр.\n Bid: $58808.0	2019-08-15 08:49:25.234601	2019-08-15 08:49:25.234601	547	403	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2664	109	110	New Bid!\n .\n Bid: $2888.0	2019-08-15 08:57:29.629074	2019-08-15 08:57:29.629074	546	404	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2665	110	109	New Task	2019-08-15 08:59:20.922598	2019-08-15 08:59:20.922598	548	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2606	109	110	Donna  has accepted your work offer	2019-08-06 21:36:25.820466	2019-08-06 21:36:25.820466	524	382	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2666	109	110	Donna  has accepted your work offer	2019-08-15 09:02:48.336445	2019-08-15 09:02:48.336445	548	405	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2667	110	109	Please confirm the Change Order	2019-08-15 09:03:44.765961	2019-08-15 09:03:44.765961	548	405	t	f	\N	f	\N	\N	\N	\N	change_order	323	Ch1	25	Change Order	new	258	258.0
2668	110	109	Back Charge	2019-08-15 09:04:03.614293	2019-08-15 09:04:03.614293	548	405	t	f	\N	f	\N	\N	\N	\N	back_charge	324	Back2	89	Back Charge	confirmed	258	258.0
2669	110	109	New Task	2019-08-15 09:05:05.503413	2019-08-15 09:05:05.503413	549	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2724	82	109	рол	2019-08-21 18:20:56.291347	2019-08-21 18:20:56.291347	336	413	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2725	109	82	New Bid!\n 25.88\n Bid: $25.88	2019-08-21 18:21:23.398757	2019-08-21 18:21:23.398757	336	413	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2726	109	82	New Bid!\n 100\n Bid: $100.00	2019-08-21 18:23:29.663619	2019-08-21 18:23:29.663619	336	413	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2727	82	109	Congratulations! Donna : Your bid was accepted.	2019-08-21 18:29:20.905177	2019-08-21 18:29:20.905177	336	413	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2728	82	109	Please confirm the Change Order	2019-08-21 18:30:17.412167	2019-08-21 18:30:17.412167	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	334	11.11 вверх\n	11	Change Order	new	100	100.0
2729	82	109	Please confirm the Change Order	2019-08-21 18:32:31.422858	2019-08-21 18:32:31.422858	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	335	12.11 вверх	12	Change Order	new	100	100.0
2730	82	109	Please confirm the Change Order	2019-08-21 18:37:38.874781	2019-08-21 18:37:38.874781	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	336	18 ииии	18	Change Order	new	100	100.0
2731	82	109	Please confirm the Change Order	2019-08-21 18:39:35.921852	2019-08-21 18:39:35.921852	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	337	14ррр	14	Change Order	new	100	100.0
2763	109	110	New Bid!\n \n Bid: $2563.69	2019-09-02 20:33:47.575053	2019-09-02 20:33:47.575053	565	421	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2761	110	109	New Task	2019-09-02 20:26:51.964587	2019-09-02 20:33:58.57873	564	420	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2762	109	110	Donna  has accepted your work offer	2019-09-02 20:27:25.148434	2019-09-02 20:33:58.579889	564	420	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2764	109	110	Donna  — completed your task, please confirm	2019-09-02 20:34:04.239477	2019-09-02 20:34:04.75917	564	420	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2765	110	109	Supervisor2 : Has confirmed your work.	2019-09-02 20:35:03.653056	2019-09-02 20:35:03.653056	564	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2766	110	109	Congratulations! Donna : Your bid was accepted.	2019-09-02 20:37:21.990261	2019-09-02 20:37:21.990261	565	421	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2767	110	109	Congratulations! Donna : Your bid was accepted.	2019-09-02 20:39:06.934235	2019-09-02 20:39:06.934235	565	421	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2789	112	110	legal  has accepted your work offer	2019-09-09 11:28:57.426027	2019-09-09 11:28:58.081953	567	423	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2791	112	110	legal  has accepted your work offer	2019-09-09 11:30:40.924347	2019-09-09 11:30:40.924347	572	428	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2792	112	110	legal  has accepted your work offer	2019-09-09 11:30:43.817202	2019-09-09 11:30:43.817202	572	428	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2790	110	112	New Task	2019-09-09 11:30:17.723956	2019-09-09 11:30:44.203008	572	428	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2793	110	112	Supervisor2 : Has confirmed your work.	2019-09-09 11:31:23.756237	2019-09-09 11:31:23.756237	572	428	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2794	110	112	 You ‘ve been raited!	2019-09-09 11:31:25.750504	2019-09-09 11:31:25.750504	572	428	t	t	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1834	83	82	New Bid! mmm : . Bid: $25	2019-02-13 20:27:04.434681	2019-02-13 20:27:04.434681	345	232	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1828	82	83	New Task	2019-02-13 20:00:24.823794	2019-02-13 20:27:04.4657	345	232	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1835	82	83	vivovmfj	2019-02-13 20:27:45.977344	2019-02-13 20:27:45.977344	345	232	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2830	112	82	New Bid!\n xfhxss\n Bid: $800.0	2019-09-25 19:26:57.951987	2019-09-25 19:26:57.951987	457	441	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2831	112	97	legal  has accepted your work offer	2019-09-25 19:31:54.80852	2019-09-25 19:31:54.80852	447	0	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2832	112	97	legal  has accepted your work offer	2019-09-25 19:31:57.883699	2019-09-25 19:31:57.883699	447	0	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2857	110	112	Please confirm the Change Order	2019-10-01 08:00:17.565736	2019-10-01 08:00:17.565736	592	447	t	f	\N	f	\N	\N	\N	\N	change_order	350	1 из админки	1256	Change Order	new	1452	1452.36
2858	110	112	Back Charge	2019-10-01 08:01:41.767368	2019-10-01 08:01:41.767368	592	447	t	f	\N	f	\N	\N	\N	\N	back_charge	351	2	1452	Back Charge	confirmed	1452	1452.36
2859	110	112	Back Charge	2019-10-01 08:02:16.793928	2019-10-01 08:02:16.793928	592	447	t	f	\N	f	\N	\N	\N	\N	back_charge	352	3	1452	Back Charge	confirmed	1452	1452.36
2889	110	112	New Task	2019-10-06 18:37:15.040146	2019-10-06 18:37:15.040146	601	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2890	112	110	legal  has accepted your work offer	2019-10-06 18:37:40.915575	2019-10-06 18:37:40.915575	601	456	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2891	110	112	Supervisor2 : Has confirmed your work.	2019-10-06 18:38:29.528156	2019-10-06 18:38:29.528156	601	456	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1859	83	82	New Bid! mmm : fh. Bid: $	2019-02-13 20:40:57.600506	2019-02-13 20:40:57.600506	345	232	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2622	110	109	New Task	2019-08-12 16:28:47.507065	2019-08-12 17:11:17.066005	532	390	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2671	109	110	Donna  has accepted your work offer	2019-08-15 20:44:17.471084	2019-08-15 20:44:17.471084	551	407	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2672	110	109	Please confirm the Change Order	2019-08-15 20:45:14.863199	2019-08-15 20:45:14.863199	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	325	Frthg	2580	Change Order	new	2586	2586.96
2673	110	109	Back Charge	2019-08-15 20:46:27.208316	2019-08-15 20:46:27.208316	551	407	t	f	\N	f	\N	\N	\N	\N	back_charge	326	Ffgh	2589	Back Charge	confirmed	2586	2586.96
2674	109	110	New Bid!\n rdfg.\n Bid: $2589.96	2019-08-15 20:53:48.313429	2019-08-15 20:53:48.313429	552	408	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2675	109	110	New Bid!\n rgghhh.\n Bid: $25899.96	2019-08-15 20:54:06.641017	2019-08-15 20:54:06.641017	553	409	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2676	110	109	New Task	2019-08-15 20:58:16.953439	2019-08-15 20:58:16.953439	554	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2677	110	109	New Task	2019-08-15 21:20:21.949726	2019-08-15 21:20:21.949726	555	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2678	110	109	Please confirm the Change Order	2019-08-15 21:23:46.247383	2019-08-15 21:23:46.247383	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	327	1	258889	Change Order	new	2586	2586.96
2679	110	109	Please confirm the Change Order	2019-08-15 21:25:08.200549	2019-08-15 21:25:08.200549	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	328	Tt	2588	Change Order	new	2586	2586.96
2680	110	109	Please confirm the Change Order	2019-08-15 21:26:51.306189	2019-08-15 21:26:51.306189	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	329	Rty	100	Change Order	new	2586	2586.96
2681	110	109	Please confirm the Change Order	2019-08-15 21:28:47.049984	2019-08-15 21:28:47.049984	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	330	1	258	Change Order	new	2586	2586.96
2670	110	109	New Task	2019-08-15 20:38:46.413033	2019-08-15 21:28:53.079851	551	407	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2682	110	109	Please confirm the Change Order	2019-08-15 21:29:07.936029	2019-08-15 21:29:07.936029	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	331	2	258	Change Order	new	2586	2586.96
2683	110	109	Please confirm the Change Order	2019-08-15 21:29:53.494281	2019-08-15 21:29:53.494281	551	407	t	f	\N	f	\N	\N	\N	\N	change_order	332	3	369	Change Order	new	2586	2586.96
2684	110	109	Back Charge	2019-08-15 21:33:12.715237	2019-08-15 21:33:12.715237	551	407	t	f	\N	f	\N	\N	\N	\N	back_charge	333	4	258	Back Charge	confirmed	2586	2586.96
2685	110	109	Supervisor2 : Has confirmed your work.	2019-08-15 21:41:16.793597	2019-08-15 21:41:16.793597	551	407	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2732	82	109	Please confirm the Change Order	2019-08-21 19:16:27.691827	2019-08-21 19:16:27.691827	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	338	151.99 мрн	151	Change Order	new	100	100.0
2734	82	109	Please confirm the Change Order	2019-08-21 19:17:12.431564	2019-08-21 19:17:12.431564	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	340	Еер	55	Change Order	new	100	100.0
2735	82	109	Please confirm the Change Order	2019-08-21 19:18:42.117201	2019-08-21 19:18:42.117201	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	341	Кмр	33	Change Order	new	100	100.0
2768	110	109	Congratulations! Donna : Your bid was accepted.	2019-09-02 20:39:09.628419	2019-09-02 20:39:09.628419	565	421	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2797	112	110	legal  has accepted your work offer	2019-09-09 11:37:53.36996	2019-09-09 11:37:53.36996	575	430	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2796	110	112	New Task	2019-09-09 11:37:23.677137	2019-09-09 11:37:54.047889	575	430	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2798	112	110	New Bid!\n \n Bid: $1586.96	2019-09-09 11:38:09.836777	2019-09-09 11:38:09.836777	574	431	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2799	112	110	legal  has accepted your work offer	2019-09-09 11:38:28.140984	2019-09-09 11:38:28.140984	573	429	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2795	110	112	New Task	2019-09-09 11:34:55.203674	2019-09-09 11:38:28.768722	573	429	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2800	110	112	Supervisor2 : Has confirmed your work.	2019-09-09 11:48:18.114349	2019-09-09 11:48:18.114349	573	429	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2833	112	97	legal  has accepted your work offer	2019-09-25 19:32:00.593119	2019-09-25 19:32:00.593119	447	0	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2861	112	110	legal  has accepted your work offer	2019-10-04 08:03:52.966489	2019-10-04 08:03:52.966489	593	448	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2862	112	110	legal  has accepted your work offer	2019-10-04 08:03:56.750734	2019-10-04 08:03:56.750734	593	448	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2860	110	112	New Task	2019-10-04 08:03:18.687323	2019-10-04 08:03:56.826798	593	448	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2863	110	112	Supervisor2 : Has confirmed your work.	2019-10-04 08:04:07.968408	2019-10-04 08:04:07.968408	593	448	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2864	112	110	New Bid!\n rfg\n Bid: $2589.96	2019-10-04 08:06:48.413723	2019-10-04 08:06:48.413723	594	449	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2865	110	112	Congratulations! legal : Your bid was accepted.	2019-10-04 08:07:33.305194	2019-10-04 08:07:33.305194	594	449	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2867	110	112	Back Charge	2019-10-04 08:08:23.776784	2019-10-04 08:08:23.776784	594	449	t	f	\N	f	\N	\N	\N	\N	back_charge	354	2	1223	Back Charge	confirmed	2589	2589.96
2866	110	112	Please confirm the Change Order	2019-10-04 08:08:07.530403	2019-10-04 08:09:50.503892	594	449	t	f	\N	f	\N	\N	\N	\N	change_order	353	1 из админки	4125	Change Order	confirmed	2589	2589.96
1901	83	82	hi	2019-02-14 20:04:22.766215	2019-02-14 20:04:22.766215	345	232	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2868	112	110	Budget has changed	2019-10-04 08:09:50.508361	2019-10-04 08:09:50.508361	594	449	t	f	\N	f	\N	\N	\N	\N	accept_line	353	1 из админки	4125	Change Order	confirmed	2589	2589.96
2870	112	110	legal  has accepted your work offer	2019-10-04 08:12:50.241844	2019-10-04 08:12:50.241844	595	450	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2869	110	112	New Task	2019-10-04 08:11:39.012868	2019-10-04 08:12:55.294431	595	450	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2871	110	112	Supervisor2 : Has confirmed your work.	2019-10-04 08:13:21.709147	2019-10-04 08:13:21.709147	595	450	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2872	110	112	 You ‘ve been raited!	2019-10-04 08:13:32.206255	2019-10-04 08:13:32.206255	595	450	t	t	5	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2873	110	112	Supervisor2 : Has confirmed your work.	2019-10-04 08:13:49.666895	2019-10-04 08:13:49.666895	594	449	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2874	110	112	 You ‘ve been raited!	2019-10-04 08:13:52.616875	2019-10-04 08:13:52.616875	594	449	t	t	5	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2892	110	112	New Task	2019-10-06 20:35:40.258074	2019-10-06 20:35:40.258074	602	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2893	112	110	legal  has accepted your work offer	2019-10-06 20:36:13.233802	2019-10-06 20:36:13.233802	602	457	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2894	110	112	Supervisor2 : Has confirmed your work.	2019-10-06 20:36:40.954057	2019-10-06 20:36:40.954057	602	457	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1928	83	82	hi	2019-02-17 18:13:14.884147	2019-02-17 18:13:14.884147	345	232	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2623	109	110	Donna  has accepted your work offer	2019-08-12 17:11:15.129865	2019-08-12 17:11:15.129865	532	390	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1941	82	83	hi	2019-02-17 19:43:35.239259	2019-02-17 19:43:35.239259	345	232	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2624	109	110	Donna  has accepted your work offer	2019-08-12 17:11:18.956079	2019-08-12 17:11:18.956079	532	390	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2625	109	110	Donna  — completed your task, please confirm	2019-08-12 17:11:33.789823	2019-08-12 17:11:33.789823	532	390	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2626	109	110	New Bid!\n .\n Bid: $300.0	2019-08-12 17:11:54.441902	2019-08-12 17:11:54.441902	533	391	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2627	110	109	Congratulations! Donna : Your bid was accepted.	2019-08-12 17:12:46.371339	2019-08-12 17:12:46.371339	533	391	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2628	110	109	Supervisor2 : Has confirmed your work.	2019-08-12 17:13:07.080252	2019-08-12 17:13:07.080252	533	391	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2629	110	109	 You ‘ve been raited!	2019-08-12 17:13:09.582469	2019-08-12 17:13:09.582469	533	391	t	t	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2686	110	109	New Task	2019-08-17 20:20:02.59464	2019-08-17 20:20:02.59464	556	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2733	82	109	Please confirm the Change Order	2019-08-21 19:16:28.573128	2019-08-21 19:16:28.573128	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	339	151.99 мрн	151	Change Order	new	100	100.0
1952	\N	83	mm : Has confirmed your work.	2019-02-20 22:03:02.190494	2019-02-20 22:03:02.190494	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2769	110	112	New Task	2019-09-04 15:54:46.994606	2019-09-04 15:56:15.03314	566	422	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2770	112	110	legal  has accepted your work offer	2019-09-04 15:56:14.194335	2019-09-04 15:56:15.035736	566	422	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2771	112	110	legal  has accepted your work offer	2019-09-04 15:57:11.043511	2019-09-04 15:59:47.013722	566	422	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1958	83	82	New Bid! mmm : 250. Bid: $250	2019-02-21 18:42:02.449503	2019-02-21 18:42:02.449503	345	232	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1959	83	82	\N	2019-02-21 18:48:01.954619	2019-02-21 18:48:01.954619	345	232	f	f	\N	f	freeBe20190210_201138.jpg	image/jpeg	2327432	2019-02-21 18:48:01.938638	\N	\N	\N	\N	\N	\N	\N	\N
1960	83	82	\N	2019-02-21 18:48:29.315568	2019-02-21 18:48:29.315568	345	232	f	f	\N	f	freeBe20190210_201130.jpg	image/jpeg	2327432	2019-02-21 18:48:29.300684	\N	\N	\N	\N	\N	\N	\N	\N
2772	112	110	legal  — completed your task, please confirm	2019-09-04 16:00:12.854156	2019-09-04 16:00:13.74022	566	422	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2773	110	112	New Task	2019-09-04 16:01:39.237196	2019-09-04 16:02:05.728734	567	423	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2774	112	110	legal  has accepted your work offer	2019-09-04 16:02:05.146112	2019-09-04 16:02:05.730214	567	423	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2775	112	110	New Bid!\n \n Bid: $1236.69	2019-09-04 16:08:18.720408	2019-09-04 16:08:18.720408	568	424	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2801	110	112	Supervisor2 : Has confirmed your work.	2019-09-09 12:03:17.126223	2019-09-09 12:03:17.126223	575	430	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2802	110	112	 You ‘ve been raited!	2019-09-09 12:03:26.144526	2019-09-09 12:03:26.144526	575	430	t	t	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2835	112	113	legal  has accepted your work offer	2019-09-25 20:07:26.995591	2019-09-25 20:07:26.995591	587	442	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2834	113	112	New Task	2019-09-25 20:06:49.464859	2019-09-25 20:07:27.76386	587	442	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2837	112	113	legal  — completed your task, please confirm	2019-09-25 20:07:32.700997	2019-09-25 20:07:32.700997	587	442	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2838	113	112	Supervisor5 : Has confirmed your work.	2019-09-25 20:08:24.753707	2019-09-25 20:08:24.753707	587	442	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2875	113	112	New Task	2019-10-04 09:08:39.36876	2019-10-04 09:08:39.36876	596	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1985	\N	82	mmm  — completed your task, please confirm	2019-02-21 22:55:27.978776	2019-02-21 22:55:27.978776	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1988	\N	83	mm : Has confirmed your work.	2019-02-21 22:57:16.897384	2019-02-21 22:57:16.897384	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2007	\N	85	Admin Astra: Has confirmed your work.	2019-02-22 14:31:03.900372	2019-02-22 14:31:03.900372	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2570	109	110	New Bid!\n app.\n Bid: $3000	2019-07-19 20:18:03.41849	2019-07-19 20:18:03.41849	502	364	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2571	110	109	Congratulations! Donna : Your bid was accepted.	2019-07-19 20:20:00.439716	2019-07-19 20:20:00.439716	502	364	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2573	109	110	Donna  has accepted your work offer	2019-07-19 20:27:03.756988	2019-07-19 20:27:03.756988	503	365	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2572	110	109	New Task	2019-07-19 20:25:34.039887	2019-07-19 20:27:04.631008	503	365	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2630	110	112	New Task	2019-08-13 08:24:13.009899	2019-08-13 08:24:13.009899	534	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2014	\N	85	Admin Astra: Has confirmed your work.	2019-02-22 15:45:49.240408	2019-02-22 15:45:49.240408	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2631	112	110	legal  has accepted your work offer	2019-08-13 08:29:00.014042	2019-08-13 08:29:00.014042	534	392	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2633	110	112	Back Charge	2019-08-13 08:30:49.548005	2019-08-13 08:30:49.548005	534	392	t	f	\N	f	\N	\N	\N	\N	back_charge	317	2	20	Back Charge	confirmed	1000	1000.55
2632	110	112	Please confirm the Change Order	2019-08-13 08:30:36.795317	2019-08-13 08:32:23.725054	534	392	t	f	\N	f	\N	\N	\N	\N	change_order	316	1 из админки	500	Change Order	confirmed	1000	1000.55
2634	112	110	Budget has changed	2019-08-13 08:32:23.735594	2019-08-13 08:32:23.735594	534	392	t	f	\N	f	\N	\N	\N	\N	accept_line	316	1 из админки	500	Change Order	confirmed	1000	1000.55
2635	110	112	Supervisor2 : Has confirmed your work.	2019-08-13 08:35:48.985481	2019-08-13 08:35:48.985481	534	392	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2736	82	109	Please confirm the Change Order	2019-08-21 19:21:28.206009	2019-08-21 19:21:28.206009	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	342	12.01 должно	12	Change Order	new	100	100.0
2776	110	112	Congratulations! legal : Your bid was accepted.	2019-09-04 16:08:48.263897	2019-09-04 16:08:48.263897	568	424	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2777	110	112	Supervisor2 : Has confirmed your work.	2019-09-04 16:09:46.59705	2019-09-04 16:09:46.59705	568	424	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2803	110	112	New Task	2019-09-10 19:35:03.332085	2019-09-10 19:35:03.332085	576	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2804	112	110	legal  has accepted your work offer	2019-09-10 19:35:58.042371	2019-09-10 19:35:58.042371	576	432	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2805	110	112	Supervisor2 : Has confirmed your work.	2019-09-10 19:36:23.23311	2019-09-10 19:36:23.23311	576	432	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2836	112	113	legal  has accepted your work offer	2019-09-25 20:07:29.259638	2019-09-25 20:07:29.259638	587	442	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2877	112	110	New Bid!\n 34\n Bid: $4589.99	2019-10-04 11:57:33.202244	2019-10-04 11:57:33.202244	598	453	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2878	112	110	legal  — completed your task, please confirm	2019-10-04 12:01:00.290644	2019-10-04 12:01:00.290644	597	452	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2876	110	112	New Task	2019-10-04 11:55:34.850274	2019-10-04 12:01:00.865822	597	452	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2032	\N	82	mmm  — completed your task, please confirm	2019-02-22 22:41:33.168144	2019-02-22 22:41:33.168144	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2039	\N	83	Admin Astra: Has confirmed your work.	2019-02-22 23:13:16.103531	2019-02-22 23:13:16.103531	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2043	83	82	New Bid! mmm : hi hello. Bid: $150	2019-02-23 08:38:49.649121	2019-02-23 08:38:49.649121	345	232	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2060	\N	85	Admin Astra: Has confirmed your work.	2019-02-24 20:47:49.854582	2019-02-24 20:47:49.854582	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2065	\N	85	Admin Astra: Has confirmed your work.	2019-02-24 20:51:45.564763	2019-02-24 20:51:45.564763	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2073	\N	85	Admin Astra: Has confirmed your work.	2019-02-24 21:07:16.874553	2019-02-24 21:07:16.874553	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2574	110	109	Supervisor2 : Has confirmed your work.	2019-07-19 20:30:40.825218	2019-07-19 20:30:40.825218	503	365	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2576	109	110	Donna  has accepted your work offer	2019-07-19 20:33:39.834212	2019-07-19 20:33:39.834212	504	366	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2577	109	110	Donna  has accepted your work offer	2019-07-19 20:33:42.336034	2019-07-19 20:33:42.336034	504	366	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2575	110	109	New Task	2019-07-19 20:33:24.759186	2019-07-19 20:33:42.39222	504	366	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2578	110	109	New Task	2019-07-19 20:49:31.984324	2019-07-19 20:49:31.984324	506	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2579	109	110	Donna  has accepted your work offer	2019-07-19 20:51:37.174434	2019-07-19 20:51:37.174434	506	367	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2580	110	109	New Task	2019-07-19 20:54:02.126538	2019-07-19 20:54:02.126538	507	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2581	109	110	Donna  has accepted your work offer	2019-07-19 20:54:18.59582	2019-07-19 20:54:18.59582	507	368	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2582	109	110	New Bid!\n app.\n Bid: $3000	2019-07-19 20:55:24.388636	2019-07-19 20:55:24.388636	505	369	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2583	110	109	Congratulations! Donna : Your bid was accepted.	2019-07-19 20:56:07.189198	2019-07-19 20:56:07.189198	505	369	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2584	110	109	Supervisor2 : Has confirmed your work.	2019-07-19 20:58:42.548616	2019-07-19 20:58:42.548616	505	369	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2088	\N	83	Admin Astra: Has confirmed your work.	2019-02-24 22:15:05.938073	2019-02-24 22:15:05.938073	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2636	110	112	New Task	2019-08-13 11:38:15.971536	2019-08-13 11:38:15.971536	535	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2737	82	109	Please confirm the Change Order	2019-08-21 19:27:52.377959	2019-08-21 19:27:52.377959	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	343	01.01 тест	1	Change Order	new	100	100.0
2738	82	109	Please confirm the Change Order	2019-08-21 19:28:09.018871	2019-08-21 19:28:09.018871	336	413	t	f	\N	f	\N	\N	\N	\N	change_order	344	01.01 тест	1	Change Order	new	100	100.0
2778	110	112	 You ‘ve been raited!	2019-09-04 16:19:38.43982	2019-09-04 16:19:38.43982	568	424	t	t	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2806	110	112	New Task	2019-09-11 09:22:38.696411	2019-09-11 09:22:38.696411	577	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2807	112	110	legal  has accepted your work offer	2019-09-11 09:25:12.162083	2019-09-11 09:25:12.162083	577	433	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2808	110	112	Supervisor2 : Has confirmed your work.	2019-09-11 09:25:45.689383	2019-09-11 09:25:45.689383	577	433	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2840	112	113	legal  has accepted your work offer	2019-09-25 20:26:06.797156	2019-09-25 20:26:06.797156	588	443	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2839	113	112	New Task	2019-09-25 20:25:47.887867	2019-09-25 20:26:07.527831	588	443	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2841	112	113	legal  — completed your task, please confirm	2019-09-25 20:26:12.581702	2019-09-25 20:26:12.581702	588	443	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2842	113	112	Supervisor5 : Has confirmed your work.	2019-09-25 20:26:26.235588	2019-09-25 20:26:26.235588	588	443	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2120	\N	85	Admin Astra: Has confirmed your work.	2019-02-25 21:29:35.958683	2019-02-25 21:29:35.958683	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2586	111	110	Garry dfdffd  has accepted your work offer	2019-07-20 08:34:15.944773	2019-07-20 08:34:15.944773	508	370	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2585	110	111	New Task	2019-07-20 08:29:31.768193	2019-07-20 08:34:17.416334	508	370	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2637	109	110	New Bid!\n .\n Bid: $200.0	2019-08-13 11:40:02.893013	2019-08-13 11:40:02.893013	536	394	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2145	\N	85	Admin Astra: Has confirmed your work.	2019-02-26 10:53:23.722837	2019-02-26 10:53:23.722837	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2638	109	110	Donna  has accepted your work offer	2019-08-13 11:42:28.81807	2019-08-13 11:42:28.81807	535	393	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2640	110	109	Congratulations! Donna : Your bid was accepted.	2019-08-13 11:45:17.690212	2019-08-13 11:45:17.690212	536	394	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2641	110	109	Supervisor2 : Has confirmed your work.	2019-08-13 11:45:34.981015	2019-08-13 11:45:34.981015	535	393	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2642	110	109	Supervisor2 : Has confirmed your work.	2019-08-13 11:46:12.634192	2019-08-13 11:46:12.634192	536	394	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2643	110	109	 You ‘ve been raited!	2019-08-13 11:46:14.712402	2019-08-13 11:46:14.712402	536	394	t	t	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2739	112	110	New Bid!\n description \n Bid: $369.96	2019-08-22 08:39:41.451721	2019-08-22 08:39:41.451721	557	414	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2740	110	112	Congratulations! legal : Your bid was accepted.	2019-08-22 08:45:33.163067	2019-08-22 08:45:33.163067	557	414	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2780	112	110	legal  has accepted your work offer	2019-09-04 17:51:06.064794	2019-09-04 17:51:06.064794	569	425	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2779	110	112	New Task	2019-09-04 17:50:29.737537	2019-09-04 17:51:06.762357	569	425	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2781	112	110	legal  — completed your task, please confirm	2019-09-04 17:52:19.965599	2019-09-04 17:52:19.965599	569	425	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2782	110	112	Supervisor2 : Has confirmed your work.	2019-09-04 17:52:48.025629	2019-09-04 17:52:48.025629	569	425	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2159	\N	85	Admin Astra: Has confirmed your work.	2019-02-26 16:17:00.325045	2019-02-26 16:17:00.325045	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2783	110	112	New Task	2019-09-04 18:05:03.338897	2019-09-04 18:05:03.338897	570	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2784	112	110	legal  has accepted your work offer	2019-09-04 18:06:40.666346	2019-09-04 18:06:40.666346	570	426	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2785	112	110	New Bid!\n \n Bid: $2589.69	2019-09-04 18:07:57.751511	2019-09-04 18:07:57.751511	571	427	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2786	110	112	Congratulations! legal : Your bid was accepted.	2019-09-04 18:08:22.398672	2019-09-04 18:08:22.398672	571	427	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2809	110	112	New Task	2019-09-12 06:42:17.178654	2019-09-12 06:42:17.178654	579	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2844	112	113	legal  has accepted your work offer	2019-09-25 21:23:12.058939	2019-09-25 21:23:12.058939	589	444	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2166	\N	83	Admin Astra: Has confirmed your work.	2019-02-26 19:34:27.982168	2019-02-26 19:34:27.982168	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2843	113	112	New Task	2019-09-25 21:22:57.784662	2019-09-25 21:23:13.246645	589	444	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2845	112	113	legal  — completed your task, please confirm	2019-09-25 21:23:21.990474	2019-09-25 21:23:21.990474	589	444	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2846	113	112	Supervisor5 : Has confirmed your work.	2019-09-25 21:23:32.930418	2019-09-25 21:23:32.930418	589	444	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2183	\N	83	Admin Astra: Has confirmed your work.	2019-02-27 13:45:32.64937	2019-02-27 13:45:32.64937	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2195	\N	85	Admin Astra: Has confirmed your work.	2019-02-27 17:24:30.558478	2019-02-27 17:24:30.558478	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2197	\N	85	Admin Astra: Has confirmed your work.	2019-02-27 17:30:21.723692	2019-02-27 17:30:21.723692	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2587	110	111	Please confirm the Change Order	2019-07-20 08:46:40.703432	2019-07-20 08:46:40.703432	508	370	t	f	\N	f	\N	\N	\N	\N	change_order	313	ghfghfjhggk	21212	Change Order	new	3232401	3232401.0
2639	109	110	Donna  has accepted your work offer	2019-08-13 11:42:31.031867	2019-08-13 11:42:31.031867	535	393	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2741	110	112	Please confirm the Change Order	2019-08-28 20:52:01.846918	2019-08-28 20:52:01.846918	557	414	t	f	\N	f	\N	\N	\N	\N	change_order	345	1	2589	Change Order	new	369	369.96
2742	110	112	Back Charge	2019-08-28 20:52:15.301988	2019-08-28 20:52:15.301988	557	414	t	f	\N	f	\N	\N	\N	\N	back_charge	346	2	3698	Back Charge	confirmed	369	369.96
2810	113	112	New Task	2019-09-12 07:02:45.412872	2019-09-12 07:02:45.412872	580	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2811	112	110	legal  has accepted your work offer	2019-09-12 07:04:29.853254	2019-09-12 07:04:29.853254	579	434	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2211	\N	83	Admin Astra: Has confirmed your work.	2019-02-27 19:44:47.278044	2019-02-27 19:44:47.278044	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2812	112	113	legal  has accepted your work offer	2019-09-12 07:05:29.148875	2019-09-12 07:05:29.148875	580	435	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2813	113	112	Supervisor5 : Has confirmed your work.	2019-09-12 07:05:49.588069	2019-09-12 07:05:49.588069	580	435	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2814	110	112	Supervisor2 : Has confirmed your work.	2019-09-12 07:06:23.77009	2019-09-12 07:06:23.77009	579	434	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2847	110	112	New Task	2019-09-26 21:51:10.055968	2019-09-26 21:51:10.055968	590	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2216	\N	85	Admin Astra: Has confirmed your work.	2019-02-28 07:16:37.634353	2019-02-28 07:16:37.634353	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2848	112	110	legal  has accepted your work offer	2019-09-26 21:51:24.866746	2019-09-26 21:51:24.866746	590	445	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2849	110	112	Supervisor2 : Has confirmed your work.	2019-09-26 21:51:43.950395	2019-09-26 21:51:43.950395	590	445	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2850	110	112	New Task	2019-09-26 21:56:47.153535	2019-09-26 21:56:47.153535	591	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2851	112	110	legal  has accepted your work offer	2019-09-26 21:57:00.814754	2019-09-26 21:57:00.814754	591	446	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2852	110	112	Supervisor2 : Has confirmed your work.	2019-09-26 21:57:28.181208	2019-09-26 21:57:28.181208	591	446	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2236	85	82	New Bid! BenCo : . Bid: $2100	2019-02-28 17:47:52.923549	2019-02-28 17:47:52.923549	405	287	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2247	\N	85	Admin Astra: Has confirmed your work.	2019-02-28 18:16:54.931023	2019-02-28 18:16:54.931023	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2588	110	109	New Task	2019-07-21 19:58:14.505151	2019-07-21 19:58:14.505151	509	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2645	110	109	New Task	2019-08-13 21:28:29.830975	2019-08-13 21:28:29.830975	538	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2646	109	110	Donna  has accepted your work offer	2019-08-13 21:29:00.213019	2019-08-13 21:29:00.213019	538	396	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2648	110	109	Back Charge	2019-08-13 21:30:49.849481	2019-08-13 21:30:49.849481	538	396	t	f	\N	f	\N	\N	\N	\N	back_charge	319	2	20	Back Charge	confirmed	100	100.55
2647	110	109	Please confirm the Change Order	2019-08-13 21:30:39.164756	2019-08-13 21:31:49.177765	538	396	t	f	\N	f	\N	\N	\N	\N	change_order	318	1 из админки	100	Change Order	confirmed	100	100.55
2649	109	110	Budget has changed	2019-08-13 21:31:49.19081	2019-08-13 21:31:49.19081	538	396	t	f	\N	f	\N	\N	\N	\N	accept_line	318	1 из админки	100	Change Order	confirmed	100	100.55
2650	110	109	Supervisor2 : Has confirmed your work.	2019-08-13 21:34:29.697286	2019-08-13 21:34:29.697286	538	396	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2651	109	110	New Bid!\n .\n Bid: $1005.0	2019-08-13 21:37:33.673678	2019-08-13 21:37:33.673678	539	397	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2652	109	110	New Bid!\n .\n Bid: $1000	2019-08-13 21:37:42.481078	2019-08-13 21:37:42.481078	539	397	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2654	110	109	New Task	2019-08-13 21:42:00.674999	2019-08-13 21:42:00.674999	542	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2281	\N	83	Admin Astra: Has confirmed your work.	2019-02-28 20:48:57.578698	2019-02-28 20:48:57.578698	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2655	110	109	Please confirm the Change Order	2019-08-13 21:43:00.361271	2019-08-13 21:43:00.361271	504	366	t	f	\N	f	\N	\N	\N	\N	change_order	320	1 из админки	100	Change Order	new	2000	2000.0
2656	110	109	Back Charge	2019-08-13 21:43:10.049716	2019-08-13 21:43:10.049716	504	366	t	f	\N	f	\N	\N	\N	\N	back_charge	321	1 из админки	20	Back Charge	confirmed	2000	2000.0
2657	110	109	New Task	2019-08-13 21:45:03.799842	2019-08-13 21:45:03.799842	543	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2658	109	110	Donna  has accepted your work offer	2019-08-13 21:45:51.716827	2019-08-13 21:45:51.716827	543	400	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2659	110	109	Please confirm the Change Order	2019-08-13 21:46:32.814105	2019-08-13 21:46:32.814105	543	400	t	f	\N	f	\N	\N	\N	\N	change_order	322	1 из админки	100	Change Order	new	500	500.36
2743	110	112	Supervisor2 : Has confirmed your work.	2019-09-01 20:44:21.586294	2019-09-01 20:44:21.586294	557	414	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2815	113	112	New Task	2019-09-12 12:24:58.059358	2019-09-12 12:24:58.059358	581	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2816	112	113	legal  has accepted your work offer	2019-09-12 12:25:19.846557	2019-09-12 12:25:19.846557	581	436	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2817	113	112	Supervisor5 : Has confirmed your work.	2019-09-12 12:25:44.585196	2019-09-12 12:25:44.585196	581	436	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2744	110	112	New Task	2019-09-02 10:15:42.865503	2019-09-02 10:24:00.781761	559	415	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2745	112	110	legal  has accepted your work offer	2019-09-02 10:18:02.545506	2019-09-02 10:24:00.783428	559	415	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2746	112	110	legal  has accepted your work offer	2019-09-02 10:18:52.90694	2019-09-02 10:24:00.784916	559	415	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2747	112	110	legal  has accepted your work offer	2019-09-02 10:24:32.052456	2019-09-02 10:24:33.905498	559	415	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2348	\N	85	Admin Astra: Has confirmed your work.	2019-02-28 22:33:01.531514	2019-02-28 22:33:01.531514	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2349	85	82	New Bid! BenCo : . Bid: $1000	2019-02-28 22:35:07.589477	2019-02-28 22:35:07.589477	420	300	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2377	\N	83	Admin Astra: Has confirmed your work.	2019-02-28 23:28:04.159486	2019-02-28 23:28:04.159486	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2388	\N	83	Admin Astra: Has confirmed your work.	2019-03-01 15:58:37.391216	2019-03-01 15:58:37.391216	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2396	\N	83	Admin Astra: Has confirmed your work.	2019-03-02 13:27:28.431121	2019-03-02 13:27:28.431121	\N	\N	f	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2592	110	111	New Task	2019-07-22 19:50:56.456077	2019-07-22 19:50:56.456077	514	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2748	112	110	legal  has accepted your work offer	2019-09-02 10:24:33.592211	2019-09-02 10:24:33.910127	559	415	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2749	110	112	New Task	2019-09-02 11:12:19.13129	2019-09-02 11:12:19.13129	561	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2750	112	110	New Bid!\n test\n Bid: $369999.69	2019-09-02 11:13:37.597275	2019-09-02 11:13:37.597275	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2751	112	110	New Bid!\n test\n Bid: $2589.69	2019-09-02 11:13:55.57309	2019-09-02 11:13:55.57309	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2752	110	112	Congratulations! legal : Your bid was accepted.	2019-09-02 11:19:04.712789	2019-09-02 11:19:04.712789	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2753	110	112	Congratulations! legal : Your bid was accepted.	2019-09-02 11:19:18.830388	2019-09-02 11:19:18.830388	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2755	110	112	Congratulations! legal : Your bid was accepted.	2019-09-02 11:20:39.15816	2019-09-02 11:20:39.15816	560	417	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2483	82	83	New Task	2019-03-14 22:55:39.778881	2019-03-14 22:55:39.778881	451	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2484	82	83	New Task	2019-03-14 23:06:25.620479	2019-03-14 23:06:25.620479	452	\N	t	f	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes, previous_refresh_token) FROM stdin;
1	1	1	f75f6be99ed3705d6f952ae547327bd6fe0b716321bba14e00ba05ea02db9136	\N	\N	\N	2018-09-07 10:59:34.227661	\N	
2	1	1	e8c17928f49f63d00edaced210a49521c294e7d00a381f2dcff47188b55b2651	\N	\N	\N	2018-09-10 09:50:06.43739	\N	
3	5	1	e17a2d8e00223ebd923d539ba88a4b027a53be125ed1fff798b78d4c4c727335	\N	\N	\N	2018-09-10 10:39:34.576886	\N	
4	2	1	c962e5ac06a11c7505d5b31128fb2c22d46ce424879f28fac5fb11e573af6c3d	\N	\N	\N	2018-09-10 17:06:03.641567	\N	
5	2	1	c1f9b0d813dff8c209577d0f9c3adf0933d8d3f57800485c03c471e19d115c57	\N	\N	2018-09-11 16:28:18.571852	2018-09-10 17:14:51.322898	\N	
6	2	1	5fd8c26c12ed146c3f1c9dc87ddbcfe674793c1935d729633c930b4ab71ec19c	\N	\N	2018-09-11 16:29:23.58981	2018-09-11 16:28:46.018784	\N	
7	2	1	5c3abc191ac6823faa55103b24b6ab7fb5d0dc1890e94cd455c5f61672f1776d	\N	\N	\N	2018-09-11 16:29:34.478699	\N	
8	1	1	d41eac08d9928c1e1da819d11a123f5e8c7d1bc9662579369af686710386ee4f	\N	\N	\N	2018-09-15 08:50:57.243798	\N	
9	1	1	82ff4c0903112c40ec32b6fb1aca902403c265a48bd8b34ffc9f582ea85fc2c4	\N	\N	\N	2018-09-17 10:52:23.797148	\N	
10	1	1	a2fc839e79d9100bd36e53f6b9aea4e0c8c5caf24da7136974eeb96ba04bc444	\N	\N	\N	2018-09-17 13:50:28.444319	\N	
11	1	1	95dafd8484579cb110d1798424f2baf290c6536483ca16d4cd07f2ed5bfe6278	\N	\N	\N	2018-09-18 21:21:49.82621	\N	
12	1	1	af60d339c33e09fb8456bf57ee7e9ef3a311550dec9050d9f6dfbf319bfddefc	\N	\N	\N	2018-09-18 22:09:26.937249	\N	
13	2	1	bfbc1aea026a4621360542486d11d94a7f104ea187d203dcfb5de8e39fc8b855	\N	\N	2018-09-19 17:01:33.2249	2018-09-19 16:59:08.50839	\N	
14	2	1	44997a4e51110ee26ab1409b7a0749bd3226af792a203adae393effdaa1b23c9	\N	\N	\N	2018-09-19 17:02:12.774712	\N	
15	2	1	95e2ef5daf4aa6b7c9a23d4a60fce93731ff97a7952db9b72bbd788e0978626a	\N	\N	\N	2018-09-19 17:27:45.048175	\N	
16	2	1	6e10b9cc49b5c6257a7c51bf8d91c2b14a5c6dde0ffcd3de62262b75a055f872	\N	\N	2018-09-20 04:11:04.057571	2018-09-20 04:10:37.236919	\N	
18	2	1	28b979995206d7cc1f5a48497a76d8cc2abacf788a36c325e5523793b8697b80	\N	\N	\N	2018-09-20 11:00:18.593624	\N	
19	9	1	7baabb2b9862a61f0d4fdacc28b4b865dba5cf247321fb7330e0322381897ea9	\N	\N	\N	2018-09-21 07:52:03.3887	\N	
20	9	1	3aa3ee11015f5e277250c428beb74e874d900b39b61752ddc2705c1c7988b761	\N	\N	2018-09-21 07:52:21.993567	2018-09-21 07:52:13.529992	\N	
21	9	1	def2dacdef88a2c5da4be312dfc16171a4967c246226bc17e824f7e25b77660b	\N	\N	2018-09-21 07:53:48.849311	2018-09-21 07:52:34.816504	\N	
22	10	1	6d36b0e469903c3038e0c916efce5cc685605c8b17522de5fc7b0dd4bd337d39	\N	\N	\N	2018-09-21 07:54:41.046494	\N	
24	11	1	63b2e2c001d2c68df83d0aeb32721f4b6d32bf5ef6bb5ca503f10e9eddaa801a	\N	\N	\N	2018-09-21 08:08:16.757433	\N	
25	13	1	122e2380ce97c868178e4c1e17c6f20c85339b6d5b5ac95622f9e77c6c1ecc89	\N	\N	\N	2018-09-21 10:57:44.622859	\N	
26	12	1	df97301b3d2cfa8d00b273000e2e516b7a0137187dc89f53fba9131c057704f3	\N	\N	2018-09-21 18:44:08.853356	2018-09-21 11:12:01.678521	\N	
27	12	1	36257b8f1d139c26a8a7f0c94b96cb9cab366d4c4444c8338714d6da7e0c4b8a	\N	\N	2018-09-21 18:55:13.946968	2018-09-21 18:44:17.236916	\N	
29	12	1	981ce4eea3c25b0b0d0840256aac7f5b1326d34c175777934ae22cdbf0544d32	\N	\N	2018-09-21 19:18:45.898539	2018-09-21 18:55:39.858469	\N	
30	12	1	5642642841e420878ca6807f50f2bf0ee51839db23db2ade989f4bbf3abc53b9	\N	\N	2018-09-21 19:27:58.488324	2018-09-21 19:19:21.710092	\N	
31	12	1	37db6212a50713b5eaedcd993abeb4b0b43b4a8ba8469fd19da89ef9e1181e10	\N	\N	2018-09-21 20:27:50.127177	2018-09-21 19:28:14.446138	\N	
32	12	1	e7b85a9c6c3ec5897fd389cf1c2030aa2e4e120ced63e14bcead822bb1f29218	\N	\N	2018-09-21 20:29:20.291048	2018-09-21 20:28:04.468417	\N	
33	12	1	db53727eb1ef536522dfefab3a988e79dcaf68e07504be06e3b41c3a2aae476a	\N	\N	\N	2018-09-21 20:30:11.843624	\N	
28	13	1	b614543e862ccb1214ad7a9278a75a26b878943b9e4b3c25bc2cb573fac6bacd	\N	\N	2018-09-21 22:21:29.447216	2018-09-21 18:45:58.760962	\N	
34	13	1	7e811a9e661f713c50709a02fcf384dd2997ed79ed7662fcda203fb9ad8e600a	\N	\N	2018-09-21 22:33:44.353611	2018-09-21 22:21:58.946923	\N	
36	13	1	1071d1d52544f36b33ab8d5cc33ba4b4ce1c69bdd50543a659b8bc0d55b82ceb	\N	\N	2018-09-23 22:24:27.171041	2018-09-23 22:05:27.242697	\N	
37	14	1	fc5f2e049e87960a72ea149b981ee88dc22ee321f27771791505921909f64178	\N	\N	2018-09-23 22:25:13.128249	2018-09-23 22:25:02.447394	\N	
39	15	1	cb23075432285fc45f045c73f4cc9fb62ca6e2e895a2e63230316a80a6f9e661	\N	\N	\N	2018-09-24 11:28:06.257164	\N	
35	12	1	25e31e355a687b2a2f46f1a74a460083426b512b42302cd8ec88b0a00d571e05	\N	\N	2018-09-24 18:31:05.991966	2018-09-22 07:53:05.241515	\N	
38	14	1	d6afbefbf019ad07fad895961d19de554cc078d0ade7378c05486928fae54fdf	\N	\N	2018-09-24 18:40:01.206624	2018-09-23 22:25:43.315977	\N	
41	12	1	877be647241b33830ab8f2ad60a5f35250af2650a3a4348e7ffaa23e2f02e320	\N	\N	2018-09-24 20:00:02.062173	2018-09-24 18:31:51.819123	\N	
43	12	1	f47c94f8c6544414feaa5dca74372f3bb1592613b34edfce3e32aa10eefad070	\N	\N	2018-09-24 20:43:07.360557	2018-09-24 20:00:24.804582	\N	
42	13	1	95918e0e77bfed4c6219f005e5370c6860a040b9838ad2e7441a3dce32421ed0	\N	\N	2018-09-24 20:53:15.49922	2018-09-24 18:40:26.106216	\N	
45	13	1	eb4f5f242feca504960554c89ad603cbead271266f643bd1331f5c768b987f1c	\N	\N	2018-09-24 20:56:50.287759	2018-09-24 20:53:54.519334	\N	
17	2	1	9a8b475551a4fcd6eaa7a860fd1b908fbb389a040a812d6d4fffaaea7f7694c4	\N	\N	2018-09-25 03:40:46.511565	2018-09-20 04:11:16.622569	\N	
47	17	1	2f7c33b69824f58acc805939c2804887f22a440131e717b6887859c76f1fe400	\N	\N	2018-09-25 03:45:47.864523	2018-09-25 03:41:56.379383	\N	
48	17	1	f41f557fd21ff44f79e812df37434362fed7232475deba6a86ca542d09795607	\N	\N	2018-09-25 04:03:51.083083	2018-09-25 03:45:56.506356	\N	
49	17	1	e7f2eda2957c02685ebd630f80a057acce9c0f071851589ab756180341342121	\N	\N	2018-09-25 04:06:53.981391	2018-09-25 04:04:10.186263	\N	
44	12	1	4d5fb0a231e7ef7bfb07250fa629a90c96f1fdee4c455ea31e21f388cd5b5af1	\N	\N	2018-09-25 04:56:19.304307	2018-09-24 20:43:17.351949	\N	
46	13	1	122c9bc03ee0585d05e505661fea75ca4f1c1474c33b32e11d09d461b4f84f9a	\N	\N	2018-09-25 11:52:16.820241	2018-09-24 20:57:31.333437	\N	
52	13	1	7aa3a95278f692f3f073dd23f7fc379b5133e128b1f0e172618b63cc6302c6d2	\N	\N	\N	2018-09-25 11:53:07.190507	\N	
51	12	1	69da3da643aad1ba11a7ab4f4885115d2b7366d9f4bdcafeed6f3662e8b903ea	\N	\N	2018-09-25 12:02:42.864283	2018-09-25 04:56:34.105459	\N	
23	10	1	8e531a9f0577051bfde706ffa85b0fe30a2e78eb853a744cd86cd0a36d4f980e	\N	\N	2018-09-25 13:33:45.196532	2018-09-21 07:54:53.141014	\N	
50	17	1	808dd12d746678be129ef45ea1a779fbf4be42d7e8f06195a5b1702534404369	\N	\N	2018-09-25 16:21:48.929542	2018-09-25 04:07:01.66906	\N	
54	17	1	5cab25920c493b7e788b2c8aecb3de915b51536d2ee1d7869a545ea680563713	\N	\N	2018-09-25 16:22:21.058818	2018-09-25 13:33:56.045551	\N	
56	18	1	ecf1b4f2d3fd35f59c9d83076ac286b914e90fdc61c860af35adc5236a162432	\N	\N	\N	2018-09-25 16:22:43.908675	\N	
57	18	1	db1a9d32d984ac3add37e0290b43b83644edf4c3c5fa8a3a668a668653123472	\N	\N	2018-09-25 16:34:59.581248	2018-09-25 16:22:52.492167	\N	
53	12	1	9acd0a4322d694a7624f8ca6a9d8d9337c0b0d5d54c81937463f6c5962bc1adb	\N	\N	2018-09-25 19:47:03.633425	2018-09-25 12:02:50.614681	\N	
55	17	1	2abdc6d186e37bba2ac5a46e7323defa939e0b3d0bd0823a6a6c3b9485d3a155	\N	\N	2018-09-26 16:24:08.054714	2018-09-25 16:22:10.540592	\N	
40	13	1	56a283216c23c22e2776f2388fc8fb98c8675417383e4582281cff4b9c317b8e	\N	\N	2018-09-26 19:32:19.367293	2018-09-24 18:29:22.584091	\N	
58	17	1	e3ed177fe8ef8f445f76578628dc731f77d0155536506065b3e2ab6b42efdee6	\N	\N	2018-09-25 16:35:58.441014	2018-09-25 16:35:07.767443	\N	
59	18	1	0be795ab83abf1b6d84d8561fc1b89cf95954a74ba1fe89f8d6b4982e9fde583	\N	\N	2018-09-25 16:36:55.776369	2018-09-25 16:36:18.918509	\N	
60	18	1	a5ae3f3d8391b6f2b634f5b0e82642a62cf44d143786cb97196222d810010fe0	\N	\N	2018-09-25 17:14:12.511916	2018-09-25 16:37:12.708496	\N	
61	17	1	7cb71a26ccd4dce3a88154ca002802510db198faf9ba7d18c69e24c6fe4c7103	\N	\N	2018-09-25 17:19:13.839908	2018-09-25 17:14:26.128058	\N	
62	18	1	5c86e0adb4fb990da8888516754008dd6fa168eb70b750485afe7d6c8f7f905a	\N	\N	2018-09-25 17:28:56.504574	2018-09-25 17:19:29.165341	\N	
63	17	1	f72ca2fda055dc423912b18f6ed6c043c5ab78aa7d0810d864c0e2473776e346	\N	\N	2018-09-25 17:34:36.31185	2018-09-25 17:29:11.080639	\N	
64	18	1	f3b08089a2562e2e6b27454a0aa27444b428e46e5701ee14036d38ca1a1598ce	\N	\N	2018-09-25 17:49:21.383481	2018-09-25 17:34:52.651026	\N	
65	17	1	05591d244c573fbd2f90274b4e8a3c254b4b5f684968121e0215096adc0ebbd4	\N	\N	2018-09-25 17:51:45.995875	2018-09-25 17:49:34.846933	\N	
66	18	1	1b0d4220f0e3432700e055ae9dfaf2888008e6945f3645b0be945f9e8189c5e9	\N	\N	\N	2018-09-25 17:51:57.607845	\N	
68	12	1	6edeee245fa3aa641d2393db15706fd390d3f2d8f9b3e2d1bab7e402488f438d	\N	\N	2018-09-25 19:48:02.433753	2018-09-25 19:47:16.068661	\N	
67	18	1	5860a728d870d46b31ea69bfdf30a14831a3444ca5709eb00b5e45e22358a6f8	\N	\N	2018-09-26 16:25:51.488911	2018-09-25 19:07:37.981009	\N	
70	17	1	70bbb7613319e3330343199b2e27292c1618d0a333b4d6aa0660f7ecc20d55fe	\N	\N	2018-09-26 17:00:52.651658	2018-09-26 16:24:32.302632	\N	
72	17	1	b40afecef2321aca1b62ce25f32e75c27c15ad6f930a7113da04c19d4d33cbac	\N	\N	\N	2018-09-26 17:08:03.192682	\N	
71	18	1	423c5257e57a4e5a538c68850b53575d04f08a3aa0ff627c349dc028eb687822	\N	\N	2018-09-26 17:59:13.291218	2018-09-26 16:26:04.323694	\N	
74	13	1	713c641f7a5703fa72b71c03c6c5e45ffd668f3a73d654c92a975470d843f15a	\N	\N	\N	2018-09-26 18:55:23.763748	\N	
73	17	1	44af855ea312dfb2aabe567a22fe958dd65f650bd375fe44ffe455af3657a5ff	\N	\N	2018-09-26 19:26:23.263704	2018-09-26 17:59:28.176856	\N	
75	18	1	ad0d3c98de84cf1f4372f10f6310e65a10697cf720f890bbdde9c885444cf4e9	\N	\N	2018-09-26 19:29:03.986754	2018-09-26 19:26:44.851473	\N	
76	17	1	f6f34a902b4a73ded1ac013715384e76767d99edf147a4f771c00a8a86f66be9	\N	\N	2018-09-26 19:29:30.215459	2018-09-26 19:27:45.033339	\N	
79	14	1	b924c800918e3a33b98210e9c55153091c41f8a8bc972fbae370c0629739bc45	\N	\N	\N	2018-09-26 19:32:40.749928	\N	
78	17	1	bb2f7d96223fd9c631cdd3ec67974944b96a0b78129110e3986ae09f11163e51	\N	\N	2018-09-26 19:49:31.458319	2018-09-26 19:30:14.01629	\N	
69	12	1	cf9b1b0eacaaa0ae9109e74ca44ea0747257df02457df955353a32223b875631	\N	\N	2018-09-27 10:40:15.278841	2018-09-25 19:48:09.472523	\N	
81	12	1	a52fe15099d443d5a1fd88ba484a60c4883484526c9b91456a35c966ef2d5d22	\N	\N	2018-09-27 19:08:29.954697	2018-09-27 10:40:21.94705	\N	
80	13	1	f1dbf65b5b56f3f656ac7dbdd5489343ee49161ea9e67342cdf18fb437be614a	\N	\N	2018-09-27 20:35:07.570306	2018-09-27 10:37:10.111948	\N	
83	13	1	dc6e34bfc529c166a67444377900a42232b0f7e83f361972e36d05761e87bc92	\N	\N	\N	2018-09-27 20:35:37.651041	\N	
84	17	1	5f1267a9c2569669dd82482c0ec23b06a18164b9100273fe223864f028dcfb0e	\N	\N	2018-09-28 19:37:30.759703	2018-09-28 18:53:10.551764	\N	
77	18	1	b3bb61408a9075ea45c5c2ba7fdfd572f47ba789ab02141753a220eea6106d09	\N	\N	2018-09-28 19:50:35.403354	2018-09-26 19:29:19.614238	\N	
82	12	1	0272c3dda8607a0125e7dec6e3471789170663250d224267b6614a94daf8aaa6	\N	\N	2018-09-28 20:59:20.401989	2018-09-27 19:08:36.5084	\N	
88	13	1	bb781103fdc1812e81872f8d26976670043acc21cbd18130bb523565ea3de4ca	\N	\N	\N	2018-09-28 21:01:35.728039	\N	
87	12	1	4cd422956e42d83a9eae367fb20bee4a96eaf56f92182320490cae3b67bc7a82	\N	\N	2018-09-28 21:10:03.804424	2018-09-28 20:59:27.384733	\N	
89	12	1	8328f59ca5e2240a9269942e9b0cf0c45ba74bc288ded06e3100be8c48fc7368	\N	\N	2018-09-28 21:15:23.35033	2018-09-28 21:10:10.369864	\N	
86	17	1	3bd70036e14b9340e9f0211a454ad5f1a7040877eb47ba9eb55001af3827e006	\N	\N	2018-09-28 21:24:19.045061	2018-09-28 19:50:49.475491	\N	
91	13	1	3d6393ba4db06d1a1abcf7b6adcf9e1a93d8ef467fba0377a0454daba50f3cec	\N	\N	\N	2018-09-28 21:25:22.535864	\N	
92	19	1	aaacbdf92ebae6b0c52e82d9d4f339a4bc7f565a338110df9b5c3fb06a30b2da	\N	\N	2018-09-29 14:36:10.551682	2018-09-29 13:33:50.426179	\N	
93	19	1	9143077da8a1475653537e2fbaee0b29454f1832083049732fcb8c954c00cbb4	\N	\N	2018-09-29 14:39:30.93077	2018-09-29 14:38:35.424579	\N	
95	19	1	5411ff0ceee5c4a4c9355925f8cce92faf4eb7b937010beacc843a7e1a76446c	\N	\N	2018-09-29 14:43:55.859177	2018-09-29 14:41:05.831078	\N	
96	13	1	91796eaead606dfde7f668f648d8617b80c6242d7775821806c53cd14b2079ac	\N	\N	\N	2018-09-29 14:44:20.747482	\N	
85	18	1	3bf819b58f0a8137c77590ab93896129426419935a93a01b4376089b0b7a4115	\N	\N	2018-09-30 13:53:32.621456	2018-09-28 19:37:42.734239	\N	
98	17	1	80b37f50cd52ab8cc3127c8b15dbd5457e8d01614faa28ee11fe4ef4db37710a	\N	\N	\N	2018-09-30 15:37:18.243899	\N	
99	17	1	56402a6f343cbb7ab35dc59a2a54957c105a2f223c700f7418cbc81081366654	\N	\N	2018-09-30 15:42:38.024617	2018-09-30 15:39:44.149217	\N	
100	17	1	a01adf44c18227e36414cf6639f91720da4992be9a21cf2ccb1cc9f724ebcb29	\N	\N	\N	2018-09-30 15:44:15.74806	\N	
101	17	1	2eebe8aeb8c101aabaa1a15ba8ecb294aa49c10ee5fad225ce2e813209f8730a	\N	\N	\N	2018-09-30 16:10:21.035247	\N	
102	17	1	d3fc37e0b084c67725a2065070e6265aa94d29ee4b1856f201023152de339732	\N	\N	2018-09-30 16:12:40.406947	2018-09-30 16:11:55.479783	\N	
103	17	1	d7fb2bdc4bdb012452b56ff5bc723259fdcd1e7edcfba2335ca1aaa0ab8b0ded	\N	\N	\N	2018-09-30 16:13:23.276705	\N	
90	12	1	9e46541cafee07241a5d78f3ec98b10ce49b0c149884005ef065e202f00a063c	\N	\N	2018-09-30 18:33:16.710547	2018-09-28 21:17:05.95147	\N	
106	12	1	21c39b9c91841f5a156b5b4d7073d32097dce31ef87d428596dc0a71f2d6233d	\N	\N	2018-10-01 09:28:58.127988	2018-10-01 09:28:42.228542	\N	
107	12	1	80d629750790e7b59eef9f81906c5d9a34e3bb0b0b808b3ac747578c15f2f6d3	\N	\N	2018-10-01 09:29:22.159933	2018-10-01 09:29:14.898315	\N	
108	12	1	d55bd2563474c4e109fc7cf2abb33d405edca3b8e84674d30b9a63e5f6e410bc	\N	\N	2018-10-01 09:29:50.60692	2018-10-01 09:29:35.440268	\N	
109	12	1	5db77a1dce7891a25e98d1848ae8e6e746b5a1b0027527763935142f8cdd755b	\N	\N	2018-10-01 09:30:47.067279	2018-10-01 09:30:01.257011	\N	
105	13	1	436fc37a3b70ac508a0f703aa6946065a5ab7b02d22a8454fc4571d0a5ac8a65	\N	\N	2018-10-01 09:36:26.739338	2018-09-30 21:06:10.576047	\N	
111	12	1	88763ac31fcf3dc2b82b6d0f9ff672ea99a8c387afe189820c13ec9921086d14	\N	\N	\N	2018-10-01 09:57:41.366204	\N	
110	13	1	8c19bfb75152140331d587bfdb23c8edb3e77a5d3ff70f571ef4b73bad6dc27d	\N	\N	2018-10-01 10:22:40.078038	2018-10-01 09:45:11.305733	\N	
112	13	1	80d76eb2420b3b112826af87974f4ac2e406d61f1b801687b4d0501403ac731c	\N	\N	\N	2018-10-01 10:22:59.921618	\N	
97	17	1	8bcf7ff749485b5538c1309528555e7a56704dafb9681fc0470e842c595a0b3d	\N	\N	2018-10-01 15:25:44.524206	2018-09-30 13:53:48.04918	\N	
114	12	1	c6d047eb9b64701010dcb97150d59f2628bf4135c9f7a66d9ca883a4877848e7	\N	\N	2018-10-01 19:01:12.333019	2018-10-01 19:00:59.703898	\N	
113	17	1	39a5972ddabeefee6bda103768bbff1f38aa985c67559330d1c1040cba7e3c32	\N	\N	2018-10-03 16:59:11.728605	2018-10-01 17:40:18.306507	\N	
104	17	1	6860b17acb8518cfc6fa236287abf9bac5e6ced37887bba607e88aa1d3ac0516	\N	\N	2018-10-03 17:45:48.600174	2018-09-30 16:15:53.966027	\N	
94	19	1	7752cf0685ce149c8541c992af56c444df82e8b844cc26f4bdde50456339d285	\N	\N	2018-10-03 18:48:49.299213	2018-09-29 14:40:18.323774	\N	
115	12	1	94762cfd9c9736986158886cb9c28bd0edd98f236ad53d90fc4e9565789c99cb	\N	\N	2018-10-02 06:40:22.061417	2018-10-01 19:01:31.487914	\N	
117	12	1	fffbbb58ab56512d54b0070a36e896fc9bc71b837b6189f4b8aa101453ab89d8	\N	\N	2018-10-02 06:42:58.938983	2018-10-02 06:40:39.281454	\N	
118	12	1	3e46163a9aa684f95fdbde8324a638805c54c41f5bf5ea9fc9146a8e8f40189c	\N	\N	2018-10-02 06:47:11.776779	2018-10-02 06:43:48.609655	\N	
119	12	1	d6bace1732d5bc101280d3f8b5e933e528472da1a370e71bdd5b982352a7e854	\N	\N	\N	2018-10-02 06:47:31.506245	\N	
116	19	1	5fb98523c602e7f5483428a8a22e0c1255ed86ad09147446d22fb45c348d472c	\N	\N	2018-10-02 07:39:43.580085	2018-10-01 21:53:11.631446	\N	
120	13	1	bc50fa695df0aa8c58eaed5170807a3e2083d5f5f3d1e2754e0b5cb1120b7906	\N	\N	\N	2018-10-02 07:40:06.684616	\N	
121	18	1	0400de055f74f753db7672132dd0099fddcbb52091b7753b21940a0ab0ae24f2	\N	\N	2018-10-03 17:32:50.977194	2018-10-03 16:59:21.262832	\N	
123	18	1	902d676450eef670e0344f2bb15865ac1a842343dc53f4636b00c45dbb5d9f9d	\N	\N	2018-10-03 18:56:28.3086	2018-10-03 17:46:08.300093	\N	
124	21	1	d675c45194179b241777c6963b090ad8acf0df4388e305bb95cde1ba69a9ac4a	\N	\N	2018-10-03 19:02:42.470703	2018-10-03 18:49:12.429284	\N	
126	21	1	43c7e76853c1fc7818b183a48f39689edc194ad382684d8bcb1034e408469ab9	\N	\N	\N	2018-10-03 19:03:10.424775	\N	
128	21	1	5d6453dab359f39b3bcda8fb7ad279ed4677912949a3f0864bbe7a91b6191a7a	\N	\N	\N	2018-10-04 00:57:16.029426	\N	
127	19	1	ec76ce8f2487d74e5c4e10452c1813fd8a037fc3f79e2da77eb3b9b0fbdf8de7	\N	\N	2018-10-04 01:02:49.732397	2018-10-03 19:10:22.033726	\N	
130	21	1	05220f9a302aa37ef96b609ac82feed1e5815331f5277f770124dd1018b2db28	\N	\N	2018-10-04 01:36:20.563643	2018-10-04 01:30:47.182794	\N	
131	21	1	9d4539a7f4584bb7d91b7383a36b5be8213dcb94b7c3615ac4983ebed5b4a96b	\N	\N	\N	2018-10-04 01:36:47.780872	\N	
122	18	1	310e3dc95454c18d69e7a95165001e9aa3deaeeb2e6d8658dd96c17c47db50c8	\N	\N	2018-10-04 18:45:34.386869	2018-10-03 17:33:12.729204	\N	
133	17	1	76818e1fa23ef8b8f0ee51fd51d6e1dd8fd8360e1f516de959b29d7a222e2514	\N	\N	2018-10-04 19:26:45.844823	2018-10-04 18:45:48.011231	\N	
134	17	1	db3e2c34e6f0b5401e1e2d998249a0185df4011e6b556d5c201cbab1e6404df3	\N	\N	2018-10-04 19:28:50.756235	2018-10-04 19:26:56.81796	\N	
135	17	1	685397c3d2978edcd34214354319e6373d0e005c110f86262e760a48af2ea5d4	\N	\N	2018-10-04 19:29:49.806389	2018-10-04 19:29:01.37799	\N	
132	13	1	b83358202f17109ecedf5e7fb0ae7e52dde6ff2fb4a713587070b630dd1afc95	\N	\N	2018-10-04 20:23:38.016927	2018-10-04 15:05:46.747867	\N	
137	19	1	e18429fa1307b2d3f479ec90272eb7324755b1f3250069e8108dc0570d20747a	\N	\N	\N	2018-10-04 20:24:15.676715	\N	
138	19	1	597cd5adab6c0c877f66bdb3b2ccd5dfd4c84f411166799b8ad7f59969b5bb87	\N	\N	\N	2018-10-04 21:30:37.299606	\N	
136	18	1	e2e64e7730267cfe45790cd0d4a7a1c87439acd303e47e6359f389338b014b6d	\N	\N	2018-10-08 19:08:59.855973	2018-10-04 19:30:02.328811	\N	
139	17	1	94b61c15b4880f09cdcf005c0cf22abcc468b8d116750ff1afc94c8bc81aa72e	\N	\N	2018-10-09 19:37:27.788148	2018-10-09 19:02:12.429348	\N	
140	18	1	03f4bc999fe61df47acf0599c77ae7cd0c601c16393f52470d381d72a042df39	\N	\N	\N	2018-10-09 19:37:37.235663	\N	
141	17	1	4beadc41d9d5ac2185f130d4f9ba685067f88b5015448192d51cdb469a409d58	\N	\N	2018-10-10 20:01:51.479073	2018-10-10 20:01:42.308382	\N	
142	18	1	b9db7562a6bbfbd5e540360930cad24135812b12d96b28b684017da6aed90a24	\N	\N	2018-10-10 20:30:47.462758	2018-10-10 20:02:22.790946	\N	
143	17	1	656e4fc4bc76cae1af92d317805c263201c4005cfef6b2070aefe3610920b0c0	\N	\N	\N	2018-10-10 20:31:01.041404	\N	
144	13	1	b09b654a15e6fb12f0406c8f5d2c1773f84e29787c7f22a48842f051163e0e49	\N	\N	\N	2018-10-11 20:38:15.62342	\N	
145	17	1	214d71fe052b8b8a473d32c1b3d66e5b7b683b3fd452ff27439bb377e76032e4	\N	\N	\N	2018-10-11 20:53:11.28375	\N	
125	17	1	613aa3da3d633da10535b57f1688396189d45ff50aea131c6eee64097beeedec	\N	\N	2018-10-13 05:48:44.332773	2018-10-03 18:56:41.072854	\N	
147	17	1	8b9200fedddeb6dce0137a130a2a8477e4afdb6afcf24c44f207c7bbb6ed657f	\N	\N	2018-10-24 19:02:57.272854	2018-10-13 07:48:23.848911	\N	
148	18	1	8d353560c30ca5c9c6b572489f5ef56734009bce1a99baf18b41a94a93200da7	\N	\N	2018-10-24 19:38:23.541932	2018-10-24 19:03:18.458103	\N	
150	17	1	2590f580f9f268d5d7248445014b305b0b61eb1db344aa1b808b49cd07abf427	\N	\N	\N	2018-10-25 16:48:39.42846	\N	
151	18	1	ac9afe64ac103c6f2a7375b349c48e5d4c3a1834d81dcb3723925d63d315a34c	\N	\N	\N	2018-10-25 16:49:04.099339	\N	
152	17	1	baeec2d2ec339b2f09177ce9d99d5db958223b500ba4e57500924d9b3454297b	\N	\N	\N	2018-10-25 16:53:10.571452	\N	
149	18	1	7b5014d65366eea92eb8294b61ea23303eee74a2c7050395e3279dab26102851	\N	\N	2018-10-25 16:56:06.982182	2018-10-24 19:39:27.801673	\N	
153	17	1	c18b41a723bd10a950dd0d0597098abbc083abb0c729bef12b977a3488af3987	\N	\N	\N	2018-10-25 16:56:23.086909	\N	
154	17	1	5940848e55c802ef0e16dfa25c021186856b566f909d44abd388321f4248ed10	\N	\N	\N	2018-10-25 16:56:39.745055	\N	
155	18	1	b56319c76b705b63c1ac089b31e54ab9c8e0d8c11a0a41666afeff9062789a38	\N	\N	\N	2018-10-25 16:56:46.516765	\N	
156	18	1	4a30a69d960587760be510b8baf9e2d9fbfc5299451131b09058d799d3e765d6	\N	\N	\N	2018-10-25 16:58:05.455394	\N	
157	17	1	d888f3dac074e1721a350ef7606fcb6e399f605ab8d32b33c73bb112c3196838	\N	\N	\N	2018-10-25 17:06:32.364896	\N	
158	17	1	3de81c0e75ec9566ea57b07cb5333aa0b66458a4818d50b5d76419134cd6dc9f	\N	\N	\N	2018-10-25 17:14:36.769889	\N	
159	18	1	7ce3f23bfd7d8b969e635bde6a3a9572a1b2df490301b0ba7f467f9621a3f7d1	\N	\N	\N	2018-10-25 17:14:45.379048	\N	
160	17	1	e69d7c947ab1341e7d8a3354c704a97864b483bcedb99b997f7e6e7a0b79ed74	\N	\N	\N	2018-10-25 17:32:53.467664	\N	
161	18	1	d388b90522610c93f9862171d78858a275353f90bd0d8ce3156905c659861bfb	\N	\N	\N	2018-10-25 17:40:05.36488	\N	
162	8	1	466948ea79083b1d7022753ac74da257e7fde6012cdd1a303cac2f5549557ecc	\N	\N	\N	2018-10-25 17:43:02.685819	\N	
163	18	1	52f4a744eaa9bd0d10de7be8fffb7784b7f2e7e7b3d9edfda79194765a350b6a	\N	\N	\N	2018-10-25 17:46:52.476027	\N	
164	18	1	0329adb338e6224669094546a74286dfff846fb0539ffe1210894f822ff83cf6	\N	\N	\N	2018-10-25 17:47:12.175088	\N	
165	8	1	daa26b8ab959eb3dc098d67bc8174f8340d9445613183efb9218ebc25fbc20e2	\N	\N	\N	2018-10-25 17:56:32.153811	\N	
166	18	1	9006097907303ef471f4484d46a19d17b869fa3adf201a506ba751bd037c0dd1	\N	\N	\N	2018-10-25 17:57:03.196454	\N	
167	17	1	aff76bd2a236ee96f1e96f09d7c47acb453691c87b14e0769644bf27cd688f71	\N	\N	\N	2018-10-25 17:58:13.679701	\N	
168	18	1	8a06a31638714a16fe91163249ca5b41ae3534537ff4cc57847fd3dbc1326d1a	\N	\N	\N	2018-10-25 17:58:33.546729	\N	
169	8	1	ddcdad6e5dfab678e92eef1f69a8170b7d67478d59a4eb641062a9e3fdaae580	\N	\N	\N	2018-10-25 17:59:19.12674	\N	
170	17	1	2de3cd1d6ccad41f7f2cac8f380f2f99fe7a397cf72e678858421f441769140a	\N	\N	\N	2018-10-25 18:03:07.896267	\N	
171	17	1	af204e66e1f4a584ab638bb4a21b67abe422210b0012557b160299d654dd355e	\N	\N	\N	2018-10-25 18:31:33.484138	\N	
172	17	1	a371ff5b354978f4972019efc34bb1ae7db10902a8ab8b65fda17b4259e310a8	\N	\N	\N	2018-10-25 18:36:56.706977	\N	
173	17	1	fcbfad068db99de656c48f7370d113d7ae53d2db64fa95a23e256363d0718bb4	\N	\N	\N	2018-10-25 18:37:56.694875	\N	
146	17	1	f282857f7a15ada8144d75676492830b205cf7713ed4929fcff51d241a1cd1fb	\N	\N	2018-11-20 06:30:29.406545	2018-10-13 05:48:56.820735	\N	
174	17	1	1ba2640204e2a9aa113f8f8929ea2c9ab5476a485f73d511ab67510fe32a1327	\N	\N	\N	2018-10-25 18:50:51.560043	\N	
175	17	1	6e75e8841fa510d9a153e52adb1346375fae37c06854a31b01068b31ce175854	\N	\N	\N	2018-10-25 18:59:55.303939	\N	
176	17	1	56559a449e280b93a15212495d605817cd2cb8d477787cd7ee03e8238c6fbe46	\N	\N	\N	2018-10-25 19:03:08.230941	\N	
177	17	1	2d50dbe27313b9f4ab24479bfecadf6cf8b94925db4b60078a24a457e4463856	\N	\N	\N	2018-10-25 19:13:08.852041	\N	
178	17	1	71d4ef7bd0083de6b4e297ed64563466a927705e72f9138f130318dd6a0b813a	\N	\N	\N	2018-10-25 19:17:00.285199	\N	
179	17	1	db6e43e7bdd08452b51f2f08fe9c2613c7a977df589d46f2cff9d8312bf8ca83	\N	\N	\N	2018-10-25 19:17:04.284419	\N	
180	17	1	5481277b39af92d07142e609e3813bf57b5e6aa4418ba4bbd022b8acb540a08f	\N	\N	\N	2018-10-25 19:24:44.080312	\N	
181	17	1	bc7811b0e610a10208692513cdf21dc6dfd07226a8a629a79a1fd520f9a25034	\N	\N	\N	2018-10-25 19:43:00.234694	\N	
182	17	1	5f26812e0e759d74bfa685d159bef7626180c098f12fa07295d003aff82d3697	\N	\N	\N	2018-10-25 19:43:10.470696	\N	
183	17	1	bf3b3ceabd228574cc7230c7248fa1c648206c3b4699bd2850c30d6d3867f31d	\N	\N	\N	2018-10-25 19:43:33.752454	\N	
184	17	1	58c701a6169b6eaaf44fd44a8147f778c9b1300ac5bf30f9b7262efe017f845c	\N	\N	\N	2018-10-25 19:45:28.201808	\N	
185	17	1	69d72e3663735c309f41a10907d698ab4568bf84e771208849fb4657147cf43c	\N	\N	\N	2018-10-25 20:14:10.795625	\N	
186	17	1	91526511fd73f2c1a6f37c56b368015dc385652119271a058ca6d2c0db13e176	\N	\N	\N	2018-10-25 20:19:29.024867	\N	
187	17	1	72f25d894c4cfd133a3c3bb606111de9435ba08e8d524c8703957288b5effb5b	\N	\N	\N	2018-10-25 20:23:06.530199	\N	
188	17	1	d3a3d8a960283e88e265d2ae21492fe11b41b84727e4db8545ffcb0b79ae196e	\N	\N	\N	2018-10-25 20:34:44.406113	\N	
189	17	1	0ee4919b8c4792b2184b2ef2822e98e96e8a71b4f9aa512a5f72f45a1cbd7afe	\N	\N	\N	2018-10-25 20:59:14.556071	\N	
190	17	1	017383a94fa00e635db36639906f1309838b085f78bc460f02ab7917a5d8636b	\N	\N	\N	2018-10-25 21:18:02.365855	\N	
191	17	1	dddee56df64ec37fcb15417fade396f216fbc9e6ac32a4deb9c430fa4d0eb1e5	\N	\N	\N	2018-10-25 21:28:55.840494	\N	
192	8	1	f67202acfda23e9897c3780709d3f20017ef47814d10893f06ea0ba687a82189	\N	\N	\N	2018-10-25 21:46:40.734298	\N	
193	17	1	1422face33c64b9559f753aec5effd2bb76a45fe52aadd3807ddb9686df16f9d	\N	\N	\N	2018-10-25 21:47:42.20392	\N	
194	17	1	7f44239b967443e45d2f211af00e2923b7d1b94fde7f67609cb829c4a709e991	\N	\N	2018-10-25 21:52:36.890974	2018-10-25 21:52:17.782522	\N	
195	18	1	40157b14b32617cd8ec0844755328f3021d7aa4275896408df53059ddaee69d4	\N	\N	2018-10-25 21:53:09.288108	2018-10-25 21:52:46.589992	\N	
196	18	1	c061e69fc8bf26200f401e16681b510c5702e8846d40d014c012f61566b1702d	\N	\N	2018-10-25 21:53:33.666394	2018-10-25 21:53:23.876401	\N	
197	17	1	ffc7e1689c04b3c15cc97cc499cac8385e6b3019d2370ae239fa9b2b8250ecaf	\N	\N	2018-10-28 14:05:54.07543	2018-10-25 21:53:43.67897	\N	
199	17	1	3dbeb4b97f7c5a9039979fbc4cd0fc80befcf3eb07fdbf41bbe2308e5932217b	\N	\N	2018-10-28 22:35:53.582703	2018-10-28 16:14:35.189085	\N	
198	18	1	9fb0f317b43aef64bdbe117021e4e1fdab68fe16b4923a36592d15a3f695a511	\N	\N	2018-10-29 18:30:50.041894	2018-10-28 14:06:09.582408	\N	
201	17	1	a75be3f02ca589094df22ebca1e18ba333faf4ab442fc11d621284cbf8e66ce0	\N	\N	2018-10-29 18:54:09.310951	2018-10-29 18:30:58.197108	\N	
202	17	1	c36d58e914c71a29e66ec107836826b521d01b924f255e806934819f90c39a7d	\N	\N	\N	2018-10-29 18:54:54.832161	\N	
203	17	1	950052226a088d0d6153eefaf09d2f5f13fdc0cf54f4b52e20bc87ce55f7637e	\N	\N	\N	2018-10-30 09:58:09.064765	\N	
200	18	1	5fbcdeab53ce1ee8d5f11c5bf398b18269c237d98a2f30391e6bb9cfefef1ff0	\N	\N	2018-10-30 21:01:22.869453	2018-10-28 22:49:16.839162	\N	
204	17	1	209fda0b278311b669466bd4213323c3837d94ec2ecc247d1c6cf4b70389d416	\N	\N	2018-10-30 21:01:30.968974	2018-10-30 20:58:43.23679	\N	
206	17	1	91eb22ddd54f2599b48afbd13d9ccdb1a7d41e116e6eb41403d914c9de4a1030	\N	\N	2018-10-30 21:02:37.07935	2018-10-30 21:02:09.143332	\N	
207	18	1	d1d384a89689681d04047f119bb2277b1cdca3aa4f7c556a820b4eafdec9c86b	\N	\N	\N	2018-10-30 21:02:52.394787	\N	
205	18	1	fe07b0b28be3d98e5dc5c57253c0708dadb8cebb235f97437f877cf2bafb6c31	\N	\N	2018-10-30 21:08:48.889597	2018-10-30 21:01:52.846093	\N	
208	17	1	dd337dfaa318d68caff83fb16aef455db49a6276f385b70605b0a39ed4a307c7	\N	\N	2018-10-30 21:28:39.100301	2018-10-30 21:28:10.555577	\N	
210	18	1	f3557b09b2262eb9bb319e7c722165ecf7eeef19002477dc5aaeb32b9212f292	\N	\N	2018-10-30 21:29:02.124857	2018-10-30 21:28:54.825922	\N	
211	17	1	6630e653841ca7368669f221baa207adc63e8702df5f0858baec39d4f69fb3ee	\N	\N	\N	2018-10-30 21:29:43.487103	\N	
209	18	1	abad577c7e5b0ad9dd415653bdbeebc8d1e9b1cb4be39a07b104a2a61f127341	\N	\N	2018-10-30 21:38:59.18047	2018-10-30 21:28:24.641926	\N	
214	17	1	551697ce490517562800c89cb0d23aa10524c6c62456516ffa2c6c947a127ddd	\N	\N	2018-10-30 22:36:42.187009	2018-10-30 22:35:48.525629	\N	
215	18	1	8148eacb805616f622cf6b5fcf94d3ed76d8b6ae81382781e38870a126ba4d6b	\N	\N	\N	2018-10-30 22:36:50.481018	\N	
213	17	1	7b608f59497778d569865f8753067a11300549752409c344f3728f74986323c8	\N	\N	2018-10-30 23:01:20.795226	2018-10-30 22:30:56.927426	\N	
217	18	1	40176de5d1d00e388f34c478cfe65f68a999815f26ad2b2d319e477911339669	\N	\N	\N	2018-10-30 23:01:33.16575	\N	
216	18	1	57d2451a031fe6edcc10666dfb6fb874e19b5189d88a6e07a7d70ef1a91d6f65	\N	\N	2018-10-31 18:27:34.956572	2018-10-30 22:45:52.985011	\N	
218	18	1	0d89af43788120bc98815fa54611669ee74f07ee150d7d370f9381c8a75df778	\N	\N	\N	2018-10-31 19:19:50.061071	\N	
219	17	1	d4a2a714ee743e728540d9cc2e66a6d38f51973e3b293501a159b5be066ab8bf	\N	\N	2018-10-31 20:45:11.422317	2018-10-31 20:33:46.289819	\N	
220	18	1	443d275e5e42fc672941e35cc90803e519a2ed69289223d54fa67502c012b976	\N	\N	2018-10-31 20:47:06.297977	2018-10-31 20:45:28.034117	\N	
221	17	1	cf39a9c1e99446b56f792ca42dd5a3ca0bbd81b8e9a18c58db98cdb5ee3fc1ac	\N	\N	2018-10-31 20:49:59.45268	2018-10-31 20:47:15.444445	\N	
222	18	1	0ea59d3694e7bfb99d24132df61ed686f8da4cde703c07ff96014ee2c787509a	\N	\N	2018-10-31 20:55:35.381726	2018-10-31 20:50:07.607616	\N	
223	17	1	672146e8fa04ef912529fedf81c60b4361e132b4df055ee9e39e25a4d3c925a3	\N	\N	2018-10-31 20:56:28.65229	2018-10-31 20:55:49.36533	\N	
224	17	1	be1345b4cc3243d0a1b23aaf4dfd510982f28f2c34a1aa196d8e71855a716268	\N	\N	2018-10-31 20:57:05.177704	2018-10-31 20:56:48.025719	\N	
225	17	1	4720a3e28494426f17b981ebb102881e99f4d5c14f379e10a9f7547d2f55f6d7	\N	\N	2018-10-31 21:03:18.005876	2018-10-31 20:57:10.985096	\N	
226	18	1	36e7f0f9b8c1f5c21c73857654cf7d533c7b01253b88d1940060655dab887869	\N	\N	2018-10-31 21:09:04.541632	2018-10-31 21:03:26.233277	\N	
227	17	1	62a2ce38938d170c4de48e2b29425384de65fa06f36cfb7119ff626e574681a5	\N	\N	2018-10-31 21:18:01.955705	2018-10-31 21:09:13.622452	\N	
228	18	1	473d86befdba30876a710ddd14d29e172516dcc527e048cd7f75c1e575f75d7a	\N	\N	2018-10-31 21:39:37.047606	2018-10-31 21:18:12.992102	\N	
230	13	1	144e4056870f586710a37b865010e29c5dfa764bf176fc000021cef74c15fc9e	\N	\N	\N	2018-10-31 21:41:22.988124	\N	
229	17	1	40ae410acdf9cb15382b800a478cfff351ab6757e76a3cdf4b7b59b657e1db1e	\N	\N	2018-10-31 21:54:07.590811	2018-10-31 21:39:45.465389	\N	
231	17	1	087e09da659b4954092fcd9160117426d519a3ed85cbeacc7c19ecfa72311115	\N	\N	2018-10-31 21:54:25.108896	2018-10-31 21:41:37.77492	\N	
212	17	1	ce7e275e6e43f4f0a26f7a211f9f1bdd0c4c452e9016d907ac40986d21918da3	\N	\N	2018-11-01 18:56:58.71989	2018-10-30 22:17:57.219668	\N	
232	46	1	5d1f90a634a7e90e468b050168d68e8e9e08c5b23ef7ad9683ddf84b49c4d9dd	\N	\N	2018-10-31 21:55:27.52281	2018-10-31 21:54:32.809518	\N	
234	17	1	f5274763038b4d60bebb4e6d80faa5e9ce20ee893fb561193dcf3b1d7577d79f	\N	\N	2018-10-31 22:26:37.0157	2018-10-31 21:55:41.641522	\N	
235	17	1	8f8da69c9ed503e3d539327bd8e9ecf3f8486fedcc61240eef4012060bef2a00	\N	\N	2018-11-01 21:29:47.000154	2018-11-01 06:04:18.152694	\N	
237	46	1	b0e008a11953882e36d8ea4585ff54753b9d81d5d00b57a0b32d2cd221eb5b05	\N	\N	2018-11-01 22:37:19.057185	2018-11-01 22:31:24.391117	\N	
238	46	1	2cf1c236e36eb5168670e47c13cc0e690b43a1a8be8555ec1f7a8bfc097c942a	\N	\N	2018-11-01 22:41:18.053753	2018-11-01 22:38:56.342339	\N	
239	17	1	32c8d66a7a3a506d2f60bbea5591380faece7b1815f765e08844cd3464a20a2a	\N	\N	2018-11-01 23:06:19.308404	2018-11-01 22:41:26.885326	\N	
240	18	1	e924ed122d7e3c2dacdab00397751c7bb7df3ff85038fbb168d73e8fd4201c5b	\N	\N	2018-11-01 23:42:16.639429	2018-11-01 23:09:26.002314	\N	
233	18	1	1863cf3e46ed0e79449b9e4f597d498bd18fde2460fc82024abd1a5e9c70a6ab	\N	\N	2018-11-02 17:10:13.786353	2018-10-31 21:54:57.295892	\N	
242	17	1	1142c980481f90c42ad9bdc15018900367c34aaf8bd6eecb26dc04bff6b5ae00	\N	\N	2018-11-02 17:13:42.750341	2018-11-02 17:10:24.876893	\N	
243	18	1	607a12579cdd8452348cf5143abc3c8d599953960d92fcc2f68277eab2973524	\N	\N	\N	2018-11-02 17:13:53.229733	\N	
244	8	1	a5d05c1e5f871eeba7e11f3a356a31da5cf48e2d60121422e09dd17f13d1a6a6	\N	\N	\N	2018-11-02 18:26:46.816842	\N	
241	17	1	78a6a2af1f5893e61f38d99e4a3ff200690041babab93e9ad0d5bb9bf425e429	\N	\N	2018-11-02 18:47:51.648572	2018-11-01 23:42:27.690398	\N	
246	18	1	344fe1cd0a57a0c8799dae451640458d4e3b0c44e954f0cccfed9cd903d35493	\N	\N	\N	2018-11-02 18:47:59.876692	\N	
247	18	1	9011c7839e31ca68bca59177c53acead9b116f5ca370b3cafafed4b440686bd7	\N	\N	\N	2018-11-02 19:19:33.203217	\N	
245	17	1	d258b6bed34eda83e22b99f3912af457704420e5a414a50965e5b6946d66ae90	\N	\N	2018-11-02 20:19:20.75626	2018-11-02 18:47:45.748748	\N	
248	17	1	c472768465f06babd6e14d837df6adab45566bc12be19d05ea3b340f4b83e5b4	\N	\N	2018-11-02 20:32:44.643367	2018-11-02 19:21:54.997707	\N	
249	46	1	7586d11c1a72cf7d111046db4b6cbfb06febc634ce09743396c247737e7980b9	\N	\N	2018-11-02 20:36:09.116944	2018-11-02 20:33:11.462888	\N	
250	17	1	a391da4ceaf92203f57b72ca1030dfc5f0cc7da57ec33b83f3c4e39ea585dd34	\N	\N	\N	2018-11-02 20:36:28.474749	\N	
251	46	1	88ea87e96434da1f4a983473eff87ec1332469de1269b0aa4253e0b99f435d2d	\N	\N	2018-11-02 20:47:27.597101	2018-11-02 20:46:47.203551	\N	
252	17	1	40e3646d12e9a53dd5f33d17c23eb71a7d1d0fe890af9568d3c47eedf61b8e64	\N	\N	2018-11-02 20:51:46.968186	2018-11-02 20:47:34.993275	\N	
253	46	1	b506ab36e6c696e360721bd888fa99d340f33e29a2af084f7b88ae59b49c576a	\N	\N	2018-11-02 20:55:48.559836	2018-11-02 20:54:50.328073	\N	
254	17	1	74d0b2de48d220f263bc4fd7cf78af36f3b0e029bd3d994bc6d211d9234afc5c	\N	\N	2018-11-02 21:06:00.199074	2018-11-02 20:55:55.59803	\N	
255	46	1	00e551cb6700880adcae2c04b293273816b49a08528596431504a80f8a4fa149	\N	\N	2018-11-02 21:13:29.095573	2018-11-02 21:06:15.140887	\N	
256	18	1	22e71eac2cf77b91ea805f37ced6cf72cccc4f2606b26564d7fb6bab51ebaf34	\N	\N	2018-11-02 21:14:49.208072	2018-11-02 21:13:37.811952	\N	
257	17	1	754b54cd8a0f8f6e86a21ce58514dd192191b97510991ff1f2d67f46a8d808dd	\N	\N	2018-11-02 22:25:35.827224	2018-11-02 21:14:58.088147	\N	
259	46	1	e84104e3204c686991b913f35f699086590f26e3db6b3992e8c393457a7c9707	\N	\N	2018-11-02 22:32:15.37584	2018-11-02 22:25:49.806406	\N	
260	17	1	48a209d72aba51f650b0876c7f7ed91a919674af9a0c39ffd781e61d749567b7	\N	\N	2018-11-02 22:34:35.650846	2018-11-02 22:32:31.937748	\N	
261	17	1	b82ecc9c02cd278c1d0a544e30f15549690830a77b192f8b7bbece74537ce57c	\N	\N	2018-11-02 22:54:23.374967	2018-11-02 22:53:02.029721	\N	
262	18	1	4c23fb5221dfb33c8e8450a57e8094deafd5706d4fb7a33efa55f59b22ba9a60	\N	\N	2018-11-02 22:55:18.929839	2018-11-02 22:54:31.166423	\N	
236	17	1	8049fa70ebb8ad7d713d6bb3d922e35e3a316fd4ab7ef85817e8183109a5cb42	\N	\N	2018-11-02 23:22:13.476481	2018-11-01 21:38:49.360623	\N	
264	17	1	5e164a8b315b3a022684d8e292f734d469899db80134f3e28b4b308372398531	\N	\N	2018-11-02 23:22:44.951411	2018-11-02 23:22:29.184571	\N	
265	13	1	5858dd5da60f34009e711bd45cd798f183179f6e6a0e16281f6a85b8a5a0fddc	\N	\N	2018-11-02 23:23:32.242585	2018-11-02 23:22:59.845616	\N	
263	46	1	754dfa7dcafc20d7fcf5a7179aaac371ba0303c8f7d23591d3a53c1984b81bd5	\N	\N	2018-11-03 07:37:47.368516	2018-11-02 22:55:46.742473	\N	
267	47	1	0c6383629c53319cbea17d1f107f0d5acbdd7f5085e04450e83d3c5bdbbcae6a	\N	\N	2018-11-03 07:38:43.434007	2018-11-03 07:38:05.055226	\N	
268	17	1	239b84c6b27efa73e7c6ecfb2eeb625f336e4880507ea13e2d5fddf0cbcff2b6	\N	\N	2018-11-03 07:41:18.525554	2018-11-03 07:38:54.013997	\N	
269	47	1	3b200ab9d5fa055d11c60c20205d1724d4c079bff7937a42e5447cfe2cf85a43	\N	\N	\N	2018-11-03 07:41:34.301389	\N	
270	17	1	de573c928612c1c0d9758b92d702b7d591f56c534685188614865b489c8eefa5	\N	\N	\N	2018-11-03 07:43:13.457803	\N	
266	17	1	49ab9e652aaec8765593c83d32e556fd2133f23911871a2a4e0a833d577a01ba	\N	\N	2018-11-03 13:28:45.618616	2018-11-02 23:23:46.691654	\N	
258	13	1	b99373cdf6ac2b668e57341f4d74048570100089e697fb8b39563a898cc4bd44	\N	\N	2018-11-03 13:34:55.147884	2018-11-02 22:14:52.821054	\N	
272	48	1	c7c9ed2ead820e4a5b49bd1c4464e27e57e7f955e66335f5e0a870d9c913cdce	\N	\N	2018-11-03 13:59:52.581246	2018-11-03 13:34:40.167833	\N	
273	35	1	5d88e99721f3babf07a3161b9b47f39ea5cf6d12c8a6c835ddb55714ed4d143d	\N	\N	2018-11-03 14:05:08.518919	2018-11-03 13:36:10.553775	\N	
271	47	1	5af5b09db95c08020c51652f8618541e30ec6db4dab3dd697fc500008b473ac6	\N	\N	2018-11-03 15:49:03.378702	2018-11-03 07:54:08.328586	\N	
276	17	1	6b31c9c7ea1b2068300b691ec28bbb1fa7db721149f45efee9ecaf1bc0fdb508	\N	\N	2018-11-03 21:48:44.484142	2018-11-03 15:49:11.486706	\N	
277	47	1	61345d6e7160bf124ce7b235581ad0213823b45008d1dcd028cdff1aa4c7474f	\N	\N	2018-11-03 22:02:23.204453	2018-11-03 21:49:01.099129	\N	
279	17	1	7e8f97728f997edc6f09567d7ea9acea00cb298c7edc3c81d0d3cf6e8fd77a2a	\N	\N	\N	2018-11-04 16:22:56.433448	\N	
280	18	1	54ddc8e60aab8e5e22c12c86c532dc9dbf2f819d3c7a483daad9f478f060b2b9	\N	\N	2018-11-04 19:02:05.530081	2018-11-04 16:51:56.414811	\N	
281	17	1	aa8ade8729e07087d143b8ab657089e5d48aed32200c3ac605e8d0d3272ef73f	\N	\N	2018-11-04 19:08:44.058387	2018-11-04 19:02:14.265091	\N	
275	48	1	c43a0f4d767937e6e61db79f47db058059aa94d0ea6c51e2d24583663a751a82	\N	\N	2018-11-04 19:23:29.736752	2018-11-03 14:06:34.426208	\N	
282	18	1	e1fd9061c43601109874714a255d1d0f0593b25708ae857191e9a98009f7e1ca	\N	\N	2018-11-04 19:45:18.246644	2018-11-04 19:08:52.506608	\N	
284	18	1	6d1d4dc5fe830d58afbab917d06f1ddb380dd9490bad1b411825e810eac26e27	\N	\N	2018-11-04 19:45:44.732357	2018-11-04 19:45:34.587531	\N	
285	17	1	f74d5ccc2bf0958b5c2a8d9e100af595dc57559763a4219291d0511f617ae401	\N	\N	2018-11-04 19:49:58.503978	2018-11-04 19:46:01.445706	\N	
283	35	1	f42154968591b6d643441e38d8077ec0bdd58a1262ffd13252cbc28a63e5eda5	\N	\N	2018-11-04 19:58:33.939802	2018-11-04 19:23:36.947725	\N	
278	17	1	6b4126dc2f4c00577b190959a14f216524aa243e4663d2d06aee0348b140f83c	\N	\N	2018-11-04 20:15:16.070802	2018-11-03 22:02:30.850692	\N	
286	18	1	b1c6184bd95bfceafff8c21364f1520616d0ce140bff13a9bf7923a8880b1526	\N	\N	2018-11-04 20:58:42.136828	2018-11-04 19:50:15.709686	\N	
274	23	1	836ce45ec3d533302dfde5ec9226775c596e5f43e64529aa0c982b3292db13d5	\N	\N	2018-11-04 21:51:25.844004	2018-11-03 14:00:14.937855	\N	
287	18	1	05505162cd29fc64b2aee3dc90f6ddc80b1e3a381b27d9e6d6e126ec5fd90846	\N	\N	2018-11-04 21:51:53.197375	2018-11-04 19:58:42.560578	\N	
288	47	1	813f95cd6b63290764b3656eb0a43185e5b6b6646e178691093678d6215a664c	\N	\N	2018-11-04 20:18:56.178482	2018-11-04 20:17:04.757766	\N	
289	18	1	0af84e614ce19ad82ba1eeefbca97cbfcb761c0962459e782bc17e9ad3335ebe	\N	\N	2018-11-04 20:23:43.441234	2018-11-04 20:19:03.352281	\N	
290	17	1	3031a5783ee5b26f4b14f4945738346046812f3c9fcc6d5fdcd6370cab87acd9	\N	\N	2018-11-04 20:40:39.253412	2018-11-04 20:23:52.328335	\N	
291	18	1	8c863cfc8c4a4a00bdc2281a9e3f62d9f76838f984c3a6619c5244a7f871a5c8	\N	\N	\N	2018-11-04 20:40:47.542732	\N	
292	17	1	e57d60787c6cb2a8d58f69997b9aa6db644f9ed937c76a31887884756ca5ef89	\N	\N	2018-11-04 21:21:32.672548	2018-11-04 20:58:52.145387	\N	
294	35	1	370447ba1e9f7ad92cec6b0ec59fa0161576b7f77d0938712c0f880b67770f39	\N	\N	2018-11-04 22:00:25.552452	2018-11-04 21:56:35.936941	\N	
295	48	1	d95a38b618cb01355e53dda6d20fb6deee53945932f284b6a4de759b77430f08	\N	\N	\N	2018-11-04 22:00:47.534802	\N	
296	17	1	5cba7e1fcf7f9c4c65ed12b3a4d40022d3b6f0b2e44afbfdf4b2635a736ce758	\N	\N	2018-11-04 22:26:07.66677	2018-11-04 22:05:50.647496	\N	
297	18	1	780527471f0d38c5a20712e445e891ba3b2896073fda727f199cf40be36ca504	\N	\N	\N	2018-11-04 22:26:40.235482	\N	
474	36	1	9a094744c57db15ec0a726fee3c4db8f05e0ebf2d2c23f9db0d8f187342fa57f	\N	\N	\N	2018-11-26 21:52:24.646679	\N	
293	18	1	34512329662a9bbc08a55d385f1d1d1c03543dee4205fd5a6674caadc2b5ab75	\N	\N	2018-11-05 17:05:16.77976	2018-11-04 21:21:48.253902	\N	
298	17	1	6cf2ea2cfdeca2df7ad0c16069f92a2effc189b7d2f73fd144e1463fa7845f0d	\N	\N	2018-11-05 18:45:00.091008	2018-11-05 17:05:28.866419	\N	
301	17	1	311bc3807893e4954af5e598f1727b561bcec59d0faf9c9cb306dc48f346dc3d	\N	\N	2018-11-05 20:17:57.687697	2018-11-05 20:17:34.560877	\N	
302	18	1	5f42d89b7d73c90ea28c2d9d2bb5854ca412f15d1f788bb8941a53ac2a4e1929	\N	\N	\N	2018-11-05 20:18:09.088007	\N	
300	17	1	890a4b1671de8df6e5089a74f4c76b87a95819177c79de6a716903d983c26c37	\N	\N	2018-11-05 20:24:28.752197	2018-11-05 19:42:16.090567	\N	
303	18	1	b3219a629330fc47e29b7ad0beb0169daacd731ead1a9a20ee792d79b38e3e73	\N	\N	2018-11-05 20:28:09.348133	2018-11-05 20:25:25.886192	\N	
304	17	1	0883a8f2eabfe976da27a064e93743a62f046b6607f397fc4fa71186735bb514	\N	\N	2018-11-05 20:30:15.085887	2018-11-05 20:28:26.436279	\N	
305	18	1	2e1a8af70f2d2a9a5c16af3266bc629fc0ba56bd2c58a1dd845c14b1b637ee38	\N	\N	2018-11-05 20:36:07.755217	2018-11-05 20:30:27.901024	\N	
306	17	1	3c20a2d0449acf59fad69ed330559c460d923167314e30fc6c37b0c77de1dfcc	\N	\N	2018-11-05 20:37:43.866509	2018-11-05 20:36:17.125728	\N	
307	18	1	13b56413a3d1665b736c603b7fad1544723cc048b5adf5cc9ec361a67c112b9e	\N	\N	2018-11-05 20:46:22.07886	2018-11-05 20:37:53.288539	\N	
308	46	1	91dcadaed1278e2d01cc906277e77b1528d39a5f9db9903c4029e41ab0721314	\N	\N	2018-11-05 20:50:25.681842	2018-11-05 20:46:38.751523	\N	
309	17	1	5367b2ebb72912d81174da9026b3d5a2466e82cee992202f26065a0bc6c5b337	\N	\N	2018-11-05 20:51:32.366702	2018-11-05 20:50:34.06167	\N	
310	46	1	257e2a14e407e3c92901cdff19451262ce34e1f3ec9a57523201f081802c8d9d	\N	\N	2018-11-05 20:53:01.008271	2018-11-05 20:51:47.026996	\N	
311	17	1	7fd21dfb968b6577fb4c0f59263277ca037728bf60414aa3bc08b3318b1574c4	\N	\N	2018-11-05 20:54:17.325642	2018-11-05 20:53:10.205267	\N	
312	46	1	49a44845044e22b01da2a63c29f6c6f19b7e7b09cd89c8b0bd138989b62318d9	\N	\N	2018-11-05 20:57:07.412383	2018-11-05 20:54:31.275738	\N	
313	17	1	3a77b15f6dc97c0b222773d21c93a229592dd156423c19614174ba9de48f787a	\N	\N	2018-11-05 20:59:41.86989	2018-11-05 20:57:14.916765	\N	
314	46	1	166454fc9449abeecb528b1d7232b2a9a2e294907b335c088d7aa64f501548bd	\N	\N	2018-11-06 07:42:42.971106	2018-11-05 20:59:57.042703	\N	
316	17	1	27210104a4823d9f4693f14055e06acf22a72c8d9a189673f6853cadfb6b5a8e	\N	\N	2018-11-06 07:51:36.522111	2018-11-06 07:42:53.799611	\N	
317	47	1	e71e2207fceee1f9655746b5900548ef6131510b02b8014273da835adedb660b	\N	\N	2018-11-06 07:59:56.223344	2018-11-06 07:58:26.985988	\N	
318	17	1	f38b7a0caa06ac7672782cdb573dca33cda8cbe9aa8348deef90c08e23b2e1e7	\N	\N	2018-11-06 08:01:27.3887	2018-11-06 08:00:05.182665	\N	
319	47	1	f3d649c85894038d5695f8818709dabcd03c94e36624d739f46edd65fc1f1fd4	\N	\N	\N	2018-11-06 08:01:45.622284	\N	
320	8	1	98a3ba18b3bd43352ae43070b16f0958c2af097bc8467a79d02544f90aa5dc0a	\N	\N	\N	2018-11-06 16:12:26.014123	\N	
299	18	1	de59e05efd8c033d693a9bb759e798219994bf3ffe2a0266bf9259f40aed9586	\N	\N	2018-11-06 18:12:41.797323	2018-11-05 18:45:22.48784	\N	
321	17	1	b9ef41e9cb9ce6be836db123081608b925bb7e49496c72d8425a229b8302e14c	\N	\N	2018-11-06 18:13:37.950652	2018-11-06 18:12:55.798394	\N	
324	18	1	c518fa8608a454df455803660cee37bc9a4ded77993cacd9365ad5ef2a6b20b3	\N	\N	2018-11-06 18:59:30.663736	2018-11-06 18:57:47.69322	\N	
325	48	1	e3a157898eb8e87e231eacfcf88a79b9cf6c19f8c7ca829a2b0888224a485127	\N	\N	2018-11-06 19:07:01.479316	2018-11-06 19:05:32.58368	\N	
323	17	1	ab4b309261d09087271f8fab3563532ce5f673b399a34ab2c8da1aa220eec989	\N	\N	2018-11-06 19:08:04.999124	2018-11-06 18:56:57.311247	\N	
322	18	1	bf9f599002388e6060f6c6c9c1cac3a0a637eece9e49556518add1c279498491	\N	\N	2018-11-06 19:12:56.66758	2018-11-06 18:13:46.913833	\N	
328	17	1	ae25c2da2b098f267365f8b6d286f51d3e44a99b94829f6b34569f5d2db4bb2a	\N	\N	\N	2018-11-06 19:13:04.82426	\N	
327	18	1	da4113ce35470c366a6ddf8d392068bbc634982000188f1bb242e16c36eb5bbb	\N	\N	2018-11-06 19:28:42.86107	2018-11-06 19:08:21.535728	\N	
329	47	1	9d736c347e94de9380b8cb55b84c6d9960359aabcb7e86fe5a67410f09575844	\N	\N	2018-11-06 19:58:03.705001	2018-11-06 19:57:51.178233	\N	
330	17	1	6a4530bb0440121f8f8cd2fb421ac03e5aaa04ba40dd00b5c7081ede55c9c169	\N	\N	2018-11-06 19:59:39.522957	2018-11-06 19:58:11.785928	\N	
331	47	1	3df62008864f1a54d89236c1334165c7ce50570e80de130a36df8defb2573e10	\N	\N	2018-11-06 20:00:19.379356	2018-11-06 19:59:53.367074	\N	
332	17	1	4586fbf75fe607e5f1b8d71464c58b42179a27b01a69f4b4950a5252bb8cc634	\N	\N	2018-11-06 20:00:49.927844	2018-11-06 20:00:35.452144	\N	
333	47	1	64df591cdd044153f4007816972c3f07aa79bc3e88c99b35da2ae769fd32467e	\N	\N	2018-11-06 20:01:17.441734	2018-11-06 20:01:05.281318	\N	
334	17	1	41dead171ba12c2294a1e45c9f88e1f41c93f8fddfec13c743bda453453f316d	\N	\N	2018-11-06 20:02:45.600431	2018-11-06 20:01:25.877013	\N	
335	47	1	8b07c3e2f0ba18c7ed56a156a62213ec1e0e546477c08c27d470d48dae81b792	\N	\N	2018-11-07 06:03:43.352932	2018-11-06 20:02:58.146185	\N	
336	17	1	aea988c91ca8c17a3a8264d6d89bb6f5e738b19b0d4febb6af6a422bc39bace0	\N	\N	2018-11-07 06:15:44.87487	2018-11-07 06:03:56.910199	\N	
337	47	1	2e84795ef5215aaa7ec31ca15e01cd493e366e95052c2bb40808fce1ccabc524	\N	\N	2018-11-07 06:17:54.068859	2018-11-07 06:16:08.346026	\N	
338	17	1	270544a94d32c2d87824ef40450e5ad12b4ad5223918de0fdf738213ac2d2b2f	\N	\N	2018-11-07 06:18:27.42991	2018-11-07 06:18:02.019483	\N	
339	47	1	3db2c249719a11f1168dbc5efc1ce37a60bc6478128e45f05a775cefe67fd313	\N	\N	2018-11-07 06:19:07.040192	2018-11-07 06:18:47.704952	\N	
340	17	1	1866ded8c8e998a57c7863c9e3e13b61e357e06c23cd01222365b6ec06507387	\N	\N	2018-11-07 06:20:24.846937	2018-11-07 06:19:15.079802	\N	
341	47	1	29d6853b6650868769271d8aced3758caffc7245955bd3a161e290cddd9e3c6e	\N	\N	2018-11-07 08:31:47.266949	2018-11-07 06:20:36.422496	\N	
342	17	1	d1e8b7e47a69f504bcbf29e17d0ccf21731a5d4f61d88fb9267b75a84b70d146	\N	\N	2018-11-07 09:01:08.956017	2018-11-07 08:31:55.294553	\N	
343	47	1	f4986127c1b227f6ba7d571f9ca93d94cb0d4fdbfdbacab1edf897180ef7c4c8	\N	\N	2018-11-07 09:03:12.463866	2018-11-07 09:01:33.976883	\N	
315	20	1	d91a03aa4d658880c0221f1a26fd5ffa50aecf94f0a1aece7deda6ca90c33226	\N	\N	2018-11-15 21:29:19.89387	2018-11-06 00:17:20.515097	\N	
326	48	1	9896dfcbbd7eaba811d72f419a1bd680b9168b4f21e106f4587dbd32a3af7035	\N	\N	2018-11-25 21:24:16.78577	2018-11-06 19:07:28.921305	\N	
344	17	1	d8171aa0658c1ea7bed68a6e0825ae9cbf88e17399482ab8cafb1135fdb3e42c	\N	\N	2018-11-07 09:03:53.425026	2018-11-07 09:03:20.355908	\N	
345	47	1	342a511f58a1d3680de5494e0cf8652b7f1e5bb099d93394c4ee3fff9585fb48	\N	\N	2018-11-07 09:04:45.42802	2018-11-07 09:04:25.427579	\N	
346	17	1	796faac81ea1ee36dc7d5839a1826a198b18f04bf330321a6cd7a80ef2049dd3	\N	\N	2018-11-07 09:08:12.235956	2018-11-07 09:04:55.377026	\N	
347	47	1	b8b9164e5dcf23f841f2f497dd5fe7fc4ec8d216565125235f9c723edea204fc	\N	\N	2018-11-07 09:10:03.434608	2018-11-07 09:08:25.636568	\N	
348	47	1	a7c13f88e61cb5fb54bdf7e5d795471225f9082b093443547780e51089e9f1cc	\N	\N	2018-11-07 09:12:55.980289	2018-11-07 09:10:14.738187	\N	
349	17	1	6b9f3797c17c59fbe6c8d07eeab92b670901e0eb40a7ac73b796afe7df2f89c5	\N	\N	2018-11-07 09:22:02.576389	2018-11-07 09:13:05.125787	\N	
350	47	1	7e82da646763f64486b848a60570b00ef0fd4d0dac06d1033ede234d7aec3cbf	\N	\N	2018-11-07 16:41:33.421221	2018-11-07 09:22:10.770105	\N	
351	47	1	c8cefe3242ee046fe9f6bc9986acd71cc7ac0246f15b671e9422be220f0085e0	\N	\N	2018-11-07 16:46:47.282424	2018-11-07 16:46:22.487802	\N	
352	17	1	8b90f97af5a4129b545a0637d9153769361f0766f1a8b5480ec99bbb056cc1b4	\N	\N	2018-11-07 16:49:09.034937	2018-11-07 16:46:58.428336	\N	
353	47	1	7bfbf6a797f025608a543caaa620e7ca95777a66c4fe5b05dcad2d6732b30e1b	\N	\N	2018-11-07 17:10:16.36267	2018-11-07 16:49:20.954754	\N	
354	47	1	18be60fa0eb2154bf6008c60ddc934a35ef3d23c0bcf1010b80c585ac11491e5	\N	\N	2018-11-07 17:12:15.131775	2018-11-07 17:12:04.545046	\N	
355	47	1	75727e057995af088f4538bbe1b35ede04651f83073c927205c53e3f3ad7c476	\N	\N	2018-11-07 17:36:07.324054	2018-11-07 17:35:22.802161	\N	
356	17	1	5bad3af40f37d4945198e1a93617831c56fd811b83a0a50a689bd4d3cc4328b3	\N	\N	2018-11-07 17:39:13.014056	2018-11-07 17:36:14.918864	\N	
357	47	1	c2a63464964ab1aa28ed32404e88142df749094e0adaa35ba0afe20db6721d39	\N	\N	2018-11-07 17:46:46.039961	2018-11-07 17:39:25.706088	\N	
358	46	1	de24165f7ad2caa114dc8a934145a4c5e13fcae99429bccd09f23a8c220427f5	\N	\N	2018-11-07 17:48:10.917279	2018-11-07 17:47:56.452978	\N	
359	17	1	eb9ec0e673c1c97cc1552a97d121b726ccbc6f2e521e39f9be1be583b2662299	\N	\N	2018-11-07 17:50:55.849716	2018-11-07 17:48:20.156176	\N	
361	23	1	296004f8b348a90de2d09c02697576e7ea5a7f791cf71272a4e1a3cac5c4f371	\N	\N	\N	2018-11-11 17:12:33.902917	\N	
360	46	1	040d80ac9a06d54ed4e4ee8cc1fc8a897d56717bdb582ca5312dd80c387c70ae	\N	\N	2018-11-12 20:32:21.172178	2018-11-07 17:51:06.740852	\N	
363	51	1	80a995fd061777f33bbfb81ac99e4e90b3e2f492dddbec7e26db7ed43691d5fd	\N	\N	2018-11-12 22:50:14.031286	2018-11-12 22:50:06.254019	\N	
364	51	1	11bc1597aaffa817e7479acdcd06a23c9b7bc2a789404669a65bf797458befae	\N	\N	2018-11-12 22:56:54.924506	2018-11-12 22:51:54.141658	\N	
365	17	1	19657a18a4ff1d6d1bbefa05cfdc243ed8861736f18fc995bd31b7b1efde3ba0	\N	\N	2018-11-13 14:41:35.030259	2018-11-12 22:57:10.907414	\N	
366	52	1	b2bad9c4e5965eefbecdd0bca9477ef9b6b22c07c8789021e508f80c35a793e0	\N	\N	2018-11-13 16:56:09.066749	2018-11-13 14:41:47.736064	\N	
367	17	1	1186cc1789032f5098d169b239f76aae1453c3c9503b7d04894d1ff4b9e0a88c	\N	\N	2018-11-13 17:10:07.315509	2018-11-13 17:07:19.606529	\N	
362	50	1	cbc64ae0744ca421d10e4e44807e153a148d69fb1bdad607fed98622bfb3cea1	\N	\N	2018-11-14 15:45:32.007666	2018-11-12 17:16:33.806003	\N	
369	53	1	6f12bb773c294cb95d2b6bbb59c2bcfb6d0a0e1111d3e581fa216c1a4fd348b0	\N	\N	\N	2018-11-14 15:45:50.759729	\N	
368	42	1	3b508093548464231382574952f59b44f5240463e4e40e743f61698481da10e7	\N	\N	2018-11-14 19:54:28.86168	2018-11-13 17:10:40.644573	\N	
370	18	1	8120acbf061cfd6704541543c6eed99acf7938f2413724da3f84023d57ff8a95	\N	\N	2018-11-14 19:56:33.517408	2018-11-14 19:54:38.630545	\N	
371	18	1	8f763cc6120848099e17cfb90b960bc37ac14f8d04f6957484b4e86244ec8a72	\N	\N	2018-11-14 23:32:41.728138	2018-11-14 20:08:04.677004	\N	
372	42	1	547987387dc8a071c1d9e9394f6f8c9401035b2be9882e98d7093a6bab3ed83a	\N	\N	2018-11-14 23:39:46.081671	2018-11-14 23:33:13.514078	\N	
373	54	1	0ef6afba2ede4c4345dd927ddb580d1b39ab81a1ccaf35d7c80ddadac024206d	\N	\N	2018-11-14 23:44:42.653164	2018-11-14 23:40:00.756008	\N	
374	42	1	c881bd3751f3b01c6e6e6845a2407f2ff1f729a4455f4c688ca025374def6db8	\N	\N	2018-11-14 23:46:57.65625	2018-11-14 23:45:28.601113	\N	
375	54	1	4779d1b2be55ebbd32d3c8dbab2828a137aa1c41779199c35ff65d4982638a4a	\N	\N	2018-11-14 23:47:47.904877	2018-11-14 23:47:10.20848	\N	
376	42	1	e7993ce25201bfaee4de11a2c98c3d2e8794f2e40669fe42ab9a7c12140d2c2b	\N	\N	2018-11-15 00:08:45.165911	2018-11-14 23:48:52.697468	\N	
129	19	1	44552f839620891e824c166016ac776ee5aa5ca0f1f375554a35a3c15ca877ac	\N	\N	2018-11-15 00:56:39.429772	2018-10-04 01:03:30.147941	\N	
378	23	1	0c247571f5ad903c01d2a28eb334a49550f5cce7a844ec9b25a2cc6195d2f45d	\N	\N	\N	2018-11-15 00:57:47.714816	\N	
377	54	1	3c685ecf815d3e1003986e431687ad7914a7780d37263004462dcd49d298c7a5	\N	\N	2018-11-15 19:15:43.427959	2018-11-15 00:08:56.887038	\N	
379	17	1	cc9461b0224e43947082a9ddc0c880afec0879ce125f8f4e34a2904fac2e17a6	\N	\N	2018-11-15 19:17:37.821587	2018-11-15 19:15:53.100461	\N	
380	54	1	a13a07b1f5195c7739111efcde8860ad0b3f785fabed23fe71e9e461032ba757	\N	\N	2018-11-15 20:19:56.874577	2018-11-15 19:17:51.113126	\N	
382	17	1	9743fa72d9c55cef92e66ef66fa5d341100dd1fefd6375869afa74fe307984cd	\N	\N	2018-11-15 20:20:27.695749	2018-11-15 20:20:14.825499	\N	
383	17	1	118aeca120a05e9c0abe6521452ddeca696e6178fc6018f70f0750eb8ad87b3d	\N	\N	2018-11-15 20:21:17.391096	2018-11-15 20:20:36.483762	\N	
384	42	1	89a3b4600d2563c65961bca8e9024e3d8d384b067d0b876a9a085fd56e0766a6	\N	\N	2018-11-15 20:22:58.420638	2018-11-15 20:21:40.958488	\N	
385	54	1	5e4376b7c0b5c00491bdeea61d1c3f2409aeb1a0d64c9dc08f33d4036662b87c	\N	\N	2018-11-15 20:48:03.273911	2018-11-15 20:23:10.594479	\N	
386	42	1	8b88f9ba0d2b0b0907161de9c68e96ff26e7af46545d86c1a362acdc130adef4	\N	\N	2018-11-15 20:50:56.662353	2018-11-15 20:48:28.712965	\N	
387	54	1	025e2265d3c2c8cc6877959d72b67272e1816859e8dcd893c871fb046fcd256f	\N	\N	2018-11-15 21:12:13.68801	2018-11-15 20:51:08.513361	\N	
388	42	1	9fd489c0efcecd61957afe62e8a93f4a30bf6b91db2061c40e0391e095cd7de7	\N	\N	2018-11-15 21:13:49.235597	2018-11-15 21:12:32.95452	\N	
389	54	1	34cd3c15dada9caf4a13a8a877f4b9f99ca5285edc529ab2cc61a86f88819970	\N	\N	2018-11-15 21:14:41.247265	2018-11-15 21:14:00.834255	\N	
390	42	1	9f664d268a5ec83221670c980a1df57575478649c4d713179ec80b2188638f3e	\N	\N	2018-11-15 21:15:36.674641	2018-11-15 21:14:52.478941	\N	
391	17	1	1e49213c552d8e6b497c04ca12d82fbc98ae0385f5e8be9aabeb6a01a1725746	\N	\N	2018-11-15 21:18:47.702542	2018-11-15 21:15:59.273688	\N	
392	54	1	7ebd57736dff0dae797735779dd4b9d220cee6d09b95efedea939f75217378e7	\N	\N	2018-11-15 21:24:43.63765	2018-11-15 21:19:04.759161	\N	
393	17	1	cb14b2102701b5e2bea60ffa3fb822177e213efd8c05b4f90a6e7f0bdc8e2b12	\N	\N	2018-11-15 21:25:58.889096	2018-11-15 21:25:23.062819	\N	
394	54	1	dd568d82ec2e69f9b58d3c60ca3e7badea53dbdd9b633d5f2176d05e014322a1	\N	\N	2018-11-15 21:26:35.657061	2018-11-15 21:26:15.100407	\N	
395	54	1	1236887c96cd8cb9a0eac2719bbeac5e0b65980b39cd2b6dbb9e87fb5b40d24a	\N	\N	2018-11-15 21:51:41.370007	2018-11-15 21:28:33.288499	\N	
396	42	1	e3d9feb6de1cb40b31048b06fb235b67f9bf0bd5f03e06c5956e05618c6b025d	\N	\N	2018-11-15 21:53:58.643539	2018-11-15 21:52:06.923683	\N	
397	54	1	bf13baa6d71819feccd2c7becd7230fc7a765c19a4910d7e940aa6b2a916caf4	\N	\N	2018-11-16 13:29:03.238148	2018-11-15 21:54:10.89949	\N	
381	42	1	75b760988613d447b4f86f41f22de5c4c19abc0c378b15715f2afff8d7350381	\N	\N	2018-11-17 11:52:28.099915	2018-11-15 19:48:23.108602	\N	
398	42	1	818fd0e0b91adc5b06974745cfb64f7c2981090760701ffcbda0e0d92ca66f1b	\N	\N	2018-11-19 14:24:12.937841	2018-11-15 22:00:48.823644	\N	
399	17	1	d7b2d478cefabb63380c60f89a3bf2772dc2966fc08d54b9d45e6ddc6ea0a991	\N	\N	2018-11-16 20:44:39.296053	2018-11-16 13:29:12.486605	\N	
400	54	1	4e449d14e4e653c8ac5daebb6b147cb5072fb2c9e1ffebff1ac1731ca10017fd	\N	\N	2018-11-16 22:06:58.042838	2018-11-16 20:44:52.988534	\N	
401	54	1	4b7c7deb98f66552126ad4c1419b7093204d6ce15d4836a68aae5d94760bd44b	\N	\N	2018-11-16 22:36:54.454286	2018-11-16 22:26:52.565343	\N	
402	42	1	49813771484d2a33a3ef26ef44df99836ba373ab96f6cafe26fda5300bbec706	\N	\N	2018-11-16 22:37:56.913538	2018-11-16 22:37:13.916374	\N	
403	54	1	da05acda1a475dc3048d52451ea758714552845f881d5086fd28ec3121f6af06	\N	\N	2018-11-16 23:17:24.1318	2018-11-16 22:38:09.903877	\N	
404	42	1	2025d3609729ac8cf4465e34cd6d129cc1e6eca23fab7ed9591b4a5e8c36e9f5	\N	\N	2018-11-16 23:24:19.75351	2018-11-16 23:17:42.417813	\N	
405	54	1	31a05d4b33288276a103615196315033a81e92b096230fc9517bab074ea15582	\N	\N	2018-11-16 23:30:49.570728	2018-11-16 23:26:14.112486	\N	
406	54	1	688e1b0d2b8f035f517180beea0cc294a37e6c4b3f9dcdcf7d10ddcf4c114eb0	\N	\N	2018-11-17 00:05:40.349968	2018-11-17 00:03:24.346917	\N	
407	54	1	16b3e6bf74499b9fe9894ce73165b39161306a13295648056bfd7ec93d565aba	\N	\N	2018-11-17 00:09:57.1444	2018-11-17 00:06:06.351738	\N	
408	54	1	99da560158d5b4f7ed2f3334f64a46577ff233458a1aa9c22adee441a840c1b2	\N	\N	2018-11-17 00:11:12.745738	2018-11-17 00:10:12.324396	\N	
409	54	1	60e0f517909bf6d896dd2cf37175f3de391aaa18ba76507aad82f4a0cb51a269	\N	\N	2018-11-17 00:15:56.781777	2018-11-17 00:11:33.270183	\N	
410	42	1	7eb46591845e411be7df678f055bb084f3765e25d513628a52c8300693f41106	\N	\N	2018-11-17 00:18:54.447583	2018-11-17 00:16:20.318615	\N	
411	54	1	7e3efcc5c6be1c0d70bdcf5f315071a4ad17e066e65e2656cb3d52e966e1336c	\N	\N	2018-11-17 00:20:32.54164	2018-11-17 00:19:09.00727	\N	
413	17	1	8869770399e1c7464c36ae60a1897e2e60b70e86855db661e356a6f1902fbaf7	\N	\N	2018-11-17 11:53:02.428043	2018-11-17 11:52:54.004376	\N	
414	18	1	d2a4fe6403dbf6fbb75577ec57504b0293ab739de2b8d1d7f5a928dbacfdcb93	\N	\N	2018-11-18 19:20:23.363851	2018-11-17 11:53:19.448586	\N	
412	42	1	0a13367f5a5ff1fe81c244bf540f6854b37c3f030d9fcf41b461a2f55e002f62	\N	\N	2018-11-18 20:30:26.20737	2018-11-17 00:21:02.515656	\N	
415	54	1	6b77170d793bf91f0257bdcac379ff9945806f1b192546f60b4488ec57630d4d	\N	\N	2018-11-18 20:31:56.083664	2018-11-18 20:30:46.607063	\N	
416	17	1	28b8185a695219d4e611cc38b029078945b3568fd5b42e8c0e9dd4ddf011b597	\N	\N	2018-11-18 20:42:21.8643	2018-11-18 20:32:03.236493	\N	
417	54	1	a3f29412ae1414b013b7e60fd7255da3bfef354ab24489ad5b6f24ed4e31421c	\N	\N	2018-11-18 22:24:21.887616	2018-11-18 20:42:37.458372	\N	
418	17	1	c6df883351fe3dc2dff0a18bf94e6a725a83d2641ab692cb00948a1d4ce1d901	\N	\N	2018-11-18 22:26:03.69447	2018-11-18 22:24:29.515267	\N	
419	54	1	681f27cdd2caf4ba723392db8a72e3874c3ea59439ae7370c74221efab37f615	\N	\N	2018-11-19 14:21:46.669224	2018-11-18 22:26:16.757233	\N	
420	54	1	560e5ce91bbc38e63cce06489cddcd8df426fa493722dedc40c57282ed997ca9	\N	\N	2018-11-19 14:23:32.26363	2018-11-19 14:22:00.309593	\N	
421	54	1	0664b75751647deea07af8eb3bb3e50d03348f16a6effd8c28bcd4e27f11f10e	\N	\N	2018-11-19 14:26:24.53497	2018-11-19 14:23:53.890851	\N	
422	17	1	e1752d63b8fb01bf5fa27a083dd29042c6a13af57b32482827237276e9ffabb6	\N	\N	2018-11-19 14:31:38.188766	2018-11-19 14:24:56.635037	\N	
423	54	1	796eef984db2600a1605e995dddbd482ec7787807b490446d68de4ebfc62e4d2	\N	\N	2018-11-19 14:32:15.511515	2018-11-19 14:26:38.545423	\N	
424	17	1	cb4de191f51063cec720f83a53982cd6a887b09f403ba5de2001dd2b33e1e669	\N	\N	2018-11-19 15:47:00.846202	2018-11-19 14:31:54.701513	\N	
425	54	1	0dc6be39e5b72249b4395aa26764db1d73af86c906bf2ae10836e25238500090	\N	\N	2018-11-19 15:47:16.779868	2018-11-19 14:32:31.753137	\N	
427	54	1	a402ca56d7098892c8237152eaef08ef992ec002bd3a89e16952c9acf551e5bd	\N	\N	2018-11-19 20:33:14.723451	2018-11-19 15:47:51.568521	\N	
426	17	1	d5c24c97ed52c681d312f2bffe70726d74a84c3aa047efeef9217e9b570770d1	\N	\N	2018-11-19 20:33:48.849253	2018-11-19 15:47:31.951661	\N	
431	17	1	e3f5b17fc28d0543b4c7f46d166bfbc8d5ada34ed72c62450a13046c54c17fbc	\N	\N	2018-11-19 20:45:18.901004	2018-11-19 20:44:45.033564	\N	
429	54	1	6252489fa897d2845e5223d77e9529880251bb7c95ea6be7937a4634ead06a44	\N	\N	2018-11-19 21:04:39.138541	2018-11-19 20:33:28.482985	\N	
433	55	1	47e79d2f6dfdad7c7484e17df8a781c5416f809383f6a37c5d7556c91caccc3d	\N	\N	2018-11-19 21:12:24.310031	2018-11-19 21:10:11.219135	\N	
434	55	1	af583c62c19788eb1dcdaefb67c1e121c89f8d61e017ab93bb3c7fe606886e7a	\N	\N	2018-11-19 21:13:15.057101	2018-11-19 21:12:35.14901	\N	
435	55	1	0ccab74a7a613cdafbdcd13dc34cbdea49d624ddda91d0eb58e99e291eda85f2	\N	\N	2018-11-19 21:15:49.080582	2018-11-19 21:14:31.44292	\N	
432	18	1	f5894a8bbe1ae85c39e4637ca8e3c8c5615f044a8b9d2fad4cc396b816d056fb	\N	\N	2018-11-19 21:17:26.911357	2018-11-19 20:45:38.457898	\N	
436	54	1	1afceefe1e652e785bea2ba791f73c1f9f5df8d0452454cb76d7e18ce0b68b61	\N	\N	\N	2018-11-19 21:18:55.318749	\N	
438	54	1	7ccb66680849fb4966b56a68b014593fdd954ac273ce337d81da84869062bfad	\N	\N	\N	2018-11-20 06:31:47.439551	\N	
437	54	1	d76e01e42a76d37e69e9ee05b5226ea8bf0957ce159b2522b24063f1b995206c	\N	\N	2018-11-20 11:11:37.032411	2018-11-19 23:27:59.868571	\N	
439	17	1	fc346a1cdaf116ae6cea4df5f1415e03a0c67db034840a1bf4a3fd0cdac5bbbf	\N	\N	2018-11-20 11:12:49.697795	2018-11-20 11:11:44.770367	\N	
440	54	1	7805562384710d1dbc5cab4b61a2b7485ae243814124e3b81e466223b5fd93bd	\N	\N	2018-11-20 11:13:22.421958	2018-11-20 11:13:02.490446	\N	
442	54	1	b4dfc79bfdc37a379a44630d47fa042df26c5dd4c5d090824f5c2704c3fbcedf	\N	\N	\N	2018-11-20 17:47:24.372933	\N	
441	17	1	51f8470e26a0b7c88fcf96780e63da797f5e3ca9369678f28cbd9fe45643dec5	\N	\N	2018-11-20 23:50:50.509603	2018-11-20 11:13:34.441476	\N	
428	58	1	751b2cb0ca03159a83f4f8677ba5424687bbf65d49fc47fc4039a06eaf217cd9	\N	\N	2018-11-20 23:57:46.264896	2018-11-19 16:17:43.555806	\N	
443	54	1	e82914b27155a063736b8873650f0b83f1d4428c6ce0d0cec0e40762ccadb277	\N	\N	2018-11-21 00:01:04.067098	2018-11-20 23:51:05.960376	\N	
430	17	1	7d7ec01e124b5e02a365cd1f3b0bb5f8dbb4580911cd6204fd7edcc58642a414	\N	\N	2018-11-21 00:09:47.380807	2018-11-19 20:34:54.537121	\N	
447	17	1	6cff93d804509a522d33356ac22a261c1c192f687984091e87b669b7938a9c07	\N	\N	\N	2018-11-21 18:21:59.653432	\N	
445	54	1	eabe5e2babae26668fb5256f5396fc57cfef81123de8b1abea6f8eda06cacbc1	\N	\N	2018-11-23 15:34:22.915332	2018-11-21 00:01:32.721006	\N	
448	17	1	40a44f682fc348214d723a7a6a2433a0bfb8a590f4f1cf7ae3848ebd78c88cef	\N	\N	2018-11-23 18:25:59.949808	2018-11-23 15:34:31.001108	\N	
449	54	1	f0beeb1ec64fec464c6068f93fb91581e0c88800d63cf6bc711b30b415ea9a05	\N	\N	\N	2018-11-23 18:26:14.867413	\N	
446	54	1	3b9a42c8c625d07672fa7d6e79c25032d12e8b04befc1e66677c0f1ca0a006e0	\N	\N	2018-11-23 21:33:22.556718	2018-11-21 00:10:35.017723	\N	
451	8	1	c91e41b5d4ae90263f0d8ebeb4ea9ed1853232ce1200a89688edd4b81ac1412a	\N	\N	\N	2018-11-24 16:32:37.812442	\N	
450	17	1	80b92b12210cec2320f3328ee462c8bc882dac9113f601adc3214b4d4ea773ec	\N	\N	2018-11-25 00:36:20.787333	2018-11-23 21:33:43.759615	\N	
454	54	1	6b81f6cb5493dcbe67a5181381cf523709d73c266f9276ae0390cad87e0532c9	\N	\N	2018-11-25 00:43:12.778426	2018-11-25 00:41:56.248755	\N	
453	17	1	2dbf96f85687b179f6917c5cc15da87623bd75418f2f6c7d52e92167ad890df7	\N	\N	2018-11-25 00:43:34.01223	2018-11-25 00:28:09.679679	\N	
452	17	1	2dca6e5627c5618aba923c26fbaa510faca4528f8a918248d1d2e9fb9b2e2b17	\N	\N	2018-11-25 21:11:36.053336	2018-11-24 19:32:10.709607	\N	
444	54	1	45d2201e3301a6aab514b2099907102a9dee6c90920a39ec49e571d2efb8860d	\N	\N	2018-11-26 13:58:27.695443	2018-11-20 23:58:49.691463	\N	
456	54	1	d4456817ee8d990697470e24711790b584270c7635188675f19419162b4cf259	\N	\N	2018-11-25 01:53:32.796888	2018-11-25 00:43:49.641486	\N	
457	17	1	071b7660b2795c5b83822117e7fc51b9a2f7762f62abbdaece7b184ea40ecc3b	\N	\N	2018-11-25 01:55:14.669165	2018-11-25 01:53:40.273619	\N	
460	18	1	17d65b04898eb57d103f56526865a0a223a672a6859ea07c644fcc55e0b515a4	\N	\N	\N	2018-11-25 21:22:38.433119	\N	
461	17	1	7ec2ee0798a6c85b53d86ac7bad9b341d027a0cab59ebd12faf284ff4d8a472c	\N	\N	2018-11-25 21:28:49.524954	2018-11-25 21:24:28.318554	\N	
462	35	1	c46aedeb96316440ca60ef434f8120478cad886d94dd5607d8969ae4884f3eea	\N	\N	\N	2018-11-25 21:29:18.542795	\N	
458	54	1	deca6f58ac486126790949bab9bbff0072ff0de9317e9cdf9431ebe75e194e4d	\N	\N	2018-11-26 06:48:01.756855	2018-11-25 01:55:27.522766	\N	
463	17	1	26b1e370c7df7fa3768236b61a6c3d5163982e8bdce34b4986130835919ee81f	\N	\N	2018-11-26 06:50:35.123659	2018-11-26 06:48:12.238375	\N	
464	54	1	79f427805ca7b19bc8a34c6adaa901ef1857f94bf5a659407603047e1a6b021a	\N	\N	2018-11-26 06:51:26.274268	2018-11-26 06:50:53.685097	\N	
465	17	1	ddd93eca7f5028a9e0434925d79fcdb67c556257dad5db999674200e962a6dd2	\N	\N	2018-11-26 19:30:36.372033	2018-11-26 06:51:34.036592	\N	
466	54	1	b9f301eeee6e75e70b7a14bf0d3d59cd76162f9eb058bd1e60ace798900b76e7	\N	\N	2018-11-26 19:35:22.855525	2018-11-26 19:30:49.231063	\N	
455	17	1	716301cb3a9d75bd645733dbf4f4c5258234718c1c87ad543b49c26c8684f7fc	\N	\N	2018-11-26 19:35:25.79771	2018-11-25 00:43:29.442218	\N	
467	54	1	9b3b560d164dcbb865c059f5adfe603c9eb4088060fe4a045007b60396ab7e40	\N	\N	2018-11-26 19:41:51.851791	2018-11-26 19:36:14.287787	\N	
468	17	1	e511e01b9bbd2063fb4e0da5bf404d38b128e5cb9861f0fa3d2f291d05e9f7c1	\N	\N	2018-11-26 19:42:15.78633	2018-11-26 19:36:31.834793	\N	
470	55	1	4a13b173955ac44d89b6e24a179c6d9e0e2a1cc57794da874c4b0e35e1a89412	\N	\N	\N	2018-11-26 19:44:54.941203	\N	
471	8	1	0043dab037680f119ac4bd1a051a3bb200b5dcb2981535192fe9e3204ec031e0	\N	\N	\N	2018-11-26 20:35:53.271276	\N	
473	37	1	3c5a655d200026aaa1ed5be52aa19dbe6d67a38bbfbaa59c45193c4a54f43bcb	\N	\N	2018-11-26 21:53:28.830617	2018-11-26 21:39:43.903233	\N	
475	56	1	1d227205f2d62259bbbd093ccb209eaec2838a5f83b4bf52dba7ba22cec5576b	\N	\N	2018-11-26 21:56:00.580116	2018-11-26 21:54:06.111337	\N	
476	17	1	dd6085dca9c1722164f1befa3e59eb54981b0d58f5c41a90230c328915d2410b	\N	\N	2018-11-26 22:03:27.89629	2018-11-26 21:56:10.627343	\N	
477	56	1	0a507b5a7d78740f68c5a0f8e801c87940c657101856267d791cee4bb6db64ba	\N	\N	\N	2018-11-26 22:04:14.783607	\N	
478	55	1	12bcc71834e800449095cd696b0c181322746cfaa216ebe70a38cccc18fffab6	\N	\N	2018-11-27 12:38:26.275938	2018-11-27 12:12:53.516472	\N	
469	17	1	ed5f2ef2d7b0b4c7d16560484dcdb7576ecb1ec84f66f7c79d64a197153361c5	\N	\N	2018-11-27 12:39:14.66976	2018-11-26 19:42:05.982772	\N	
480	17	1	3efc5e94540ee8ae1cabc92a56595f51fb95395415fde07cc3c8a25723a97cef	\N	\N	2018-11-27 12:59:14.785527	2018-11-27 12:39:28.798304	\N	
481	55	1	281863693ef74f1bc5c87f677a99bb62653acd06198655ef2b941f43040d5a27	\N	\N	2018-11-27 13:00:43.566058	2018-11-27 12:59:36.097643	\N	
482	17	1	2aa91af52602ba47391b91100e658cf126cdb95048400fabf7b068b9c61f18b5	\N	\N	\N	2018-11-27 13:00:58.17076	\N	
479	55	1	43cb83dbe86d11f7029f5be0cfd0c1042e884611f2e1f2e2acf465727f883aad	\N	\N	2018-11-27 13:03:24.029868	2018-11-27 12:38:37.399172	\N	
483	54	1	6991861d815665160e8e1f2d79c297becd68ca65e1b2e36ef1874dcf33c0d151	\N	\N	\N	2018-11-27 13:07:58.690842	\N	
485	17	1	ce0cd26fdef57b050e4b57d43a35b08bd9502cbf692d4f0b4b9f2a00687602f0	\N	\N	2018-11-27 14:31:35.028921	2018-11-27 14:29:45.125274	\N	
486	55	1	a6c1413d0c2b34f45b96f78215b0ec20af1682c40583b87d9210b00519fe253a	\N	\N	2018-11-27 14:34:38.475225	2018-11-27 14:32:00.518785	\N	
487	17	1	4c9084e3804aecbb3ab97f2510f6c30fc25f9f71394d426ff2d0e1b9efbfa153	\N	\N	2018-11-27 15:33:49.963237	2018-11-27 14:34:49.241313	\N	
488	42	1	90b6247ec3f30e2c46eecf01fc031d3e6f1810d70c0258f6d045d02148ebcf2e	\N	\N	2018-11-27 15:35:47.329041	2018-11-27 15:34:06.643169	\N	
489	39	1	42fc578938df3f1fea1d38840b04962066159490b3d18aac7288ad23bec7cfab	\N	\N	2018-11-27 15:44:04.311548	2018-11-27 15:36:04.448367	\N	
490	34	1	4c40983f38ea2271b2a70e1d161b715670f277b750cfd30ae43880d015f208e2	\N	\N	2018-11-27 16:11:29.755047	2018-11-27 15:44:20.67807	\N	
491	23	1	17c0baaa3f44f83eae2483a4d33cfeef4a3cea4fcfedd56a5f282076b93e57dc	\N	\N	2018-11-27 16:18:03.777575	2018-11-27 16:11:47.895893	\N	
492	24	1	f35674c4f2c9f43cd01340513f5eb03452f827e42817a66e4aee9875462666ac	\N	\N	2018-11-27 16:27:24.123341	2018-11-27 16:18:17.658068	\N	
493	25	1	597d44bc905b3e80363485242eaf0c289da16ed1f52c3449dbb1f4169a42a33b	\N	\N	2018-11-27 16:29:21.726797	2018-11-27 16:27:43.207702	\N	
494	26	1	2fa61e9cba75b73d773f1a39e6cca9eb7f78ca97918ae7acd9ac0ceaf78adc1d	\N	\N	2018-11-27 22:06:47.752594	2018-11-27 16:29:49.666706	\N	
495	54	1	1832dd7e2d007743f1aa0b9ba49e175fb4a8d62389d74aad41915ae2116d6a9c	\N	\N	2018-11-27 22:07:43.502368	2018-11-27 22:07:02.076104	\N	
484	17	1	f42e786ed0ce7b867fc9658af1dde68b525aea6e349c6e7614808060aa4e8716	\N	\N	2018-11-28 09:14:19.664059	2018-11-27 14:26:14.801928	\N	
497	8	1	8698f364b1d74aeb62825b3f07cc9330f3b58f530c8bc892eb658e608d42382e	\N	\N	2018-11-28 09:32:49.646156	2018-11-28 09:15:10.009798	\N	
498	59	1	9b6e4b443e44a802b8392482ecfa3cf00dee317e1713c7df3737eb2d87971546	\N	\N	\N	2018-11-28 09:33:27.685999	\N	
499	59	1	223cf35c2920132a61728a094d61acc7c1ce32749e29b6bec709261dc6504759	\N	\N	2018-11-28 10:10:05.932267	2018-11-28 09:50:26.611261	\N	
500	17	1	155eb22b93e4bcc39a746193c05c921d58a5036fd5c9afeb7bef400e8f2071b2	\N	\N	\N	2018-11-28 10:10:16.47985	\N	
496	55	1	c0762fb5f4a5ecec94f0cad21e681e8d6964c526772880fe95cac5d3e5ee6273	\N	\N	2018-11-28 10:34:13.825279	2018-11-27 22:07:54.596809	\N	
472	17	1	76ace0fe8053a7f270e076cfe4e2bc8bf3cff2816af6e64b4089a610d81d4730	\N	\N	2018-11-28 21:08:18.660882	2018-11-26 20:36:32.16935	\N	
501	17	1	9e74910c4af84413bff3af290df3000cb951553433925fb5d3f49c8a665c6b0a	\N	\N	2018-11-28 21:09:15.516598	2018-11-28 10:34:24.205114	\N	
503	29	1	12848bde01817a06cf4977107f77958fe82ebb0310d19c436e7ef19897626998	\N	\N	\N	2018-11-28 21:09:39.740671	\N	
459	17	1	0b4f39e17313047f37745ed3165773797d3dd45fdb1e3b3c44e66aa110717eaf	\N	\N	2018-11-28 21:17:26.786574	2018-11-25 15:57:49.191065	\N	
504	59	1	da5d22c00321e19645b683ed7f57078099c9c70ba108273eda6964655eafed15	\N	\N	\N	2018-11-28 21:17:47.406853	\N	
502	59	1	b61a9e98556d6e22154453c1c6dc0034e725b19f9b889364af6663ab39498900	\N	\N	2018-11-28 21:32:13.032123	2018-11-28 21:08:30.756013	\N	
505	17	1	2adffdedc44239cae39714621b07f9bf84d148a40f803c61e3910a14fced8b82	\N	\N	2018-11-28 22:24:17.022905	2018-11-28 21:32:27.260926	\N	
506	59	1	3115478aa5225fa42c863fab489768e5a5c2eea64ccf6205ae2d0c19a2aad2c3	\N	\N	2018-11-28 22:24:59.127497	2018-11-28 22:17:06.320661	\N	
508	17	1	15c453af2af9076eb9665be0e5a08ab0bd5a17bd5d003595b5b06804b82be605	\N	\N	\N	2018-11-28 22:25:10.712531	\N	
507	59	1	6abd75d32d779685a0716d7abffd3f7126099a2a835469e3e9929bb26d079dc9	\N	\N	2018-11-28 22:48:55.390909	2018-11-28 22:24:44.158381	\N	
510	17	1	1bb50ec5856e9e973e8d47aab1d46b5b63d286edf8a23b16ed7d65297c21a9bf	\N	\N	\N	2018-11-29 21:18:03.847037	\N	
511	54	1	7d923ba0f95c18b004155be7eb205a2a81e4513cf7807788dfa3132f7fbb29fc	\N	\N	\N	2018-11-29 23:43:10.931719	\N	
509	58	1	79768842c132df6b0ad9822ef8bce356c01300335a1518f6ce4cd493162faa25	\N	\N	2018-11-30 12:18:04.710895	2018-11-29 15:14:36.451344	\N	
512	40	1	70793aa2aaa454bddcff1e0efb7881d1004692a6d208be3d878a3bf75756d013	\N	\N	2018-11-30 13:08:20.422883	2018-11-30 12:19:04.244034	\N	
515	8	1	0210a0c0a56e58debb00e2c841ec8a6767fb56ca143b451a9e01663a1ceedb4f	\N	\N	\N	2018-12-02 22:17:55.360192	\N	
516	17	1	2e016842319fac9441706c9cafb5cef9e63555a0bfb5a31fdfff6c4686db5ff0	\N	\N	2018-12-02 22:58:10.640589	2018-12-02 22:35:33.050159	\N	
517	17	1	562249ea2b201e4e0c76ab8a7d2f682888734a9c5683d49e4b8023771ad7c235	\N	\N	2018-12-03 19:09:11.488095	2018-12-03 18:07:55.663318	\N	
514	17	1	420130b3b97bd12342dbd6faa60e4e71f5def626a281604c2ceb20b7ab302b01	\N	\N	2018-12-03 19:37:14.960246	2018-12-02 22:17:23.613055	\N	
519	59	1	67a4a24567a8496069bad2042e93b769d1a7979427efebd6d18e1220584ebefb	\N	\N	\N	2018-12-03 19:37:32.707337	\N	
520	17	1	ff9169e3ff9ab28c4eb4b1849bd78940e31afe1fcfb71e7dc14bd5985fd95953	\N	\N	2018-12-03 21:01:28.838764	2018-12-03 21:01:09.062981	\N	
521	17	1	0654ee2e9ed07ad677f6f17b320971c3256462fbcb947f9443f103b1186972e1	\N	\N	2018-12-03 21:02:01.076849	2018-12-03 21:01:51.379948	\N	
523	54	1	7dd1a23f55045c8a97b89721d3c790857770f657a251dcbe5ee4fef0873adebf	\N	\N	2018-12-03 21:30:27.314135	2018-12-03 21:28:03.85008	\N	
524	17	1	3a42808ff0b142f082f27e68dfa9fa255991a757e7f43d1d1805353fedba94fb	\N	\N	2018-12-03 21:31:17.879611	2018-12-03 21:30:34.917152	\N	
525	54	1	68bc3bd66133bd0f7774c7ad351b3a1e4ec64dec78fefaa7a59390c37bb11b23	\N	\N	2018-12-03 21:31:59.750989	2018-12-03 21:31:37.812149	\N	
526	17	1	cde19fc6a11764fdfc787fb42ea57430f2c567857524a70d8fc331b6479b4c31	\N	\N	2018-12-03 21:33:19.780211	2018-12-03 21:32:07.402242	\N	
527	54	1	9d47948aff785d81a045eb99fc0cd150dcaba3b853e3438a073be98156e4f07c	\N	\N	2018-12-03 21:34:13.715582	2018-12-03 21:33:37.804107	\N	
528	17	1	b43beaa21722aa10a9e9a32de3843cceed8558b96d64bcc929e6b742d614246e	\N	\N	2018-12-04 11:51:58.724289	2018-12-03 21:34:23.249293	\N	
530	17	1	f231ebcfe1593785a1089d6b13525ed61fee63f22950b5e2f43d001856fd7b7e	\N	\N	\N	2018-12-04 12:02:44.396014	\N	
513	58	1	8928bea5ceb469a9855ba9ad3af5d5eb247fc320551da780caed7f91a392138f	\N	\N	2018-12-05 07:46:27.118672	2018-11-30 13:08:51.009206	\N	
531	31	1	5195b174dd64c417d0981eb80a333d74561b2e1a4383549ca3d4470a5d0ccdf5	\N	\N	2018-12-05 07:48:34.72758	2018-12-05 07:47:17.48641	\N	
532	58	1	bcbde1081243f8665f0f184889841517c87b4ad57ccf11b5e599f69f2949d3d6	\N	\N	2018-12-05 07:50:08.751679	2018-12-05 07:48:59.601642	\N	
533	31	1	4aa4fc6be12af93878f88145a8efc9aad3d41f2fe2185443d845b6cc82d623c4	\N	\N	2018-12-05 07:51:28.209529	2018-12-05 07:50:20.528159	\N	
534	58	1	9c0b2a92def45f1f80d1976747c912afd0ddbc703e2b54f3df13026f84f0f29c	\N	\N	2018-12-05 07:52:34.574487	2018-12-05 07:51:51.274447	\N	
535	31	1	3868f59e19e7e7084d02f9e397f4a3e938f9fe654bd568dee349c3efa8ccff95	\N	\N	2018-12-05 07:55:09.799432	2018-12-05 07:52:42.636497	\N	
536	58	1	533cec967b8860af2491ab697c256e518fe327af6daf5f776b9f29300d3c6f65	\N	\N	2018-12-05 07:56:15.144621	2018-12-05 07:55:42.22514	\N	
537	31	1	7dbc807999d0aa875371837cb5e8f8722f7a6e9ea7d81f4e523cdf36facac587	\N	\N	2018-12-05 07:56:38.175323	2018-12-05 07:56:22.276212	\N	
538	58	1	ed2e9bf851852f3b5c20c0ed0474a5f00dec76a68b3bb1cc2bc1ee036ced949e	\N	\N	2018-12-05 07:57:25.056671	2018-12-05 07:57:02.139024	\N	
539	31	1	835240359b642a1080d7c8abf705e634b681d9d98fb8b93a79747b87795ef474	\N	\N	\N	2018-12-05 07:57:33.283815	\N	
518	17	1	dbc4efc6641415c2151c1418d29cab8186df80b984b11462540db7922b53d797	\N	\N	2018-12-05 17:49:46.135124	2018-12-03 19:09:22.848429	\N	
529	54	1	26ca77781bcd7efc495d0c15ada4ab89b8f21a84e256c6bbde491a2a347f910c	\N	\N	2018-12-06 07:07:30.098056	2018-12-04 11:52:15.210006	\N	
541	29	1	80e668dc7fc8df9923de16425221646225cc2987a69ff11e011d0d7165a97720	\N	\N	2018-12-06 07:09:22.463037	2018-12-06 07:07:45.741994	\N	
542	54	1	2450e4adbc224c1d8b4307f4769f739109cb59504bdaf2313d9c43e0c368a0cc	\N	\N	2018-12-06 07:10:10.76773	2018-12-06 07:09:40.615085	\N	
543	29	1	d36e04118f1aacae48508f33ac20c0163c6fb6aa2b61fea9757ba130cf30cbc3	\N	\N	2018-12-06 07:10:48.47901	2018-12-06 07:10:31.610763	\N	
544	54	1	e7f2332b4d4b185ab81508cb901ddad088ed4281d5d7e007b75794a6f8dc1304	\N	\N	2018-12-06 07:11:22.435949	2018-12-06 07:11:04.127885	\N	
545	29	1	685cde98048d96f08900957081094f585b7055cbc6adc18c922f4cb52e581e62	\N	\N	2018-12-06 07:14:35.16058	2018-12-06 07:11:35.487413	\N	
546	29	1	074fe92b9c52d78633f12f845a47d299a7c25fb087a30f5bb72a810b21328cc7	\N	\N	\N	2018-12-06 07:14:45.78594	\N	
547	54	1	2a2b2fbc61c23490ea849e19f344a15b63231593eb8aa1560e89f8ef9f28a810	\N	\N	2018-12-06 07:20:39.732001	2018-12-06 07:20:21.026609	\N	
548	54	1	ac9f5c0c35de2dd9dcc236f330bc29325a009840ee3f82bc0f7307812b19b1af	\N	\N	\N	2018-12-06 07:21:52.074967	\N	
549	29	1	6cd9f5d45bca12297c93f566f9c810ac66d59c1bfddd2420e25eea8f9f84cd47	\N	\N	2018-12-06 12:45:02.662403	2018-12-06 11:30:32.136301	\N	
550	29	1	b82779fb2a4aebc63016d1f9df0def8548da72e46166d75c04465b99d83425eb	\N	\N	2018-12-06 12:45:26.600371	2018-12-06 12:43:47.9123	\N	
552	26	1	25d58c75c55e830c58fc9a2328072048af6ee584eb5ac5a3dcfd68f4781a3876	\N	\N	\N	2018-12-06 12:46:26.678599	\N	
551	54	1	3b031df5f6c4737ffdbb1d58fe2c94e764e48c920c09d828505996c86779c4e5	\N	\N	2018-12-06 12:50:28.84789	2018-12-06 12:45:15.559738	\N	
554	23	1	7512a55d0a8f7711cd6fdc2867920ab93c5d4ff294e392234678af0959659de7	\N	\N	2018-12-07 13:56:10.932104	2018-12-07 13:55:17.322283	\N	
555	23	1	f5a1455b7bdbaae79470f21dbd44eb91df847b99e2bd5b1e247dba5a31edd43b	\N	\N	\N	2018-12-07 13:58:21.070401	\N	
553	26	1	aac5777d1770095e412d4f2973aa7a14b6a593b854c8a4e8afa5a85f7b68065c	\N	\N	2018-12-07 22:29:48.180417	2018-12-06 12:50:50.606434	\N	
556	61	1	a9be89f757714938171b415c032b621ec23672fe2590d64e2ecec41f609a7cb2	\N	\N	2018-12-07 22:30:52.433805	2018-12-07 22:30:33.613693	\N	
557	26	1	6b43113b1b5e9ea9c7a612f6e3a052642f2a81cf5a88b2526096f11bd299fded	\N	\N	\N	2018-12-07 22:31:12.234472	\N	
540	17	1	c2488804fb6e01af0dfb3465e86273b1582785fc42502301f1da31db4e65d0a9	\N	\N	2018-12-08 14:30:49.135315	2018-12-05 17:50:00.516045	\N	
559	53	1	ab590ebcece56dad83006c3ac9fc20ead51a279cc55e4bd9359ba23b2813944a	\N	\N	\N	2018-12-08 19:10:45.744305	\N	
560	61	1	6dc1006efb37a70493c960f72f1797b0bbdc87fa9813fe22a64d007d67b5cd12	\N	\N	2018-12-09 23:14:42.5363	2018-12-09 23:04:31.327089	\N	
562	26	1	7b0607bec2d4b3561e00d2c27dde1e92b667f41c747594e10846b8d87387657d	\N	\N	2018-12-09 23:17:11.972239	2018-12-09 23:15:04.28994	\N	
561	56	1	0d89162721151110117fde96485aad3e8d79b42dc8c527499a618a3fe153751c	\N	\N	2018-12-09 23:18:07.001757	2018-12-09 23:11:07.903114	\N	
563	23	1	2a2ba39d866970823e2782d1cba53157e750a824dda0a7f85a27cc2a4497aa34	\N	\N	\N	2018-12-09 23:18:35.840633	\N	
564	61	1	e2bf03c2e4d82e18b572cf1cf9220c4fa21b35c810601797cf22c275113ff3cc	\N	\N	2018-12-09 23:19:55.787683	2018-12-09 23:19:11.159748	\N	
565	17	1	353bdd4f3ae1c4b6911368476654ea450c9e9af813d5478b61f7abbf1ca11819	\N	\N	2018-12-09 23:28:20.958687	2018-12-09 23:20:46.880013	\N	
566	54	1	ee779d2ac10d30edd6844eb1b5ddcd8d36c5d1ab653cf47c5bfbe4e1fa1c77ac	\N	\N	2018-12-10 21:09:29.849696	2018-12-09 23:28:37.667313	\N	
567	54	1	87efff22963cdb80f6a181cb592046a28a5709a6103f8c7bf2fc20647971f4d8	\N	\N	2018-12-10 22:42:26.158824	2018-12-10 21:53:40.313496	\N	
558	17	1	8253a05736abf9b90fe1a62fe49115394505f390bd1f663d14a490e5bb08b8f0	\N	\N	2018-12-13 19:51:40.20625	2018-12-08 14:36:15.323486	\N	
522	59	1	2d8b396b7ca8a16728efc4126cdccd4d2d8b16215a9c277754e9e66ed731e683	\N	\N	2018-12-15 14:53:53.458135	2018-12-03 21:02:12.438528	\N	
569	27	1	452304d74fa31c5ddea69b9330427e24031f23688a065af4e4c2bbff245c713c	\N	\N	\N	2018-12-10 22:46:24.750588	\N	
568	63	1	a7ed95edd002cfffb8d732fc8f4ad22b54565a8b6379a8b8385d7b5b73827d31	\N	\N	2018-12-10 23:04:18.960896	2018-12-10 22:43:17.813153	\N	
571	63	1	5c4864f607fbd7ca1f79b64e21a555361ddeefeb49ef778459b8fc9e247e9ea9	\N	\N	2018-12-10 23:04:36.987211	2018-12-10 23:04:28.304354	\N	
572	63	1	293dd274059b86dd1b550497e8544416896e2d53d1aeec5d791225a6f293ddbd	\N	\N	2018-12-10 23:07:01.318904	2018-12-10 23:05:56.130896	\N	
573	63	1	8b085cf21105703ab17972d095121c929c799e979b27b2bb4d31c94e4e4b6e6d	\N	\N	2018-12-10 23:18:35.709174	2018-12-10 23:18:23.247731	\N	
574	63	1	7d75035ddc63ebe0a9bde4fea27ad3426e60b29530bc1e3c394eee79f27a867d	\N	\N	2018-12-10 23:21:41.298639	2018-12-10 23:21:36.656459	\N	
575	63	1	34475c2356b0dff2959d9e97832643f242cc83fad215c3aca7375d6a802813c8	\N	\N	2018-12-10 23:25:38.228246	2018-12-10 23:25:31.667933	\N	
570	27	1	51561fcd50217d6392e71479d7fdc9ae4a6ae9b2a5598a74996413d0f72c5085	\N	\N	2018-12-10 23:39:27.798083	2018-12-10 22:49:53.318572	\N	
576	63	1	6e8de2a8afc0a20cb18f8b1bfbe41f585ea6b07c0fe0f82b473a50e66b3a64fd	\N	\N	\N	2018-12-10 23:39:57.442539	\N	
577	30	1	23d3547c663cfef5c0b074689355bce172690042484d8f8d3bd7b906f21b0f2a	\N	\N	\N	2018-12-10 23:40:20.30169	\N	
578	56	1	8ad8677d1b2eba590385f1033d41da513ca8f7bef2704d78190aba05dc6d534c	\N	\N	2018-12-13 21:29:51.295982	2018-12-13 19:52:09.357902	\N	
579	62	1	ac9acf2ffac40a59126c68149a3fb5c4277d86d523e9ee0ea66e85a186a44691	\N	\N	2018-12-13 21:44:11.825917	2018-12-13 21:31:59.666315	\N	
581	17	1	a86382606e720f0af2bbb5cd12750b33209b54fe26abf5dc02381d8ce768f578	\N	\N	2018-12-14 10:14:51.14868	2018-12-14 10:14:18.286081	\N	
582	62	1	7454cea896ab09de4de0238c9bbdbe94e599865723e141bf0ca38f9e5a83ddc5	\N	\N	\N	2018-12-14 10:18:21.080778	\N	
584	23	1	e5090786b9bfdf11ef85c4676082939bf208c877938d50f5158033134f687827	\N	\N	\N	2018-12-14 20:26:55.746267	\N	
583	23	1	fb2179fabc187371f269a51df895c9dc3650fc11cb6e3b9a17f1033a0d349e85	\N	\N	2018-12-14 20:43:05.998534	2018-12-14 20:24:56.285058	\N	
585	56	1	3284d15199ddcd86af7f0fe684cc7a408d807a546932bd9537b76d51d3ca3de2	\N	\N	\N	2018-12-14 20:43:33.289326	\N	
586	17	1	46cc01fffb5d9f11db6b2d3f64f045f606777d02a91f05de0b4925981efeeafc	\N	\N	2018-12-14 22:50:47.64981	2018-12-14 22:50:07.551748	\N	
587	63	1	328552d3cdf277b5b4c8147e8a27767cbc3cf7ea3a35733eb65cee0a9c1ac0ac	\N	\N	2018-12-14 23:00:59.093692	2018-12-14 22:58:38.902957	\N	
588	17	1	e9a7ddb7acd17901685c17202ad1cc00fe061d4e181b74a92d85d4d6a0e43735	\N	\N	2018-12-14 23:02:16.385541	2018-12-14 23:01:06.642311	\N	
589	63	1	9cdcd2d3f680a3912314cc6bfb036a91d656228a85227852e8ae37012b3c7880	\N	\N	2018-12-14 23:23:11.183651	2018-12-14 23:03:31.292038	\N	
591	17	1	59a9aae57d97b36d49af53d1f2dcacb19c13b1a49395b15787e2911a724c194d	\N	\N	2018-12-14 23:28:57.773429	2018-12-14 23:23:23.929635	\N	
590	25	1	97ac4d1f4556713aea3c42efd6c06ae42d8cce045f147226aa659544b2e53f15	\N	\N	2018-12-14 23:29:57.943222	2018-12-14 23:18:04.461348	\N	
592	63	1	5549787067ab81d2c352fb2c64ff5db02e5c83cdebd6a3546b735f73df3e347e	\N	\N	2018-12-14 23:44:19.045359	2018-12-14 23:29:15.003519	\N	
594	54	1	dda12a0f5849177d42c69bffe01d3ddc8328a4865acfa39c5b17ae91ae110fb8	\N	\N	2018-12-14 23:47:52.229462	2018-12-14 23:46:23.539805	\N	
580	17	1	3c8fd9706d52fd4110925f5576068a24bbc2744eff29d1d84e0e7394324b89f6	\N	\N	2018-12-15 14:48:26.358311	2018-12-13 21:44:23.60001	\N	
596	56	1	8f841aa63e15bc4dca5ab19ed144d6db1a197aa72ec0e9455cd9e3d47d4f2617	\N	\N	2018-12-15 15:21:49.578288	2018-12-15 14:50:00.021734	\N	
595	54	1	d52c5d44db7b7ccc6a8d7f1afbb3bbfebca526f43e0500697acd0e98e9dcacc3	\N	\N	2018-12-15 22:30:39.893791	2018-12-14 23:48:07.087704	\N	
599	63	1	9b1ecceae998d0f616ae42dcaba78198e580ef78350bce1fdd145cadab620207	\N	\N	\N	2018-12-15 22:30:58.824756	\N	
600	63	1	fc041a3549ebacead00288b21ba60622d77b3e2397f0c9b3aa09929beb3688a4	\N	\N	2018-12-15 22:33:44.34209	2018-12-15 22:32:49.044095	\N	
601	17	1	a05c860301db376e094a87fa509ba3619c443b7bb53205ee5102d47f1aba7719	\N	\N	2018-12-15 22:35:26.288505	2018-12-15 22:33:52.704067	\N	
602	63	1	38bec811ec774a5f8caf9fc0ee30dce4e3ce597a9df4c876091f3400871f6b02	\N	\N	2018-12-16 08:57:44.07526	2018-12-15 22:36:59.895105	\N	
603	66	1	c0196191df37ac9ef0b08e2bb3ae2671e31f1400773cf06f3036b88bba34879a	\N	\N	2018-12-16 09:00:38.705522	2018-12-16 08:59:13.562303	\N	
604	66	1	b20f4577936998725588ec41cd84c260538c368c1eda1e1355344b63cf342053	\N	\N	2018-12-16 09:11:24.354246	2018-12-16 09:07:25.472079	\N	
605	66	1	54dc2429b0bb7a604eb3ba3fe146dbe495c7b9fee64120cce2a7ed30a2642f71	\N	\N	2018-12-16 09:18:24.176064	2018-12-16 09:18:05.941048	\N	
597	17	1	7318c72b3adaf9bfd7565750dc246551563c71e490604e07425fbef04948857d	\N	\N	2018-12-17 08:15:14.448851	2018-12-15 14:54:09.231984	\N	
606	66	1	29cccba6a5c617ff2a06166753e54521e40f6bf423c750edaa2c76dac23397ea	\N	\N	2018-12-17 20:28:08.191264	2018-12-16 09:21:04.682392	\N	
608	66	1	ca5e54049373a2e63a8f65e8094c6a51bd6d7999a914b863610b81264463b8df	\N	\N	2018-12-17 20:39:34.936433	2018-12-17 20:39:16.298324	\N	
609	17	1	ef7b5dd4f6219d4ecb50944602b2f9a5cd3595eab46d3a78cb22c91aee726ebe	\N	\N	2018-12-17 21:26:15.330867	2018-12-17 20:39:41.886082	\N	
610	66	1	243d50d5c755e804665b62b099c23c784fe906f81302488b9251653dce0c92c4	\N	\N	2018-12-18 16:01:59.454221	2018-12-17 21:26:31.748729	\N	
611	17	1	7ef0596aafb4dcf3dab9a303035e5b5fbd9feff952cd36a111d7bb93b84059ef	\N	\N	\N	2018-12-18 16:02:06.814469	\N	
612	23	1	d06f5665a550492c812be7de6f02f5c1e68bb440e704ed6e1d754e06a44a9e85	\N	\N	\N	2018-12-19 01:13:54.447046	\N	
598	62	1	979243f7b23ca3a12b59e595deabd55ecdd0ab60088b28ce7f66668ea66f6e20	\N	\N	2018-12-24 15:33:04.272749	2018-12-15 15:21:59.169918	\N	
615	17	1	549db49075cab3a1295b0130fcfe7570c261818317c4bff4fe2928528152e533	\N	\N	\N	2018-12-24 15:33:54.51543	\N	
614	17	1	75e7f53b4027e1b7c6d1c082b8d58bc53bb64c312fee43593c96f4c0c55e404a	\N	\N	2018-12-24 22:38:30.484038	2018-12-22 13:21:20.166831	\N	
616	54	1	3d7265870ea5692ebebbc82458a633bda38ae2bb9e8d630d864b1e15a2e8aafc	\N	\N	2018-12-24 22:45:54.222309	2018-12-24 22:39:46.65074	\N	
617	69	1	e4b6dfa90f79a1ba4cde8ceb115f4492075d785946143027f02571010614a072	\N	\N	2018-12-24 22:48:57.469785	2018-12-24 22:46:17.441704	\N	
618	29	1	34a50b634b317e24aa46e7dc66527b6086c44d2b9ad1e59ee34755756909b67d	\N	\N	2018-12-24 22:50:12.355283	2018-12-24 22:49:18.481697	\N	
593	27	1	6bf95adb2e9e0835f2000cc12217793ac47b10f4470a7898ab97632ebf230167	\N	\N	2018-12-24 22:52:43.179158	2018-12-14 23:30:48.559477	\N	
620	29	1	f92271157c003319aec35040f4caf643152abdb08573ee59031c641e10e0dae9	\N	\N	\N	2018-12-24 22:53:10.653536	\N	
619	69	1	9bf451f4691d3e612a58e7cd143fedad1185fc0c72794914d22ce41f8607443f	\N	\N	2018-12-26 06:07:18.101285	2018-12-24 22:50:35.409822	\N	
622	23	1	b6fe561ba3e05012e4114980047903fc2b3029948df7be2c5986ffcfebd32385	\N	\N	\N	2018-12-26 21:49:02.870762	\N	
621	29	1	5106f6c8f740c30f185637667f018010ac02347c5333cd3f39feeb133ed70105	\N	\N	2018-12-26 22:23:16.7329	2018-12-26 06:07:31.794284	\N	
623	69	1	d7bf2bb4f12623ed1a86bf687d47cb997e364b414c6394562c9edb26c3a71cb0	\N	\N	2018-12-26 22:24:28.695047	2018-12-26 22:23:50.072227	\N	
624	29	1	1f0cbd0937b37a69d9da6d8d765dfdb74b4dd1741196e8e9832c5b60668ccc37	\N	\N	2018-12-26 22:26:00.097881	2018-12-26 22:24:42.230246	\N	
613	68	1	5dfe1a00a702d946e165670f93a33695b65e6963cd3fcc3cb7e9491ce050cbde	\N	\N	2019-01-13 17:31:35.198552	2018-12-19 01:22:06.978828	\N	
625	69	1	9b9afb0478b7e3ef06b2f80917e133a286522d746d677903987033620b49dc6e	\N	\N	2018-12-26 22:26:39.800414	2018-12-26 22:26:13.451775	\N	
626	29	1	40ab4b09d9a7b58048e452669927f68d3549be0a83edca6c48c2f820ceea2888	\N	\N	2018-12-26 22:27:11.564148	2018-12-26 22:26:52.876539	\N	
627	69	1	bb0e2c37bbadc3e59f5f1a6153fb8f0e84d8a657c515de42483f8490cf9cbb8a	\N	\N	2018-12-26 22:27:38.16565	2018-12-26 22:27:22.104044	\N	
628	29	1	4f526ad4f0c8f8c2353e7b9140245ace6beff0bf6a5265e4c3b31fedea03a1ef	\N	\N	2018-12-26 22:28:06.175085	2018-12-26 22:27:52.54697	\N	
629	69	1	08b7ffff5a256ee7e2b5fe8fc2db6745ffc9046e92cf003b85b52870efe978f5	\N	\N	2018-12-26 22:29:36.232011	2018-12-26 22:28:17.698136	\N	
630	29	1	bba833b1e48263fafaf699b31c3a7ce9e4ace732df2354a9974161152ee5be3f	\N	\N	2018-12-26 22:31:17.624218	2018-12-26 22:29:49.445105	\N	
631	69	1	f3afc8e67400f47322b6e60f88b3bfa34155c6cf4641dec62b08b1b9b95ee3cc	\N	\N	2018-12-26 22:31:59.803148	2018-12-26 22:31:40.030934	\N	
632	29	1	ffa208dade80d088b1463957aff77065f3d632378c97f6caad12fa1604c565bb	\N	\N	2018-12-26 22:32:36.000531	2018-12-26 22:32:18.470591	\N	
633	69	1	c26262a277f794136342a1ca0c8edaca0eeed3e534ef8e3e0be6976efbe3c076	\N	\N	\N	2018-12-26 22:32:45.532686	\N	
634	29	1	b8ccad310f0a51f4f8214e07d8de0587fdcccb7b4499cf27791c688110fdc850	\N	\N	2018-12-26 22:39:12.66053	2018-12-26 22:33:12.876188	\N	
635	69	1	89b3ad7e0c59ef64113b36f70e91a94c95093f67047710c82b6e51501a7b7d49	\N	\N	2018-12-26 22:39:43.494726	2018-12-26 22:39:25.84268	\N	
636	29	1	a60caa8f8da67f0c9869b625b5e3a11dd92cb8bb4a80060ecfbd0a5fa9042002	\N	\N	2018-12-26 22:43:02.982452	2018-12-26 22:39:55.026835	\N	
637	69	1	0f7cfcc3314ae191178a0ff72e875e67d7481874dd1f5022a1f4f1e0df93a8ec	\N	\N	2018-12-26 22:43:39.97828	2018-12-26 22:43:14.959585	\N	
638	29	1	8685af873dd93e81d486a1c3e0cf3e043250d62cbcf09320890f0817cc49b01f	\N	\N	2018-12-26 22:44:04.127503	2018-12-26 22:43:50.874596	\N	
639	69	1	d468ac7d93ecb2049b07cde21013962f14c4aa22835b80b0f83987aff46d491e	\N	\N	2018-12-26 22:44:30.016245	2018-12-26 22:44:12.835872	\N	
640	29	1	57c0ef8b7cbf3082f428672254d96b84fe1b27ab4cd8b9abe5d2ddf98a979f9d	\N	\N	\N	2018-12-26 22:44:43.969195	\N	
641	17	1	bf534da899591ca536de9ae684c3b5b8ada2a3c3a3ebf6dabd356575a511e740	\N	\N	2018-12-30 13:12:45.145189	2018-12-30 13:12:10.241246	\N	
642	69	1	14bac092fcd8c0ac4df342aa69adc7eec492115979a2d501d5572140a4cbf07d	\N	\N	2019-01-06 23:09:09.429901	2019-01-06 23:08:28.140233	\N	
643	69	1	405febbad6ad31394aff4b0ce98b1cf05b85e442303b4219e79df2ab1535bd6b	\N	\N	\N	2019-01-06 23:09:17.346874	\N	
644	69	1	4195597dad2661927f0676d9c3397a92afa88746e133223a23a96d5110068fc4	\N	\N	2019-01-06 23:18:02.814731	2019-01-06 23:11:16.606158	\N	
645	23	1	bf6ce7adc4b74fa3d394539869f9065a57a2675a38ac7198c3bf50d8bcda5471	\N	\N	2019-01-06 23:19:59.251729	2019-01-06 23:16:40.656347	\N	
646	17	1	965ce99c84213877d3626c4ee817146beb07bae0442cbf4dbd57f687aafec013	\N	\N	2019-01-06 23:20:41.418639	2019-01-06 23:19:04.87696	\N	
648	69	1	29277bca04e55e8ad99f7cf1d0768f1c92ffd60422a9caedc0ad2f3d4942e4a2	\N	\N	\N	2019-01-06 23:21:07.569195	\N	
649	69	1	76408fa7f8b77e344c08767220e3ed605a5de12d4d796426426762a461bab208	\N	\N	2019-01-06 23:37:18.051017	2019-01-06 23:36:33.355682	\N	
650	17	1	95a299af3ef1f56635b631fe3606a63e6b1c7a7ea0145cfe33e08b8f20976944	\N	\N	2019-01-06 23:40:40.745235	2019-01-06 23:37:35.13421	\N	
652	69	1	3151cfb4a27e925906afdcd396c99c79e957580d220b17a3171eb900817bdfda	\N	\N	2019-01-06 23:45:11.181332	2019-01-06 23:43:57.63582	\N	
653	69	1	e6ada9969b5d9745e1c4691d036c753015c8ed6a01fe233a1a1050aadf7b9317	\N	\N	\N	2019-01-06 23:45:29.792697	\N	
651	23	1	da4bbf44d56c43341b5d7dbc7672abbda18afdd4451abb1439e7f1bafc8b922d	\N	\N	2019-01-06 23:45:59.213852	2019-01-06 23:41:27.698228	\N	
654	17	1	b137052ebecfda60d2e5097242c2f52ccf1f120a16009b5c1d7675b364f8308c	\N	\N	\N	2019-01-06 23:46:25.544734	\N	
647	17	1	d969db04afdef617de004bfce941e21b277629d538711900483a4d100f10a691	\N	\N	2019-01-06 23:48:21.790273	2019-01-06 23:20:12.331853	\N	
655	69	1	bd35a236ad8e6d3404a1372065be810113a2dab907fabbaec69ec69aac7c3cf8	\N	\N	2019-01-07 15:22:33.816788	2019-01-06 23:48:44.083155	\N	
656	32	1	e386358e32ec53fa9dcd73bf4f5830cdcb32043379c97816752e9479036df1b7	\N	\N	2019-01-07 15:30:32.120757	2019-01-07 09:40:41.738161	\N	
660	69	1	ea8d45ba1cae40f2b3f853b6ddb8e28e5296e7649dd3f76e9399f04e4bd1737a	\N	\N	2019-01-07 22:23:10.296119	2019-01-07 22:18:38.23933	\N	
661	29	1	e7a36e4e59cfb7b63c1f26135048888fcfeb43ab978dc7c70e9ea938a4e45b3a	\N	\N	2019-01-07 22:24:39.450483	2019-01-07 22:23:41.629885	\N	
662	69	1	58bd9455fbbbc7716e1007433b5f070513898f4bf254c8748acfd26f2095f6ff	\N	\N	2019-01-07 22:26:22.5915	2019-01-07 22:24:51.917322	\N	
663	69	1	cb03c92cd24f46a352e7b0acfdf81f24978b094fe6f7763a37a5c36bdd52c46e	\N	\N	2019-01-07 22:27:43.218206	2019-01-07 22:26:31.937937	\N	
664	29	1	0415805e00c5d509838b90ea4af03c10cfbd5f5179fa197a9095eb05237a9c98	\N	\N	2019-01-07 22:28:31.177569	2019-01-07 22:28:08.304678	\N	
665	69	1	4f9393185f15306385120d52215783aa5449d40da565102091874de9a2bbdd4d	\N	\N	2019-01-07 22:33:29.99491	2019-01-07 22:30:07.971042	\N	
658	23	1	30941d9504ae3795c001e96e7a6f46703a1b26578ca8d478ef2eea7b66c8b7f5	\N	\N	2019-01-07 22:36:31.865415	2019-01-07 15:33:12.69306	\N	
657	23	1	0bea52cc1d96fd109f44a1c90b71ff494c8ef8301d2a00465c5d918fac79fda7	\N	\N	2019-01-07 22:38:29.490172	2019-01-07 15:30:55.07419	\N	
666	29	1	3fa00d34cd651e8b9d5945a81f1f60444339bd415b4ae76e45cda8252b139e48	\N	\N	2019-01-07 22:39:39.876238	2019-01-07 22:33:40.808943	\N	
669	69	1	17e8b2825b2c85af073bcf93a015ee83849c07445ea5729dabfcde35da8b14fd	\N	\N	2019-01-07 22:40:47.771807	2019-01-07 22:39:48.498149	\N	
667	29	1	8619828de89369f8e43d391c042e101c6a7503930a8d51e5bbf396a3b92fe2b7	\N	\N	2019-01-07 22:44:52.837557	2019-01-07 22:36:55.934139	\N	
671	17	1	61eb0883b3500c6c829eccc350f578b4a79bf0b8448b3a22f3d6ddf63a449f09	\N	\N	2019-01-07 22:45:39.235218	2019-01-07 22:45:11.847548	\N	
670	29	1	b9996cc1b80b49e60f64d57692b608ea478ce023a887b683e0c95235bcef7a7f	\N	\N	2019-01-07 22:47:50.722047	2019-01-07 22:41:21.159048	\N	
672	69	1	11a9f608d24e4e0a0562f8c89a1d49131083ae2e498ff416d30ad1f7445c609d	\N	\N	2019-01-07 22:51:09.008443	2019-01-07 22:48:12.39007	\N	
673	33	1	1acda94524c8b539b48f8ec26bf128c3711cde00b47f8b12f29df40151fef0b6	\N	\N	2019-01-07 22:53:16.456964	2019-01-07 22:52:11.168454	\N	
674	69	1	64c22952c554c54d1603c487e6cde304364ebe93085db4c59b183b197cdc9237	\N	\N	2019-01-07 22:59:36.71732	2019-01-07 22:53:23.799319	\N	
675	69	1	549dd23d8f720c89b72f9214696db850fb964c0f0a6127206954e729a518c5cc	\N	\N	2019-01-07 23:02:12.934335	2019-01-07 22:59:44.499537	\N	
676	33	1	11a08ef0c0fcea52e26a4aaf01214c62e779101c26995fcc2588f095794c9def	\N	\N	2019-01-07 23:08:32.45014	2019-01-07 23:03:32.004472	\N	
677	69	1	9ee09a289b10fbe5af2b3690a37ba1a2b3bdad2d47832458612a0ef859f7aae5	\N	\N	2019-01-07 23:15:53.657116	2019-01-07 23:08:41.06434	\N	
678	33	1	04629576ccaff3d5d66d66aec74db6ecd39ab03064ebe45ee10d00f0690a187d	\N	\N	\N	2019-01-07 23:16:11.199095	\N	
607	67	1	83eea5db8a23f5e5f8415d3d6c6582d19e99d7d517f85141411f632d8783a6dd	\N	\N	2019-01-07 23:36:11.789551	2018-12-17 08:15:29.382534	\N	
668	29	1	787d65c74e76b76b4c7e1190be43095e64d0e9f520b3893b3270cb1f52760a7d	\N	\N	2019-01-07 23:36:23.996178	2019-01-07 22:39:44.914876	\N	
679	69	1	0e4e9957ecb46defcac6ca07cb5799719ff474bb5825dafb7ce0968016ad3ab6	\N	\N	2019-01-09 21:44:49.983563	2019-01-07 23:32:12.403193	\N	
659	17	1	d179df26bc3885bb722ca7fad8c9889bff281a9f1db08a3c31c6dce19ad92575	\N	\N	2019-01-10 18:15:54.08028	2019-01-07 19:20:25.946161	\N	
680	69	1	abb15f02b71930efde1b96c32f99aeea90ccbc3ad41ad7376a383947cb744625	\N	\N	2019-01-09 19:51:08.699858	2019-01-07 23:36:27.073921	\N	
684	23	1	bea8fdfddaf019aae4e6907f0cf1d8b1332cc63b67d71688fc282a8a735eed7a	\N	\N	\N	2019-01-09 20:02:05.207434	\N	
685	66	1	1bd269aaee11421eefe6ae8e76aeb7ae441e6c5a7e77453bd0087a4156ee327d	\N	\N	2019-01-09 21:51:11.720961	2019-01-09 21:48:37.859372	\N	
686	66	1	96687e09f2d25edada89f285d760cd9885a164c40623aac0f79d60a8d7c052b5	\N	\N	2019-01-09 21:54:25.804388	2019-01-09 21:51:24.246662	\N	
687	66	1	ca4b637717a1e7d4f890036278d3547293d895e73558e92b4ca05f1c58323388	\N	\N	2019-01-09 22:18:09.953338	2019-01-09 21:54:38.304575	\N	
688	34	1	83473c015a5f559fe1fb0b19d3fe4ce3d102b591ed67a975d8bf7a29c31429a2	\N	\N	2019-01-09 22:23:38.850424	2019-01-09 22:19:46.59049	\N	
689	69	1	17a24a1eeab9e36bb8c56b25076637fee982dafa69bccceda92592632183ce8f	\N	\N	2019-01-09 22:31:42.161328	2019-01-09 22:23:47.546608	\N	
690	18	1	5a6ede19295d85ec9ad5f92f0d8ee5cfcfa62fbadb21a7993322e2aa2ef0955d	\N	\N	2019-01-09 22:35:30.867224	2019-01-09 22:31:48.765141	\N	
683	23	1	e32235c663152039f8db15a5b10290218bb6fd9430d16b71a9dfb8ca63506032	\N	\N	2019-01-09 22:37:00.369408	2019-01-08 22:07:13.935326	\N	
692	62	1	d8bf53f976e087cbd995dc72c91260dfdf9dd827c9ccec97829d8fea0cf1e089	\N	\N	\N	2019-01-09 22:37:42.556244	\N	
691	69	1	2b5540e464c7645949a89aad44cef6d78c7378a8c2aab1ad5bdd2aa48eb870b8	\N	\N	2019-01-09 22:54:04.258235	2019-01-09 22:35:47.659661	\N	
693	34	1	98dab97a129b89fd78e8a071eb0a93cdda31d67221e1d126f6c039278f77d7a7	\N	\N	2019-01-09 23:06:03.380359	2019-01-09 22:54:17.410292	\N	
694	69	1	5e1887327ca8415ec6e07884f820fbb061b1b633c0a068d5327f61458bc3bc47	\N	\N	2019-01-09 23:06:51.54119	2019-01-09 23:06:12.210018	\N	
681	69	1	d3459c16514d897b7133f7963b27ee50c1266e713f9ba9392b56eaaca0933e5c	\N	\N	2019-01-10 13:30:35.209282	2019-01-07 23:37:04.576449	\N	
695	62	1	c947d984076bca36ab5897047e4fc0e341a7de727ac42eaa1086168e40c8ad5b	\N	\N	\N	2019-01-10 13:31:16.161985	\N	
696	66	1	8835c513832bfbd045babf3834e3479b8c3355f4032e1093e77ea491efb316b6	\N	\N	\N	2019-01-10 18:17:45.579471	\N	
699	69	1	3a9778542a0b740e24c03bdda219a3e0ce31f1464ba9f74de47e56f88035f2d4	\N	\N	2019-01-10 23:13:12.786948	2019-01-10 22:47:44.158189	\N	
700	34	1	11c86c0c67db0227557d33c85615947bd284fe2fcf85332e246583f3fc47bfc0	\N	\N	2019-01-10 23:20:35.634318	2019-01-10 23:13:25.900777	\N	
701	69	1	98ef6a5fb04f1d40cb9a2ca475632c0aa8c865a6879ad6723963173ef711f33e	\N	\N	2019-01-10 23:23:59.006558	2019-01-10 23:20:43.707261	\N	
702	34	1	e8ebdf645b435fce198da2e81e6b29dbe81103d27f5ab40f48634e7f04ff3318	\N	\N	\N	2019-01-10 23:24:12.732285	\N	
703	69	1	220815d31b8865f4eb71f5cdc956f0391f2a3d5a0506782db0ea79b157bab55b	\N	\N	2019-01-10 23:28:14.391524	2019-01-10 23:25:26.864207	\N	
698	62	1	6f6320f83605f1e78e985dee320a0e505d6bc1a51d0939bb3f0d65d574bc70c4	\N	\N	2019-01-10 23:33:28.27885	2019-01-10 22:30:41.508843	\N	
705	23	1	c060df4be59e6e240daee9d82604c6937b9b3ed71d74708c8b71f3e1c712f97e	\N	\N	\N	2019-01-10 23:35:45.832732	\N	
704	34	1	ec889753f2b2c1a50028e3b995299ff388cf89ff23e8f5d8de5e391cc8dbace3	\N	\N	2019-01-10 23:37:34.546229	2019-01-10 23:28:35.534271	\N	
706	69	1	43cb1a38056596d065ecef623e9140c002119526fb15e01bec365cb3dd913ad2	\N	\N	2019-01-10 23:40:54.175343	2019-01-10 23:37:44.198723	\N	
707	62	1	cf6331030a2ff60062423c1b19324747904ae6d09cca38bd9f44c1d687c3c0f2	\N	\N	2019-01-10 23:42:02.22486	2019-01-10 23:41:29.060943	\N	
708	69	1	ab6a50db8fb2170734c195da636c6857c02fb9e93a082da6c8d5a40b60978713	\N	\N	2019-01-10 23:50:16.238373	2019-01-10 23:42:13.601874	\N	
709	34	1	680d1bba247dc45b1ef454acada082dcc6bd7601c458134702c94a55048c144b	\N	\N	2019-01-10 23:51:15.095722	2019-01-10 23:50:53.00165	\N	
710	69	1	5bf16ca1f9e50a5171e791b730021b0c49fa1db21a3e6f05f67b3cd2d1a44b6c	\N	\N	2019-01-10 23:51:50.133882	2019-01-10 23:51:31.10643	\N	
713	8	1	ae33e69cc0caea07036c2156ec7e766d066e2f0199813c72eeaaa51bc0a19ae2	\N	\N	\N	2019-01-11 07:55:16.879355	\N	
714	62	1	e3c018a69968c3e1c055437285471619bad5b78a483456c3c4680c4db10a5025	\N	\N	\N	2019-01-11 14:47:51.11608	\N	
711	34	1	56d5784d702e7553ad1438c05e55625fb0c9748661d962e08a2d738ff19b7f59	\N	\N	2019-01-11 20:09:02.972848	2019-01-10 23:52:01.531598	\N	
712	66	1	e8ddda75b30d4ec31a97b8aa847752312faac491f5bac07f67fee6243e718ee9	\N	\N	2019-01-12 19:42:55.932891	2019-01-11 05:23:16.652342	\N	
717	17	1	e0d8d435bc4278c5dfdbe6a3a9797cc72759fa4ca2942ac55262e9ac49ced73b	\N	\N	\N	2019-01-12 20:31:07.711493	\N	
716	17	1	5f526274414b150048c19e8d7a7dfdf12970fad33caee963bf73f7d1f1d1eafe	\N	\N	2019-01-12 21:54:29.367981	2019-01-12 19:44:06.100712	\N	
718	18	1	14f7cf7382b22fba18fbe5fa52d898b53b3348a8734d3d54ca5f2ce1514287b3	\N	\N	\N	2019-01-12 21:55:06.341311	\N	
719	18	1	c0d3e46be70498711d823fdcf2b65affab6c73ea5d997bebc8f0d7fe38ae7ed3	\N	\N	2019-01-12 22:06:07.494414	2019-01-12 22:04:56.489586	\N	
721	62	1	94ec7a7a58ee5f7624907b0d1b6c75ab3e7bab078281a01ac2a4b1fa550d5b07	\N	\N	2019-01-13 14:01:16.765629	2019-01-12 22:30:59.693589	\N	
720	17	1	3704981fe9a157e997b9e9c1c9063a74f9ce53745ba6f81ac8b33413d76ae6e2	\N	\N	2019-01-13 16:51:18.955978	2019-01-12 22:07:00.456048	\N	
724	53	1	b1c9b0c573f82b626e68444c764f1c0d590c4a30b8f6b0b42f1dc8b641759cfa	\N	\N	\N	2019-01-13 17:34:47.517508	\N	
722	23	1	b3c862659cfb4828ff7d87cb22d519d3724918ed3bf63090098c5adf0e81257c	\N	\N	2019-01-13 17:49:19.102538	2019-01-13 14:02:47.348931	\N	
723	17	1	b8598e22e9309100d9f8e46139e15c799ceb6ec6ab32f89f877030aa7405d155	\N	\N	2019-01-13 18:18:28.191419	2019-01-13 16:51:33.959326	\N	
726	18	1	4c994f7dc7d0bc182aa453103caf1b45dc6da8b6cac81f5a00b5cc322330a6dc	\N	\N	2019-01-13 19:03:47.215556	2019-01-13 18:18:43.648011	\N	
728	17	1	3dfa1161fc59bd3d914044c8bed776e195283314bbd408f235056d1d5b7260f5	\N	\N	\N	2019-01-13 20:02:38.100228	\N	
729	17	1	d90b988a67b458d2a9ade188a2e70f589d51dbef7b6d308eda6f5b569d7986a9	\N	\N	\N	2019-01-13 20:06:24.049961	\N	
727	62	1	2b9666fa799f2bdcf3688ca132d032dd6743b0f6faa67cbafbd53e66587bca2a	\N	\N	2019-01-13 21:31:50.551336	2019-01-13 19:04:09.149063	\N	
715	69	1	3592080c5936eb1a44d75b32243539affdbd703943b74a3cf5b63af15ebe2003	\N	\N	2019-01-13 21:55:39.789403	2019-01-11 20:09:12.355765	\N	
731	33	1	174e0018deeff6ac5660e820e9296aacaf4afcd3f0e7ca18681a9635262b4808	\N	\N	2019-01-13 22:02:18.65766	2019-01-13 21:56:44.229293	\N	
733	69	1	4ab3cf0973bb3bf2b7627250ebed091abe1899e6176f620a7d085d828ce9c0cb	\N	\N	\N	2019-01-13 22:04:51.649959	\N	
732	69	1	ae99b6ee4fad920c1895466c73cff21664651e1c337a3d76e39e192952e69f9f	\N	\N	2019-01-13 22:15:09.599783	2019-01-13 22:02:25.415799	\N	
734	33	1	be608a075f83190a7b64d7008f64e64d9928e5fb67265b725ea65e05a0511911	\N	\N	2019-01-13 22:23:40.321151	2019-01-13 22:15:18.77994	\N	
735	69	1	89250ca1a748a31fc61d8c0e025e14a547f2796f5fd385858274aec408b441fc	\N	\N	2019-01-13 22:26:41.694067	2019-01-13 22:24:32.235658	\N	
736	33	1	a295852b26209c800e176e71b1e6db2c0cdecac8ba06a0cbb25c9fc4d265d095	\N	\N	2019-01-13 22:28:02.82778	2019-01-13 22:26:59.423171	\N	
730	17	1	57b2e7c81f44a5da13a01739289b78f19f5626d89d1f43614c0344b64faf05cb	\N	\N	2019-01-13 22:51:36.808094	2019-01-13 21:32:03.487101	\N	
697	66	1	0127e7dd256ed5acfcb1246b107c8402ee4094e5b09985e3d7182d4a4220fe1f	\N	\N	2019-01-15 19:08:53.942427	2019-01-10 19:48:02.787727	\N	
725	62	1	5bc9d2f46828afa8437d034e4a90abb218ea1571111f8cadb1d7d122d26bc303	\N	\N	2019-01-17 19:21:00.821839	2019-01-13 18:13:43.14557	\N	
682	69	1	77bcc4655331736fa0a06acb092d2b7f727d6396a42a86f1c61e4c8c9f6f55f3	\N	\N	2019-01-20 13:42:10.956651	2019-01-07 23:41:36.027593	\N	
737	34	1	41db226b4420ea02180da39b41f7b7938b220952b052458bb3d8e6cbc8b0515a	\N	\N	2019-01-13 22:29:34.962982	2019-01-13 22:28:29.460552	\N	
738	69	1	2caa9b11cbc438cd7d8ff102f2ed09ca39d0d3ff2b5f28b906afba24821507cc	\N	\N	2019-01-13 22:30:21.415496	2019-01-13 22:29:43.210263	\N	
739	34	1	ae3baa76d668ffd1a9c6ed3f084dfe876c3aaccc6e5cfc2173d93b74d227140f	\N	\N	2019-01-14 11:00:00.71138	2019-01-13 22:30:29.617339	\N	
741	69	1	9581eb19e5911c14739081e811cb3bb15bb746d0cc427dc2ee244dc56ede3b6f	\N	\N	\N	2019-01-14 11:00:09.586514	\N	
742	17	1	e5a75b3bae58dd06b078b0398143473aa83f756805483f305b8de7ef9037dcae	\N	\N	\N	2019-01-14 11:29:27.41715	\N	
740	62	1	da7322761a388733f32508ca541515237fa19bde29c47096d79e701c228b7bd9	\N	\N	2019-01-14 17:25:44.735873	2019-01-13 22:52:38.465442	\N	
743	18	1	f5de2bd9c8351cd06e111d331b8c4ee99f3d7b9603cad12dce939a5b3960fc9a	\N	\N	2019-01-14 17:26:31.069026	2019-01-14 17:26:09.058543	\N	
744	18	1	f803dd528dde91b78311411b3969725fe8dafc4b0ec77225d352fb96cf3d7b75	\N	\N	\N	2019-01-14 17:26:42.118311	\N	
746	69	1	5e083c158bf71cc09a65a82d78cb47890add605b3191e5dabd75365c815c524f	\N	\N	2019-01-14 21:03:58.890482	2019-01-14 21:01:36.354606	\N	
747	40	1	df7ec27e2a4c900bcd5817452c505bc2e928fa2dc88ccea0f36cae82470b3a33	\N	\N	2019-01-14 21:07:56.514288	2019-01-14 21:04:17.452559	\N	
748	34	1	730050b3e7ee7271935c6f2be56e1beb9a8820e4f2e59e7140b6f09bb2ffb17e	\N	\N	2019-01-14 21:09:21.456702	2019-01-14 21:08:13.725959	\N	
749	69	1	f035cdee2ab3011a588af0f57db14fa454ce72a1d1d2f98a7ac7433126f23ce1	\N	\N	2019-01-14 21:12:58.805347	2019-01-14 21:09:29.323438	\N	
750	40	1	b8a561691f9cf5d146c83dbf44d16d8b5ddf25cce9e3e11ff819e79b29afa4c4	\N	\N	2019-01-14 21:13:55.964453	2019-01-14 21:13:07.964593	\N	
751	69	1	40105fe1872e98a7ff7dff638e8a10fc072f2727f389d35a4171fd8770c95a15	\N	\N	2019-01-14 21:14:42.444638	2019-01-14 21:14:03.246168	\N	
752	40	1	a0adb4faa336ef078b7c1ae59f6d13b9a83b630f7ad3157199ea12474b971653	\N	\N	2019-01-14 22:37:37.690671	2019-01-14 21:14:50.370171	\N	
753	69	1	9548dd725d41132cbb0bcb69582871a09af016f9e27dd162fa7b158ca37958e5	\N	\N	2019-01-14 22:38:33.033002	2019-01-14 22:37:46.38149	\N	
754	40	1	ce884f1c1119972f033ab5eddbb200c32b2ee554f74e9f77938f49cb1f179836	\N	\N	2019-01-14 22:39:27.971524	2019-01-14 22:38:42.797737	\N	
755	69	1	3dd94c798f6226a80e86324415de26d82a6335bda6d6f9bb6e56168c665a92be	\N	\N	2019-01-14 22:39:57.240836	2019-01-14 22:39:37.116267	\N	
757	18	1	7f4a56c4938a0601fdc88ec3b7eeefb34a504252a830aaa1d2132a0f6bc9686a	\N	\N	\N	2019-01-15 19:09:21.367794	\N	
758	17	1	33f1e5139495b3bde474fd5c8919603967c69f4708c39093a1123551dafed127	\N	\N	\N	2019-01-15 19:11:17.666359	\N	
759	18	1	223ceeefb4291b37fdb4536ce87e08cca12fe8bb4534f46bd101df7105519522	\N	\N	2019-01-15 19:11:55.511518	2019-01-15 19:11:41.312023	\N	
756	40	1	70cf46f8a5177206740c6ea1e37a7e3a9f4098a6c87b68ab3f269dd726439485	\N	\N	2019-01-16 19:47:59.775343	2019-01-14 22:40:05.532539	\N	
760	66	1	39550cf97efea23b53fe4e5478712086074e918053dedd2f12690d1e05b54417	\N	\N	2019-01-17 18:20:54.359857	2019-01-15 19:14:11.253164	\N	
763	17	1	b30685c0304278426ad2dd30d799ff0bfe8e5677411e2152c0e0abee223c1ed2	\N	\N	\N	2019-01-17 18:21:08.954171	\N	
745	17	1	d7e1e1086acc0ea20b0f74753d3a2ca944f0b978afa4bec9f7ed276a05fbf547	\N	\N	2019-01-17 18:21:55.123938	2019-01-14 17:29:20.349819	\N	
765	66	1	1e29486b3141173bdfc91d90b3866f48cb9ff7c61e069062dc8b2efb9e6b1713	\N	\N	\N	2019-01-17 18:52:20.816723	\N	
766	66	1	f6d2d73fe785caf54ebf1dc7185b25b430c0b49bc7632630bb983d53db8a2d59	\N	\N	\N	2019-01-17 19:13:41.092894	\N	
767	17	1	c3f77641a5ea9095361e5636e312b64e7aec1acfddbf014f42cd6b186b8d3a15	\N	\N	2019-01-17 19:45:33.206724	2019-01-17 19:24:34.231843	\N	
768	62	1	13ea7aaf0dc7555f7bfa73f09d677a1201c063ae7591fbc0e7e41c2aa4f6445e	\N	\N	2019-01-17 20:49:36.755782	2019-01-17 19:50:11.903313	\N	
770	23	1	46b033e7815b065447ab553f33357ed7f0ce6ac6544374a902ce051630c15da7	\N	\N	\N	2019-01-17 20:51:10.875161	\N	
762	34	1	2d4c22b56842d33a97b2590ca6d492b97b3678a8a5f753b9c4d780c997d3c834	\N	\N	2019-01-18 11:37:20.064627	2019-01-16 22:23:48.984597	\N	
761	40	1	8ed99f7b7f534448ec79d462dc7180a5ea734f4ff91337984dbe83b3ce87c358	\N	\N	2019-01-18 20:20:17.566529	2019-01-16 19:48:11.790621	\N	
772	69	1	db3097a7fea8a4d10d7cc3ea46bc514da9ea0dbd9d28c502a33b5eaee7a5d887	\N	\N	\N	2019-01-18 20:22:12.981534	\N	
773	40	1	35484a122b2b4d2f162e02dd01dc77809fca4853bf72f24cf70417230d47e0b5	\N	\N	2019-01-18 20:56:57.748336	2019-01-18 20:23:40.378799	\N	
774	69	1	61cc2890a462f32970ab65dbe3e9f918970c259dad27662bb1d8672e56ccad94	\N	\N	2019-01-18 20:59:48.170808	2019-01-18 20:57:09.989598	\N	
775	69	1	f47669272ecb31fef0867c5f9817eb6cec93c64021231713443b28c618f26ddb	\N	\N	\N	2019-01-18 21:00:02.648894	\N	
771	34	1	8257e6632b8c7cb9480f97269832fd058da3f08b18628e0351d645d81b6fd5d7	\N	\N	2019-01-19 00:59:33.345934	2019-01-18 11:38:32.422658	\N	
776	23	1	325c9ef89bcb2cee9285dbd99ef81c6659e387cdb5c9632f27ffb6dbc81deafc	\N	\N	\N	2019-01-19 13:27:21.80333	\N	
764	66	1	2761ed2985bd899aa764373e8390f51ce3c35550b14a14240de25b58fb072dc4	\N	\N	2019-01-19 20:34:04.561364	2019-01-17 18:22:06.135988	\N	
769	17	1	292f0fcd05113219021f4c900a3dd59fc837e49c9a62c4011516197a4010dd59	\N	\N	2019-01-19 20:34:46.70434	2019-01-17 20:39:22.993283	\N	
779	17	1	0a6fa57c4f0c1848417e5bb0a6bf5190110454fb2288efdbfc139015d6b8195e	\N	\N	\N	2019-01-19 20:53:09.34194	\N	
777	17	1	6ec0f3ee4d750b6708aa7c607f4a1a4cb8cd2b44629a19febbb42c7387a79cca	\N	\N	2019-01-19 20:58:28.58278	2019-01-19 20:34:16.368353	\N	
781	17	1	47e74ab8ea98ade2829b8e70198547c1802c17e715e6e7f62eef6864ac2ff632	\N	\N	\N	2019-01-19 21:09:46.105341	\N	
782	17	1	5ef23adf31f1bf50038ae36848b43250d0ced0ff80a4ac9474b5546800c8e8bc	\N	\N	\N	2019-01-19 21:34:33.246623	\N	
783	17	1	254a211e8068505da477107f2cdf0954747bfabbf65e04e65ea368d57be99772	\N	\N	\N	2019-01-19 21:57:11.718294	\N	
784	66	1	fccf083e2c92659f665cf7e51e4dbed440bc39c47cbe6dc320cbbebe2f894159	\N	\N	\N	2019-01-19 22:04:04.077405	\N	
778	66	1	4717260522f0efe6f93aa743d4839043fc9ac356ee361ded2870640c601fb039	\N	\N	2019-01-19 22:17:08.385733	2019-01-19 20:35:13.950086	\N	
785	66	1	b6414a3c75f4cb8aa77ebcc18c748edb6c2ee78dd863063547563f6124df949d	\N	\N	2019-01-19 22:18:01.98309	2019-01-19 22:17:51.603516	\N	
780	66	1	2ab28545e884070b68298627c59ba6db71c254834525204fcc40b36f5647b4bb	\N	\N	2019-01-19 22:25:15.612252	2019-01-19 20:58:52.471791	\N	
787	17	1	93ff1ccc2786e6a3678b201f962e2acb9057c731d660e5c772f2e3b58947950f	\N	\N	2019-01-19 22:34:34.167429	2019-01-19 22:25:39.670057	\N	
788	66	1	33ad86589465ab5b40d1fe3be6e1f99e5bb79c535570b9f1d2873cf5d2db8e7a	\N	\N	2019-01-19 22:48:06.277001	2019-01-19 22:34:50.980261	\N	
786	17	1	4abc3767563845965ab5f30d93101f46711beaf548da3e088d9e4b3b80fb2ed4	\N	\N	2019-01-19 22:48:56.747913	2019-01-19 22:18:18.923744	\N	
790	66	1	7c18c2d9a61566b84422301d4770185e627a9965a1cfab032836fe40793aafae	\N	\N	\N	2019-01-19 22:49:28.069669	\N	
789	17	1	4b9a11eaf870703911a84a4843f0324fa4871611498a604ec572486202fea34d	\N	\N	2019-01-19 22:55:09.117523	2019-01-19 22:48:44.996912	\N	
791	66	1	01a936e13ffc54c2ab3fa36bb937559db1bae3cd3dc0150804f83dc8d010c24c	\N	\N	\N	2019-01-19 22:55:26.237509	\N	
792	17	1	c5235ef2c17341c4374f2f2ab2dd8f6da71c8126351e485243ba75d8c38b760b	\N	\N	\N	2019-01-19 23:00:30.59891	\N	
793	17	1	6de7e157db235a46d988e270af0d5ecbeacfb499a0dc4bdc7c5c82a885302209	\N	\N	\N	2019-01-20 07:37:27.339375	\N	
794	66	1	aa157ac93382b985bf75d30efdb6436104576ec8c84fca23496a15b3f9624c9c	\N	\N	\N	2019-01-20 07:37:41.728173	\N	
795	17	1	03c784fb4923d55d0899effe2103a62893d6a93c1fc1433202a5d88c0b2532f7	\N	\N	2019-01-20 10:51:25.677932	2019-01-20 10:45:55.629655	\N	
796	66	1	10994ba461d661703ae3d166c59a18be40ffbf1156fa12f41b4588613ffa3115	\N	\N	2019-01-20 11:16:41.181535	2019-01-20 10:52:28.113868	\N	
798	34	1	c265a8f2017fb86c1ecf850701446a977c59748191ffd505f1eda0d4e5863008	\N	\N	2019-01-20 12:56:56.592982	2019-01-20 12:56:31.357552	\N	
799	40	1	b18f6750531da5a0852614931f4f21dd548b9d8731820800a8e5ef3df411a876	\N	\N	2019-01-20 13:03:14.071997	2019-01-20 12:57:09.553743	\N	
800	69	1	f95d43b8ac3a10aac25f09bee2853740ee3cc70097897246b049aa1d159dc8a8	\N	\N	2019-01-20 13:18:06.411923	2019-01-20 13:03:23.033274	\N	
801	34	1	f71249ebbbdbdc760860a47b2315538a2eca251dc120be152c47b6dd9e2248e7	\N	\N	2019-01-20 13:25:28.530109	2019-01-20 13:23:00.905966	\N	
802	69	1	79135bbf21d866b5cf2edc0645dae1a6fb747f4e612795b49e3839d294239b6d	\N	\N	2019-01-20 13:27:23.349146	2019-01-20 13:25:37.39815	\N	
803	34	1	c929a0843b2ba3309010354fc4026e044d7d0647d64974aa9e5c82a368f6db77	\N	\N	2019-01-20 13:28:43.336123	2019-01-20 13:27:31.580378	\N	
804	69	1	ccd9bc4ab4d55fd61d00b1e4fc6b921c16ad297dae675cce90dcc339956e3adb	\N	\N	2019-01-20 13:29:26.86848	2019-01-20 13:28:50.924496	\N	
805	34	1	763aaee8f242a4ede53896ff6f8041b44efdf8c637498a4c7f3adecc836a3a0c	\N	\N	2019-01-20 13:38:10.327477	2019-01-20 13:29:38.431185	\N	
806	69	1	e78dcea9e69c6ffbae3cbf6d7fc5ac5d195f531cb16a5ac46bdb67436e22af43	\N	\N	2019-01-20 13:41:40.290922	2019-01-20 13:38:22.270871	\N	
807	34	1	afa8fb54595b564a9a688b81b11ec30788b4c6e1808ffacc2765c95f4b506520	\N	\N	2019-01-20 14:01:44.918465	2019-01-20 13:42:50.908916	\N	
808	34	1	69a04d748f00cc3c5a52760a95c1a1888048852ff676aee38e8db023e488b7f1	\N	\N	2019-01-20 14:08:45.280061	2019-01-20 14:01:54.970194	\N	
809	69	1	c360be32eae0a854accc011016e25d322927136b257d44fc02b7e542a9b3c519	\N	\N	2019-01-20 14:10:13.857017	2019-01-20 14:08:54.631205	\N	
810	34	1	a116015063de00a8c9d7707dff8784a65a1696cf2f6578ae2c161e254f4c9157	\N	\N	2019-01-20 14:11:39.524958	2019-01-20 14:10:28.565502	\N	
811	69	1	6f7ae400028f52b9fcc8c31fabd269be4311dfdcfdc8ff228ae3e16aa2ec2096	\N	\N	2019-01-20 14:12:12.614252	2019-01-20 14:11:48.848837	\N	
812	34	1	be1242871c61400f780254dc939eab1a8cc18c095005390f56fe01a892e6ec20	\N	\N	2019-01-20 14:37:27.348853	2019-01-20 14:12:29.863027	\N	
813	69	1	313eee9aa2150cfe54d3c44d741d19f726f93d2d15e4cdf0c68d5ba2849e99e0	\N	\N	2019-01-20 14:47:35.248731	2019-01-20 14:37:34.830837	\N	
814	34	1	a99db6d62acd82511d345b79694f962f06c2d7b268a66c173eeee9312fe98d8b	\N	\N	\N	2019-01-20 14:47:45.531833	\N	
815	69	1	bff3eb1af0252bbc1992a7c523497b8c0cbd2fc6461774c510279c0fa03de03f	\N	\N	2019-01-20 20:44:37.026785	2019-01-20 15:03:55.385397	\N	
816	69	1	cd6308c3ee908e3e637cf57c6b91d4aec2975405ac179bc9f86fe380d9793d55	\N	\N	2019-01-20 21:05:31.08703	2019-01-20 20:44:45.011357	\N	
817	36	1	42ed204da0dd4077c623a6ccca0d2e7ce368fa159eb8d7a32d0bb820ac547d92	\N	\N	2019-01-20 21:08:07.83798	2019-01-20 21:05:47.216491	\N	
818	69	1	4b2eab08cdc3bd7778470489269d2976d78368acfd7be019dde3d32533ffb895	\N	\N	2019-01-20 21:10:44.359796	2019-01-20 21:08:15.466165	\N	
819	36	1	da6681112db02b2746c3696f7061ecc80898d1910bb8328b98c3c5076aa19a64	\N	\N	2019-01-20 21:28:34.541785	2019-01-20 21:10:58.116403	\N	
820	69	1	dc3d20cd2781b069f3952916c2547daca6276682f2cff88f92fed615f3af3c86	\N	\N	2019-01-20 21:30:10.760278	2019-01-20 21:28:44.309207	\N	
821	36	1	7b3b3e13355d0e51f87cbcaa91ef470aced67589fae402c20143379083b0f8b2	\N	\N	2019-01-20 21:30:57.436119	2019-01-20 21:30:18.843778	\N	
822	69	1	cf724b3372cf3098e330de55a2bc5211a34cf57f1b05dcf466d75fcc58bde603	\N	\N	2019-01-20 21:41:21.693117	2019-01-20 21:31:06.869102	\N	
823	36	1	83beaebcc2c2cfb89232c9d7dd4f91f229cea8538bd8c78d808ffbf1983fa759	\N	\N	2019-01-20 21:41:51.599831	2019-01-20 21:41:33.891822	\N	
824	69	1	820c76a2e46b62177360abb2f194e2e17806140b89fdb8b4cc0d94ff1a69e393	\N	\N	2019-01-20 21:48:51.76106	2019-01-20 21:42:04.278957	\N	
825	36	1	472533f5e4045baf88bda97668d55a142d3dce48e509282e55866e7f7c2b7599	\N	\N	2019-01-20 21:50:51.932217	2019-01-20 21:49:01.696595	\N	
826	69	1	a286ff42666b7e8a9f7e25c5d44d5f0aed36d28ac55ee063f399e3a6191513b8	\N	\N	2019-01-20 22:02:52.258583	2019-01-20 21:51:03.476801	\N	
828	36	1	ef83eedfc8e73fe97377e854d9a98e25a79d0acd5bf6bf05adefe415110fff3e	\N	\N	2019-01-20 22:05:30.559681	2019-01-20 22:03:03.462327	\N	
829	69	1	a26688cfec585e474a44b8fac4973a67573636f3299a6863c13ec42ff2e51f4f	\N	\N	2019-01-20 22:07:15.120937	2019-01-20 22:05:42.444988	\N	
830	36	1	3b37aa31d65affb801c78cb0ee957b02be2555720f609b1dd6bcfa392736bcb6	\N	\N	2019-01-20 22:11:28.701031	2019-01-20 22:07:24.43775	\N	
831	69	1	5922a58443ae4b929097f48ab7d6ab61b48eed9a66c9887f8e0466d7c95ff7a3	\N	\N	2019-01-20 22:14:56.937212	2019-01-20 22:11:38.639092	\N	
832	17	1	ea7dd45916f125732014a23652889bd0fc578cf9788849948634e67c37f82d30	\N	\N	\N	2019-01-20 22:15:11.260885	\N	
833	36	1	9de2fd67577d1d5e34847120feedcd5043edf389597d2e35818e3220a37e24ff	\N	\N	2019-01-20 22:20:13.870853	2019-01-20 22:15:11.74081	\N	
834	69	1	cd74b30a85ef5f9739204e614585e774386386c7ccb146dffe42ee7fda78bffc	\N	\N	2019-01-20 22:21:15.299852	2019-01-20 22:20:26.724681	\N	
835	36	1	6362a1b29b660a082215b3e6fa55a1d4fb0d60e3510b4672621430c6915178cb	\N	\N	2019-01-20 22:26:59.373687	2019-01-20 22:21:23.998335	\N	
837	17	1	fafa6514a94c7b3ed0996099e4646bb575ac5ffe29a7c759b5cde126239c85d7	\N	\N	\N	2019-01-20 22:27:51.184997	\N	
836	69	1	f2de093f313b223ea3825d72585fe67a9312e50b493d47bd44052e3b96737a97	\N	\N	2019-01-20 22:28:45.79666	2019-01-20 22:27:07.887492	\N	
838	36	1	7df8c79260effac4dcaebf75b559e2019c43fbcfec86b9b94e64f7ca785023dd	\N	\N	2019-01-20 22:30:54.257626	2019-01-20 22:29:15.057641	\N	
839	69	1	a8f0db89adcc21519e06053fbd484a5e2228d6b60a2fc095a8aadc588b21a1d3	\N	\N	2019-01-20 22:34:50.529111	2019-01-20 22:31:01.103585	\N	
841	17	1	3dcbc622582f1ab558a69d8997540187ac55b7f245343e23185d5f5dba31b169	\N	\N	\N	2019-01-20 22:38:46.99967	\N	
842	17	1	cda3526269dd119c64d1436a84ebfadfc132d0c8d11e0802dedcce06b7ce3621	\N	\N	\N	2019-01-20 22:43:08.887262	\N	
840	36	1	1d15f3604c025ff7efca7dcd67d69288bee84a01a5a5d730572efcd4ec45fd1b	\N	\N	2019-01-21 10:40:53.441701	2019-01-20 22:34:59.804232	\N	
844	34	1	26e9b76bf59855e7ec4b325d46efa17598b5ea94207dec1d1dc9c154df5987bf	\N	\N	\N	2019-01-21 11:36:28.699334	\N	
845	17	1	1952ae82dd6f46006095d96b0dd757b3656bd15c8c4447de2fe2ecbf114c0fd3	\N	\N	\N	2019-01-21 18:39:17.148109	\N	
846	17	1	89d398e3b0fc09d832f516dba2397dc3f60a27c70755eae570a548c163a7731c	\N	\N	\N	2019-01-21 21:23:02.008283	\N	
847	66	1	15e997f11394fa61c001cc348ae9132aac8051a46a532c15ffbad53568e518d5	\N	\N	2019-01-22 18:17:59.460067	2019-01-22 17:25:10.505158	\N	
827	17	1	42bf1eb3b151614068f7218f5d5e8a01f66cfeb1ba96a9ece379c219fadb461b	\N	\N	2019-01-22 18:21:55.521637	2019-01-20 22:01:38.297241	\N	
849	66	1	194ba1e76195d233de87fede1be9a8fc07f95ec6d7063ff90d842ae857df8cfe	\N	\N	2019-01-22 20:14:40.462027	2019-01-22 18:23:10.377578	\N	
850	17	1	c74572b0f565c5c04e3c68b21945a3a6eb8054d20e7d85248076e0e59594b672	\N	\N	\N	2019-01-22 20:14:58.116826	\N	
848	17	1	b5963df23e0846ded09dfe2f27da7617cd2777966063024fb4148a64f81d8e93	\N	\N	2019-01-22 20:15:06.071153	2019-01-22 18:18:23.077905	\N	
843	69	1	39a02047e696d1d8306ce287cd19bd2ecb3c6eba4f38d71c706774826ea043e9	\N	\N	2019-01-23 22:21:04.795742	2019-01-21 10:41:00.976739	\N	
797	17	1	47e25685d048712e566f95c6477ce75f30bb7ee306000bf97dcf927678b24f7b	\N	\N	2019-01-23 23:54:22.116662	2019-01-20 11:17:24.641871	\N	
852	17	1	324857f7baea0d7e1ad156b099a532c14f9d1df058d98cc785506cdee3f57a82	\N	\N	\N	2019-01-22 20:20:38.601506	\N	
853	34	1	38c3431dc4d46f1ce32362b252bbb63c916d8e08460c8056766280867eaf915f	\N	\N	2019-01-23 22:33:06.060532	2019-01-23 22:21:21.783919	\N	
854	69	1	9b8634bd0eef221fb58ffe7961b3e69b1dd6b8c71b40640f3f371956d0ccf430	\N	\N	2019-01-23 22:37:53.556368	2019-01-23 22:33:13.326934	\N	
855	34	1	13fe5b144bc56c0de3f71fdaa983d1ab2cce5b20b5c300225df559387da8948f	\N	\N	2019-01-24 17:29:54.888026	2019-01-23 22:38:02.564231	\N	
857	34	1	b1a5dc3032e90e0fa6eb6592e116e16bf15aaa9c41b7f54e01592dae41de01fc	\N	\N	2019-01-24 17:32:47.061014	2019-01-24 17:30:09.253848	\N	
858	69	1	e432c94d2dd69a13c0e1c9127167509f08bdabfa9f5e8f36c566a1b305ee266a	\N	\N	2019-01-24 17:34:53.825906	2019-01-24 17:32:56.144276	\N	
859	36	1	3df6bc4f9e3791dba8c166373399bc70c9e729b4c5d606d3af32b21934ba9275	\N	\N	2019-01-24 17:37:00.280157	2019-01-24 17:35:06.594203	\N	
860	69	1	db1824e76e4ef21f332aff208869f72d10eeecfbbbb2f8512c932608976cd813	\N	\N	2019-01-24 17:54:10.479774	2019-01-24 17:38:05.926877	\N	
861	34	1	200ae94682f1e219a1d5b852670756f9bbee575ce028381133f018605db97d28	\N	\N	2019-01-24 17:54:52.106789	2019-01-24 17:54:21.450307	\N	
862	36	1	c83095c9e397fddb321e499d866aef1276f4f1a9f7d1d45e31f61a8f46f4db31	\N	\N	2019-01-24 17:57:25.217859	2019-01-24 17:55:01.621619	\N	
863	69	1	b9f63a24a71167811b75ec12a3d3c1ee5ba6d1759f4c50b40153e57060999535	\N	\N	2019-01-24 18:06:14.414935	2019-01-24 17:57:33.733672	\N	
864	34	1	1a5c7c50ce40d23f19b9fc4befcde40802235b1c1b234eff9fc2aff94b093025	\N	\N	2019-01-24 18:08:25.352192	2019-01-24 18:06:23.266453	\N	
865	69	1	65c81c28b9d063f39f670b95e67f9f668cf555b0eea1def9532e4eba6f29d1e0	\N	\N	2019-01-24 18:14:10.762988	2019-01-24 18:08:33.96911	\N	
866	34	1	c578e5b9b36fcc07dda7899a5ce216a310a13a77e549a59f9fd6965209e939c1	\N	\N	2019-01-24 18:24:03.804793	2019-01-24 18:14:34.599684	\N	
867	69	1	fc2574798953af98cbab831d94bad27889b3bc6c6bed3bc67b0621038ae6d33f	\N	\N	2019-01-24 18:24:40.158	2019-01-24 18:24:11.708399	\N	
868	34	1	b0e77c94422f49a32c7d4897bc980e8420ed5cf9de04dee8bf5fe4d71365e2a0	\N	\N	2019-01-24 18:30:12.021777	2019-01-24 18:24:48.717283	\N	
869	69	1	db2e30537ee7e67df9602a86745abbeb5243044f0eca4b1655f47a5337f60b4d	\N	\N	2019-01-24 18:31:26.515139	2019-01-24 18:30:24.87546	\N	
870	69	1	240172a428f037aa9b72fba5c7a2b760eff21f7d6cf443ab74a8851e47b7c226	\N	\N	2019-01-24 18:31:49.539814	2019-01-24 18:31:37.549406	\N	
871	34	1	8101249f9a1e627c2177129c39ba4c4fd077ed0a68c038ccd0c7887e062e8ab5	\N	\N	2019-01-24 18:44:18.190412	2019-01-24 18:31:56.082773	\N	
873	23	1	f31e42b565da3de7b9f70e6ab067c3dd7d1131de904543affba8e97e30a73e47	\N	\N	\N	2019-01-24 19:41:59.086643	\N	
851	66	1	ec3fe0045ee901ad58c6f42b919e737651fea644d28b13dd11f14ccd1a14d77e	\N	\N	2019-01-24 20:40:00.842628	2019-01-22 20:15:28.311474	\N	
875	23	1	76268d2e884b795f3480ec769b71d867c831c65c20a106f8f3f6266362a38829	\N	\N	\N	2019-01-24 21:13:47.096625	\N	
876	66	1	5b668ab89931ea375a992d48ffe7aef858483db90c0e2c34fc13f951d6482932	\N	\N	2019-01-24 21:26:53.321747	2019-01-24 21:26:10.828698	\N	
877	66	1	46558da27a06c56205d9e91af3ff98cfc01ae3020e811b451e7538caadeb70ea	\N	\N	2019-01-24 21:29:36.289227	2019-01-24 21:27:03.858193	\N	
878	17	1	5476180cfaaa9c5da85552174b972755a908fac2ccb6887234b04b2883a4fd85	\N	\N	2019-01-24 21:30:25.477865	2019-01-24 21:30:14.863223	\N	
879	66	1	be95aa4a2e8c5f93c07c123f1dd227cb5378757f1104d6f52e097bcc169b5d12	\N	\N	2019-01-24 21:54:50.225991	2019-01-24 21:30:49.179048	\N	
880	18	1	65a3a41179f2c972c0b888f1cecf35bd074fcc56c15e0ad250c7a5241b7c3b1c	\N	\N	\N	2019-01-24 21:55:15.05329	\N	
881	23	1	fa8341394c99a1ea772a4a27a5bc1077237aedb4df9112972f5f1ec61ef4eabb	\N	\N	\N	2019-01-25 13:56:35.720238	\N	
882	66	1	b5cee304a4b2ba3608bcb2987b58bdd58aa8276689e9a51cf3c55b8f6a52c5e6	\N	\N	\N	2019-01-25 14:12:08.405685	\N	
883	17	1	62848488d867515c9c541d3b95e6db3e332078483044e94fb7f441ff722e5c0e	\N	\N	2019-01-25 21:29:30.460351	2019-01-25 20:07:00.217672	\N	
884	66	1	bc69f4cd78626eacc17aaa152d0c52267545c93496e3c0ab354c09b659cbd7c8	\N	\N	2019-01-25 21:30:34.320201	2019-01-25 21:29:58.847993	\N	
885	66	1	f3330859f9863c089778304d7d0bd1c12aac85dc5a80f97432186b8b0c4d1fc9	\N	\N	2019-01-25 21:31:42.213009	2019-01-25 21:30:49.879497	\N	
886	66	1	4acfad2209d4918cfb042a1cefc7bdf02c3670b26abb310aff0f73f466c49733	\N	\N	2019-01-25 21:36:29.390261	2019-01-25 21:31:56.899236	\N	
872	69	1	e20a9940f5a89fafee985c7619e7e4528706edb094b944a95c9e09165897dd37	\N	\N	2019-01-25 22:27:57.989225	2019-01-24 18:44:27.556555	\N	
888	34	1	a33ee3bb0dcfad17c7f224a6349cf04715b67a228fa24df4bb05dcec734f4241	\N	\N	2019-01-25 22:34:39.59816	2019-01-25 22:28:12.35826	\N	
889	69	1	380a0999ec3b55c527887d3f8c6f04ef9ccb2f6d0b71f29bb824c1772c19a0e0	\N	\N	2019-01-25 22:36:40.911776	2019-01-25 22:34:48.611634	\N	
890	34	1	cbf99b5613092ed62b64a207f874c9a5e16867538ba5d37f14a92b4ae3c2d075	\N	\N	2019-01-25 22:48:08.634326	2019-01-25 22:36:49.886726	\N	
891	54	1	494066d556711ee3af97fabae5a821bec87c5f66cf76868c324892d445b7814d	\N	\N	2019-01-25 22:51:30.006544	2019-01-25 22:50:08.886889	\N	
887	18	1	b203135a3e48e799c723638a6566154f876f56e4d8b55756dcacf127bb669101	\N	\N	2019-01-26 07:58:37.179502	2019-01-25 21:36:42.138949	\N	
892	18	1	fa3fed7f4592bbf8e301cd0c534fbb9ac12f48dd32ae06bdf0d5c91a381d9661	\N	\N	2019-01-26 07:59:05.73238	2019-01-26 07:58:49.503113	\N	
894	66	1	5d1e925e4539611da93c7af34a5e7898409254773dc666fc3e63740265a87b27	\N	\N	\N	2019-01-26 20:39:12.255445	\N	
893	66	1	6f1d1f65007f5f86c7f57b1dbee26f183eb1f941b7304b2cdcd5fbbaad577215	\N	\N	2019-01-26 20:46:34.803816	2019-01-26 07:59:17.941229	\N	
895	18	1	8650dfc353a75073e1c5d2fb423444bd9e1cb1213693ba9e16ec073ecfade476	\N	\N	2019-01-27 01:21:53.01148	2019-01-26 20:46:46.896288	\N	
874	17	1	e3831b250e3a7d83cf9d244244d9ad6921559021e2121b8e62447829dd62ee0c	\N	\N	2019-01-27 01:23:55.08974	2019-01-24 20:40:13.406038	\N	
897	66	1	e09c2fe738a65bf44386b155043c8a427cff2f6e7fa40b8ab185ac7a4f5f23c3	\N	\N	\N	2019-01-27 01:27:46.145324	\N	
896	17	1	394db5e75dffec7a8542d7bc9ebc5ffb6dd4fc9011f2bb8d70a7e7168c8ac62c	\N	\N	2019-01-27 20:09:35.09722	2019-01-27 01:22:10.313376	\N	
898	66	1	71211df5dda0d34797ab2977b6cc3099f616d909e878ee5ba4f357adcc14bca0	\N	\N	2019-01-28 17:49:22.46648	2019-01-27 20:09:54.914209	\N	
900	17	1	db45e545eba698e7491a48f6bed91eb8b64b11c33cbdb51101dec75bacd1df1c	\N	\N	\N	2019-01-28 17:49:39.388864	\N	
901	66	1	f7589dc459226f38ada985563657144c744a9c31f4705a1938c717915c9b67bd	\N	\N	\N	2019-01-28 19:20:12.464912	\N	
903	69	1	c2e95636d0a711a6b17271b3b8bb2184880d25cde26e5e717df9aefa4efd063d	\N	\N	2019-01-29 05:48:10.948605	2019-01-29 05:39:05.468612	\N	
904	34	1	d39368a90828076ba2072c020ea92cd31a8ffd804a55f4f10ac9fa16499d2290	\N	\N	2019-01-29 05:54:16.85541	2019-01-29 05:48:21.801452	\N	
905	69	1	75595ed693ecdb017996f0e92124d4d8a86894b512bc6ffdc88c715c77ff2027	\N	\N	2019-01-29 05:55:14.4071	2019-01-29 05:54:24.61593	\N	
906	34	1	d049c6355cba38612cc990b72f12d3d0b43cd42172a609d70125b63bea870e58	\N	\N	2019-01-29 05:58:07.427413	2019-01-29 05:55:23.628371	\N	
902	17	1	ede3cd2058773e7217dadf0e479ba99995aa97c4b8801ea2fa504f53804f6832	\N	\N	2019-01-30 21:40:17.399774	2019-01-28 19:20:41.69054	\N	
856	66	1	9f34df604aaae6ab82c8e316cb822764ab287c4a8bcd5557997dcf13281c1c48	\N	\N	2019-01-31 22:51:35.165212	2019-01-23 23:58:22.668597	\N	
899	34	1	e4ba8d5eabd54c7e0e69e6f1ace80173456f7400b7ca79ba7e61bfa8319be74e	\N	\N	2019-02-01 09:11:43.913799	2019-01-28 16:29:07.393465	\N	
907	69	1	9e02b310fb25d4166014bbb60dc93ea1da858b8938249e18fe6f23e43a358b2e	\N	\N	2019-01-29 06:06:11.327067	2019-01-29 06:00:37.548118	\N	
908	34	1	3a61a4e2ec5a20fb82e4c8e56762bb7e8e20f4554c6e43e0355d4ff016fb185e	\N	\N	2019-01-29 06:12:46.635664	2019-01-29 06:06:35.043174	\N	
909	69	1	55f62e8a78a9bb63a0fe8c7d3c21ba3d4d9cddbfe8a6a61a69f844567ba61f88	\N	\N	2019-01-29 06:16:11.289113	2019-01-29 06:12:55.415773	\N	
910	34	1	1312fcb5bb64aff1cf4e11bf7cecb9b8c2627318414775ce286b8c782c3d9813	\N	\N	2019-01-29 06:32:38.539046	2019-01-29 06:16:21.953346	\N	
911	69	1	66f3972bfc2b99469fc1b89ee86933235bfc48ac8f4959c76c0f63a4adc907be	\N	\N	2019-01-29 06:33:11.827568	2019-01-29 06:32:46.739384	\N	
912	34	1	281d50ac0192518e98128ed7d3dba82e5414fb6f3a4898347bb537eedcec52f3	\N	\N	2019-01-29 06:36:16.982661	2019-01-29 06:33:22.658196	\N	
913	69	1	69ed1bf9c5b44076d14be5de6a39ca9fa548c0014f9811bf6f09bb7b5fa32f6a	\N	\N	2019-01-29 06:36:53.836552	2019-01-29 06:36:26.413993	\N	
914	34	1	815bf2d10701ace53cf2259091ccb1f73b4558b22983eb14749ee9f96ecf2d29	\N	\N	2019-01-29 06:46:33.726647	2019-01-29 06:37:05.629604	\N	
915	69	1	ef40b7f91a7a2d2d122cba030f547637fb55145408b3e7abc739bd0daa76136b	\N	\N	2019-01-29 06:50:30.787184	2019-01-29 06:46:42.488274	\N	
917	34	1	27f4ede11468f6792428925d8c67eabf269dd1f87e7458787c8c0cd2a6a1e7f9	\N	\N	\N	2019-01-29 17:06:46.865961	\N	
916	34	1	a48440f7ec014076946633da6c6b2b994f54ddd598fb56bc5d4de51cce900e43	\N	\N	2019-01-30 08:58:41.115625	2019-01-29 06:50:40.536053	\N	
918	69	1	48f4be2562f5fa18b83050a816c8326e6a8f542dbc402f46d4f7d5fa556f0f1a	\N	\N	2019-01-30 08:59:19.958465	2019-01-30 08:58:50.758514	\N	
919	34	1	1f69d05ab137df6b2c742c9394acc6510059865f94347899f97705fc6a741238	\N	\N	2019-01-30 09:10:11.844913	2019-01-30 08:59:45.8247	\N	
921	66	1	44bfaa8a4987cce26bb166f8456285c5283ab7ecc1126f438c0b8d35ebb4292c	\N	\N	\N	2019-01-30 13:24:06.105432	\N	
920	69	1	0964162d08052c7a6f5af2b51b34aad67f0a4516b8050596868a5c8af4abbd09	\N	\N	2019-01-30 16:55:45.635627	2019-01-30 09:10:22.463017	\N	
922	34	1	ea43d5fefab59ed68d8dd6951fe203980daafd0ed8ca8e6bbe2c0036c798c998	\N	\N	2019-01-30 17:04:41.800598	2019-01-30 16:55:53.845734	\N	
923	69	1	893db07da8c94f462995a9ee2630d41236fd70b4300dc905b7d7ac3ddb86b5f2	\N	\N	2019-01-30 17:07:36.63128	2019-01-30 17:04:52.868825	\N	
924	34	1	7a1982088a879987b876d8fc8229f47b9fba1f1073240d1c636ba1c22057247e	\N	\N	2019-01-30 17:53:51.962312	2019-01-30 17:07:47.453457	\N	
925	69	1	62c64970fbf45b89eeebbeb4e7f82ab290fe1493b02883d32078f8f20abb2d9d	\N	\N	2019-01-30 17:54:59.390135	2019-01-30 17:54:01.375695	\N	
926	34	1	f72aa46f122f466a80ed7266a1e2407d921076c9cf2872ea05e6761d11d0427b	\N	\N	2019-01-30 17:57:14.246207	2019-01-30 17:55:15.539658	\N	
927	34	1	06f7846d45dad19bdef5ab286e9f92ce6b8770c35558daf89efae9a7e61f3f4b	\N	\N	2019-01-30 18:00:12.87799	2019-01-30 17:57:27.822536	\N	
928	69	1	fb287c2979f25711cceff21b459e11c7c0fd59964e2cdbf5739184d9496a6d5f	\N	\N	2019-01-30 18:00:54.115286	2019-01-30 18:00:23.288808	\N	
929	34	1	616cdd1d786a46762e926892be0cb273c7c50959d012b9d44456de1b851b8fa6	\N	\N	2019-01-30 18:08:41.474276	2019-01-30 18:01:07.081899	\N	
930	69	1	d6ba1bd4453e3db845ce6cd994d0f228e0111ddef94e60881ee13dab8b1a1971	\N	\N	2019-01-30 18:11:00.05844	2019-01-30 18:08:50.727424	\N	
931	34	1	edf19fb741365d429e3acb6c039b53cb90d715ab38566a53fb3ea1ab1c51eaf4	\N	\N	2019-01-30 18:20:20.027293	2019-01-30 18:11:08.267872	\N	
932	69	1	20fb2e5f333daa88acaea062b74d1c5419c63869d389abc545927c379596dd6b	\N	\N	2019-01-30 18:32:27.995424	2019-01-30 18:20:28.01584	\N	
933	34	1	dd88c28f24a1431f4a7babc90349a3411efd6d28b1bc5baf0470c9d40476e022	\N	\N	2019-01-30 18:33:54.847548	2019-01-30 18:32:40.231107	\N	
934	69	1	c06341ae35d1498b1e880dbe79de1b6464214abd3c38d37c2c98c9132bc3751d	\N	\N	2019-01-30 18:44:19.856297	2019-01-30 18:34:04.980167	\N	
935	34	1	cf3200233c233f9d9bcc109ad6d8a88638eebeb25ea46371f2ee9ecafea1c00c	\N	\N	2019-01-30 18:46:19.320769	2019-01-30 18:44:29.192208	\N	
936	69	1	a6182834bf2de7c2f74a6f9237c2ef7769fc026a39e7ff34d10bcaffa9be443b	\N	\N	2019-01-30 19:09:10.909481	2019-01-30 18:46:26.690565	\N	
937	34	1	f29f1ac9c7a4c4a006c41b2087be64ef3ba98aa9b6cb6aa85d0a32906f0321c1	\N	\N	2019-01-30 20:06:21.695999	2019-01-30 19:09:28.712372	\N	
939	69	1	b5fa3ad8abbbe409bfb0a8a4a3befca693196021697584252e5c5040f5c3d010	\N	\N	2019-01-30 20:09:25.863924	2019-01-30 20:06:30.43637	\N	
940	34	1	3bb0feda354abe9822e822e32a18fb5408e1f5aa3e14bb891985d6570ad1e582	\N	\N	2019-01-30 20:46:35.505818	2019-01-30 20:09:34.342297	\N	
941	69	1	20bf2d8740a184f9b112840b00d6f8485be391e2c1777c1da35549fba0549c1b	\N	\N	2019-01-30 20:47:16.744311	2019-01-30 20:46:43.939386	\N	
938	69	1	a434ecf9486d6a0b38e01b834dbdfca6f62d04883c06ed7abf8d6f5d25785f8e	\N	\N	2019-01-30 21:02:22.63516	2019-01-30 19:32:08.193571	\N	
942	34	1	553b02a4b17d3cb971701fc498d860f7bb4a59385eba33f6dab89aa9824fbceb	\N	\N	2019-01-30 21:23:39.056751	2019-01-30 20:47:25.1231	\N	
945	69	1	663b5aa8e3e2c5b6e311385f1190b4971577c1c04e8d4e9234bd095e09fdbb8f	\N	\N	2019-01-30 21:33:14.448851	2019-01-30 21:23:54.593763	\N	
944	17	1	e7bf3b87badb478812cd6ba96f1f6614569cab78d6843cd708ef35a22125dcad	\N	\N	2019-01-30 21:36:21.928634	2019-01-30 21:02:38.694986	\N	
948	17	1	f38767f750913ff6c4a7fdf933b1b7509a298037cf52becea707d84384a78c95	\N	\N	\N	2019-01-30 21:39:07.038098	\N	
949	66	1	aa2562f658f976529e5a3cbd38b7e60e347d972f11b9f93f581603cd60f9d869	\N	\N	\N	2019-01-30 21:40:34.077102	\N	
946	34	1	75d97fc8b31e648c2aa71a9d241bfef1e8e07d1a26888a770f3f46c13e48003a	\N	\N	2019-01-30 21:44:01.720174	2019-01-30 21:33:30.339561	\N	
950	69	1	003a74dfff767acbf19507c3262fb1207279c5f65cb86f86c12d1f0188bfd7e6	\N	\N	2019-01-30 21:49:36.046242	2019-01-30 21:44:11.037978	\N	
951	34	1	812d103e1502a0214f6628e62d5b5a4d5af0c67e840a6fab7500278c134d19ea	\N	\N	2019-01-30 22:06:33.605824	2019-01-30 21:49:51.374253	\N	
952	69	1	77ff525f2068a8582eb535831f1f83175a3aaf6c1f3674925ed6d6b3e7fe9741	\N	\N	2019-01-30 22:13:09.536451	2019-01-30 22:06:42.566953	\N	
953	34	1	8cd1114c7ec3053a0a17d49d4e2cd184b0324946ae4b02b718892566c54ff9f3	\N	\N	2019-01-30 22:24:01.604836	2019-01-30 22:13:26.37012	\N	
954	69	1	d3a5382121da2aa882db85658efd57760c738771fd5f481f426596eb427a331c	\N	\N	2019-01-30 22:45:52.823823	2019-01-30 22:24:09.885679	\N	
955	34	1	ba833eda42be93dd57a770232b8fb16671639097b97c5a72685a689cdcf1491d	\N	\N	2019-01-31 13:02:47.113708	2019-01-30 22:46:03.645044	\N	
943	23	1	5a985b0f2e7c785fb7b3d035106935ec9d2a7caaa08d82fa9a2057580f382e92	\N	\N	2019-01-31 22:11:21.190524	2019-01-30 20:52:01.289166	\N	
956	62	1	74b0a3af976f949711f08f5bb7d2257a256f818e023ca47700a7f2b1a807e099	\N	\N	\N	2019-01-31 22:12:37.779427	\N	
957	17	1	9337d097704b8daa4a31ecc6e80d4aaddbfc26a9c1756dbfe3e07b56b3435ae8	\N	\N	\N	2019-01-31 22:51:59.160159	\N	
958	23	1	7ec59f1875498f29c8472eee25de3ea298f274d0c8db90744b956db52da3754b	\N	\N	2019-02-01 09:18:46.051416	2019-02-01 09:14:16.356145	\N	
959	23	1	f2c360f3bb70887df984a9d25739a51495ab0b1dc6efb66f6f50f3a29a8869fc	\N	\N	\N	2019-02-01 09:48:32.01211	\N	
960	17	1	d4b4d99121a86cbba045dd5a848aa5aae75fe794075776205177509aa73601ce	\N	\N	\N	2019-02-01 14:12:12.848248	\N	
961	23	1	e721df6f4544fa91fbb46d89ccd3759d6b06fd0a2f239693b53137f4e4127bc1	\N	\N	2019-02-01 14:56:56.955247	2019-02-01 14:48:40.214623	\N	
962	23	1	b72c82de1af50af31793ea6c2a9bfa52f94154dbda466073c635d6cda3d74b6b	\N	\N	2019-02-01 16:03:56.065213	2019-02-01 14:58:56.284261	\N	
947	17	1	8f30b979f76cca5449e24929e7fc505b9283c361898bb0dc12122d67d36f08fe	\N	\N	2019-02-01 19:01:06.702318	2019-01-30 21:36:32.213725	\N	
964	66	1	22f930886a5a6afc36f534a686dd656579c446fe1b56cae13603e1ac8ba95fa3	\N	\N	2019-02-01 21:25:50.533395	2019-02-01 19:01:27.305413	\N	
965	17	1	2cf5297ccaac01d57b2b5b94a1d6388b99c8f533c64ba15348cbad6db7979c23	\N	\N	2019-02-01 21:36:30.606904	2019-02-01 21:26:02.990734	\N	
966	66	1	2fd8ac3958c5708089d23b4202ef79ca621a06de9939ff2b4d992ba249261c9a	\N	\N	\N	2019-02-01 21:38:46.867827	\N	
968	76	1	3e2c7ce8c1eef3e70b1fd34c6143f015e74cbcf67d3c58df7b94e8ff59bbeed7	\N	\N	2019-02-01 23:13:51.077041	2019-02-01 22:48:31.968556	\N	
969	76	1	5c5d7a5e345aa40a753befc1f431ec56ca33247af93b3aabe3b24c97b3592b01	\N	\N	2019-02-01 23:39:18.9284	2019-02-01 23:33:27.751558	\N	
970	39	1	f5a048178f9db903c9afe471ede3f1a670c48552c3b4cb3e19696cf0977b061c	\N	\N	2019-02-01 23:51:48.511836	2019-02-01 23:39:43.729762	\N	
971	76	1	a7f0911f5309639c51c93a0f1099b0336b809cb8401e0704feef8a21e5bbdbd2	\N	\N	2019-02-01 23:52:20.271793	2019-02-01 23:51:57.882495	\N	
972	39	1	8d06c029ac2fe4a38b87b346daa65d9f713a88627d3bb9ee4fcecbe6eb2efa76	\N	\N	2019-02-02 01:46:32.936722	2019-02-01 23:52:31.242295	\N	
973	17	1	70b232c710680e11e61deb88690e7d6b1c753b4564edc8a013d9684b5907b10a	\N	\N	2019-02-02 01:47:06.895054	2019-02-02 01:46:40.680081	\N	
974	76	1	0d328a4a1673bf55260e6b0631bfc4ab30a00566917fb08d25eafb1ed6b358f2	\N	\N	2019-02-02 02:16:35.252244	2019-02-02 01:47:20.810397	\N	
975	34	1	68a7c6fed7e90e50daca2b50e4a08d0359beca3a544916672578f995e8a6fd8c	\N	\N	2019-02-02 02:26:32.119737	2019-02-02 02:16:57.406933	\N	
977	17	1	03907098e727ae3635ac01ef6af8d6ffcf9cbf0625ece440b5c2c92cc62e4d04	\N	\N	\N	2019-02-02 07:08:19.726721	\N	
967	17	1	3eda83af147181711e736f52cae26d17cab6cf01be2b79e093787f0c55ed8871	\N	\N	2019-02-02 08:57:36.136917	2019-02-01 22:45:09.585537	\N	
963	62	1	caad5aca2c116dde4970ba0146336709b4265270a92da8a05d0105437e66ca41	\N	\N	2019-02-02 09:06:18.329347	2019-02-01 16:20:20.362183	\N	
979	23	1	d23c6304ea9858da94db74d8a76a96d0dea902b1bde8f214c08b27d1b3e64c28	\N	\N	2019-02-02 15:36:57.239415	2019-02-02 09:07:45.079498	\N	
980	62	1	697eeb7d79be678cb23114863ba6889e19405d0dc9485baef7938ef40d939876	\N	\N	2019-02-02 15:45:56.744795	2019-02-02 15:43:06.921016	\N	
981	23	1	0a1d5485c2bb2bda85ad7114224aa47dea4a9175f45c9f5a322f0f53b6b35c48	\N	\N	\N	2019-02-02 15:46:45.070219	\N	
976	36	1	8be129a912ecdeb804f44a1f183dcc47bac64daa6da79f4bd36ad1dbf0d2f55d	\N	\N	2019-02-02 22:42:44.14615	2019-02-02 02:26:54.941605	\N	
982	34	1	f890cc703df05cf6f2cf1782237a625cefb3f0b9424c70dba0c8f0daa17a7fe1	\N	\N	2019-02-02 22:46:40.568019	2019-02-02 22:43:03.386491	\N	
983	39	1	e6f5c653c5b662475cd338142c065c2849527e04b472854db6be47ed7a88bb8d	\N	\N	\N	2019-02-02 22:47:02.455524	\N	
978	66	1	891094939c714b7335d25d5b0c8842213f436d8fc13c0e034058db385dbc42ae	\N	\N	2019-02-04 16:17:12.25997	2019-02-02 08:58:06.21784	\N	
984	17	1	ffaca75db08dcd709221d866aa94e69cbc3201a65ef0313423f35f9e24298874	\N	\N	\N	2019-02-04 16:17:39.753918	\N	
985	62	1	e58d502f631d6af7ed3a81ed2eb5eaa41e13fc2e848173268f12037d3b35315c	\N	\N	2019-02-04 17:18:52.019524	2019-02-04 17:18:25.360382	\N	
986	23	1	72d913ea431e6906d407324d8d216d3ee8bfc09ddd6826916288ad8a3869d8bb	\N	\N	\N	2019-02-04 17:19:42.980971	\N	
987	23	1	052cf0805f0bc9bf6e14d1d96c69bd63e5069618a8f1cdd88198d53868a7160c	\N	\N	\N	2019-02-04 17:24:52.282725	\N	
988	23	1	878ac6fef5a0199fdf819f9834bc274d4389adf24ef5faac8010fff92f738f91	\N	\N	\N	2019-02-04 17:45:24.076354	\N	
990	23	1	45729e99efbb591333977a61773dd7ac3cc26a984eb06e607a0be31c020d04d9	\N	\N	\N	2019-02-04 20:53:08.299699	\N	
991	62	1	4fee03762f5d8f0593703286fa64ba7c2ab3f59b1f76879c54631f0e6124840a	\N	\N	2019-02-04 21:08:17.454652	2019-02-04 21:07:49.103321	\N	
992	17	1	8fd73e120effae879e6fee4585717baf71ecfa6cf6c595065a0ee9a5b7fcfe8e	\N	\N	\N	2019-02-04 21:08:30.422232	\N	
994	17	1	7a43db09e32512eec5db7e2a24cfb7dd702ca2efc8d800d2560814d37deca724	\N	\N	2019-02-04 22:31:26.349803	2019-02-04 22:09:23.568662	\N	
995	62	1	d6625c3c89a55e41ec1e8d2468eb7a3707e2f4e1bdb3ade94ea4528ec77b094f	\N	\N	\N	2019-02-04 22:32:13.729533	\N	
993	76	1	e32fa4fea0852dd68ec9e0b46f33715ee3d63932106cb8f85ec62094a17990a5	\N	\N	2019-02-04 22:53:10.964263	2019-02-04 21:54:03.117964	\N	
996	78	1	904b0f3214c53711d6ecf45fb299943c61b20a17af522e3828897c76018b4d6c	\N	\N	2019-02-04 23:53:37.085248	2019-02-04 22:53:20.092865	\N	
997	34	1	577b4098fc66a92e8b2d5c8e75a8806d73b82472e27d6e5a1d2b3766166a3c0a	\N	\N	2019-02-05 00:06:34.185505	2019-02-04 23:53:52.007277	\N	
998	78	1	4d33d1562bd16f7e788e8db55a4fd753df6820f89d8be96b97d11333d609c8ac	\N	\N	2019-02-05 00:11:38.166572	2019-02-05 00:06:46.08295	\N	
999	34	1	4d8b4b5770389d60fbda54672f6f33b27a328b0f3db777168410fbc3ccb16e9d	\N	\N	2019-02-05 00:19:41.487051	2019-02-05 00:11:51.191608	\N	
989	23	1	49d960d5857c79d87a87419efe36e7bb862414ca6437a776a56e814af3035401	\N	\N	2019-02-06 09:39:26.544399	2019-02-04 19:15:52.129929	\N	
1001	83	1	d7b059d1cbefd3c01c9ef1d9878269e81deed9eb49f6c096483593e33face53e	\N	\N	\N	2019-02-06 10:09:35.815708	\N	
1002	83	1	c258ab48e0d85a8567bf0b1fa1d2dc9ca1c294505099aeac0b69bda421e0a4a7	\N	\N	\N	2019-02-06 10:24:10.831139	\N	
1004	83	1	9673c1a952a1cb5ddf973dc533babad0fb1c44cb3bd6c478e3077d24415f122d	\N	\N	\N	2019-02-06 11:48:26.150023	\N	
1003	83	1	f7e09b447dcbe137a799386277736ccc03e94beef99ab9a66d2338c8e0489485	\N	\N	2019-02-06 12:02:07.475066	2019-02-06 10:47:41.383662	\N	
1000	80	1	7f5e24a4c8cbb322fdbfb88d2ed4990c4ae11503724006de4450cbf67226bb0c	\N	\N	2019-02-06 12:10:01.181463	2019-02-06 06:43:27.699299	\N	
1005	83	1	600bf56207cd3b73ecffc1ebe769c44d89f57b115f55842f01ee3f8f46616fe8	\N	\N	2019-02-06 13:24:27.02288	2019-02-06 12:04:36.955298	\N	
1006	80	1	7b96758bca46b349cd53094167559f03dc0a0561b515fcf90089375459405cc6	\N	\N	2019-02-06 13:24:45.041627	2019-02-06 12:59:50.968125	\N	
1007	82	1	90ba62f64431f4aa4f97ebcb1260a20ac8dcb9f429689e16495525da674a72fb	\N	\N	2019-02-06 13:25:29.010606	2019-02-06 13:24:52.425919	\N	
1008	80	1	8a126e6e28d1ecceaf7bfeb08e5655a4eb2a21d1f05d4caa6169eba8573ec1f6	\N	\N	2019-02-06 17:40:09.795609	2019-02-06 13:27:04.990973	\N	
1010	82	1	71366ad2f2eb92a24b36311f8d54b83a7b14091ec898c9a317e5b411bff2d375	\N	\N	2019-02-06 17:42:24.510407	2019-02-06 17:40:16.79017	\N	
1012	82	1	9408f0c3881ef9054d7bd81d47e8251ec6a7f9295adbdbac8f488fec92eb751c	\N	\N	\N	2019-02-06 17:54:58.037457	\N	
1013	83	1	67db714df7ba3eb02487527cc4d616e404fb30861956ef62f5ced49bdb3b6ea2	\N	\N	\N	2019-02-06 18:03:19.390996	\N	
1014	82	1	10bbed32d0eaca586e01290c51e6cf85b4ff093e1cbc87f057037df60cd2afab	\N	\N	\N	2019-02-06 18:27:47.921211	\N	
1016	83	1	b9f29dd66cf93c0b97944f8d73c0dd9431e6cd3e586d631dfe0c974034f8ac81	\N	\N	2019-02-06 18:46:05.729984	2019-02-06 18:45:09.159556	\N	
1015	83	1	dbdd9a4663d67249e839b25a5288fa735e8d22a06d267ece29347b7a14e37fa6	\N	\N	2019-02-06 18:47:17.205015	2019-02-06 18:36:17.083631	\N	
1018	82	1	369e9559b53effd0f61a48b1026908070d172fc26e84c4f5d571e3f82a34250f	\N	\N	\N	2019-02-06 18:47:32.919671	\N	
1019	82	1	8af3f9e7cc63783b66383bfb19d114eb723cf510a2a7cfa69530c036c7353d81	\N	\N	\N	2019-02-06 21:07:40.988872	\N	
1009	82	1	11a1908510abc6b5d3d38e87f70adff1daa1f1c68389d3546a4eb12cb7da5d8c	\N	\N	2019-02-06 21:41:39.598796	2019-02-06 13:34:36.676891	\N	
1011	80	1	f7cc7dc64462ace80d61cca54dc40d5e93742514704b397210578c8416135d50	\N	\N	2019-02-06 23:10:09.569126	2019-02-06 17:42:39.08741	\N	
1021	85	1	681cd3947f9a7878105ae433aeed2f1be5a57654a249b4b5e05059992f30d154	\N	\N	\N	2019-02-06 23:10:21.817295	\N	
1020	83	1	458f388ab796a7d074b262c0d940e6fdac1f6d084e416f7468e5ca149250aae5	\N	\N	2019-02-07 09:38:16.033536	2019-02-06 21:42:06.511338	\N	
1022	82	1	bdc2296eb02054e6d64ec3e6a7a120475c5fa2c0ba4da2e063d0805d72cca8d4	\N	\N	2019-02-07 09:47:06.048245	2019-02-07 09:25:58.27376	\N	
1023	83	1	44835a78e9e69aaec3cf1ef28fb9971fffd0a04ae435f8ceb5a72354521900d0	\N	\N	2019-02-07 09:48:04.020256	2019-02-07 09:47:24.485297	\N	
1024	82	1	5a6e998a5200d5dade572af043d32901bfe9a32b5fdaa5e5aea47d640f7b2a12	\N	\N	2019-02-07 09:54:07.26173	2019-02-07 09:53:51.746476	\N	
1025	82	1	b65baf2f4d8ab2ebdc4651596d35583cfb34bac4bdd4eca0d2ea99ae38fde08b	\N	\N	2019-02-07 13:52:10.45268	2019-02-07 09:54:23.053606	\N	
1026	82	1	384eb80a21db71417ec04f78898f7a7cc5c0785eab8734b6ceccb30c0800405e	\N	\N	2019-02-07 15:10:23.324236	2019-02-07 13:58:55.333198	\N	
1027	83	1	eb3faf255622f1cd8fd2fb6557bf4f70bd2b9d624b162002bc68799512d9071b	\N	\N	2019-02-07 18:35:23.385595	2019-02-07 15:10:59.057668	\N	
1028	82	1	9b51af10c8020db2a967d11181b98dbf9aeb4bc0cb7cb617f26356416cc9d21e	\N	\N	2019-02-07 18:39:14.404289	2019-02-07 18:35:40.561232	\N	
1030	82	1	44866373449bcc2166ce2c1638c9f4d756db784bdc518715652b202bf1c9c3e1	\N	\N	\N	2019-02-07 18:52:08.050841	\N	
1029	83	1	5f2e04305040ae3ea8ca92706f35d365e68224b43912e5379053e666b88afd55	\N	\N	2019-02-07 19:12:55.986683	2019-02-07 18:39:31.772977	\N	
1032	82	1	0eaec76470aff189a53635e42076d9b555134cf14c20ac924a6370608b84db5f	\N	\N	2019-02-07 19:55:53.607805	2019-02-07 19:35:04.200658	\N	
1033	83	1	8e9ad6f4d650975104dcdada5136001d8b2b8f43226e0d0059a4e8693eeffa32	\N	\N	2019-02-07 22:37:12.377955	2019-02-07 19:56:34.272203	\N	
1034	82	1	1ff7109d6f0077f96bc7a015595726945cac40c99195e4e5aadc24d9b8301c5d	\N	\N	2019-02-07 22:50:21.205964	2019-02-07 22:37:27.684165	\N	
1031	82	1	d285185fd7871f74913b128599aaea0072ba68612db196c14c7f210944e58cc6	\N	\N	2019-02-08 05:44:13.818325	2019-02-07 19:13:18.653779	\N	
1035	83	1	2282d7267485ffd0fbb8e1b27ad32bedfe194d139ecc0976e14520e31258714d	\N	\N	2019-02-08 05:51:06.561757	2019-02-08 05:44:33.093309	\N	
1037	82	1	60f33ac92dae1b1083b681ba5afd4031be9f016a0893c4f3e9c0533a8ab08f50	\N	\N	2019-02-08 07:37:44.268045	2019-02-08 07:19:07.345738	\N	
1036	82	1	b64c9b6064d4d92ad84bed942ff91ff8d7440579cc71812bed6dc983e90a45b8	\N	\N	2019-02-08 07:51:07.96146	2019-02-08 05:51:21.165375	\N	
1038	83	1	e36597f6aca4eecfda5002cf5083b88b21a125cf3918f656dff8ab37b4918a92	\N	\N	2019-02-08 08:00:23.121016	2019-02-08 07:37:58.825466	\N	
1040	82	1	e4315b3590ebc220074403aa7510c072de8fc7067bce9b1513edf192a462d7da	\N	\N	2019-02-08 09:13:23.555775	2019-02-08 08:00:34.665579	\N	
1041	83	1	0721919bc95c5a2b9df1ae21b260819bef6273fdf83b9b2e7bf3e71ed0f4b39b	\N	\N	2019-02-08 09:23:03.626004	2019-02-08 09:13:38.020793	\N	
1039	83	1	36c950062ee1c232a0c1e234c23702c0ac34ab461ca4af4871c649d35eabbb69	\N	\N	2019-02-08 09:29:32.382996	2019-02-08 07:51:23.40759	\N	
1043	82	1	9b2b6d94d082fa205fec41a9a724c8ecb6e0773a5734084685127eab5da42503	\N	\N	2019-02-08 09:39:11.795606	2019-02-08 09:29:58.177838	\N	
1044	83	1	9b1f3513aa73f952d149cd3f8710387e8ca59c4e14d8ee5a5b4ed34d4db22f96	\N	\N	2019-02-08 14:26:35.653744	2019-02-08 09:39:33.659841	\N	
1046	82	1	a55499223c0b1ee3e8aae522dd624b2906dadce9df645045bc49e9c4e23e4bfd	\N	\N	2019-02-08 21:47:04.902729	2019-02-08 21:44:14.564746	\N	
1047	83	1	57d8dd37997d12df828c5dc407eab4ac753eed6bf04db0896e884f58e47fee45	\N	\N	2019-02-08 21:47:56.505984	2019-02-08 21:47:28.592532	\N	
1048	82	1	3f2f785d641cbe75e3024115e32441c8201464c5e1388b98df5661c4db234d68	\N	\N	2019-02-08 21:50:37.465803	2019-02-08 21:48:07.516932	\N	
1049	82	1	041589cb06e96a4fad77bcea9d271d00b6d216444761001b3cfeafc8cbd346cb	\N	\N	2019-02-08 21:54:09.580686	2019-02-08 21:50:47.191064	\N	
1050	83	1	b1ff7c7bd0b7d8d1378d987070ecdd87d59462eb3c794f3629ea75ffd24626a4	\N	\N	\N	2019-02-08 21:54:26.424735	\N	
1051	82	1	eaebdeb30ba6634e21fec6246dd37447d00725095f1712a6259b9331c51ba062	\N	\N	\N	2019-02-08 21:57:33.845435	\N	
1052	80	1	d74997599c83d534589ca6ef334cac22b4a3f5cc6b047e525242b55b06416496	\N	\N	2019-02-09 21:33:33.902003	2019-02-09 21:32:44.154946	\N	
1054	82	1	71b2f599e03cdc04d5b413db6bbb65d0cd63bd96f6ae4e2199ffd86f0f0f9000	\N	\N	\N	2019-02-10 12:37:11.271743	\N	
1045	82	1	9f8a3322ced80c9d1225564d858499556c32872f968efc9874002788e356d62a	\N	\N	2019-02-10 12:59:50.416674	2019-02-08 14:27:22.015871	\N	
1053	82	1	4f5b68c0ccf698e30fd141cf87329a7836d65f979730f932d7b6bd6ec71d0389	\N	\N	2019-02-10 14:57:00.369423	2019-02-09 21:33:41.452408	\N	
1017	82	1	661c1309b83d0e391c9a54056e23dec3425d32029b465d35ba4dba1e1eaeeb1b	\N	\N	2019-02-10 17:54:32.597409	2019-02-06 18:47:08.508158	\N	
1055	83	1	792d960fa5c78ed35baf4510d3c42ecdcd36fa746c1fdcf9c1a59cd64fd20fb3	\N	\N	2019-02-10 13:16:06.980797	2019-02-10 13:00:07.308827	\N	
1057	80	1	d855a6edb61df708f4b610b290c5f11cb736390edee8117424c526d7b0f57a19	\N	\N	\N	2019-02-10 14:57:08.830046	\N	
1058	83	1	4c38f3d9438556e392cb29080c3bd04a5c8c5a7aaafbf755227ba246bd901d64	\N	\N	\N	2019-02-10 17:54:49.341417	\N	
1056	82	1	cea96216671726c5697ccee9694c5a64f3085d17af1a83384c6659611b1136c4	\N	\N	2019-02-10 18:00:22.480177	2019-02-10 13:16:26.179532	\N	
1059	83	1	f99460b207eb9e8b8108cdd2603b3f89ae10e3e97bc046a3a7d674bcad1bfe0a	\N	\N	2019-02-11 05:52:12.949959	2019-02-10 18:00:41.937386	\N	
1060	82	1	93c271ac13430b6c15cb8a2f0c941aa077ab3b422cd9ae8096e4fcf2ba7dbeaf	\N	\N	2019-02-11 07:22:08.51784	2019-02-11 05:52:35.958908	\N	
1061	83	1	015b15dfdab3429f6524f465a243ebf78cc4fb5bbca6c8922c5e446c631fae12	\N	\N	2019-02-11 07:22:50.47431	2019-02-11 07:22:24.572318	\N	
1042	82	1	14cfe81509697140960da7883b616d948133012f3acccb48aaa0c25f0ba866e1	\N	\N	2019-02-11 07:35:07.999346	2019-02-08 09:23:12.341743	\N	
1062	82	1	8851c6d248605b202d65fd8a46bd5cab485b603e79ba8fbd4fc240b0fc696da4	\N	\N	2019-02-11 13:59:03.839544	2019-02-11 07:23:05.326765	\N	
1064	83	1	60b8ce97aaf30647c2946f97750acf5d33b1352f81de459810cceea069a8abcb	\N	\N	2019-02-11 14:10:43.116871	2019-02-11 13:59:20.787559	\N	
1065	82	1	dad31ea0f418635c33e7bc946a0fa57c287df9befbed55f14f31d93fb62b5b8f	\N	\N	2019-02-11 14:22:37.378188	2019-02-11 14:11:03.544494	\N	
1066	83	1	142a77e3149a62700fca0ba2337ea9ee879378bf900c97fb83c5938e1e423e0b	\N	\N	2019-02-11 14:33:47.526678	2019-02-11 14:22:54.132457	\N	
1068	82	1	c0cc317c61bac074d92a4932cb6c10a6efc8aee6a60c6bc7bc7cc05e85553eab	\N	\N	2019-02-11 18:34:05.01529	2019-02-11 18:32:03.207403	\N	
1069	82	1	5861e543debae99018d31231c3500de8df8e15aae1a3bd4c7ff2c29771d5bcf3	\N	\N	2019-02-11 21:53:46.633563	2019-02-11 18:35:58.591965	\N	
1070	82	1	5ad18c2dbd96dfb6df98479a4112636e7d8d43d05d1a7dc237fdaea5cad31e3a	\N	\N	2019-02-11 21:54:49.769884	2019-02-11 21:53:58.065995	\N	
1071	82	1	797fb1785c088128ddf7b7823e3384f7cc09db19c4c9fc73e9f67199ecf1cb57	\N	\N	\N	2019-02-11 21:55:04.88511	\N	
1067	82	1	648202566143551d477dedf7d71401a1e72e6a702757ae4374055ed7e2d71a88	\N	\N	2019-02-12 10:53:34.608123	2019-02-11 14:34:10.247421	\N	
1073	83	1	10622ef89ba0945309b28c7e00ac2c05eff8e31cf081ad063d3a6f506edbed59	\N	\N	2019-02-12 11:09:32.316403	2019-02-12 10:53:50.764672	\N	
1074	82	1	ba83c4340a63a914a3ba914579a4ad904aad90aec09a6cde9adfee566914612c	\N	\N	2019-02-12 11:26:46.736944	2019-02-12 11:09:49.123989	\N	
1075	83	1	4c2e549856b345131d671525480636e6bb48fad1ae2b16911f3b7f6e4e58200d	\N	\N	\N	2019-02-12 11:27:12.573614	\N	
1076	82	1	9020b54dea115ecab8537edb68692b120b0e07fe94f81f328659885e959294b5	\N	\N	2019-02-12 14:13:32.988877	2019-02-12 14:00:07.376541	\N	
1077	83	1	d94057b04292050c467baa8f2ca8e64557e4d2f6b3db2e7d829d54e370d28ae8	\N	\N	2019-02-12 15:10:31.903446	2019-02-12 14:13:50.878923	\N	
1072	82	1	59ca5a5eae07554e83cb1eb20294d6e46508f748c70a5d9f8136eeaca035bc36	\N	\N	2019-02-12 20:19:22.308724	2019-02-11 21:57:56.341768	\N	
1080	82	1	5942d49c1fdaeab65f88271bfe8390cabfaae91a95b764ddac1fd00c05b42fed	\N	\N	\N	2019-02-12 21:35:39.279794	\N	
1081	80	1	58e9806de87fcb9a14a149b42bfe295050ed05e8747e776d0b743a64f5aff8a2	\N	\N	\N	2019-02-12 21:59:33.172005	\N	
1082	82	1	3980147226acd0c47b27ade186a65e326db6ad15854d7b97706fcb53f4d8828c	\N	\N	\N	2019-02-12 22:01:35.876633	\N	
1078	82	1	40c9087fbd3121d33b7c5a6d891d7040c58846dcff82c3307cb53445d024d590	\N	\N	2019-02-13 07:52:42.783663	2019-02-12 15:10:57.7436	\N	
1083	83	1	311c365819c3ce2246b0d771806e69a96bfc1666342a196e3628fcc205a9109a	\N	\N	2019-02-13 07:54:40.788406	2019-02-13 07:52:58.556275	\N	
1084	82	1	e270007954dcf3e9e211f108ca5d1dbe870ff79413e8e81dba2ac5d6a4be4fd8	\N	\N	\N	2019-02-13 07:54:56.613971	\N	
1063	83	1	a64f694dc8ddda422f20e122d219af37d8cb3ed2b1ea4a3436ce24b404190049	\N	\N	2019-02-13 08:13:01.70092	2019-02-11 07:35:24.552759	\N	
1085	82	1	06ae95ee595645a42b7a2dcd02d6da3839fd74839ffbb22ba0cf29ecd2a6bb27	\N	\N	2019-02-13 08:29:35.831752	2019-02-13 08:13:12.809769	\N	
1086	83	1	4c2ab96d677196f203ff02b1e0b9a98008a7e55c5cfb228428394358230df679	\N	\N	\N	2019-02-13 08:29:54.663947	\N	
1087	82	1	2ac332591494560b35ab5f034c773b7f1769cca1418e04dcce2bc6c6955bd416	\N	\N	\N	2019-02-13 20:00:42.620892	\N	
1088	80	1	98b2ad1fc88729b4e8024dd46c10af5237302271d0caba6d57215fb92230e85e	\N	\N	2019-02-13 21:02:25.458535	2019-02-13 21:01:52.382423	\N	
1089	82	1	d42cf97daf2a33c7d3ae2dd98b465b8a6fefe87107d6701fd7654d7fbaa1a16a	\N	\N	2019-02-13 21:04:31.135722	2019-02-13 21:02:41.63425	\N	
1091	82	1	f63695e2b6057f23e004d13ff6c9bc4b3589c7972951020cce4162126fc9c68b	\N	\N	\N	2019-02-13 21:04:44.022847	\N	
1090	80	1	02396f52a219cb867885d4fda739bfad6e56e9e835e1c27f54ddf1782c9848c6	\N	\N	2019-02-13 21:04:52.861421	2019-02-13 21:04:39.531507	\N	
1092	82	1	b8793a5d0bc044539dc9d45561d7edcca459c2f835d1d10a508294d5e90d302b	\N	\N	2019-02-13 21:07:59.983139	2019-02-13 21:05:05.685896	\N	
1093	80	1	71a69af72ba89f338b1fcc763774c94d0320c7923393de7badc616461ef76f79	\N	\N	\N	2019-02-13 21:08:17.860115	\N	
1094	82	1	9cb3da6cc22d8c3a2cd20fe80a2fae4fbc6a358683eac15a5ee28b4496a2360d	\N	\N	\N	2019-02-14 08:32:30.921156	\N	
1095	82	1	ad27dab0f6222ea7905dd2f037a84a75428955adce7bf13ef8663910bbeb4e9d	\N	\N	\N	2019-02-14 08:41:33.240573	\N	
1097	80	1	38a0dc84430bac63cc59fa8bde8f0696c21459109b3529440a9476c0110bb7fb	\N	\N	2019-02-14 19:47:11.603938	2019-02-14 19:46:31.499742	\N	
1098	80	1	94266951e76a6acc3ffc90ae79d5a456a7323b339b0994adaa67e9a4c7a16705	\N	\N	\N	2019-02-14 19:47:21.213984	\N	
1096	82	1	9e2460913bab08829c109f821bf9dc789ac806f97108efa34829e9bd917ea41b	\N	\N	2019-02-16 21:55:39.141994	2019-02-14 08:45:27.187675	\N	
1099	82	1	d9a52dfb5f20c81982752029745dfab153232e6ff79eadd828f937aa892d98d6	\N	\N	\N	2019-02-16 23:31:41.185304	\N	
1079	83	1	d3a094d7fe12336e298343a6ff5bd23f18eabb8d5998e586bc1192f061abb314	\N	\N	2019-02-17 18:14:36.109266	2019-02-12 21:35:24.90574	\N	
1100	83	1	df30e015c4320f4eeb12c1d4331f90ff84f98cf484a990e916dd30c3d6ff622a	\N	\N	\N	2019-02-17 18:15:08.325744	\N	
1101	82	1	6aa55ba4586770caf38eabd7e455fff133f30dd2659f86c9e73bdad566e583ef	\N	\N	\N	2019-02-17 18:55:27.412738	\N	
1102	82	1	f30a9bb2baf3d8d530cc467881e85aaa0331ee7a56652ae4a68653add1c48ae4	\N	\N	2019-02-17 19:37:00.431552	2019-02-17 19:36:30.239488	\N	
1103	83	1	79415afbbb79d5ae7922f96d8513d641a79cb1e9d58ae3a19448437b6298c95c	\N	\N	\N	2019-02-17 19:38:40.460333	\N	
1104	82	1	a83a30dade38630ca17d379bab4786f91657f1d937810c17ed4e513dcb7b3d37	\N	\N	\N	2019-02-18 19:04:20.035449	\N	
1106	86	1	91c1f7a3ceaf21fbb91ae31ba1410ed56acf0f157a46203976a1e4f96c4e6024	\N	\N	2019-02-18 23:35:52.40341	2019-02-18 23:35:09.875316	\N	
1107	82	1	8db716d2b9916f76a10ad0dac88e787fda332c05bf7cdb97dba52b6fedc4a81e	\N	\N	2019-02-19 00:01:29.948589	2019-02-18 23:36:16.85983	\N	
1108	86	1	f8313eff67f78238e0799e097a7acdff6c66331edb2e26e77a7154f2ffaeba5f	\N	\N	2019-02-19 00:02:06.631542	2019-02-19 00:01:44.198651	\N	
1109	82	1	f9c0f182f4d0d7d26998fdee6fa3b6829a53a26d3ef2b7d69df078c4bd8fabec	\N	\N	2019-02-19 00:03:20.653107	2019-02-19 00:02:14.239369	\N	
1110	86	1	7b3f7c2136dfc8539cb63b8412e45f363be5bbe0e548df5f37f3fe589f61e5bd	\N	\N	2019-02-19 00:09:35.358966	2019-02-19 00:03:34.241178	\N	
1105	82	1	d6595788f66e97b071c3ed922608eeca14402517b6282363b7065f1833ff9d6b	\N	\N	2019-02-20 20:02:22.139829	2019-02-18 19:31:22.290009	\N	
1111	82	1	afc1f26037d9182f981dfa46d29638b37aa74c38d60b84f91ff14981ee531732	\N	\N	\N	2019-02-19 00:09:47.863379	\N	
1112	82	1	ef99cdcc6e34b953acbba4f7dc833b186be740aed4c8259658116c7c655cc66d	\N	\N	\N	2019-02-19 08:39:33.499598	\N	
1113	82	1	1825762d989182737d854e10a5b97c51bad7f35294e0f93ea7683c3d159f07b9	\N	\N	2019-02-19 08:42:58.601182	2019-02-19 08:41:10.188927	\N	
1114	83	1	98af4de6de70a6a548cd9100dc523796012dd9b027a8ad1a6bca49865f8a4b8b	\N	\N	2019-02-19 09:13:58.739444	2019-02-19 08:43:44.317774	\N	
1116	82	1	f0ab831847a23c25e132ff8f49b23e2b904d7bbb8986538a0e09b9e33b0ff653	\N	\N	\N	2019-02-19 16:18:35.078886	\N	
1115	82	1	da23856643928a0bd1fe0df80f5396f24c7df2decdad0b659405517e166b50a6	\N	\N	2019-02-19 18:26:03.619746	2019-02-19 09:14:15.30582	\N	
1117	82	1	dcd672aa7a03fbb0a10ce32a32c30e2f78cd1f2c31e68f332e56ef08912c7571	\N	\N	2019-02-19 18:27:19.299347	2019-02-19 18:26:31.447628	\N	
1118	83	1	5b12e78f88cdc8436e0495dffe19760546766a339c4eabb675703f2f9c49e2f4	\N	\N	2019-02-19 19:05:00.574625	2019-02-19 18:27:34.588465	\N	
1119	82	1	8b7284c6622e14b45133e33d2883a024c57ba58b365641dc19e5de1aac620fe8	\N	\N	\N	2019-02-19 19:05:23.204364	\N	
1120	83	1	62395009358844b65df975794aa5344a66b263dca055ec6a5facfe2204c8022c	\N	\N	2019-02-19 21:12:39.558206	2019-02-19 19:08:21.171463	\N	
1121	83	1	21a9bfe4e8e954b9a08f0517ba600484ea8008a8f932eba738e218fd5ec90dd4	\N	\N	2019-02-19 21:13:17.431209	2019-02-19 21:12:57.539356	\N	
1122	82	1	e167c97f6dfa386786e3ab686b7fe33164fc09c65c1660943be39b8c7eae7517	\N	\N	2019-02-20 06:07:08.21594	2019-02-19 21:13:33.906352	\N	
1123	83	1	5ebad02e9c1334b750b368311e296dfa795141c094dd69b0f16eb83f2fc76535	\N	\N	2019-02-20 08:03:23.102496	2019-02-20 06:07:24.664511	\N	
1124	82	1	6d0e94aa927b51cf54b9622e9fd798d8cd83c6d933b10336366b5f7e0966f166	\N	\N	2019-02-20 08:35:24.0912	2019-02-20 08:03:41.623046	\N	
1125	82	1	86e4d7135670eeda25674c6f44ecf06de254b322a431bf8dafb8575aafab7f26	\N	\N	2019-02-20 08:35:56.271477	2019-02-20 08:35:49.026393	\N	
1126	83	1	8c12de4c5d03295f6e52b1ea251279a2d296540e42c32964302fe6593c39506d	\N	\N	2019-02-20 09:25:27.49384	2019-02-20 08:36:14.560606	\N	
1127	83	1	b5b760a21415c3eda3cc2a2eb1c884beea5de3cf9b0f4719d3bc7ad68ecbd287	\N	\N	2019-02-20 09:25:55.262526	2019-02-20 09:25:47.00153	\N	
1128	82	1	b5f542afc5bfc245d746690040892eb45f83281ebb7faf1c648733ac2bfa17b5	\N	\N	2019-02-20 16:54:45.851211	2019-02-20 09:26:15.75149	\N	
1129	83	1	a2457d85f29244ccd6cfd8d7cd3bdbbabaed0d5cafcf5dfb14119516eb6f7964	\N	\N	2019-02-20 17:01:53.435759	2019-02-20 16:55:04.223089	\N	
1130	82	1	049d35f1e517591b0149d552a846648dfa1fd2b562e9a05f6b078a05a48e068d	\N	\N	2019-02-20 19:27:48.340451	2019-02-20 17:02:11.831659	\N	
1131	83	1	7b8f121ea1b9952458bff3b0d6bb444f9463582043c48ea3db09f14c0635f621	\N	\N	2019-02-20 19:46:02.689151	2019-02-20 19:45:42.638717	\N	
1132	82	1	736488567f63b74755a96fafad521baec20e6929b9eb203c53bc8d328db914ee	\N	\N	\N	2019-02-20 19:46:27.174255	\N	
1135	80	1	fa5ea878c4ead54390b8eb61fcb38c2ba58f24f7b39192883a687ef8f6f035b0	\N	\N	2019-02-21 07:35:32.86472	2019-02-21 07:29:08.845913	\N	
1136	82	1	03ae0536bdbc17a605b4d2705c5994f12892c9103007089b0e5720ed3d78d842	\N	\N	2019-02-21 07:38:23.841237	2019-02-21 07:35:41.762635	\N	
1137	80	1	36e8b9ff915c60b237737d990fe2a0cebbbcd005ad101c2b92477bf9981f353f	\N	\N	\N	2019-02-21 07:38:37.461838	\N	
1134	82	1	6d38b120c8048f8a8cf3ffa85a34977ed2ced6243513eacc05944d6d81d03942	\N	\N	2019-02-21 12:35:04.679039	2019-02-20 22:05:49.287621	\N	
1138	83	1	70e513a96b2842ae1a4af0295819fa91d37c6be08b43b6c34a577c709c9fca37	\N	\N	\N	2019-02-21 12:35:18.224465	\N	
1139	83	1	fe91fbbb7b4a395121989a140c8f4f6758f3f91d32b378bf783596f4241210be	\N	\N	2019-02-21 19:01:35.304499	2019-02-21 18:19:33.209539	\N	
1140	82	1	57b6719f6cd8d2683fe0fc7618ddf5678c6014f71bb8c9ce6f21b39a1cd4bc0f	\N	\N	2019-02-21 19:04:33.528414	2019-02-21 19:01:50.757755	\N	
1141	83	1	41cc66b3d133128ab98fd64a351abb4760f2fde7c4939a0310e228262e3a43a4	\N	\N	2019-02-21 19:16:15.943957	2019-02-21 19:04:48.326279	\N	
1142	83	1	a8b87f550b718e51d669318c5f4b83973beb97a19eeecd5bbfc33e68579bf0a0	\N	\N	2019-02-21 19:44:32.384696	2019-02-21 19:16:32.600279	\N	
1143	82	1	dcf7687cb1320cddf5dab430937118aa1fe3e55ddc0d28ad5dc148ad8fd38d78	\N	\N	2019-02-21 19:45:22.480209	2019-02-21 19:44:46.923243	\N	
1144	83	1	cd9060c2255c8845a17a696c59373656b82a2252cd2874fcfe494a840a5f87cd	\N	\N	\N	2019-02-21 19:45:47.935583	\N	
1145	82	1	2742ed54992f90ecdbd579c096dc9fce1e064508a8c962f0917bae140a6b490d	\N	\N	\N	2019-02-21 22:25:37.722295	\N	
1146	83	1	0e635487e1615e2d974b30d78b718c47352159786635f3290f1c959c6680007b	\N	\N	\N	2019-02-21 22:31:15.56016	\N	
1147	82	1	6befb30e7bda4151289a096bd24e12fc56ee69880e379b8ebd9514f652ad79c8	\N	\N	\N	2019-02-21 22:49:29.772719	\N	
1148	82	1	45d99f068ec42bff3e5336f8d04607ebedc80bf8aab97a49f08abf307818e220	\N	\N	2019-02-22 10:47:22.153951	2019-02-22 07:23:09.001332	\N	
1150	85	1	9d12eb0a2c8c259cbdb8b9cbce37ec2fd1694d31ec1548aa0dc9fdc9ca3120d8	\N	\N	2019-02-22 15:14:25.6503	2019-02-22 13:22:13.041274	\N	
1151	82	1	80deda74c5a64debb9588f292c4e1d6016868d8d36f5e42c9a89f4a8c3ea4d27	\N	\N	2019-02-22 15:15:18.389646	2019-02-22 15:14:35.576618	\N	
1152	85	1	cdc6d7aca577f17b1a9e0867e86d9aa79ca109499168458a36762d717128c9dc	\N	\N	\N	2019-02-22 15:15:28.141495	\N	
1153	82	1	ee480efa36fd34e5024cfd1d6b299a125e391d79cde82c1ac89e9082ffbea3fa	\N	\N	2019-02-22 22:22:49.619213	2019-02-22 22:22:22.434044	\N	
1154	82	1	eb4338c2fafadb041c561399dc7bfc456bd184786131415df259ccb754b7f54b	\N	\N	\N	2019-02-22 22:23:22.187462	\N	
1149	83	1	8359164306902356d851c3dcba18758c8e6db32460e00db1a6e1120ba21f22e6	\N	\N	2019-02-23 06:53:05.972824	2019-02-22 10:47:40.437132	\N	
1157	83	1	2dee1223b46a5c968d7cad8c5163929d732040a8761505eaa52ada82094bdc7d	\N	\N	2019-02-23 09:14:21.034543	2019-02-23 08:37:20.383829	\N	
1158	82	1	026d23b83c2e5a550f41b80b8e292bddf114d7fbb33cc996650f579c8a377a81	\N	\N	\N	2019-02-23 09:14:35.763721	\N	
1155	83	1	b9f4b09444a59036930d2be748295a171821bc025ff1fbec5f5e144e8508f496	\N	\N	2019-02-24 10:04:43.528239	2019-02-22 22:25:13.431807	\N	
1159	82	1	fcb2c8b7d70b67f6501bf507861c6d01587f4192bb2e2057244046543dd09ad6	\N	\N	\N	2019-02-24 10:05:25.54821	\N	
1160	82	1	f53da8645bc1b17e6f7af218e82c12263c0822055e4b4a5ad9a850a171f2cc23	\N	\N	\N	2019-02-24 10:21:37.031867	\N	
1156	82	1	4c07337480ae0266f0456f4309dc7aeb58efb8056c4247443692009598e8bde8	\N	\N	2019-02-24 11:27:06.348916	2019-02-23 06:53:37.458401	\N	
1161	83	1	fbd34b0fb3d4043bcaaa3c71e08bad59cf084672ffe75cddb2141383e8237de4	\N	\N	2019-02-24 12:06:19.763128	2019-02-24 11:27:23.475136	\N	
1162	82	1	7739b346f3a50b479d653d2f1eaf315006a81752398995271a1eb95df4ea9fd3	\N	\N	2019-02-24 12:26:08.996387	2019-02-24 12:06:38.19826	\N	
1163	83	1	6d4cdb79dc777f54b0f55ad3f44cc8bdda14d9b7ccbbb9be8dc8363ea1a5ce14	\N	\N	2019-02-24 12:55:36.405477	2019-02-24 12:26:25.359942	\N	
1165	82	1	0612dc2b5d2b4115c101df38b11c6d58ce952880229216030ef84de09c92f104	\N	\N	\N	2019-02-24 17:03:12.336226	\N	
1166	82	1	e20463d8f4a484a338f5242bb98c381d21b08bfa57fd1d6b71e872a1b2390264	\N	\N	\N	2019-02-24 17:08:43.890657	\N	
1164	82	1	c6d90c4a6103b6c13eba8be61eb767d591f3ee22d95116e056cd70d48d0d260c	\N	\N	2019-02-24 18:21:07.482303	2019-02-24 12:56:09.107699	\N	
1167	83	1	4197f2ca260d69d5e8c70338a78a3bfbb910cdf097222c1d69919f53b4c07042	\N	\N	\N	2019-02-24 18:21:28.062127	\N	
1133	82	1	9edb7d08ae1158139055bee632632d1a32aa32c4919b6489a102059907a7abcf	\N	\N	2019-02-24 18:38:34.4867	2019-02-20 20:02:54.05037	\N	
1168	83	1	3a4ec6589bb45a0b4493913c1281d58a564b1e60e690bf026a6f929daa3e1958	\N	\N	\N	2019-02-24 18:38:50.929865	\N	
1169	82	1	7c0d316de18a2897592741a2ce0ed71974ee37b24fe30b18f91440e26233c3a2	\N	\N	\N	2019-02-24 19:00:53.244663	\N	
1170	83	1	fc2ff1bb7ba0c6fafc1ecc67ee53398d0e777930ce447877962feca83dcbfc03	\N	\N	\N	2019-02-24 20:18:03.397404	\N	
1171	85	1	34e6fe493a8841d41dee829b1a34b869c8591a68c3a3ac5ae48ced0ac7eb7b06	\N	\N	\N	2019-02-24 20:40:20.508066	\N	
1172	85	1	faa9a6e167bd2fe92df830aa4df3b84d04e4a8156d6a4bb9a5ab37be1f04e765	\N	\N	2019-02-24 21:01:52.957687	2019-02-24 20:59:48.142646	\N	
1174	83	1	2af7d7882994217becc4ece049642ea26a2d7bda40a849ea1a58e1dff8d19eab	\N	\N	2019-02-24 21:04:12.707946	2019-02-24 21:03:41.009796	\N	
1173	82	1	46857c390f001588e0eb5402e52977bd6d0ddcd62cd7487af68c9e88d725f591	\N	\N	2019-02-24 21:05:01.978617	2019-02-24 21:02:01.783401	\N	
1176	85	1	1fc9742e52fb4af3aa0c00bc97ed5ea1183cf8286c2cefc54de3d55134bc61fe	\N	\N	2019-02-24 21:06:14.385553	2019-02-24 21:05:14.746756	\N	
1177	82	1	a815b2b3e346ebc0a45e8971e29770b90027da62afd1347e21b237b8a0d992c8	\N	\N	\N	2019-02-24 21:06:23.314542	\N	
1175	82	1	197c72496a29a453e84a7b3e8f2f82d010decf2e40f0c5ae33d3cacdfa72213e	\N	\N	2019-02-24 21:30:52.699694	2019-02-24 21:04:25.022314	\N	
1178	83	1	4c6570de84b46ff20e18426a7bbfa3925c6c4a44cd012ca957f1f4578e600b1d	\N	\N	2019-02-24 21:32:00.130213	2019-02-24 21:31:16.216278	\N	
1179	82	1	1d3e15a146d969e11a8ce2c9fed75d2fdbf04d6b93e487f2c491f9e1c5c0ddac	\N	\N	2019-02-24 21:37:22.939972	2019-02-24 21:32:11.651882	\N	
1180	83	1	67c7f403a67e2ca75456ba801530d83309490abb55ed715f6e51a4f773d1d9df	\N	\N	2019-02-24 22:03:23.768066	2019-02-24 21:37:43.919518	\N	
1181	82	1	1c7e401f9402b32dd74a21236ee347de51d67d716e39ee776322f32286b867a0	\N	\N	\N	2019-02-24 22:03:37.746387	\N	
1182	83	1	11da0a7a7e36f064829fef00d075153d12acd7d2c068824d5d2bdd4ba13555bb	\N	\N	\N	2019-02-24 22:06:25.728192	\N	
1183	82	1	3f274e4c11858e98eaba1c8daf2d69b551bce33e40326522e965aaa14636be97	\N	\N	\N	2019-02-24 22:17:10.1504	\N	
1186	85	1	3fe1b66a4c98f375ce244482ef93022b256cc1ce4d8f5b48732aef9866d6320e	\N	\N	\N	2019-02-25 20:40:36.613443	\N	
1184	82	1	3c640854ddb89c2d810f5f75a28e75ec37540983eb608dd54a86dcd329f8341a	\N	\N	2019-02-25 20:50:43.482735	2019-02-24 23:08:50.296049	\N	
1188	85	1	435c92f8e1d5d2ff12966d29d9b90317d04d85649c7e112da7bc854248e6a949	\N	\N	\N	2019-02-25 21:04:28.053184	\N	
1187	83	1	fcdd9e1d868375e82a9850b48da550f14e2f59b6de22d382120d0a3f07aac073	\N	\N	2019-02-25 21:49:35.041911	2019-02-25 20:50:56.420201	\N	
1185	82	1	10bb55af4d80bd1acefa430a554c195cf3f3aa0873cb8f4564ae96cc6d9c7e23	\N	\N	2019-02-26 08:57:31.008778	2019-02-25 18:22:51.309818	\N	
1191	83	1	dd493ee8368f52fa3de6341a2946ee85262d709fead12dab7526a7160ca8d4a1	\N	\N	2019-02-26 09:26:59.372781	2019-02-26 08:58:05.240805	\N	
1193	85	1	ef66d7d7a7935ab17ca3da0a471023812137bda36c48864375dfb253f625dc2a	\N	\N	\N	2019-02-26 15:57:20.020149	\N	
1192	82	1	6e4a28700b9b1c3de8f374ddcce59592d0c75904f8d859ad7c3a6db595eba8e9	\N	\N	2019-02-26 18:29:52.207685	2019-02-26 09:27:12.65133	\N	
1189	82	1	eef632b139ab8c4de1c57c91e23fb93756b958a80845064cf8ce048dd273594f	\N	\N	2019-02-26 19:33:01.324958	2019-02-25 21:08:14.818317	\N	
1195	83	1	c71da18c4318b87a35290a9fa4f40252d7cac39c28ffbcdb27aebbd7da4513c1	\N	\N	\N	2019-02-26 19:33:14.27042	\N	
1196	82	1	b982dc8deeb92f418c57f045d17b0d18dea05c04b056d4caa1b95fdc438c080a	\N	\N	\N	2019-02-26 19:57:19.150849	\N	
1194	83	1	82b9d5c13e3c5bd45f43ebfe1713d0dd1daf5c5d1a789d5827b39783f454df28	\N	\N	2019-02-26 20:05:51.236227	2019-02-26 18:30:13.776149	\N	
1197	82	1	08848d00ce73b1c416da65fbf28d59b0a4c1561dcb5ef9ac0f093c33d7085e02	\N	\N	\N	2019-02-26 20:06:06.664925	\N	
1198	82	1	d355e5b1e9255720a33f2a33866e395597b15d1ae0df7527aaebbc9ffdf6dbca	\N	\N	\N	2019-02-26 20:21:15.727815	\N	
1200	82	1	26003fca2a537640be918c875964440866515d264e5deb29785e0e913b67ffde	\N	\N	2019-02-26 22:30:11.49738	2019-02-26 21:03:14.4863	\N	
1201	82	1	431aee8f3c772aa5da6ba473cab0cf3ca4ae8c288c940277c098730a682494fd	\N	\N	\N	2019-02-26 22:30:18.823718	\N	
1202	82	1	a0a45063be2c22be206f50365111b8855f04af9a402380af5461d9169546071b	\N	\N	2019-02-27 10:29:21.65697	2019-02-27 10:27:41.879422	\N	
1203	83	1	db5c56c29d1817dab25820be95ccde931c360d9ac9adf32f59f85bf58cd98dac	\N	\N	\N	2019-02-27 10:29:33.48449	\N	
1199	82	1	f6c74b4be71431cf2084de5c7184596d38cbccf631565b32b388e715b7fffea6	\N	\N	2019-02-27 11:04:00.720036	2019-02-26 20:27:01.171905	\N	
1204	83	1	bffed62b5649522565f581c2ebca68e79341fb97101cee5b194bb97d3c0198a3	\N	\N	\N	2019-02-27 11:04:34.544117	\N	
1205	82	1	5ca4d1d8a3f32aa739e8665472f53bb76df925c1247be90c491ec169b40a059a	\N	\N	\N	2019-02-27 11:59:50.087756	\N	
1206	82	1	8610948e8e8adafa68b87ccbc5ed0dabce65510b5b510c297c35802ecb41c40a	\N	\N	\N	2019-02-27 12:08:00.18658	\N	
1207	82	1	b48398ce3f8d65ddc6a6e04028635bfdf4ffb8d604e4f4011e6929019045dc6a	\N	\N	\N	2019-02-27 12:26:59.527152	\N	
1208	83	1	3038996cf19531a6959edc2f53341c6f9918d2599b8d32833ab0f97cbf582944	\N	\N	2019-02-27 13:49:50.320978	2019-02-27 13:00:24.437843	\N	
1209	82	1	6c0174ab50bc2d54188f2d86a7bbff3fb541af949e1fb42107131b92f44c84a0	\N	\N	\N	2019-02-27 13:50:01.581851	\N	
1210	83	1	c1059fcd3b7bf1b350330cb60fc82cb542453498ed9256d59add60bb486bc47c	\N	\N	2019-02-27 14:54:52.229407	2019-02-27 14:48:06.666933	\N	
1211	82	1	4091b5bd05d1f05ac02f667dfb3790d6b16abf5798419e0983333bcce3100ca7	\N	\N	2019-02-27 17:42:05.77206	2019-02-27 14:55:14.827324	\N	
1190	82	1	c220e53b73c212e3bcbf6b46a985528827168f97939d0da0414f58add9b5bd45	\N	\N	2019-02-27 17:46:09.162155	2019-02-25 21:49:47.934848	\N	
1214	83	1	21743bff3d655ab979f5cf9bf49f4ed9ab6548b032ecc6a251df0d1ad8056d3e	\N	\N	\N	2019-02-27 17:46:25.298253	\N	
1212	85	1	44cc13b60d86888b36ce90d52e5a9774bb325e5741d651c911e8f165c6134c54	\N	\N	2019-02-27 17:58:17.659502	2019-02-27 16:38:44.747367	\N	
1215	85	1	0ced5faa4724e1b69aac7a240dcfa38fb862ba29fb9608436c02e29784e436a8	\N	\N	\N	2019-02-27 17:58:27.143438	\N	
1216	85	1	3feb940145b49608c389f58fa97810ebf47bdb8f43afa4356188a2d251b5e681	\N	\N	\N	2019-02-27 18:09:28.606645	\N	
1217	85	1	eeddc04366134b98101dab35b8a04409691470056d42620ff01e0abfceb8219a	\N	\N	2019-02-27 18:26:56.769368	2019-02-27 18:23:30.721871	\N	
1218	82	1	3ae90e3e10a904ef580c9a0b784956e8c80b8e56e1874e2cbc0644bc23996e3b	\N	\N	2019-02-27 18:55:55.013029	2019-02-27 18:27:05.302295	\N	
1219	85	1	6313a3d54a48f3025a56c5c27d0c3d118a2409545f9adeea429d19c1232d9397	\N	\N	2019-02-27 19:02:34.149627	2019-02-27 18:56:15.736998	\N	
1220	82	1	3f6e9bffcf7d917804707bd0efefcede8e7593b45f72fc53342998f850f71043	\N	\N	2019-02-27 19:04:20.643698	2019-02-27 19:02:41.718847	\N	
1222	83	1	4c083bf94b30e02aaa99fc8c01692215c9695308283bde73f8bc4e9bb4840948	\N	\N	\N	2019-02-27 19:33:09.583245	\N	
1223	82	1	fc7847f9fad68e76b1076c224eb95b938eda682c06a4097b7217ba54a86e960b	\N	\N	\N	2019-02-27 19:36:02.111857	\N	
1213	83	1	62b36805256bd176fdd6f343ea6e9fe91ccbf54972362f44986b7e1ffee862ac	\N	\N	2019-02-27 20:34:35.946876	2019-02-27 17:42:24.56887	\N	
1224	82	1	617b528d14631cef8f6889bdd079f8a57705b59ea853dbc22620032cd1baa297	\N	\N	2019-02-27 21:48:26.622151	2019-02-27 20:34:55.324585	\N	
1225	83	1	266d8ce3f5c0708c2ebb6dced6f589b7eea7940c04f658531a1acd50c4a3382e	\N	\N	\N	2019-02-27 21:49:07.338007	\N	
1226	82	1	8a8a44c00de88d36c56855da71dfaf1ac2d28ccc5c53ddd22321c82e1f64cabe	\N	\N	2019-02-27 22:36:14.959429	2019-02-27 21:50:23.496484	\N	
1221	85	1	a302bf8dafd2f4035aa7297a4ec1c0a218dbcdae64464751253ee83b9c723d1d	\N	\N	2019-02-27 21:51:20.441663	2019-02-27 19:04:34.740717	\N	
1227	82	1	9ff24adc0a1ea295f01aeb4666f505f9a76a585ab18dfcb33137bb6b230b10d9	\N	\N	\N	2019-02-27 21:51:28.28624	\N	
1228	83	1	c770341dac1cb77c98970449a57654dd4299dc9c51d1f2385deef79ea99daa6a	\N	\N	2019-02-28 08:46:57.336106	2019-02-27 22:36:32.662912	\N	
1230	82	1	8cc30946a0be7f8b781a56afdb4b82fe6807803e36206d9e04d8281a44a4cfd4	\N	\N	\N	2019-02-28 08:47:20.118506	\N	
1231	82	1	5284a751d3736397e7e5c306d9ec74d570d3fd196f379377129c523040bbcdd4	\N	\N	\N	2019-02-28 10:31:07.875679	\N	
1229	85	1	9f76f0d87b93e3c8eeb6a7af8b97441af76ace3594fd846cb084bdeb80f6da61	\N	\N	2019-02-28 12:45:04.78127	2019-02-28 07:15:46.805198	\N	
1233	85	1	1009a9938d60d5d5de5289a2b13d0a47247d4bae0dca89113823a309773b590f	\N	\N	2019-02-28 18:02:55.715625	2019-02-28 17:31:55.918155	\N	
1234	82	1	1d270a7a5709170877fbf3627b33aa7f86d7c5725274be013ff10271e99097b8	\N	\N	2019-02-28 18:11:50.877876	2019-02-28 18:03:03.13191	\N	
1235	85	1	a9e0af05950a4ea7b2508678bb9f8e525b4de0f966f79bbfb2833bb692882ed6	\N	\N	2019-02-28 18:18:14.247933	2019-02-28 18:12:06.256922	\N	
1236	82	1	d3b8ce8b16ee90d6f0f52ac2606a87b24b3e643a6f42d69cf20526486486fcd3	\N	\N	\N	2019-02-28 18:18:22.489045	\N	
1237	82	1	eeea270035c9a4a68453d1f1380e3200427db1c91452a1d19ea5189c6a0c2d67	\N	\N	2019-02-28 19:52:17.650564	2019-02-28 19:16:08.764433	\N	
1239	85	1	986466419e9dacb7fed7ec0adf5068bd5a353f8a0a0d695540047a1681e477b2	\N	\N	\N	2019-02-28 20:39:31.908985	\N	
1240	82	1	17ffffb7c980108bdc7bcfcc6e75fa1437b179b4ae1b1ba7b560c20796a355a8	\N	\N	2019-02-28 20:55:01.361853	2019-02-28 20:53:55.772362	\N	
1241	82	1	1191b15e0a1596f894c7c451207583fe79d9aca8dd53742855a1b8dafea1a837	\N	\N	\N	2019-02-28 20:55:19.665997	\N	
1243	83	1	7e3afd4325cc05de1a5154f98ab9072be69001d12a091ca2fdcdb0ffbe22490e	\N	\N	\N	2019-02-28 21:21:00.980087	\N	
1242	85	1	b9f7e8bba7d7d1fc4340caf47f481a5a6c86500e6d1925feec749a30551927ab	\N	\N	2019-02-28 21:49:36.48318	2019-02-28 20:55:47.88792	\N	
1245	85	1	9ac23ce369339c922e7bafe7542326e0dc3efeccc83a7202d3aecb311ae3ba40	\N	\N	2019-02-28 21:54:08.198655	2019-02-28 21:51:35.458427	\N	
1247	82	1	b0167521e75d394dbe7986cc5ff8c508a7b1b530eff84e99e3100436bacbb8a3	\N	\N	\N	2019-02-28 21:55:04.389949	\N	
1246	82	1	1e1329ce173cb7cbee8661d6c364c1aa2c6896a5fcffdefc075be3763206cd2b	\N	\N	2019-02-28 21:55:47.151504	2019-02-28 21:54:18.849612	\N	
1248	85	1	a0dc38ec40c1e0505bfb7cbfb358416a65702004dfb76bae9c0a255e8db4d673	\N	\N	\N	2019-02-28 21:55:55.926576	\N	
1244	82	1	59fc89c5961ed056083a6cd69b502c44a46d22a340b1381759472f66c4dac163	\N	\N	2019-02-28 22:19:17.484495	2019-02-28 21:51:28.293813	\N	
1249	82	1	ad3aff4cccdf0b1447fcca074668f3356a76d23c47092a7ca7a62ceabfe331df	\N	\N	2019-02-28 22:48:22.40652	2019-02-28 22:47:12.908201	\N	
1250	85	1	85bb17e0ac039c9e4299fdaa8ddb37e6467fc0d58f2b8c8d906349ffebaa469f	\N	\N	2019-02-28 22:49:02.206866	2019-02-28 22:48:31.837096	\N	
1251	82	1	20f40e6f92c4e619c43a549759b98118dfeee4f1a6f627f871712d0605feae74	\N	\N	2019-02-28 22:50:49.997238	2019-02-28 22:49:19.425934	\N	
1252	85	1	dff0634bf3615d3fa22d5702ae408e9ae7e73ae6fac51fec2728b2d17a6e1b62	\N	\N	\N	2019-02-28 22:50:58.401895	\N	
1253	82	1	6a63c81c7e9c002a495f35af12a63c8168656b26c7c25b0af96b592e8c1d195c	\N	\N	2019-02-28 23:20:07.641479	2019-02-28 23:16:55.388212	\N	
1254	83	1	4e0a045f7d4b6fe42065c6259497fba5056a3ff93e2b9f985c1724f7be9f29af	\N	\N	\N	2019-02-28 23:20:18.258151	\N	
1232	83	1	af09ca98df53c315e06a9c79a17695549ae7e6810bd58c5a751912a1fa49d47d	\N	\N	2019-02-28 23:44:23.942077	2019-02-28 12:37:43.654992	\N	
1256	83	1	7dd457f3d2c375f212052840832dfe4ec680e59914b4922a75793b62638d9ccf	\N	\N	\N	2019-03-01 15:48:33.276271	\N	
1238	83	1	1044e0bd2cb0fe2826dbac9d83beb501600e8dfc7aa7e24287423c8c5007eabf	\N	\N	2019-03-01 16:00:37.985111	2019-02-28 19:52:42.494689	\N	
1257	82	1	86118e1d6f711eaac59e42be217f0ceb8b1d1c5ca86060d83180547aeb167cac	\N	\N	2019-03-01 19:17:00.174123	2019-03-01 16:01:07.907259	\N	
1258	83	1	4276335410e386d45ce5dd3f2c5ff19c3cb2c0db2a9ad72767a37510c93dd860	\N	\N	2019-03-01 19:19:57.137078	2019-03-01 19:17:20.449397	\N	
1259	82	1	ebe9ecf3f468585694d6fd19bed76d8aba4d92e14dd6b32c0545d4ab05b35b9f	\N	\N	\N	2019-03-01 19:20:12.700636	\N	
1260	82	1	99d8da86c0ba64d3f46902e53e8a5510701282ddce924b0b6bd8db524a5b592d	\N	\N	\N	2019-03-02 10:27:22.448407	\N	
1262	82	1	dae8e77109d0aee7fab74fbfc3f849fcbcb0acf1ec2d60c4132c7706fe7d3dfd	\N	\N	\N	2019-03-02 10:32:45.619441	\N	
1263	82	1	85c60dda38da8a293bec977b03e92c0be331ad71406b096be905906c86142879	\N	\N	\N	2019-03-02 11:43:17.05555	\N	
1264	83	1	9d87888842c65756f25edb86812f45d0d943c60ff7b39bff2d0d32c49252ed5d	\N	\N	2019-03-02 13:12:39.395087	2019-03-02 13:10:35.288568	\N	
1255	82	1	dcde049e80e7b114ed38acbcd7271655c963f6c31af46c5abb77bc5c533e499f	\N	\N	2019-03-02 13:18:04.802913	2019-02-28 23:44:46.268575	\N	
1266	83	1	2a4a69acbe1a41cf6a80c53be5072ace120cb8f970bcf09bdb5f5569498af026	\N	\N	\N	2019-03-02 13:18:58.736204	\N	
1265	82	1	663539da56e9714233e8c8cd24fe23ba20369459fbf530f4f42098c3d13fbeff	\N	\N	2019-03-02 13:20:00.065734	2019-03-02 13:12:52.922059	\N	
1267	83	1	ba68d58497f2eae57724cc51fbabdf389c2b0cbe9b1d178ea41a54f6becf37b3	\N	\N	2019-03-02 13:36:50.244453	2019-03-02 13:20:15.886106	\N	
1268	82	1	2286d6534eb65edf48813a359237db5a687d29d424c9683df5df2325fee85924	\N	\N	\N	2019-03-02 13:37:03.114524	\N	
1269	83	1	1f6e10affb089ec2b67914f9665f6cce2d4fa378f951e7c0a44c349bd152075e	\N	\N	\N	2019-03-02 13:51:58.894049	\N	
1261	82	1	b6f1ccb6009a7aee9dc32a226677b8d48bd1254b05b4ddbbe2ea20c15d718b36	\N	\N	2019-03-02 21:27:55.452874	2019-03-02 10:27:48.996116	\N	
1270	83	1	6543699329e2e5e8681f3f95063d18bf9f8d5b8c18283ff782c10e3837ca3c7c	\N	\N	2019-03-02 21:28:48.439044	2019-03-02 21:28:09.018015	\N	
1271	82	1	56a7d42c677c1b8ce40ace82f0c53186223dbdcce756734ebe23f70fbe06343e	\N	\N	\N	2019-03-02 21:29:00.418072	\N	
1273	82	1	57d919dc951fe01e076f0aae8084f3f473c5402676908cec488ca6765c1bed01	\N	\N	2019-03-03 13:15:17.694058	2019-03-03 13:11:53.340798	\N	
1274	83	1	c18c73b61827c4ad2e1a3def678e3d7c5d3c7263edbb4892954258e7f70c702b	\N	\N	\N	2019-03-03 13:15:45.437875	\N	
1275	82	1	950d1d9ab024d7af93993d1884dca6597e65475811918186b69aca9da283747d	\N	\N	\N	2019-03-03 18:23:16.620024	\N	
1272	82	1	379edcdacc4ec77054fcd1fc92a698d3f635512bad001bf205b920a1397efbdd	\N	\N	2019-03-04 18:39:54.347646	2019-03-03 07:42:39.144462	\N	
1276	83	1	8ed868afcf0366d3aec940ee811c97b8eef023f598af1fd9e3e07d7ccb54143f	\N	\N	2019-03-04 20:43:47.371838	2019-03-04 18:31:40.053898	\N	
1279	85	1	664009e87fd51576c4e2666134bd3e33ec28cfa230f76938a1bdb90d77f6491e	\N	\N	\N	2019-03-05 16:38:26.96703	\N	
1280	85	1	33c49814eec7cee1ee0bf3378b1f2e822db3e2026950691c5c126e5f0a519636	\N	\N	\N	2019-03-05 19:01:01.20548	\N	
1278	82	1	20fb2792808d84e6da877ec0cfe3469988951c0242a92b8059208d30e8ffdaff	\N	\N	2019-03-05 20:23:38.423644	2019-03-04 20:58:58.314621	\N	
1281	83	1	74f381abbd7c9bb52e290f65ce59de054edfe7e91ea64d7897ba64835eb0832c	\N	\N	2019-03-05 20:24:42.822533	2019-03-05 20:23:50.295039	\N	
1282	82	1	196d43dcb1d07b9c33493742b81b4500c300b78416a8fff84239d91d624d6cc7	\N	\N	\N	2019-03-05 20:24:54.067429	\N	
1283	82	1	d724a1d93078c2fcfd8c2d82743f4505a5527d6a43404b82e88028d81ad9bf24	\N	\N	\N	2019-03-05 21:54:02.073173	\N	
1284	82	1	8f284dd55364fc9a7750a3581fad95dc3a82fde1396f6b67b75fa6c555ffbb16	\N	\N	\N	2019-03-05 22:06:19.801623	\N	
1285	85	1	01fc5a1b1181d9a68c0e027fb2a8a5fca8d81095db162e83de80965504e0cec7	\N	\N	\N	2019-03-05 22:37:22.945126	\N	
1277	83	1	7aa42d2c6fbb08ce3c6972ce1e8bb384a7ac846e7b94ec4b755fb498fc13bd87	\N	\N	2019-03-06 07:55:28.003666	2019-03-04 18:40:15.421749	\N	
1286	83	1	364e8545b962defd309023dc79c50347e2d4b204dcda7bdee2a76abf9633c5c0	\N	\N	2019-03-06 08:12:55.150084	2019-03-06 07:55:43.640416	\N	
1287	83	1	42be0a6beb7c18b34ee991cf75a6949d8bd8a5d0a20f7b7cddee60eaa9827012	\N	\N	2019-03-06 08:29:51.54447	2019-03-06 08:15:26.722145	\N	
1288	82	1	966f139babc02176ba90214ee6319fb15debc5df4a2fedba2ad116004c5839c4	\N	\N	\N	2019-03-06 08:30:12.002971	\N	
1289	82	1	a6703949a298b4318e8aea486eefa38b50afd7735ba910e55ba0650afc834a3e	\N	\N	\N	2019-03-06 09:31:37.425518	\N	
1290	83	1	a8fbe9620cddd06df28d742eb8cb393ba5f124286d0bc081efaf22bee5c755d0	\N	\N	2019-03-06 12:07:15.026981	2019-03-06 10:41:26.769588	\N	
1291	82	1	baea4792ea871481c581f21a6f08e5c8aafbfb88562530c11a16b0415b78b17c	\N	\N	2019-03-06 12:23:40.026758	2019-03-06 12:23:11.09419	\N	
1292	82	1	03196aaf3e15f930b2c3eb3d04e318f7571a3579d6eb3f1095705f7cca332348	\N	\N	2019-03-06 12:31:34.48177	2019-03-06 12:24:27.397848	\N	
1293	83	1	8155199e2308cbe3d5d3060e92f99084c4d5116b14cd76120959a5fa4e7725eb	\N	\N	2019-03-06 15:27:29.76918	2019-03-06 15:27:09.027956	\N	
1294	82	1	d55f33dde89149df086320a533017658a7c8283c5298d9d82e3a90431b1cf53a	\N	\N	\N	2019-03-06 15:27:42.47072	\N	
1295	82	1	be6a53bd2e634164dd4a03fd0feb983e6a3ea3def73db6268b14c950ba62c672	\N	\N	2019-03-06 21:35:00.355164	2019-03-06 18:31:52.727261	\N	
1298	87	1	5fc1860d6f4f9bb5c5ce4293f661f6b4d4d3fbf595d9166c49118843a7f934dc	\N	\N	2019-03-07 22:15:27.32417	2019-03-07 22:14:34.97093	\N	
1299	82	1	c358f6d3b2d3c911b7c582505f1eefc559c7f1ca5c3926eca261ee7e724588fb	\N	\N	2019-03-07 22:15:54.916409	2019-03-07 22:15:35.30975	\N	
1300	87	1	6d5a79f05644c6ab7bcc27a8a18b73dcab684d857d6a878a63747027deb37ede	\N	\N	2019-03-07 22:37:04.659178	2019-03-07 22:16:09.197635	\N	
1301	82	1	eb59e0c0612960db9271f1cae6fc8eb9dfbd8c2cfe7d0d865d5b25adb644b30e	\N	\N	\N	2019-03-12 07:57:37.583456	\N	
1302	83	1	88d523a177e9be7e95a4a0e89be2ffa07ce8a5cac50d31f5345786c5bce32330	\N	\N	\N	2019-03-12 12:25:49.501327	\N	
1303	82	1	e206db5c7aa22cbf59a6458ac9748ed20e9f645753222042ede93c8161ecd7f3	\N	\N	\N	2019-03-12 19:06:01.844044	\N	
1296	83	1	4bd57d49caadab09c690b1bda620d99b32ba13436a624cea9a9589e72378f21e	\N	\N	2019-03-13 07:10:13.981446	2019-03-06 21:35:24.073538	\N	
1304	87	1	3cb4dd6e386c4cb42a54387042d6977f2509ebff17ae9ee27f92a17b97a8d937	\N	\N	2019-03-14 21:28:29.691016	2019-03-14 20:51:32.254878	\N	
1305	89	1	3b1a2e2a1217af5a0c557768d26c67253bb7899c3b4c4c0085dee45cdcf1796a	\N	\N	\N	2019-03-14 21:28:45.561946	\N	
1306	89	1	ccd0d52010704af5bf4241c9001d6999ef7d732683dd5016f48e54b65a23e78c	\N	\N	2019-03-14 21:58:39.15696	2019-03-14 21:31:51.853209	\N	
1307	82	1	c23b9fb6d10e538c1216bb515b01ab35dd48324d79674775bb8b88e25899f7db	\N	\N	2019-03-14 22:04:59.957352	2019-03-14 21:58:51.94337	\N	
1308	85	1	1eac561a92632886943859fd7aec77e69471b965c9695d8b8620dd3ff0ff0b77	\N	\N	\N	2019-03-14 22:05:25.702763	\N	
1309	82	1	f2bd35eaab843ed7f680a894c5dbf716e5ab11f1c2bdca7d55c3d291e1783cf1	\N	\N	2019-03-14 23:04:31.668708	2019-03-14 22:44:11.463534	\N	
1310	82	1	147af1ab3d14b964fa97ce4075298e7d918c7cc42fccbec4fb9fda47b6ef8bf6	\N	\N	2019-03-24 19:54:05.296998	2019-03-24 17:38:06.772712	\N	
1311	82	1	269bc9b7661ebf67761ad0fb2dca495078415bc7105312671868e6948437e025	\N	\N	\N	2019-03-25 16:24:21.248098	\N	
1312	82	1	77543f2b21750e5ee9bfa78033a1572c497e7d65b3e81aa47b0e6be9540b0c3e	\N	\N	\N	2019-03-25 17:50:13.04727	\N	
1313	82	1	2c2690fdddbb312335eca3025448abbcf87e42a4146b293efca1378366b63103	\N	\N	\N	2019-03-25 21:59:52.772841	\N	
1314	98	1	c03f6ff861a661f89062bc8412dcdeabed69369d09d67a5417ee2ae8187889ac	\N	\N	2019-03-28 21:59:11.465207	2019-03-28 16:56:53.067248	\N	
1315	103	1	c8bf4c488db97c0ab27c63cd42a556a65a3b793598d5bc587582e41c9e20d086	\N	\N	2019-03-28 22:01:52.801909	2019-03-28 21:59:45.58462	\N	
1316	104	1	b15e06ecf52d98e94839150fdd9006ecf7ee7967d25840d6e508b4f33172a6b1	\N	\N	2019-03-29 21:27:07.333232	2019-03-28 22:02:10.444136	\N	
1317	103	1	62cb36236f58d165a1247dc30ec2fae5c728123c726aaf94e15a41459177e852	\N	\N	2019-03-30 20:45:14.082225	2019-03-29 21:27:29.36999	\N	
1318	104	1	2390bd4dc67280be9a696af820a775dcc2293941a8f94f2dd02247a320be4037	\N	\N	2019-03-30 21:01:13.288697	2019-03-30 20:45:44.6927	\N	
1319	104	1	0ec29c14a974f75356f95f1c7b7f87bbdb3396dcd2d71c336dd1c43013b686b1	\N	\N	2019-03-30 21:04:37.578092	2019-03-30 21:01:25.57494	\N	
1321	104	1	bf3620d91c94a87308a026367bf80056e18be68252614b4b9d2624ddfe3cf2b8	\N	\N	\N	2019-03-30 21:19:07.946444	\N	
1320	82	1	3b402b1a54edda1f358e1be3ea1d6e9b5dc942ef5c6e95b3484a4edb789db6ce	\N	\N	2019-03-30 22:01:34.459296	2019-03-30 21:08:24.280798	\N	
1322	104	1	a62190d3b646766044106512e15f503873a5b4d1bb4486eb05268f161209121c	\N	\N	\N	2019-03-30 22:02:17.324741	\N	
1297	83	1	3e4f87310ab522db5a34789f7becd0fc1d3454189966f9e3b0a276341801fe78	\N	\N	2019-03-31 18:06:32.502911	2019-03-07 08:44:50.226879	\N	
1323	82	1	3068ca3a25431f78a404fdd77797d7ff0ea54054050e230166c2407b55b1b710	\N	\N	\N	2019-03-31 20:38:20.719696	\N	
1324	82	1	UZnc8_b7ij5PP_ybw3HkqkTIKQYxOGxFgWSBFebpSVk	\N	\N	\N	2019-07-17 20:10:16.462895	\N	
1325	82	1	76zAwMjefkvToY37g8vs3lfb4mrEFSZAiStWCIyNZRE	\N	\N	2019-07-17 20:32:10.921256	2019-07-17 20:11:18.11979	\N	
1327	83	1	0q_7WRC3l3ZZRoEf6we-_0IysSDNTdtGBlCQ_wID574	\N	\N	\N	2019-07-17 20:56:00.395391	\N	
1328	83	1	L8OWq-POLyHyV33v54-C-WrZr_b5Oy3esZdKpu1Hnxk	\N	\N	\N	2019-07-17 21:03:33.153549	\N	
1329	83	1	x6HyncnmQYWhn-6DP2oq8YJAZQ6_3QcPveR3qnGf6_Q	\N	\N	\N	2019-07-17 21:04:49.205772	\N	
1330	106	1	-ZQridADNeKGO37QovFHvItXHDKAhopDrXAGiPhj1nU	\N	\N	2019-07-17 22:25:45.196725	2019-07-17 22:19:59.863081	\N	
1331	107	1	m5L62WwtKmhrOnOfQn46XybiMBrmRz_-FB-ezwI-SR0	\N	\N	2019-07-17 22:32:01.993437	2019-07-17 22:25:56.894774	\N	
1332	106	1	miYAXOfpdF0HmzQIguIjzNM-HwJt8nxg1D5qlnrErVo	\N	\N	2019-07-18 05:19:08.674796	2019-07-17 22:32:20.547789	\N	
1333	107	1	vA5Gzv2IV5NMeGj52jXaQtGW8lcPGzGq4GgaIsTDS9A	\N	\N	2019-07-18 05:30:46.290879	2019-07-18 05:19:28.781836	\N	
1334	106	1	HfoGtfOF9BgZwIbpsaLNs1C7JsA_KrL7BkG_BHUMnb0	\N	\N	2019-07-18 06:37:22.462827	2019-07-18 05:30:57.48552	\N	
1335	107	1	f-cvJKEkIkFMKB-jgPVbZIbH_BTYIYa7jwb3ouDIKyI	\N	\N	2019-07-18 06:40:36.596283	2019-07-18 06:37:35.203381	\N	
1336	106	1	YKYY6c7OpZqQD-MKzZlXBNqFzIqFlJvFIY-2ETFJF9o	\N	\N	2019-07-18 06:41:13.204301	2019-07-18 06:40:45.676106	\N	
1337	107	1	qVbYq24L83BwT34iCm0wago4RXIlXfCE0U3iigxsZlM	\N	\N	2019-07-18 06:45:56.038607	2019-07-18 06:41:27.086783	\N	
1338	107	1	Ddpv_NyMYiHSIcOE_Suos5wKA4RIRJ26MBHcawO0UsA	\N	\N	2019-07-18 06:48:07.878007	2019-07-18 06:46:19.948081	\N	
1339	106	1	wHyA4EoH4Yb8hrcevveaxiBmADUF6czxGQbt2WNWIm8	\N	\N	2019-07-18 08:52:12.984901	2019-07-18 06:48:19.993098	\N	
1340	107	1	nvk8vCxVXXpoiHywav5ulIws-y738R6GtHBx8-mQeN4	\N	\N	2019-07-18 09:04:48.189475	2019-07-18 08:52:20.937077	\N	
1341	107	1	OYzGsh2FWzNBKiDWgnmSSmbx81ImKLp-3ppeb5N_8bY	\N	\N	2019-07-18 09:05:38.190292	2019-07-18 09:04:56.719358	\N	
1342	106	1	lZyrBcWHMYalpRY0qvs9f7Ed3esCGbyuxw01lxF5-rM	\N	\N	2019-07-18 09:07:16.265308	2019-07-18 09:05:44.788578	\N	
1343	107	1	cfEV-cfxrr_rzvZgFHxuGRpfPw6Iwxp3TlrcRM_PIJQ	\N	\N	2019-07-19 19:54:18.640034	2019-07-18 09:07:22.981518	\N	
1344	109	1	uI8MJJMI_9b8m0LQrSeIYOzwcbm2fL2U0nhayLsPIXY	\N	\N	2019-07-19 19:58:41.062983	2019-07-19 19:54:28.571028	\N	
1345	109	1	UNn_0913IDVKrR1we3n5JuedVO1M1Vr2YbcFyy-KoCI	\N	\N	2019-07-19 20:05:12.422759	2019-07-19 19:58:51.742122	\N	
1346	110	1	y0BVi6UIvX2z3JzEUQKW6dMAHE1wcg2E3J6bWCR5yBc	\N	\N	2019-07-19 20:17:30.439343	2019-07-19 20:05:25.9895	\N	
1347	109	1	MRPgDYHCJFsy7B78HRgcrVQFvsH50zw7aNLJEUhjeS0	\N	\N	2019-07-19 20:19:40.148911	2019-07-19 20:17:46.822174	\N	
1348	110	1	F2mAZWe4kO8_0ev2BAT6g1n08j0giaCbCkwgpe7tv0g	\N	\N	2019-07-19 20:21:29.050614	2019-07-19 20:19:49.801205	\N	
1349	109	1	4XhnE9ngPu5cAKlEqDdF3wNcSX1RhHV2yVdGaxWrrG4	\N	\N	2019-07-19 20:55:49.838424	2019-07-19 20:21:40.436041	\N	
1350	110	1	wYMlfofTUrTapbi5-GSdxWDacGf5fJyQMBrxVv6SAeU	\N	\N	2019-07-19 21:34:40.044491	2019-07-19 20:55:57.814019	\N	
1351	109	1	xuTYCfNk7XoO70DazOCyL2PDwLYy0tR7B1jWmdYcXJA	\N	\N	\N	2019-07-19 21:35:00.942092	\N	
1352	111	1	zHKaGaz3cXZ-t9F7lDuIb1Raeh0LT4_ayRR5bfni1ow	\N	\N	\N	2019-07-20 08:33:56.105371	\N	
1326	83	1	JWAU313ZGvg62ml4nhOImRwwCma8RKcV9839Pc9IXBk	\N	\N	2019-07-21 19:06:20.107772	2019-07-17 20:32:24.048537	\N	
1354	107	1	vJA91ffO7ZY70van_5G6wBvMUS2RMP-KD_ecdeaLbCw	\N	\N	\N	2019-07-22 20:42:11.31416	\N	
1355	107	1	hGjHoRhbGREtV8GT00W1nQEf34FPLsKQtoloZZZG49U	\N	\N	\N	2019-07-22 21:30:26.980092	\N	
1356	107	1	3d9ahY-UN3blnRwOv_vuCayyBa09V6HLgOweE8ld94o	\N	\N	2019-08-06 21:31:39.806852	2019-08-06 21:20:17.077832	\N	
1353	82	1	RmMarGXFVDcROFvApN2621zTTLbbIHgnPokeea1iy7c	\N	\N	2019-08-15 18:12:34.160976	2019-07-21 19:06:41.957153	\N	
1357	109	1	bppVoWXpK5oWC-xEZ9o5giimC3vKDqRjGhfdHj6A7MM	\N	\N	2019-08-06 21:44:17.914	2019-08-06 21:33:11.336927	\N	
1358	109	1	bSa8-s3e9NZl-ZwEi2KHSULxPgI1gQUNeS3rsz7ysCI	\N	\N	2019-08-06 21:44:30.822694	2019-08-06 21:44:25.611102	\N	
1359	107	1	eHk6zGYEqdj2aJc-p_i3K6MEiDZEkIEOQ2ZScanAa4w	\N	\N	\N	2019-08-06 21:44:37.829706	\N	
1360	110	1	gCLIGoyk5KrbF7f0sSiHyGNFlhJPQEGHRWsRsT_S7dY	\N	\N	\N	2019-08-09 08:09:27.099262	\N	
1361	109	1	Tie4DmmYXvJDAGVdOUD35r40R9EhmTSe9Tj6UV44rbw	\N	\N	2019-08-12 17:12:10.189183	2019-08-12 17:09:47.375674	\N	
1362	110	1	tgFaqgGoTIGQd-D1GmeTLaOWnhWlUcP-lS8NDEMkMLs	\N	\N	2019-08-13 11:16:34.624508	2019-08-12 17:12:21.649137	\N	
1363	109	1	_UlDWaZFSO54w5t-T6W-Q2pE8p_40VqnsW6q1IMyE7A	\N	\N	2019-08-13 11:29:15.29811	2019-08-13 11:24:35.932004	\N	
1364	110	1	6YZ6frWoTq_gCFhCsBvqG1Ldy_5HdkGg_DXIfxFoYM4	\N	\N	2019-08-13 11:39:23.167633	2019-08-13 11:29:25.835046	\N	
1365	109	1	6eH9bdCT7YBbbaKagsjd2J2RL1Rcjqh0C035nC-4_rA	\N	\N	2019-08-13 11:44:23.768038	2019-08-13 11:39:37.050629	\N	
1366	110	1	SrEyS9_gc_JKWlo2DydNr_CQehGdocGVJyjngExdTqQ	\N	\N	2019-08-13 21:13:52.4584	2019-08-13 11:44:34.468205	\N	
1367	110	1	T8XzGzjJGjwH7e3bCNVCNPQa4HB8KCE4lgR9Nv4pcaA	\N	\N	2019-08-13 21:37:05.332944	2019-08-13 21:16:31.594124	\N	
1368	109	1	wHu79jqoO64EAiNvxEhNhqVJN5hLX6qz_V801kzwbNk	\N	\N	2019-08-13 21:47:53.798271	2019-08-13 21:37:20.774492	\N	
1369	110	1	0hnSuIMhfFUy3nvWY_u_wHTntB0bfcemjC-Cj5o5uH4	\N	\N	2019-08-15 08:08:09.191007	2019-08-15 07:47:27.104965	\N	
1370	109	1	X6lyHasNaTlqrQn0INIdo_zLY4QD-_ezQ7-UNrSXEOU	\N	\N	2019-08-15 08:57:36.865025	2019-08-15 08:08:29.000435	\N	
1371	110	1	uFxUUXKAr2SwLJK2tCOsv1-p2lX1RdG_-VpvVoh6XOU	\N	\N	2019-08-15 18:25:05.776229	2019-08-15 08:57:45.614595	\N	
1372	109	1	1Nco7Kp6-OeVcHSocfEH1XpupwmgwnYQO9MNkPxeNh8	\N	\N	2019-08-15 18:25:53.603731	2019-08-15 18:25:21.418517	\N	
1373	110	1	MAa33wnrpjt3TF_kiqy4ShDLPxKVgigd_R0edq7h_RE	\N	\N	\N	2019-08-15 18:26:00.99281	\N	
1374	109	1	oAfPfEvWzQaRgqKqLPq5DR8AFbCh27LrE0u2Utyj1NQ	\N	\N	2019-08-15 18:38:48.987453	2019-08-15 18:27:10.690691	\N	
1376	110	1	_Yh6bl2VaBA8AcLShVAkfw7dBHKXL-Au0sws3YyNHpo	\N	\N	2019-08-15 20:53:09.18436	2019-08-15 20:30:38.991357	\N	
1377	109	1	HXCbPGGej7YjWM_cwDxkmBI03uIpicJlvgDNRY1doME	\N	\N	2019-08-15 20:55:11.973787	2019-08-15 20:53:31.634461	\N	
1378	110	1	KG_HI6Uz9sQn9XC9ba8X5x9-AmpAQoE3jZQB8RPGEwQ	\N	\N	\N	2019-08-15 20:55:42.303925	\N	
1379	110	1	BMrNhUPlxHeHuz-AyjuchpZ5-CFI8fUIneUJqsmHD4M	\N	\N	2019-08-15 21:28:07.639087	2019-08-15 21:18:36.69124	\N	
1380	110	1	5kSAjHW9sFg5Zpz-yE4DE9yVb2DT0PRuxCFvbaWB46I	\N	\N	2019-08-17 19:20:06.909884	2019-08-15 21:28:14.880873	\N	
1381	110	1	fGA3PQt1w-5exe7XlNq3Mr4gMNM9Qwvhfmbu6nrUQfc	\N	\N	\N	2019-08-17 19:21:31.123949	\N	
1382	109	1	OL0TvOW14-1YT96n2OA_VuNgLalbviEgrXqs9QRNfkc	\N	\N	\N	2019-08-19 15:38:50.107401	\N	
1375	82	1	aMLMa63FWfQh8TfEGtW_Z5ah9U9MTmPuQNDo4kIGass	\N	\N	2019-08-19 20:19:55.045243	2019-08-15 18:38:59.431684	\N	
1383	82	1	ZPeF0XS8CknQVzqs_ozUjHBis2n9wfgOMjrbh6uApXs	\N	\N	2019-08-19 20:21:57.500593	2019-08-19 20:20:06.615917	\N	
1384	82	1	tQOwg2pWvhn2QgwyAA5zldFEub1aHoRwoIgkjXsiaPE	\N	\N	\N	2019-08-19 20:23:52.691356	\N	
1385	112	1	hjgKaXf80LFWLIp_T08wjlTA8B8Fq5JXyz7IHRxweQI	\N	\N	2019-08-22 08:45:04.686728	2019-08-22 08:39:25.970928	\N	
1386	110	1	7Qb0q_N5Fp-4sA8GgfJvBxoCXc3tLvQ9ZwlPRFB51_M	\N	\N	\N	2019-08-22 08:45:20.414737	\N	
1390	8	1	tuNPWkRimQeYMAkwO0Pu9CQiaqthv0frNE5K78QUJr8	\N	\N	\N	2019-08-28 20:51:05.489228	\N	
1391	110	1	rm_TwybwtZFJk3smKanEMu1jqO24ITwKkORqDpCHS8I	\N	\N	\N	2019-08-28 20:51:29.985469	\N	
1392	8	1	4So5Rc-WyWRUsT3wQIXq4MN6h9B90Vqzb732oicox3A	\N	\N	\N	2019-08-29 08:30:27.746788	\N	
1393	8	1	iP7qFwRzBH3FgSNZGG070x7F879ivo_TbrR97_S-Lic	\N	\N	\N	2019-08-31 13:59:58.428666	\N	
1394	8	1	8GeKyZM6_ZWOwy4nqgjRdAHQWF9oxvmFATC-Q3LWzvI	\N	\N	\N	2019-08-31 21:45:18.673523	\N	
1395	8	1	jBjhk7hRL_iytOYA8fNQxpDVWaf1wJiuIMlmJ4THlKU	\N	\N	\N	2019-09-01 17:20:26.568566	\N	
1396	8	1	8-fckkfLCLRWOLKzhLxF5xBE9ht_dLqbs36eYOa93s8	\N	\N	\N	2019-09-01 19:50:56.984492	\N	
1397	8	1	N4DMy0bj0lOTELZ4s1wh697VEcRk02Fe_Ao3u0fnZVw	\N	\N	\N	2019-09-01 21:02:36.533041	\N	
1398	109	1	BkZF6DDp5x9RZvIQ0aiSeOkDD30rTWAgC25oO6mUsr0	\N	\N	2019-09-02 10:22:03.030214	2019-09-02 10:08:26.258206	\N	
1399	112	1	X61JDw2N-Gjn9qidfXwdp5IZqD7yyvX6-O5nQ8Pfgno	\N	\N	2019-09-02 11:14:15.512512	2019-09-02 10:22:10.524155	\N	
1400	110	1	g2AtS5ogStsK403Gb77yTB6XA4BQY0fISjvdXvZOf58	\N	\N	2019-09-02 11:22:46.277695	2019-09-02 11:14:33.780826	\N	
1401	109	1	-2EILXBNWqXntacnUGl0lYy7_T032SaF61QU0rLHcD8	\N	\N	2019-09-02 13:44:58.533144	2019-09-02 13:39:56.374391	\N	
1403	8	1	NFyBNhf5nhH5JSaAkDTzsKO2KR4KhVjQrDIKOd_4M70	\N	\N	\N	2019-09-02 14:03:09.437119	\N	
1404	8	1	bq8kaODEvfMWgRUtWcnKm6i4h8_iYZ9mmU2Ptm0WqeU	\N	\N	\N	2019-09-02 15:05:34.206319	\N	
1405	8	1	AZqxEi30W9p_WGbUOZ8jyHmFFayIeD5XCOui6HIVhnc	\N	\N	\N	2019-09-02 18:44:10.917912	\N	
1406	8	1	m2qBvxL-tHpzwM3YKOhs_ovOxxA0pikZc_V3t96Dj8g	\N	\N	\N	2019-09-02 20:25:03.156331	\N	
1402	110	1	ZhCmUgLuq0p4YVeDAFJXJ6UpRRZ5LI_eyxqFZakteA4	\N	\N	2019-09-02 20:32:29.594015	2019-09-02 13:45:05.518786	\N	
1407	109	1	vpg7WjK56leoShRuFJ6v_PgipmJp-u3ruOHkIpys2iU	\N	\N	2019-09-02 20:34:31.069026	2019-09-02 20:32:39.336199	\N	
1409	8	1	NQW6RDWS8OZJLNVy17t24R2IgdZgvzcGiRB9C3mmARI	\N	\N	\N	2019-09-03 08:19:15.795589	\N	
1408	110	1	hAHO3Vo8QuXaB7ITYTUqAT4aIyoeqKVYPbC6wl4keJc	\N	\N	2019-09-04 15:52:43.151791	2019-09-02 20:34:38.425494	\N	
1410	112	1	YfMmuHpXe1z0L2SzO4BebQpM7yWR0r5k_9Yvq2Fidg0	\N	\N	2019-09-04 16:08:28.274017	2019-09-04 15:52:55.867938	\N	
1411	110	1	wLHYUN0SDHqaxnM-fUN46v4GzsyfJo_PpXdWOChJAK4	\N	\N	2019-09-04 17:50:48.407359	2019-09-04 16:08:37.892826	\N	
1413	8	1	mQZwxpJyJrdmVr9-UMA5zI1tNt0BW3F_tUj7o0mflWM	\N	\N	\N	2019-09-04 18:02:08.81974	\N	
1412	112	1	m41jGhXN62jsBvRwJdfS12FwbSsn8bPTy__ZndZKesg	\N	\N	2019-09-04 18:08:06.061821	2019-09-04 17:50:57.05877	\N	
1415	8	1	QaBnhYxXUY5ZzCtbZx3RfpGO5FfTUIBvC5xux-otWpk	\N	\N	\N	2019-09-06 15:04:10.688933	\N	
1416	8	1	ENT4kSouPNRSigWALAewiriwG1fF5qZKNyx6kPWLlfY	\N	\N	\N	2019-09-07 14:35:27.27558	\N	
1414	110	1	J017qXYIF6rOOnQ5nMCy0Jdrm1YHXcOaBpltmG4NtH0	\N	\N	2019-09-09 09:54:00.734543	2019-09-04 18:08:12.089411	\N	
1417	110	1	lzwBPHySjVbX3s-9RZsLaJpjFmQN7tlqeY7Lg644EZk	\N	\N	2019-09-09 10:08:46.812966	2019-09-09 09:54:11.225142	\N	
1419	8	1	oTDFi5SNPebcQT5UGaI4Jp18C8Xml3icpDiqv4k1Saw	\N	\N	\N	2019-09-09 11:20:44.169636	\N	
1418	110	1	qXsbqka8I391zs63F2uUeI3rRJ65ovCRcFMvXW8-DsM	\N	\N	2019-09-09 11:28:37.022853	2019-09-09 10:08:57.844088	\N	
1420	112	1	KZf0Rj8yO0qeP0hSjFiIEBSsphwHPxgrjVKg3EeH97E	\N	\N	2019-09-09 11:30:55.595356	2019-09-09 11:28:48.102501	\N	
1421	110	1	TM0D0VTLIrrU-7PqhB4T0WOuXc17SM0_7B_B-jFY4vg	\N	\N	2019-09-09 11:37:33.643651	2019-09-09 11:31:01.648227	\N	
1422	112	1	c1lMgyv1SgSIvogBFqsyJrLAV0gktBHfen4E408wPb4	\N	\N	2019-09-09 11:38:51.78208	2019-09-09 11:37:43.223969	\N	
1423	110	1	6kqMjHly6wgZSSPECjo-_QB3iUtohlu_8iF1YobBbgk	\N	\N	\N	2019-09-09 11:38:57.953685	\N	
1424	110	1	9LRrA7koR52H6BfAH19cLf8IPi8WCMJttgd_67lhXiI	\N	\N	\N	2019-09-09 16:13:58.985162	\N	
1425	8	1	KXcNc93LVe2Dt2VKq7RqVlTsHT_hD_uux8jSXk9L-6o	\N	\N	\N	2019-09-09 16:44:28.046299	\N	
1426	110	1	5S8e80jM79DjT0VopJddRV6WHB6hBEG9emKoUuKamKA	\N	\N	\N	2019-09-09 17:25:12.712738	\N	
1427	110	1	iJKh2D3KT_qBc-ZajzNY1fd6cUdBENJX-j5rrjE5wyo	\N	\N	\N	2019-09-09 17:36:44.469037	\N	
1428	110	1	zAawsqxi9CJ_ifvTkGZ4lfy1GDflxvsNdcjb9VAWdH4	\N	\N	\N	2019-09-10 17:52:16.910364	\N	
1429	8	1	4zIPuKAgs2TgoBW5_dx96rfDSN3hgQK4eeUf78VmMkQ	\N	\N	\N	2019-09-16 10:51:10.751675	\N	
1430	8	1	kWUp3MkCr5EEm3xWr1U2Pvmjq1uomAuP9Xar3W40Wt0	\N	\N	\N	2019-09-16 10:53:37.182911	\N	
1431	8	1	qwTEwtbBnfww6s7C6535lvo57I8S0-oibwUNrbTlarc	\N	\N	\N	2019-09-16 12:07:43.263284	\N	
1432	8	1	QPcxIPNfFgAHn4e6cIrDPx6j7FQt7r1inawxMYWb9bk	\N	\N	\N	2019-09-17 09:37:55.111831	\N	
1433	8	1	nhoGLrH0W6g8aCqpauRCLp2nQI7K1v98aQdys721fBQ	\N	\N	\N	2019-09-18 06:40:58.221513	\N	
1434	110	1	UaN_qWXzmU3M2-nvNABTDsbhxIr-tcG1aLFay5pq7oU	\N	\N	\N	2019-09-18 10:58:59.729053	\N	
1435	8	1	SvIOiKJEmnHqVhpO9B81KRjKQ1aLffTlxWV2qrx5cf4	\N	\N	\N	2019-09-19 08:12:52.437048	\N	
1436	8	1	zeVzVTzjlkKEP7j0DMG00g66mJUu0WdUFDqKcxfqsoQ	\N	\N	\N	2019-09-19 08:21:20.14056	\N	
1437	8	1	v8gqOQG69GfO6FJf56FRKHs4NFbHoGoHls9cLJAR6LA	\N	\N	\N	2019-09-19 20:11:16.582623	\N	
1438	8	1	TpqPyKf0KAd2QtZaNZeUNydbqvMpC1906i1zvRHxDFc	\N	\N	\N	2019-09-19 22:23:47.870972	\N	
1439	8	1	kTGfthh8Afr6qGFEQWaWmXO-guVoPvvJ3gJuJpUCyDk	\N	\N	\N	2019-09-23 10:25:50.049857	\N	
1440	8	1	WQUXo7NQvJNTFWl7XG_AQWtx2Ujq-GpncquEJURTDas	\N	\N	\N	2019-09-23 10:39:51.645774	\N	
1441	112	1	rpyxAmXABTn3aHqDbezkGPuWZ3JTPmutis9ysZvvqwQ	\N	\N	\N	2019-09-23 19:57:31.12754	\N	
1443	112	1	cTnFXFjhsQxowkgeKMO08pf3JS-Am-iur5Oaxwwdslw	\N	\N	\N	2019-09-24 13:06:32.255758	\N	
1446	82	1	2W_yTY-D07iVqJSKYit6Adaz6y3HfTF0_FgbLo86NrE	\N	\N	2019-09-25 18:59:01.104376	2019-09-25 18:57:54.944663	\N	
1447	110	1	jMXV0Xwxs1EH7yFroqgAWfH8STihEIDMPidRrFRULXM	\N	\N	2019-09-25 19:04:16.61293	2019-09-25 19:03:19.732879	\N	
1448	112	1	PIZNJztlcFK3SLzpvD0-F5m3IDYx4XK7L-LS54KbSLM	\N	\N	2019-09-25 19:27:40.219623	2019-09-25 19:26:14.032509	\N	
1449	110	1	3A19YwGzU9vCHVpRmgc_pS246ufq0ttNv3d_Ovzo4-g	\N	\N	2019-09-25 19:29:28.239448	2019-09-25 19:28:11.76107	\N	
1450	112	1	CtLZ3AnkrIsrFd7kP1sGPO1CooNPKjV9d2wgz4JnQaM	\N	\N	\N	2019-09-25 19:30:38.271822	\N	
1451	8	1	dcRYCYvSxuJevDqgQmwMzRLhnhoNLnXKiEno7nPh1wo	\N	\N	\N	2019-09-28 08:06:35.881478	\N	
1452	8	1	1m2b6NDd_3fWcO5H_aNoMTJEyZBL6O6X32GE4LF3NCI	\N	\N	\N	2019-09-30 12:42:36.083903	\N	
1445	82	1	d5TDjVGQfqXlK8Er2HuYcKNeukPGUUnmTG7uCDRW6wI	\N	\N	2019-09-30 16:39:25.053442	2019-09-24 20:33:38.088455	\N	
1454	112	1	dFmzbnAJe4Y8iXXgS-CNKmVkIbvL53YKofi34jbGASA	\N	\N	\N	2019-10-01 07:28:13.259198	\N	
1455	8	1	SBp7-9OoHJ8iAtx6X6ukSRcCNQQ9PodokzDL93LFegk	\N	\N	\N	2019-10-01 17:30:55.944351	\N	
1456	8	1	vHTGY70dEM5xJLngQ9WTahhJQe4dQB5uXnV8iciofwA	\N	\N	\N	2019-10-03 11:22:50.676078	\N	
1453	82	1	C_gMPjGx0_eC-hcxIi8AleEnS24FoEKpMCzEBbTCyvA	\N	\N	2019-10-03 21:06:23.045434	2019-09-30 16:39:38.488787	\N	
1457	82	1	yMmubYWxXp07emsLn2388_nZS_3tWIClFp2Vuj5UG1Y	\N	\N	\N	2019-10-03 21:06:32.460771	\N	
1458	112	1	TBBR0xIXnmThSTBbFbThF9qjNdu1g6hIUlMxbNPkLDw	\N	\N	2019-10-04 08:07:02.296319	2019-10-04 08:01:29.201155	\N	
1459	110	1	bDhbhu-Uru6TcqaIM78OnfRe5df-sM-18NhQGCuXRjM	\N	\N	2019-10-04 08:07:47.150021	2019-10-04 08:07:08.910237	\N	
1460	112	1	pXRDm-ekgxFxx90Cg_QospnCLBOJU341vdhUJvACT1I	\N	\N	2019-10-04 08:09:28.219461	2019-10-04 08:07:53.476319	\N	
1461	110	1	8PZM7dE-7o4xNclACA0eE8xIopsWo-9Un6CVPNuXd70	\N	\N	2019-10-04 08:14:04.828089	2019-10-04 08:09:43.470032	\N	
1462	112	1	XgixTytxJB0calcjnHhlkfjBrfnNMJE0VOj4VFcLcEI	\N	\N	2019-10-04 11:57:05.789168	2019-10-04 08:14:11.819889	\N	
1463	112	1	yug1SNYrWCNseauQUaar_jBrLdnifGp076XBgySDy5s	\N	\N	2019-10-04 12:01:59.604857	2019-10-04 11:57:12.134601	\N	
1464	110	1	uqopSimvjor51kFZS3kG4i9jelocUhfEAVEYkia0oZo	\N	\N	2019-10-04 13:24:43.63455	2019-10-04 12:02:06.878374	\N	
1465	112	1	eHXutNLM2q-aeHo5a_Nx0NUHrj8P7-JHIZyezLalwp0	\N	\N	2019-10-04 13:42:35.179815	2019-10-04 13:24:50.464797	\N	
1466	110	1	0yj1jvdf9Mmr3eFnxXYeDrSZnZIhfk-zdQGVi4QG75s	\N	\N	2019-10-04 13:43:17.800038	2019-10-04 13:42:41.591424	\N	
1467	112	1	te-cDtTyYhlPQT2QoEtvZy9iJRZoXA-0OEaa-MNTBc8	\N	\N	\N	2019-10-04 13:43:28.883033	\N	
1468	8	1	5xP-9lMCkLB94pOn51v7kVqV29HRXxKj0BQ9f8GX6EU	\N	\N	\N	2019-10-08 09:42:37.436089	\N	
1469	8	1	imfIftDC-yCWHkTS7o05ibTiBNBYw8ZlZq355nAcTdk	\N	\N	\N	2019-10-12 15:02:44.202729	\N	
1470	110	1	GY5uy4QvU1B3dqe2HNOzgFu6-W_iKkUgwl1SRm2DhQQ	\N	\N	\N	2019-10-14 19:40:28.337829	\N	
1471	110	1	J2yW2uvaLOQB7vMOzls4BN4-vHxVGPBUndDrKne2Qlk	\N	\N	\N	2019-10-14 19:40:48.279933	\N	
1472	110	1	QPs-v_TXog0OEv5tQB8wXkW8M1_0POUw45uPVIbtHXo	\N	\N	\N	2019-10-14 20:05:31.71204	\N	
\.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, created_at, updated_at) FROM stdin;
1	android	4621b78501cc9150592b0b725fd1f594dbe7f2fe73cc2304c192d775745aeb80	d085629d9f16ff1155f1f5b3e5af1c3c9e96716dc103b96c77b658b6e1e5c8b0	https://159.203.42.111	http://159.203.42.111	2018-09-07 10:38:11.017669	2018-09-07 11:01:06.534903
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.permissions (id, action, subject_class, subject_id, active, role_id, created_at, updated_at) FROM stdin;
2	read	ProjectTask	\N	t	1	2019-07-15 14:37:02.863703	2019-07-15 14:37:02.863703
3	update	ProjectTask	\N	t	1	2019-07-15 14:37:02.865657	2019-07-15 14:37:02.865657
4	destroy	ProjectTask	\N	t	1	2019-07-15 14:37:02.867596	2019-07-15 14:37:02.867596
5	create	Task	\N	t	1	2019-07-15 14:37:02.869442	2019-07-15 14:37:02.869442
6	read	Task	\N	t	1	2019-07-15 14:37:02.871193	2019-07-15 14:37:02.871193
7	update	Task	\N	t	1	2019-07-15 14:37:02.872854	2019-07-15 14:37:02.872854
8	destroy	Task	\N	t	1	2019-07-15 14:37:02.874518	2019-07-15 14:37:02.874518
9	create	WorkZone	\N	t	1	2019-07-15 14:37:02.876059	2019-07-15 14:37:02.876059
10	read	WorkZone	\N	t	1	2019-07-15 14:37:02.877605	2019-07-15 14:37:02.877605
11	update	WorkZone	\N	t	1	2019-07-15 14:37:02.879156	2019-07-15 14:37:02.879156
12	destroy	WorkZone	\N	t	1	2019-07-15 14:37:02.880703	2019-07-15 14:37:02.880703
13	create	Contract	\N	t	1	2019-07-15 14:37:02.882307	2019-07-15 14:37:02.882307
14	read	Contract	\N	t	1	2019-07-15 14:37:02.883838	2019-07-15 14:37:02.883838
15	update	Contract	\N	t	1	2019-07-15 14:37:02.885411	2019-07-15 14:37:02.885411
16	destroy	Contract	\N	t	1	2019-07-15 14:37:02.887045	2019-07-15 14:37:02.887045
17	create	Setting	\N	t	1	2019-07-15 14:37:02.888745	2019-07-15 14:37:02.888745
18	read	Setting	\N	t	1	2019-07-15 14:37:02.890323	2019-07-15 14:37:02.890323
19	update	Setting	\N	t	1	2019-07-15 14:37:02.8919	2019-07-15 14:37:02.8919
20	destroy	Setting	\N	t	1	2019-07-15 14:37:02.893505	2019-07-15 14:37:02.893505
21	create	ProjectTask	\N	t	2	2019-07-15 14:37:02.895157	2019-07-15 14:37:02.895157
22	read	ProjectTask	\N	t	2	2019-07-15 14:37:02.896846	2019-07-15 14:37:02.896846
23	update	ProjectTask	\N	t	2	2019-07-15 14:37:02.898409	2019-07-15 14:37:02.898409
24	destroy	ProjectTask	\N	t	2	2019-07-15 14:37:02.900025	2019-07-15 14:37:02.900025
25	create	Task	\N	t	2	2019-07-15 14:37:02.901572	2019-07-15 14:37:02.901572
26	read	Task	\N	t	2	2019-07-15 14:37:02.903319	2019-07-15 14:37:02.903319
27	update	Task	\N	t	2	2019-07-15 14:37:02.9049	2019-07-15 14:37:02.9049
28	destroy	Task	\N	t	2	2019-07-15 14:37:02.90646	2019-07-15 14:37:02.90646
29	create	WorkZone	\N	t	2	2019-07-15 14:37:02.908038	2019-07-15 14:37:02.908038
30	read	WorkZone	\N	t	2	2019-07-15 14:37:02.909613	2019-07-15 14:37:02.909613
31	update	WorkZone	\N	t	2	2019-07-15 14:37:02.9112	2019-07-15 14:37:02.9112
32	destroy	WorkZone	\N	t	2	2019-07-15 14:37:02.912813	2019-07-15 14:37:02.912813
33	create	Contract	\N	t	2	2019-07-15 14:37:02.914349	2019-07-15 14:37:02.914349
34	read	Contract	\N	t	2	2019-07-15 14:37:02.915988	2019-07-15 14:37:02.915988
35	update	Contract	\N	t	2	2019-07-15 14:37:02.917557	2019-07-15 14:37:02.917557
36	destroy	Contract	\N	t	2	2019-07-15 14:37:02.919169	2019-07-15 14:37:02.919169
37	create	Setting	\N	t	2	2019-07-15 14:37:02.920961	2019-07-15 14:37:02.920961
38	read	Setting	\N	t	2	2019-07-15 14:37:02.92255	2019-07-15 14:37:02.92255
39	update	Setting	\N	t	2	2019-07-15 14:37:02.92421	2019-07-15 14:37:02.92421
40	destroy	Setting	\N	t	2	2019-07-15 14:37:02.925778	2019-07-15 14:37:02.925778
41	create	ProjectTask	\N	t	3	2019-07-15 14:37:02.927446	2019-07-15 14:37:02.927446
42	read	ProjectTask	\N	t	3	2019-07-15 14:37:02.929026	2019-07-15 14:37:02.929026
43	update	ProjectTask	\N	t	3	2019-07-15 14:37:02.930609	2019-07-15 14:37:02.930609
44	destroy	ProjectTask	\N	t	3	2019-07-15 14:37:02.932286	2019-07-15 14:37:02.932286
45	create	Task	\N	t	3	2019-07-15 14:37:02.934058	2019-07-15 14:37:02.934058
46	read	Task	\N	t	3	2019-07-15 14:37:02.935648	2019-07-15 14:37:02.935648
47	update	Task	\N	t	3	2019-07-15 14:37:02.93725	2019-07-15 14:37:02.93725
48	destroy	Task	\N	t	3	2019-07-15 14:37:02.938847	2019-07-15 14:37:02.938847
49	create	WorkZone	\N	t	3	2019-07-15 14:37:02.940419	2019-07-15 14:37:02.940419
50	read	WorkZone	\N	t	3	2019-07-15 14:37:02.942025	2019-07-15 14:37:02.942025
51	update	WorkZone	\N	t	3	2019-07-15 14:37:02.94354	2019-07-15 14:37:02.94354
52	destroy	WorkZone	\N	t	3	2019-07-15 14:37:02.945145	2019-07-15 14:37:02.945145
53	create	Contract	\N	t	3	2019-07-15 14:37:02.946711	2019-07-15 14:37:02.946711
54	read	Contract	\N	t	3	2019-07-15 14:37:02.948617	2019-07-15 14:37:02.948617
55	update	Contract	\N	t	3	2019-07-15 14:37:02.950171	2019-07-15 14:37:02.950171
56	destroy	Contract	\N	t	3	2019-07-15 14:37:02.951779	2019-07-15 14:37:02.951779
57	create	Setting	\N	t	3	2019-07-15 14:37:02.953553	2019-07-15 14:37:02.953553
58	read	Setting	\N	t	3	2019-07-15 14:37:02.955183	2019-07-15 14:37:02.955183
59	update	Setting	\N	t	3	2019-07-15 14:37:02.95673	2019-07-15 14:37:02.95673
60	destroy	Setting	\N	t	3	2019-07-15 14:37:02.95827	2019-07-15 14:37:02.95827
61	approved	Contract	\N	t	1	2019-07-15 14:37:02.959866	2019-07-15 14:37:02.959866
62	archive	Contract	\N	t	1	2019-07-15 14:37:02.96147	2019-07-15 14:37:02.96147
63	pending_team	Contract	\N	t	1	2019-07-15 14:37:02.963024	2019-07-15 14:37:02.963024
64	approved_team	Contract	\N	t	1	2019-07-15 14:37:02.964639	2019-07-15 14:37:02.964639
65	archive_team	Contract	\N	t	1	2019-07-15 14:37:02.966163	2019-07-15 14:37:02.966163
66	approved	Contract	\N	t	2	2019-07-15 14:37:02.96777	2019-07-15 14:37:02.96777
67	archive	Contract	\N	t	2	2019-07-15 14:37:02.969422	2019-07-15 14:37:02.969422
68	pending_team	Contract	\N	t	2	2019-07-15 14:37:02.97102	2019-07-15 14:37:02.97102
69	approved_team	Contract	\N	t	2	2019-07-15 14:37:02.972662	2019-07-15 14:37:02.972662
70	archive_team	Contract	\N	t	2	2019-07-15 14:37:02.974192	2019-07-15 14:37:02.974192
71	approved	Contract	\N	t	3	2019-07-15 14:37:02.975807	2019-07-15 14:37:02.975807
72	archive	Contract	\N	t	3	2019-07-15 14:37:02.977333	2019-07-15 14:37:02.977333
73	pending_team	Contract	\N	t	3	2019-07-15 14:37:02.978862	2019-07-15 14:37:02.978862
74	approved_team	Contract	\N	t	3	2019-07-15 14:37:02.980415	2019-07-15 14:37:02.980415
75	archive_team	Contract	\N	t	3	2019-07-15 14:37:02.982008	2019-07-15 14:37:02.982008
76	tracker	User	\N	t	1	2019-07-15 14:37:02.983736	2019-07-15 14:37:02.983736
77	time_tracker	User	\N	t	1	2019-07-15 14:37:02.985299	2019-07-15 14:37:02.985299
78	tracker	User	\N	t	2	2019-07-15 14:37:02.986812	2019-07-15 14:37:02.986812
79	time_tracker	User	\N	t	2	2019-07-15 14:37:02.988395	2019-07-15 14:37:02.988395
80	tracker	User	\N	t	3	2019-07-15 14:37:02.989962	2019-07-15 14:37:02.989962
81	time_tracker	User	\N	t	3	2019-07-15 14:37:02.991514	2019-07-15 14:37:02.991514
82	create	Permission	\N	t	1	2019-07-15 14:37:02.996662	2019-07-15 14:37:02.996662
83	read	Permission	\N	t	1	2019-07-15 14:37:02.998568	2019-07-15 14:37:02.998568
84	update	Permission	\N	t	1	2019-07-15 14:37:03.000345	2019-07-15 14:37:03.000345
85	destroy	Permission	\N	t	1	2019-07-15 14:37:03.00205	2019-07-15 14:37:03.00205
86	create	Permission	\N	t	2	2019-07-15 14:37:03.003667	2019-07-15 14:37:03.003667
87	read	Permission	\N	t	2	2019-07-15 14:37:03.005245	2019-07-15 14:37:03.005245
88	update	Permission	\N	t	2	2019-07-15 14:37:03.006802	2019-07-15 14:37:03.006802
89	destroy	Permission	\N	t	2	2019-07-15 14:37:03.008457	2019-07-15 14:37:03.008457
90	create	Permission	\N	t	3	2019-07-15 14:37:03.010021	2019-07-15 14:37:03.010021
91	read	Permission	\N	t	3	2019-07-15 14:37:03.011595	2019-07-15 14:37:03.011595
92	update	Permission	\N	t	3	2019-07-15 14:37:03.013104	2019-07-15 14:37:03.013104
93	destroy	Permission	\N	t	3	2019-07-15 14:37:03.014599	2019-07-15 14:37:03.014599
1	create	ProjectTask	\N	t	1	2019-07-15 14:37:02.860674	2019-07-15 14:40:10.521443
94	create	Properties	\N	t	1	2019-08-20 22:42:05.011845	2019-08-20 22:42:05.011845
95	read	Properties	\N	t	1	2019-08-20 22:42:05.019425	2019-08-20 22:42:05.019425
96	update	Properties	\N	t	1	2019-08-20 22:42:05.02397	2019-08-20 22:42:05.02397
97	destroy	Properties	\N	t	1	2019-08-20 22:42:05.026998	2019-08-20 22:42:05.026998
98	only_for_admins	Properties	\N	t	1	2019-08-20 22:42:05.029931	2019-08-20 22:42:05.029931
99	create	Toolkit	\N	t	1	2019-08-20 22:42:05.032927	2019-08-20 22:42:05.032927
100	read	Toolkit	\N	t	1	2019-08-20 22:42:05.035817	2019-08-20 22:42:05.035817
101	update	Toolkit	\N	t	1	2019-08-20 22:42:05.03907	2019-08-20 22:42:05.03907
102	destroy	Toolkit	\N	t	1	2019-08-20 22:42:05.041734	2019-08-20 22:42:05.041734
103	only_for_admins	Toolkit	\N	t	1	2019-08-20 22:42:05.044323	2019-08-20 22:42:05.044323
104	create	Properties	\N	t	2	2019-08-20 22:42:05.047036	2019-08-20 22:42:05.047036
105	read	Properties	\N	t	2	2019-08-20 22:42:05.04979	2019-08-20 22:42:05.04979
106	update	Properties	\N	t	2	2019-08-20 22:42:05.052441	2019-08-20 22:42:05.052441
107	destroy	Properties	\N	t	2	2019-08-20 22:42:05.055092	2019-08-20 22:42:05.055092
108	only_for_admins	Properties	\N	t	2	2019-08-20 22:42:05.058505	2019-08-20 22:42:05.058505
109	create	Toolkit	\N	t	2	2019-08-20 22:42:05.062319	2019-08-20 22:42:05.062319
110	read	Toolkit	\N	t	2	2019-08-20 22:42:05.065548	2019-08-20 22:42:05.065548
111	update	Toolkit	\N	t	2	2019-08-20 22:42:05.088375	2019-08-20 22:42:05.088375
112	destroy	Toolkit	\N	t	2	2019-08-20 22:42:05.091866	2019-08-20 22:42:05.091866
113	only_for_admins	Toolkit	\N	t	2	2019-08-20 22:42:05.095013	2019-08-20 22:42:05.095013
114	create	Properties	\N	t	3	2019-08-20 22:42:05.097873	2019-08-20 22:42:05.097873
115	read	Properties	\N	t	3	2019-08-20 22:42:05.100662	2019-08-20 22:42:05.100662
116	update	Properties	\N	t	3	2019-08-20 22:42:05.103357	2019-08-20 22:42:05.103357
117	destroy	Properties	\N	t	3	2019-08-20 22:42:05.106075	2019-08-20 22:42:05.106075
118	only_for_admins	Properties	\N	t	3	2019-08-20 22:42:05.108939	2019-08-20 22:42:05.108939
119	create	Toolkit	\N	t	3	2019-08-20 22:42:05.111612	2019-08-20 22:42:05.111612
120	read	Toolkit	\N	t	3	2019-08-20 22:42:05.114325	2019-08-20 22:42:05.114325
121	update	Toolkit	\N	t	3	2019-08-20 22:42:05.116994	2019-08-20 22:42:05.116994
122	destroy	Toolkit	\N	t	3	2019-08-20 22:42:05.119591	2019-08-20 22:42:05.119591
123	only_for_admins	Toolkit	\N	t	3	2019-08-20 22:42:05.122222	2019-08-20 22:42:05.122222
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.places (id, latitude, longitude, task_id, country_id, city, state, address, apartment) FROM stdin;
496	51.0486150999999992	-114.070845899999995	502	\N	\N	\N	Калгари, Альберта, Канада	45
497	53.9332706000000002	-116.576503500000001	503	\N	\N	\N	Canada, Alberta	100
498	53.9332706000000002	-116.576503500000001	504	\N	\N	\N	Canada, Alberta	
499	53.9332706000000002	-116.576503500000001	505	\N	\N	\N	Canada, Alberta	
500	53.9332706000000002	-116.576503500000001	506	\N	\N	\N	Canada, Alberta	
501	53.9332706000000002	-116.576503500000001	507	\N	\N	\N	Canada, Alberta	
339	48.4647170000000003	35.0461829999999992	345	\N	\N	\N	Днипро, Днепропетровская область, Украина, 49000	\N
507	0.545546199999999981	24.9042208000000009	513	\N	\N	\N	Чопо, Демократическая Республика Конго	
526	51.0513945000000007	-114.101353200000005	532	\N	\N	\N	1810 Bowness Rd NW, Calgary, AB T2N 3K4, Канада	
527	53.9332706000000002	-116.576503500000001	533	\N	\N	\N	Canada, Alberta	
532	53.9332706000000002	-116.576503500000001	538	\N	\N	\N	Canada, Alberta	
533	51.0676849999999973	-114.201060999999996	539	\N	\N	\N	74 Cougar Ridge Mews SW, Calgary, AB T3H 5P3, Канада	
534	53.9332706000000002	-116.576503500000001	540	\N	\N	\N	Canada, Alberta	
354	49.9897694000000001	36.3411358000000035	360	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	\N
536	53.9332706000000002	-116.576503500000001	542	\N	\N	\N	Canada, Alberta	
356	49.9862400000000022	36.3632956000000007	362	\N	\N	\N	Салтівське шосе, 266, Харків, Харківська область, Украина, 61000	\N
537	53.9332706000000002	-116.576503500000001	543	\N	\N	\N	Canada, Alberta	
330	48.4647170000000003	35.0461829999999992	336	\N	\N	\N	Днепропетровская область, Украина	
538	53.9332706000000002	-116.576503500000001	544	\N	\N	\N	Canada, Alberta	
539	53.9332706000000002	-116.576503500000001	545	\N	\N	\N	Canada, Alberta	
550	49.9897694000000001	36.3411358000000035	556	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	t56
551	53.9332706000000002	-116.576503500000001	557	\N	\N	\N	Canada, Alberta	100
554	51.0622676999999996	-114.0648269	560	\N	\N	\N	137 11 Ave NW, Calgary, AB T2M 0B7, Канада2502 6 St NE, Calgary, AB T2E 3Z3, Канада	15
555	51.0503683000000024	-114.201211099999995	561	\N	\N	\N	180 Strathlea Pl SW, Calgary, AB T3H 4T5, Канада	23
560	51.0506357000000008	-114.065658600000006	566	\N	\N	\N	214 3 Ave SW, Calgary, AB T2P 0B4, Канада	15
561	51.081114300000003	-114.024267300000005	567	\N	\N	\N	1595 32 Ave NE, Calgary, AB T2E 7Z5, Канада	15
562	51.0476935000000012	-114.0562319	568	\N	\N	\N	332 6 Ave SE, Calgary, AB T2G 4S6, Канада	
566	51.0448009999999996	-114.187987000000007	572	\N	\N	\N	1411 69 St SW, Calgary, AB T3H 3W8, Канада	
571	51.0447330999999878	-114.071883099999994	577	\N	\N	\N	Canada, Calgary	
574	\N	\N	580	\N	\N	\N	test12093	
576	51.0867959999999997	-114.157746000000003	582	\N	\N	\N	3736 R 49 St NW, Calgary, AB T3A 2E3, Канада	
577	51.0872280000000032	-114.0382654	583	\N	\N	\N	Deerfoot Trail, Calgary, AB T2E, Канада	
578	51.0447330999999878	-114.071883099999994	584	\N	\N	\N	Canada, Calgary	
582	37.7036534000000003	-122.161247099999997	588	\N	\N	\N	Bakery Street	
586	\N	\N	592	\N	\N	\N	tttttttttttttttttttttttreeeeeee1	100
591	51.0303061999999983	-114.069505800000002	597	\N	\N	\N	305 25 Ave SW, Calgary, AB T2S 0L3, Канада	100
592	51.0584269999999876	-114.115803900000003	598	\N	\N	\N	2406 6 Ave NW, Calgary, AB T2N 0X4, Канада	15
593	51.0375384000000025	-114.299340799999996	599	\N	\N	\N	30222 River Ridge Dr, Calgary, AB T3Z 3L1, Канада	15
594	51.0637720000000002	-114.113256000000007	600	\N	\N	\N	1312 22 St NW, Calgary, AB T2N 2N4, Канада	100
552	51.0121718999999985	-114.047585799999993	558	\N	\N	\N	4620 Blackfoot Trail SE, Calgary, AB T2G 4G2, Канада	3
413	51.0818336000000031	-114.099523899999994	419	\N	\N	\N	3328 Constable Pl NW, Calgary, AB T2L 0L1, Канада	
386	51.038964	-114.072011000000003	392	\N	\N	\N	508 15th Ave SW, Calgary, AB T2R 0R2, Канада	\N
388	51.0306139999999999	-114.099959999999996	394	\N	\N	\N	1700 26 Ave SW, Calgary, AB T2T 1C8, Канада	\N
389	48.4647170000000003	35.0461829999999992	395	\N	\N	\N	Днипро, Днепропетровская область, Украина, 49000	\N
390	51.0299029999999973	-114.139343999999994	396	\N	\N	\N	2804 36 St SW, Calgary, AB T3E 3A1, Канада	\N
391	49.990248600000001	36.3423619000000002	397	\N	\N	\N	проспект Тракторобудівників, 88, Харків, Харківська область, Украина, 61000	\N
399	51.0565241999999984	-113.985130499999997	405	\N	\N	\N	565 36 St NE, Calgary, AB T2A 6K3, Канада	\N
556	51.0447330999999878	-114.071883099999994	562	\N	\N	\N	Canada, Calgary	15
557	51.0447330999999878	-114.071883099999994	563	\N	\N	\N	Canada, Calgary	
563	51.0447330999999878	-114.071883099999994	569	\N	\N	\N	Калгари, Альберта, Канада	34
564	51.0447330999999878	-114.071883099999994	570	\N	\N	\N	Canada, Calgary	
565	51.0447330999999878	-114.071883099999994	571	\N	\N	\N	Canada, Calgary	
407	49.9897694000000001	36.3411358000000035	413	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	\N
567	51.0447330999999878	-114.071883099999994	573	\N	\N	\N	Canada, Calgary	100
502	42.0648576999999975	-88.0421324999999939	508	\N	\N	\N	Ветеринарная	
414	51.0461489999999998	-114.090678999999994	420	\N	\N	\N	1220 9 Ave SW, Calgary, AB T2P 2C4, Канада	\N
505	3.73554420000000009	3.74350899999999998	511	\N	\N	\N	Гвинейский зал.	
569	49.9897694000000001	36.3411358000000035	575	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	45
568	51.0478813000000073	-114.050762399999996	574	\N	\N	\N	553 5 St SE, Calgary, AB T2G 0G1, Канада	16
508	53.9332706000000002	-116.576503500000001	514	\N	\N	\N	Canada, Alberta	4342
572	51.0120959000000127	-113.984925000000004	578	\N	\N	\N	calgary 3435	
446	10.4791039000000001	26.7967848999999987	452	\N	\N	\N	Al Deain, Судан	, , , 70lol
515	53.9332706000000002	-116.576503500000001	521	\N	\N	\N	Canada, Alberta	
424	51.0234088999999997	-114.350417500000006	430	\N	\N	\N	Township Rd 241, Calgary, AB T3Z, Канада	\N
425	-33.8650692000000006	150.975283600000012	431	\N	\N	\N	50 Orchardleigh St, Yennora NSW 2161, Australia	\N
426	51.023974299999999	-114.210528999999994	432	\N	\N	\N	3320 85 St SW, Calgary, AB T3H 4G1, Канада	\N
518	\N	\N	524	\N	\N	\N	ffkdsjfksdjflk	100
431	51.0766988999999967	-114.109740799999997	437	\N	\N	\N	2628 Morley Trail NW, Calgary, AB T2M 4G5, Канада	\N
524	53.9332706000000002	-116.576503500000001	530	\N	\N	\N	Canada, Alberta	
528	53.9332706000000002	-116.576503500000001	534	\N	\N	\N	Canada, Alberta	
540	53.9332706000000002	-116.576503500000001	546	\N	\N	\N	Canada, Alberta	
436	51.0556989999999971	-114.029677000000007	442	\N	\N	\N	332 Hill Rd NE, Calgary, AB T2E 5E2, Канада	100
541	53.9332706000000002	-116.576503500000001	547	\N	\N	\N	Canada, Alberta	
438	51.0556989999999971	-114.029677000000007	444	\N	\N	\N	332 Hill Rd NE, Calgary, AB T2E 5E2, Канада	300
542	49.9897694000000001	36.3411358000000035	548	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	55
543	49.9897694000000001	36.3411358000000035	549	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	45
575	\N	\N	581	\N	\N	\N	test2336	
443	51.0766988999999967	-114.109740799999997	449	\N	\N	\N	2628 Morley Trail NW, Calgary, AB T2M 4G5, Канада	6
444	51.0766988999999967	-114.109740799999997	450	\N	\N	\N	2628 Morley Trail NW, Calgary, AB T2M 4G5, Канада	
445	28.8370715000000004	-105.928864099999998	451	\N	\N	\N	Альдама, Чихуахуа, Мексика	\N
447	51.0766988999999967	-114.109740799999997	453	\N	\N	\N	2628 Morley Trail NW, Calgary, AB T2M 4G5, Канада	100
579	51.0279912000000024	-114.246182099999999	585	\N	\N	\N	131 Pinebrook Way, Calgary, AB T3Z 3K3, Канада	
580	51.085782199999997	-113.977961300000004	586	\N	\N	\N	31 Whitaker Bay NE, Calgary, AB T1Y 5H7, Канада	
441	51.0397089999999878	-114.174807900000005	447	\N	\N	\N	160 Christie Park Manor SW, Calgary, AB T3H 2T6, Канада	1111
583	37.7036534000000003	-122.161247099999997	589	\N	\N	\N	Bakery Street	2802
587	51.055759700000003	-114.1488327	593	\N	\N	\N	138 Wildwood Dr SW, Calgary, AB T3C 3C5, Канада	15
588	51.0728319999999982	-114.222284999999999	594	\N	\N	\N	132 Cougarstone Manor SW, Calgary, AB T3H, Канада	100
589	49.9897694000000001	36.3411358000000035	595	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	34
595	51.0888758999999979	-114.118591800000004	601	\N	\N	\N	3947 Brooklyn Crescent NW, Calgary, AB T2L 1G9, Канада	100
451	51.0697759999999974	-114.071975699999996	457	\N	\N	\N	506 19 Ave NW, Calgary, AB T2M 0Y6, Канада	
503	51.0588853000000071	-114.051034799999996	509	\N	\N	\N	810 4a St NE, Calgary, AB T2E 3W4, Канада	4342
506	7.80724479999999943	20.1402594000000015	512	\N	\N	\N	Баминги, Центральноафриканская Республика	
525	53.9332706000000002	-116.576503500000001	531	\N	\N	\N	Canada, Alberta	
529	53.9332706000000002	-116.576503500000001	535	\N	\N	\N	Canada, Alberta	
530	53.9332706000000002	-116.576503500000001	536	\N	\N	\N	Canada, Alberta	100
544	48.4647170000000003	35.0461829999999992	550	\N	\N	\N	Unnamed Road, Дніпро́, Дніпропетровська область, Украина, 49000	
545	49.9897694000000001	36.3411358000000035	551	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	
546	49.9897694000000001	36.3411358000000035	552	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	45
547	49.9897694000000001	36.3411358000000035	553	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	45
548	49.9897694000000001	36.3411358000000035	554	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	56
549	49.9897694000000001	36.3411358000000035	555	\N	\N	\N	проспект Тракторобудівників, 86/137, Харків, Харківська область, Украина, 61000	t6
553	51.0764804000000012	-114.141198700000004	559	\N	\N	\N	Collegiate Rd NW, Calgary, AB T2N 5A6, КанадаCollegiate Rd NW, Calgary, AB T2N 5A6, Канада	10
558	51.0174238000000031	-114.049324600000006	564	\N	\N	\N	4000 4 St SE, Calgary, AB T2G 2W3, Канада	15
559	51.0262999999999991	-114.183983999999995	565	\N	\N	\N	43 Sienna Park Grove SW, Calgary, AB T3H 4M9, Канада	
570	51.0446199999999877	-114.101385899999997	576	\N	\N	\N	1736 10 Ave SW, Calgary, AB T3C 0J8, Канада	
573	\N	\N	579	\N	\N	\N	test1209	
581	37.7036534000000003	-122.161247099999997	587	\N	\N	\N	Bakery Street	12
584	51.0267789999999977	-114.091950999999995	590	\N	\N	\N	1408 Premier Way SW, Calgary, AB T2T 1L9, Канада	15
585	51.0698214000000021	-114.050089900000003	591	\N	\N	\N	2002 5 St NE, Calgary, AB T2E 3X5, Канада	15
590	37.7036534000000003	-122.161247099999997	596	\N	\N	\N	Bakery Street	
596	51.0579636999999877	-114.121964000000006	602	\N	\N	\N	2628 6 Ave NW, Calgary, AB T2N 0X8, Канада	100
\.


--
-- Data for Name: project_tasks; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.project_tasks (id, name, address, type_pt, description, active, created_at, updated_at, number) FROM stdin;
13	Перший тест	321 10 St NW, Calgary, AB T2N 1V7, Канада	Дом	g dfgdf gd gdfg dffg dfg dfg df	t	2019-02-06 09:59:01.9482	2019-02-06 09:59:01.9482	1
15	Test project 		house		t	2019-02-06 12:48:18.755265	2019-02-06 12:48:18.755265	111
18	Test 2	ffkdsjfksdjflk	dfjksdlsdjfkl	dfjlskfjdslfkjldskjf	t	2019-02-25 20:54:48.596459	2019-02-28 13:55:50.658502	589
20	Test 259				t	2019-02-28 13:57:54.657264	2019-02-28 13:57:54.657264	100
21	Test 259				t	2019-02-28 13:58:30.061361	2019-02-28 13:58:30.061361	100
24	test	Toronto	renovation	12345	t	2019-02-28 20:17:31.081643	2019-02-28 20:17:31.081643	123
25	test 28/02/2019	32/d, Linden ave., Toronto, ON, CA	renovation	renovation wall	t	2019-02-28 20:34:30.793899	2019-02-28 20:35:45.598156	123
22	There are many variations of passages	Bakery Street	hbv	fhh	t	2019-02-28 17:27:46.774072	2019-03-03 13:17:53.265956	2802
26	test project diagramma	Canada 	home	Cccvg	t	2019-03-22 13:25:12.753545	2019-03-22 13:25:12.753545	111
27	Progect2803				t	2019-03-28 21:49:38.161147	2019-03-28 21:49:38.161147	2803
29	TEST	Canada, Calgary	test		t	2019-07-17 22:29:29.176983	2019-07-17 22:29:34.142938	1807
30	Progect0708	Calgary 8545	test		t	2019-08-06 21:24:18.640549	2019-08-06 21:24:18.640549	2803
31	The House of Stager's dream	1001 Boulevard Décarie, Montréal, QC H4A 3J1, Canada	castle		t	2019-09-02 06:37:33.000184	2019-09-02 06:37:33.000184	1234
32	Renovation	Canada, Calgary	test	test	t	2019-09-02 10:09:54.306656	2019-09-09 11:27:02.823571	20919
28	TEST	Canada, Alberta	test	test	f	2019-07-17 19:42:41.646637	2019-09-17 10:31:45.948878	170719
33	TEST27	Canada, Calgary	test	test	t	2019-09-26 21:55:05.361728	2019-09-26 21:55:05.361728	2709
34	Last new project	Calgary 8545	test	test	t	2019-10-01 07:29:41.547575	2019-10-01 07:29:41.547575	110
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.projects (id, description, year_completion, value, owner_name, project_address_id, owner_contact_one, phone_one, email_one, owner_contact_two, consultant_two, phone_two, email_two, contract_id, created_at, updated_at, check_past) FROM stdin;
116	Test	1999	100	TREDCO	973	TRED	(777) 777-7777	k4872319@yahoo.com	\N	\N	\N	\N	217	2019-07-19 19:51:51.92895	2019-07-19 19:58:19.337124	f
\.


--
-- Data for Name: quick_books_integrations; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.quick_books_integrations (id, created_at, updated_at, tokens, access_token_expired_at) FROM stdin;
1	2019-09-09 11:07:53.757739	2019-10-04 15:00:47.446439	{"expires_in": 3600, "token_type": "bearer", "access_token": "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..eMQxHfpScE1zUvTQ5k6VIA.ek36VzQ_ZmBVLPkytW4MevdGgDybxHCE9SoTrde4dc-u8eAVtqGRYUjtu0xjSLqHVVIz_mPfHb5zdLwKwVzfpXG3r1webJZywJ7zocz_ksdJByaDIYe5Ztwh_gD_u_fzyYucz8Z7GG79E2l2dZ-Eb11TFAeZ6RWU_4j50f2DzHJpy2HZsaYQEN0P0DKJgHXZIuJwxRfAYSLSdOYV9Xjgefzv2QomDHqoZ9yR_EpNQpVRrpaZs2F41LKlf6TOQ5lMkJCbeLOPiQ5JdfNbhuPeTp1MSKLWwx_zDdbn6raqMSuBM_owB7v5IMci7SG5BpNeHLyNOg297DzjYLdI_g9ttqx-C6xr66_TUEMPBZShl3uuarw8Es_6CRw8JXLeE9HKUXp-jYRcVgOTcVYegBdVCYEpSblbaT0gFv6dbOC5tNzuE61D321sV18XXKzYo2QXFtXbNgUhdpXv1p_2vRMuAWMJbK-YCAO3JyrS4CUUqU8LqwnzovSRiCHA-zadi7NvQA8wRE_caYzMNSxDqa5x21d0LdHdDthjnUa3mJ4e6Bn2N_k6uM_An-uk3TkfPlzQ3nU3N06Zjhag-iPJ4t1IPVNomcSdO85gLpI3mFl4HVQTE54meQ0bHOJovvDi9psUJkT3JjQU79xtk6c6d8REg13D437feethskoE3UBXwCV2DUl9YkKRGn3dpEFoNwpIuCcCyIOqYFrOw4XsilBdHHt_WeB7szonuoSnojBOeRk.YQbP9rcLtFcM4WVMgx4BDw", "refresh_token": "AB11578902647Rgd7qkhbeaInpLu57oloeiSxH1aqA4YPMB47V", "x_refresh_token_expires_in": 8701401}	2019-10-04 16:00:47.445156
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.ratings (id, task_id, points, positive, negative, concierge_id, hire_id, hire, concierge) FROM stdin;
37	165	3	t	\N	54	29	t	f
38	166	5	t	\N	54	26	t	f
39	171	5	t	\N	63	27	t	f
40	173	3	t	\N	63	30	t	f
41	172	3	t	\N	63	27	t	f
42	184	5	t	\N	68	23	t	f
43	185	2	\N	t	69	29	t	f
44	187	5	t	\N	69	29	t	f
45	241	4	t	\N	66	17	t	f
46	265	1	\N	t	69	34	t	f
47	284	3	t	\N	69	34	t	f
48	287	4	t	\N	69	23	t	f
49	297	4	t	\N	66	17	t	f
50	294	4	t	\N	66	17	t	f
51	282	5	t	\N	66	17	t	f
52	280	4	t	\N	66	17	t	f
53	296	4	t	\N	66	17	t	f
54	301	4	t	\N	69	34	t	f
55	329	5	t	\N	83	82	t	f
56	332	4	t	\N	80	82	t	f
57	341	4	t	\N	83	82	t	f
58	343	5	t	\N	80	82	t	f
59	342	4	t	\N	80	82	t	f
60	339	4	t	\N	80	82	t	f
61	344	5	t	\N	80	82	t	f
62	338	4	t	\N	83	82	t	f
63	346	4	t	\N	83	82	t	f
64	347	4	t	\N	83	82	t	f
65	348	4	t	\N	83	82	t	f
66	349	4	t	\N	83	82	t	f
67	330	4	t	\N	83	82	t	f
68	337	5	t	\N	80	82	t	f
69	350	3	t	\N	80	82	t	f
70	334	4	t	\N	80	82	t	f
71	351	4	t	\N	80	82	t	f
72	364	4	t	\N	83	82	t	f
73	367	5	t	\N	85	82	t	f
74	366	4	t	\N	85	82	t	f
75	369	5	t	\N	83	82	t	f
76	371	5	t	\N	83	82	t	f
77	373	4	t	\N	85	82	t	f
78	370	5	t	\N	83	82	t	f
79	379	5	t	\N	85	82	t	f
80	388	5	t	\N	83	82	t	f
81	410	5	t	\N	83	82	t	f
82	409	4	t	\N	83	82	t	f
83	412	4	t	\N	85	82	t	f
84	416	3	t	\N	85	82	t	f
85	417	1	\N	t	85	82	t	f
86	418	5	t	\N	85	82	t	f
87	398	4	t	\N	83	82	t	f
88	385	5	t	\N	85	82	t	f
89	434	5	t	\N	85	82	t	f
90	363	5	t	\N	83	82	t	f
91	494	4	t	\N	106	107	t	f
92	491	5	t	\N	106	107	t	f
93	493	2	\N	t	106	107	t	f
94	487	5	t	\N	106	107	t	f
95	533	4	t	\N	109	110	t	f
96	536	4	t	\N	109	110	t	f
97	568	4	t	\N	112	110	t	f
98	572	4	t	\N	112	110	t	f
99	575	4	t	\N	112	110	t	f
100	595	5	t	\N	112	110	t	f
101	594	5	t	\N	112	110	t	f
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
1	admin	\N	\N	2018-09-04 09:44:12.806165	2018-09-04 09:44:12.806165
2	concierge	\N	\N	2018-10-03 11:06:04.558947	2018-10-03 11:06:04.558947
3	hire	\N	\N	2018-10-25 17:25:09.126382	2018-10-25 17:25:09.126382
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.schema_migrations (version) FROM stdin;
20170209155831
20170209160011
20170211142711
20170211145538
20170211162911
20170211164219
20170211170321
20170212143602
20170213161800
20170213164953
20170214144413
20170214191335
20170214200829
20170215142050
20170215144825
20170218125216
20170218130417
20170218135623
20170220134203
20170220162109
20170222175545
20170222182522
20170222183514
20170222190817
20170224134347
20170226125135
20170226130129
20170226170816
20170226174217
20170228112643
20170302104753
20170303101240
20170303122040
20170306122703
20170307111516
20170314140250
20170320125326
20170320150325
20170321150131
20170322174213
20170323110337
20170410101650
20170413075242
20170413083403
20170413083756
20170413084553
20170413173450
20170417104608
20170417113247
20170419143022
20170420120922
20170420165145
20170420174547
20170421170333
20170424163625
20170424181209
20170425104923
20170425115417
20170430091903
20170510093452
20170510105935
20170516095234
20170523094443
20170523115150
20170628135252
20170705104230
20170705134039
20170802142459
20170803175342
20170804090530
20170808120706
20170811092706
20170811115222
20170814132052
20170814143254
20170814180851
20180817143849
20180817145438
20180817163445
20180818115255
20180818123432
20180818123530
20180818125120
20180819082622
20180819083942
20180819090917
20180830120735
20181016080513
20181023151545
20181027134123
20181027134205
20181118154538
20181121115722
20181214002250
20181229192152
20181230013748
20181230082900
20181230095115
20181231080447
20190108155002
20190113144621
20190122175333
20190122214358
20190122223813
20190128114313
20190222173157
20190302135335
20190311212832
20190313222346
20190320173024
20190304175625
20190404191058
20190527090052
20190527090804
20190602100416
20190713141319
20190716181029
20190717071151
20190729144903
20190809192530
20190814144228
20190817111850
20190818204459
20190819122532
20190819124740
20190819181252
20190827124132
20190820161919
20190831154256
20190831214753
20190903135056
20190904132553
20190907150100
20190907192431
20190907200533
20190907212854
20190907213508
20190908092059
20190909190419
20190909190420
20190906143037
20190909112042
20190910094512
20190918082052
20191002175237
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.settings (id, var, value, thing_id, thing_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: task_payments; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.task_payments (id, task_id, user_id, hire, concierge, persents, created_at, updated_at, budget, payment_method) FROM stdin;
\.


--
-- Data for Name: task_requests; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.task_requests (id) FROM stdin;
\.


--
-- Data for Name: task_suggestions; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.task_suggestions (id, user_id, task_id, proposed_text, price, created_at, updated_at, hire_read, concierge_read) FROM stdin;
364	109	502	app	3000.00	2019-07-19 20:18:03.406204	2019-07-19 20:20:06.037778	t	t
365	109	503	task1907	2000.00	2019-07-19 20:25:32.992129	2019-07-19 20:25:32.992129	t	t
366	109	504	task19075	2000.00	2019-07-19 20:33:23.689869	2019-07-19 20:33:23.689869	t	t
367	109	506	task19079	2000.00	2019-07-19 20:49:31.046274	2019-07-19 20:49:31.046274	t	t
223	79	336	task for test chat	1000.00	2019-02-10 13:22:38.302255	2019-02-10 13:22:38.302255	t	t
368	109	507	task25-5	3000.00	2019-07-19 20:54:01.203594	2019-07-19 20:54:01.203594	t	t
369	109	505	app	3000.00	2019-07-19 20:55:24.37413	2019-07-19 20:55:24.37413	f	t
371	109	509	231231312	1000.00	2019-07-21 19:58:13.105818	2019-07-21 19:58:13.105818	t	t
373	111	514	New test title task 34sdf3	4900.00	2019-07-22 19:50:55.031509	2019-07-22 19:50:55.031509	t	t
388	112	530	task25-5	800.00	2019-08-12 09:17:02.820562	2019-08-12 09:17:02.820562	t	t
287	85	405		2100.00	2019-02-28 17:47:52.86699	2019-02-28 17:47:52.86699	f	t
232	83	345	hi hello	150.00	2019-02-13 20:00:22.599675	2019-02-23 08:38:49.661257	f	t
300	85	420		1000.00	2019-02-28 22:35:07.516053	2019-03-05 23:03:02.7166	t	t
323	83	451	test apartment	25.00	2019-03-14 22:55:37.942879	2019-03-14 22:55:37.942879	t	t
324	83	452	test apartment2	25.00	2019-03-14 23:06:23.572074	2019-03-14 23:06:23.572074	t	t
370	111	508	peluhnya	3232401.00	2019-07-20 08:29:30.831092	2019-07-20 08:29:30.831092	t	t
379	111	521	4324234234	32323.00	2019-07-23 09:30:58.286809	2019-07-23 09:30:58.286809	t	t
382	107	524	task034	2500.00	2019-08-06 21:34:51.605844	2019-08-06 21:34:51.605844	t	t
389	109	531	task1904	20.00	2019-08-12 16:10:10.827524	2019-08-12 16:10:10.827524	t	t
390	109	532	task1928	100.00	2019-08-12 16:28:46.141087	2019-08-12 17:11:33.770943	f	t
391	109	533		300.00	2019-08-12 17:11:54.407168	2019-08-12 17:12:56.389428	t	t
392	112	534	task25-5	1000.55	2019-08-13 08:24:11.669182	2019-08-13 08:24:11.669182	t	t
393	112	535	task1437	2000.00	2019-08-13 11:38:14.52749	2019-08-13 11:38:14.52749	t	t
394	109	536		200.00	2019-08-13 11:40:02.824738	2019-08-13 11:40:02.824738	f	t
396	109	538	task0022	100.55	2019-08-13 21:28:28.909931	2019-08-13 21:28:28.909931	t	t
397	109	539		1000.00	2019-08-13 21:37:33.542777	2019-08-13 21:37:42.458767	f	t
443	112	588	Test invoice 	3000.00	2019-09-25 20:25:46.791615	2019-09-25 20:26:12.570137	f	t
399	109	542	task25-5	20.20	2019-08-13 21:41:59.676563	2019-08-13 21:41:59.676563	t	t
400	109	543	task0406	500.36	2019-08-13 21:45:02.887758	2019-08-13 21:45:02.887758	t	t
401	109	544	task1508admin	1000.00	2019-08-15 08:27:06.970622	2019-08-15 08:27:06.970622	t	t
402	109	545	task1508	1000.55	2019-08-15 08:33:36.033985	2019-08-15 08:33:36.033985	t	t
403	109	547	амррр	58808.00	2019-08-15 08:49:25.194611	2019-08-15 08:49:25.194611	f	t
404	109	546		2888.00	2019-08-15 08:57:29.592862	2019-08-15 08:57:29.592862	f	t
405	109	548	task	258.00	2019-08-15 08:59:19.472712	2019-08-15 08:59:19.472712	t	t
406	109	549	task	2500.00	2019-08-15 09:05:04.525291	2019-08-15 09:05:04.525291	t	t
407	109	551	task123	2586.96	2019-08-15 20:38:44.662937	2019-08-15 20:38:44.662937	t	t
408	109	552	rdfg	2589.96	2019-08-15 20:53:48.275919	2019-08-15 20:53:48.275919	f	t
409	109	553	rgghhh	25899.96	2019-08-15 20:54:06.608761	2019-08-15 20:54:06.608761	f	t
410	109	554	task	123.97	2019-08-15 20:58:15.718209	2019-08-15 20:58:15.718209	t	t
411	109	555	tas	4999.99	2019-08-15 21:20:20.312114	2019-08-15 21:20:20.312114	t	t
412	109	556	task2319	123.70	2019-08-17 20:20:01.186863	2019-08-17 20:20:01.186863	t	t
444	112	589	280228022802	4500.00	2019-09-25 21:22:56.112019	2019-09-25 21:23:21.978361	f	t
445	112	590	task2709	1000.00	2019-09-26 21:51:08.957556	2019-09-26 21:51:08.957556	t	t
446	112	591	task27095	1596.36	2019-09-26 21:56:46.196276	2019-09-26 21:56:46.196276	t	t
447	112	592	task01101	1452.36	2019-10-01 07:31:49.39095	2019-10-01 07:31:49.39095	t	t
413	109	336	100	100.00	2019-08-19 15:41:02.596775	2019-08-21 18:23:37.798801	t	t
414	112	557	description 	369.96	2019-08-22 08:39:41.393833	2019-08-22 08:45:39.367443	t	t
415	112	559	task02091	1523.63	2019-09-02 10:15:41.137265	2019-09-02 10:15:41.137265	t	t
416	112	561	afasdadadad	343434343.00	2019-09-02 11:12:17.603199	2019-09-02 11:12:17.603199	t	t
448	112	593	task0410	1236.36	2019-10-04 08:03:16.521925	2019-10-04 08:03:16.521925	t	t
417	112	560	test	2589.69	2019-09-02 11:13:37.567755	2019-09-02 11:18:45.056952	t	t
418	109	562	task02093	2365.36	2019-09-02 13:39:07.565432	2019-09-02 13:39:07.565432	t	t
419	109	563		2589.69	2019-09-02 13:44:46.384288	2019-09-02 13:45:22.911191	t	t
420	109	564	task02095	1236.56	2019-09-02 20:26:50.024495	2019-09-02 20:26:50.024495	t	t
421	109	565		2563.69	2019-09-02 20:33:47.548105	2019-09-02 20:37:28.400256	t	t
422	112	566	task04091	1236.63	2019-09-04 15:54:45.584324	2019-09-04 15:54:45.584324	t	t
423	112	567	task04092	2365.36	2019-09-04 16:01:37.88212	2019-09-04 16:01:37.88212	t	t
424	112	568		1236.69	2019-09-04 16:08:18.697495	2019-09-04 16:08:50.789592	t	t
425	112	569	task04095	3698.69	2019-09-04 17:50:27.646916	2019-09-04 17:52:19.954955	f	t
426	112	570	task04097	1236.96	2019-09-04 18:05:02.30658	2019-09-04 18:05:02.30658	t	t
427	112	571		2589.69	2019-09-04 18:07:57.729967	2019-09-04 18:07:57.729967	f	t
428	112	572	task09091	2536.36	2019-09-09 11:30:16.324783	2019-09-09 11:30:16.324783	t	t
429	112	573	task09092	1256.36	2019-09-09 11:34:53.496216	2019-09-09 11:34:53.496216	t	t
430	112	575	task 09093app	1258.96	2019-09-09 11:37:22.230201	2019-09-09 11:37:22.230201	t	t
431	112	574		1586.96	2019-09-09 11:38:09.802646	2019-09-09 11:38:09.802646	f	t
432	112	576	task1009	1000.00	2019-09-10 19:35:01.535595	2019-09-10 19:35:01.535595	t	t
433	112	577	task11091	1236.65	2019-09-11 09:22:36.377888	2019-09-11 09:22:36.377888	t	t
434	112	579	New Kitchen	1236.63	2019-09-12 06:42:15.394087	2019-09-12 06:42:15.394087	t	t
435	112	580	Final Clean and Garbage Removal	7657.50	2019-09-12 07:02:44.084555	2019-09-12 07:02:44.084555	t	t
436	112	581	Final Clean and Garbage Removal	8288.50	2019-09-12 12:24:56.426801	2019-09-12 12:24:56.426801	t	t
437	112	582	task24-1	1234.23	2019-09-24 13:08:06.561724	2019-09-24 13:08:06.561724	t	t
438	112	583	task242	1234.23	2019-09-24 13:08:59.769487	2019-09-24 13:08:59.769487	t	t
439	112	584	task243	1236.36	2019-09-24 13:09:49.139884	2019-09-24 13:09:49.139884	t	t
449	112	594	rfg	2589.96	2019-10-04 08:06:48.383511	2019-10-04 08:10:09.912974	t	t
441	112	457	xfhxss	800.00	2019-09-25 19:26:57.924795	2019-09-25 19:26:57.924795	f	t
440	112	586	rtghg	1256.96	2019-09-24 13:13:31.47384	2019-09-25 19:28:37.826947	t	t
442	112	587	Invoice test name	2500.00	2019-09-25 20:06:47.995097	2019-09-25 20:07:32.694008	f	t
450	112	595	task04103	2551.96	2019-10-04 08:11:37.522978	2019-10-04 08:11:37.522978	t	t
451	112	596	Test Invoice PDF	500.00	2019-10-04 09:08:37.603565	2019-10-04 09:08:37.603565	t	t
452	112	597	task04104	2452.36	2019-10-04 11:55:32.911164	2019-10-04 12:01:00.284433	f	t
453	112	598	34	4589.99	2019-10-04 11:57:33.176478	2019-10-04 12:03:06.46802	t	t
454	112	599	task04106	1563.36	2019-10-04 13:26:24.181378	2019-10-04 13:26:24.181378	t	t
455	112	600	trert	3999.99	2019-10-04 13:42:28.180296	2019-10-04 13:43:50.071468	f	t
456	112	601	task0610	1236.36	2019-10-06 18:37:13.393063	2019-10-06 18:37:13.393063	t	t
457	112	602	task06102	1452.36	2019-10-06 20:35:38.343266	2019-10-06 20:35:38.343266	t	t
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.tasks (id, owner_id, concierge_id, title, status, task_type, description, phone, date_limit, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, suggestions_counter, suggestion_id, budget, completed_at, confirmed_at, photo1_file_name, photo1_content_type, photo1_file_size, photo1_updated_at, photo2_file_name, photo2_content_type, photo2_file_size, photo2_updated_at, photo3_file_name, photo3_content_type, photo3_file_size, photo3_updated_at, photo4_file_name, photo4_content_type, photo4_file_size, photo4_updated_at, photo5_file_name, photo5_content_type, photo5_file_size, photo5_updated_at, photo6_file_name, photo6_content_type, photo6_file_size, photo6_updated_at, photo7_file_name, photo7_content_type, photo7_file_size, photo7_updated_at, project_task_id, tender, apartment, date_start, fact_start, fact_end, city, pay_state) FROM stdin;
592	110	112	task01101	confirmed	Framing (Wood)	DescriptionDescriptionvvvDescription	(111) 111-1111	2019-10-26 00:00:00	2019-10-01 07:31:49.350283	2019-10-01 07:35:32.763685	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-10-01 07:31:47.586682	1	447	1452.36	\N	2019-10-01 07:35:32.758561	C_Logo-01.jpg	image/jpeg	673980	2019-10-01 07:31:47.916967	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-10-01 07:31:48.695499	gipsokarton.png	image/png	41077	2019-10-01 07:31:48.778663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	f		2019-10-01	2019-10-01	\N		not_payed
583	110	112	task242	posted	Drain Cleaning	tesst	(111) 111-1111	2019-09-30 00:00:00	2019-09-24 13:08:59.758613	2019-09-24 13:08:59.775905	\N	\N	\N	\N	1	438	1234.23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-23	\N	\N		not_payed
582	110	112	task24-1	confirmed	Drain Cleaning	ddsafdefr	(111) 111-1111	2019-09-30 00:00:00	2019-09-24 13:08:06.502323	2019-09-24 13:11:02.492489	\N	\N	\N	\N	1	437	1234.23	\N	2019-09-24 13:11:02.489864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-22	2019-09-24	\N		not_payed
585	110	\N	tender2444	posted	Framing (Wood)	rystyhtyr	(111) 111-1111	2019-09-30 00:00:00	2019-09-24 13:11:49.955434	2019-09-24 13:11:49.955434	\N	\N	\N	\N	\N	\N	1234.63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-22	\N	\N		not_payed
586	110	\N	tendre245	posted	Framing (Wood)		(111) 111-1111	2019-09-30 00:00:00	2019-09-24 13:13:14.013436	2019-09-24 13:13:14.013436	\N	\N	\N	\N	1	\N	2365.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-22	\N	\N		not_payed
584	110	112	task243	done_confirmed	Framing (Wood)	retertrr	(111) 111-1111	2019-09-30 00:00:00	2019-09-24 13:09:49.132433	2019-09-24 13:15:25.231777	\N	\N	\N	\N	1	439	1236.36	2019-09-24 13:15:25.230081	2019-09-24 13:14:21.924041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-22	2019-09-24	2019-09-24		not_payed
599	110	112	task04106	done_confirmed	Framing (Wood)	test	(111) 111-1111	2019-10-30 00:00:00	2019-10-04 13:26:24.089351	2019-10-04 13:30:53.450007	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-10-04 13:26:23.551362	1	454	1563.36	2019-10-04 13:30:53.447642	2019-10-04 13:29:07.115406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-01	2019-10-04	2019-10-04		\N
589	113	112	280228022802	done_confirmed	NEW TEST	280228022802	(280) 228-0228	2019-10-05 00:00:00	2019-09-25 21:22:56.100652	2019-09-25 21:23:30.731747	\N	\N	\N	\N	1	444	4500.00	2019-09-25 21:23:30.729667	2019-09-25 21:23:08.892014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	f		2019-09-27	2019-09-25	2019-09-25		not_payed
600	110	112	tender04107	done_confirmed	Framing (Wood)	test	(111) 111-1111	2019-10-31 00:00:00	2019-10-04 13:28:15.216781	2019-10-04 13:44:05.843402	Без_названия_(1).jpg	image/jpeg	7863	2019-10-04 13:28:14.675593	1	455	3999.99	2019-10-04 13:44:05.841627	2019-10-04 13:43:04.307192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-10-01	2019-10-04	2019-10-04		\N
514	110	111	New test title task 34sdf3	posted	Framing (Wood)	fdsfsdfds sdf dsf sd f ds	(111) 111-1111	2019-08-24 00:00:00	2019-07-22 19:50:55.006706	2019-07-22 19:50:55.186122	\N	\N	\N	\N	1	373	4900.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-03	2019-07-26	\N		not_payed
530	110	112	task25-5	confirmed	Framing (Wood)	bgfthfgh	(111) 111-1111	2019-08-24 00:00:00	2019-08-12 09:17:02.809591	2019-08-12 09:17:52.810333	\N	\N	\N	\N	1	388	800.00	\N	2019-08-12 09:17:52.807241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-01	\N	\N		not_payed
507	110	109	task25-5	confirmed	Heating & Ventilation		(111) 111-1111	2019-07-27 00:00:00	2019-07-19 20:54:01.19992	2019-07-19 20:54:16.723387	\N	\N	\N	\N	1	368	3000.00	\N	2019-07-19 20:54:16.721933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-19	\N	\N		not_payed
360	82	\N	tender2	posted	Framing (Steel)	gghh	888	2019-02-22 00:00:00	2019-02-19 00:03:14.390295	2019-02-19 00:03:14.390295	\N	\N	\N	\N	\N	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
457	82	\N	task22035	posted	Framing (Wood)	gtgtfgv,hg uyjhgygh	36	2019-05-31 00:00:00	2019-03-22 13:31:00.276784	2019-08-14 21:04:35.134108	\N	\N	\N	\N	1	\N	4500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	t		2019-03-23	2019-03-23	\N		not_payed
590	110	112	task2709	done_confirmed	Drain Cleaning	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-26 21:51:08.94416	2019-09-26 22:00:00.296073	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-26 21:51:08.414441	1	445	1000.00	2019-09-26 21:51:41.714351	2019-09-26 21:51:21.719011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-22	2019-09-26	2019-09-26		payed
591	110	112	task27095	done_confirmed	Drain Cleaning	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-26 21:56:46.179383	2019-09-26 22:00:03.05248	Без_названия_(1).jpg	image/jpeg	7863	2019-09-26 21:56:45.744035	1	446	1596.36	2019-09-26 21:57:25.903254	2019-09-26 21:56:58.106016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33	f		2019-09-22	2019-09-26	2019-09-26		payed
593	110	112	task0410	done_confirmed	Framing (Wood)	test	(111) 111-1111	2019-10-31 00:00:00	2019-10-04 08:03:16.501323	2019-10-04 08:04:04.461801	\N	\N	\N	\N	1	448	1236.36	2019-10-04 08:04:04.457039	2019-10-04 08:03:53.061039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-04	2019-10-04	2019-10-04		\N
595	110	112	task04103	done_confirmed	Framing (Wood)	app	1478.58	2019-10-31 00:00:00	2019-10-04 08:11:37.517381	2019-10-04 08:13:18.961557	\N	\N	\N	\N	1	450	2551.96	2019-10-04 08:13:18.959681	2019-10-04 08:12:47.550939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-04	2019-10-04	2019-10-04		\N
594	110	112	tender04102	done_confirmed	Framing (Wood)	tesr	(111) 111-1111	2019-10-17 00:00:00	2019-10-04 08:06:31.186259	2019-10-04 08:13:46.034326	\N	\N	\N	\N	1	449	2589.96	2019-10-04 08:13:46.031116	2019-10-04 08:07:30.224185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-10-01	2019-10-04	2019-10-04		\N
601	110	112	task0610	done_confirmed	Framing (Wood)	app	(111) 111-1111	2019-10-31 00:00:00	2019-10-06 18:37:13.38215	2019-10-06 18:38:26.964051	\N	\N	\N	\N	1	456	1236.36	2019-10-06 18:38:26.96211	2019-10-06 18:37:37.408826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-01	2019-10-06	2019-10-06		\N
540	110	\N	task0406	posted	Framing (Wood)		(111) 111-1111	2019-08-31 00:00:00	2019-08-13 21:38:41.163258	2019-08-13 21:38:41.247097	\N	\N	\N	\N	\N	\N	13.55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-01	\N	\N		not_payed
579	110	112	New Kitchen	done_confirmed	NEW TEST	QTY: 1.0\r\nNew Kitchen	(111) 111-1111	2019-09-30 00:00:00	2019-09-12 06:42:15.365156	2019-09-18 13:02:07.666906	\N	\N	\N	\N	1	434	1236.63	2019-09-12 07:06:21.606709	2019-09-12 07:04:27.081465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-12	2019-09-12		payed
362	82	\N	task chat2	posted	Engineering / Consulting	ffhvvghh ghjnbvg hggthvdghcggg ghhgg hvvgvbhbbh hvvvvvcvvvvvvvvvvvvvvvvvbbb	558845	2019-02-24 00:00:00	2019-02-21 07:38:16.859239	2019-02-21 07:38:16.859239	20190219_192732.jpg	image/jpeg	2583023	2019-02-21 07:38:14.751405	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
505	110	109	tender19078	done_confirmed	Heating & Ventilation	admin	(111) 111-1111	2019-07-30 00:00:00	2019-07-19 20:43:28.5414	2019-07-19 20:58:40.605503	\N	\N	\N	\N	1	369	3000.00	2019-07-19 20:58:40.603876	2019-07-19 20:56:05.131068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-07-19	\N	2019-07-19		not_payed
602	110	112	task06102	done_confirmed	Framing (Wood)		(111) 111-1111	2019-10-31 00:00:00	2019-10-06 20:35:38.318996	2019-10-06 20:36:38.394317	\N	\N	\N	\N	1	457	1452.36	2019-10-06 20:36:38.392372	2019-10-06 20:36:09.824474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-01	2019-10-06	2019-10-06		\N
587	113	112	Invoice test name	done_confirmed	NEW TEST	Invoice test name	(324) 324-4234	2019-09-28 00:00:00	2019-09-25 20:06:47.976246	2019-10-01 17:32:04.901517	\N	\N	\N	\N	1	442	2500.00	2019-09-25 20:08:22.326812	2019-09-25 20:07:25.77462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	f		2019-09-28	2019-09-25	2019-09-25		payed
511	82	\N	city	posted	Framing (Wood)	city yest	6555	2019-07-22 00:00:00	2019-07-22 18:29:46.277865	2019-07-22 18:29:46.277865	\N	\N	\N	\N	\N	\N	6.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		2019-07-22	\N	\N	\N	not_payed
345	82	\N	test	posted	Framing (Wood)	Descr	588	2019-02-13 00:00:00	2019-02-13 20:00:22.592111	2019-02-24 12:17:46.688158	\N	\N	\N	\N	1	232	125.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
571	110	112	tender04098	done_confirmed	Drain Cleaning	Yest	(111) 111-1111	2019-09-04 00:00:00	2019-09-04 18:05:54.097274	2019-09-09 10:24:15.909505	\N	\N	\N	\N	1	427	2589.69	2019-09-09 10:24:15.907572	2019-09-04 18:08:19.13557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-04	2019-09-03	2019-09-09		not_payed
512	82	\N	city2	posted	Framing (Wood)	city2 desk	3	2019-07-22 00:00:00	2019-07-22 18:44:49.397209	2019-07-22 20:00:15.442239	\N	\N	\N	\N	\N	\N	6.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-07-22	2019-07-22	\N	Acadia Valley	not_payed
524	110	109	task034	confirmed	Drain Cleaning	xzczfsdgvfdbhgxgdfc	(111) 111-1111	2019-08-28 00:00:00	2019-08-06 21:34:51.585464	2019-08-06 21:36:23.301981	Chrysanthemum.jpg	image/jpeg	879394	2019-08-06 21:34:50.763043	1	382	2500.00	\N	2019-08-06 21:36:23.299163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	f		2019-08-06	\N	\N		not_payed
508	110	111	peluhnya	confirmed	Framing (Wood)	dasdasdasdasddsa	(111) 111-1111	2019-07-31 00:00:00	2019-07-20 08:29:30.817487	2019-07-20 08:36:13.908345	\N	\N	\N	\N	1	370	3232401.00	\N	2019-07-20 08:34:13.427081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-31	\N	\N		not_payed
596	113	112	Test Invoice PDF	posted	NEW TEST			2019-10-31 00:00:00	2019-10-04 09:08:37.591628	2019-10-04 09:08:37.610884	\N	\N	\N	\N	1	451	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	f		2019-10-01	\N	\N		\N
394	82	\N	tender2702	posted	Framing (Wood)			2019-02-28 00:00:00	2019-02-27 21:07:16.811539	2019-02-27 21:07:16.931832	\N	\N	\N	\N	\N	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		\N	\N	\N	\N	not_payed
395	82	\N	small floor	posted	Framing (Wood)	arr	1	2019-03-14 00:00:00	2019-02-27 21:15:58.37501	2019-02-27 21:16:58.078921	IMG-bf6b76555ac84291c707ed938eabbc40-V.jpg	image/jpeg	196563	2019-02-27 21:16:57.169725	\N	\N	2000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
396	82	\N	tender1111	posted	Framing (Wood)			2019-02-28 00:00:00	2019-02-27 21:50:23.184649	2019-02-27 21:50:23.28849	\N	\N	\N	\N	\N	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		\N	\N	\N	\N	not_payed
397	82	\N	tender app	posted	Framing (Wood)	cvnmk	8899999	2019-02-28 00:00:00	2019-02-27 21:53:21.821579	2019-02-27 21:53:21.821579	\N	\N	\N	\N	\N	\N	600.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		\N	\N	\N	\N	not_payed
405	82	\N	tendr0001	posted	Framing (Wood)	 hmj hjmv 	(222) 222-2222	2019-03-08 00:00:00	2019-02-28 17:47:12.404698	2019-02-28 17:47:12.572636	\N	\N	\N	\N	1	\N	2000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	t	2	\N	\N	\N	\N	not_payed
392	82	\N	tender27021	posted	Framing (Wood)	hhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfhhjfgzjzg fzdfvvhhjfgzjzg fzdfvvhhjfgzjzg fzdfvhhjfgzjzg fzdfvvhhjfgzjzg fzdfvhhjfgzjzg fzdfv		2019-03-05 00:00:00	2019-02-27 17:40:51.008605	2019-02-27 17:40:51.183835	\N	\N	\N	\N	\N	\N	3000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		\N	\N	\N	\N	not_payed
419	97	\N	task0033	posted	Framing (Wood)	каяапы		2019-04-01 00:00:00	2019-02-28 22:34:06.482076	2019-07-17 22:02:41.136942	\N	\N	\N	\N	\N	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	t		2019-07-24	\N	\N		not_payed
413	82	\N	tender app	posted	Framing (Wood)	chjjbvc	4590009	2019-02-28 00:00:00	2019-02-28 21:48:37.619173	2019-02-28 21:48:37.619173	Screenshot_20190228-230728_Astra_Tenders.jpg	image/jpeg	469012	2019-02-28 21:48:36.887152	\N	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	t		\N	\N	\N	\N	not_payed
509	110	109	231231312	posted	Framing (Wood)	312321312132	(213) 213-3123	2019-09-06 00:00:00	2019-07-21 19:58:13.066454	2019-07-21 20:32:58.712183	\N	\N	\N	\N	1	371	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-03	2019-07-20	\N		not_payed
513	82	\N	city 33333	posted	Framing (Wood)	fgu	3	2019-07-22 00:00:00	2019-07-22 18:55:42.43398	2019-07-22 19:54:02.312967	\N	\N	\N	\N	\N	\N	2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-07-22	2019-07-22	\N	Acme	not_payed
420	82	\N	task0034	posted	Framing (Wood)			2019-04-03 00:00:00	2019-02-28 22:34:56.260429	2019-02-28 22:34:56.931303	\N	\N	\N	\N	1	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	t		\N	\N	\N	\N	not_payed
442	82	\N	tender1403	posted	Framing (Wood)			2019-03-31 00:00:00	2019-03-14 20:59:21.164674	2019-03-14 20:59:21.267749	\N	\N	\N	\N	\N	\N	2000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
430	82	\N	tender0503	posted	Framing (Steel)			2019-03-16 00:00:00	2019-03-05 19:13:33.190223	2019-03-05 19:13:33.313094	Chrysanthemum.jpg	image/jpeg	879394	2019-03-05 19:13:32.28549	\N	\N	3005.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
431	82	\N	вававава	posted				2019-04-05 00:00:00	2019-03-05 19:21:18.013402	2019-03-05 19:21:18.54118	\N	\N	\N	\N	\N	\N	23233.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	t		\N	\N	\N	\N	not_payed
432	82	\N	tender5035	posted	Framing (Wood)			2019-04-03 00:00:00	2019-03-05 19:26:12.072924	2019-03-05 19:26:12.237525	\N	\N	\N	\N	\N	\N	3000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
444	82	\N	tender14032	posted	Framing (Wood)			2019-03-31 00:00:00	2019-03-14 21:19:10.089211	2019-03-14 21:19:10.17567	\N	\N	\N	\N	\N	\N	3000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-03-26	\N	\N	\N	not_payed
452	82	\N	test apartment2	posted	Framing (Wood)	yh	33333	2019-03-17 00:00:00	2019-03-14 23:06:23.561682	2019-07-22 19:59:24.831033	\N	\N	\N	\N	1	324	25.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-03-16	2019-03-16	\N	Cold Lake	not_payed
437	82	\N	task101222	posted	Framing (Wood)			2019-04-05 00:00:00	2019-03-07 22:08:58.202715	2019-03-07 22:08:58.676037	\N	\N	\N	\N	\N	\N	2000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	\N	\N	\N	not_payed
502	110	109	tender19072	confirmed	Heating & Ventilation	app	2558963	2019-07-31 00:00:00	2019-07-19 20:16:33.784959	2019-07-19 20:19:58.474421	\N	\N	\N	\N	1	364	3000.00	\N	2019-07-19 20:19:58.4725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-07-19	\N	\N	\N	not_payed
572	110	112	task09091	done_confirmed	NEW TEST	test	(111) 111-1111	2019-09-11 00:00:00	2019-09-09 11:30:16.313974	2019-09-09 11:31:20.35878	\N	\N	\N	\N	1	428	2536.36	2019-09-09 11:31:20.356943	2019-09-09 11:30:40.947172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-09	2019-09-09	2019-09-09		not_payed
449	82	\N	tender14035	posted	Framing (Wood)	ASTRA Group is your local general contractor and property-management company in Calgary. We offer total construction, restoration, and renovation services for commercial, residential, and industrial clients. We build and upgrade custom houses, multifamily complexes, and commercial properties in Calgary.\r\n\r\n		2019-03-31 00:00:00	2019-03-14 22:09:32.869824	2019-03-14 22:09:33.398916	\N	\N	\N	\N	\N	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-03-17	\N	\N	\N	not_payed
450	82	\N	tender	posted	Framing (Wood)			2019-03-19 00:00:00	2019-03-14 22:52:33.830233	2019-03-14 22:52:33.916895	\N	\N	\N	\N	\N	\N	100.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-03-21	\N	\N	\N	not_payed
451	82	\N	test apartment	posted	Framing (Wood)	ygh	369	2019-03-17 00:00:00	2019-03-14 22:55:37.932533	2019-03-14 22:59:56.866929	\N	\N	\N	\N	1	323	25.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-03-16	\N	\N	\N	not_payed
453	82	\N	task22031	posted	Framing (Wood)	vftf,jvcddhgfghv bgftfj gghgj 		2019-03-26 00:00:00	2019-03-22 13:26:43.584319	2019-03-22 13:26:43.682796	\N	\N	\N	\N	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	t		2019-03-22	\N	\N	\N	not_payed
521	110	111	4324234234	posted	Framing (Wood)		(111) 111-1111	2019-07-17 00:00:00	2019-07-23 09:30:58.264282	2019-07-23 09:30:58.420716	\N	\N	\N	\N	1	379	32323.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-06	2019-07-11	\N		not_payed
503	110	109	task1907	done_confirmed	Drain Cleaning	admin	(111) 111-1111	2019-07-31 00:00:00	2019-07-19 20:25:32.98611	2019-07-19 20:30:38.744826	Penguins_-_копия.jpg	image/jpeg	777835	2019-07-19 20:25:32.393746	1	365	2000.00	2019-07-19 20:30:38.742151	2019-07-19 20:27:01.583019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-19	2019-07-01	2019-07-19		not_payed
504	110	109	task19075	confirmed	Heating & Ventilation	admin	(111) 111-1111	2019-07-31 00:00:00	2019-07-19 20:33:23.683362	2019-07-19 20:33:40.232833	\N	\N	\N	\N	1	366	2000.00	\N	2019-07-19 20:33:40.231552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-19	\N	\N		not_payed
506	110	109	task19079	done_confirmed	Heating & Ventilation	admin	(111) 111-1111	2019-07-31 00:00:00	2019-07-19 20:49:31.03727	2019-08-12 15:56:31.141839	\N	\N	\N	\N	1	367	2000.00	2019-08-12 15:56:31.139456	2019-07-19 20:51:34.873242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-07-19	\N	2019-08-12		not_payed
531	110	109	task1904	done_confirmed	Drain Cleaning		(111) 111-1111	2019-08-17 00:00:00	2019-08-12 16:10:10.766342	2019-08-12 16:15:55.346488	\N	\N	\N	\N	1	389	20.00	2019-08-12 16:15:55.344271	2019-08-12 16:11:19.095735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-12	\N	2019-08-12		not_payed
533	110	109	tender1929	done_confirmed	Drain Cleaning		(111) 111-1111	2019-08-27 00:00:00	2019-08-12 16:29:32.059723	2019-08-12 17:13:04.981842	\N	\N	\N	\N	1	391	300.00	2019-08-12 17:13:04.979821	2019-08-12 17:12:44.326002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-13	\N	2019-08-12		not_payed
532	110	109	task1928	done	Drain Cleaning	рекрек	(111) 111-1111	2019-08-27 00:00:00	2019-08-12 16:28:46.113146	2019-08-12 17:11:33.017974	\N	\N	\N	\N	1	390	100.00	\N	2019-08-12 17:11:15.782525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-12	\N	2019-08-12		not_payed
548	110	109	task	confirmed	Drain Cleaning	cghh	2589633	2019-08-31 00:00:00	2019-08-15 08:59:19.466865	2019-08-15 09:02:46.136971	\N	\N	\N	\N	1	405	258.00	\N	2019-08-15 09:02:46.134583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-15	2019-08-15	\N		not_payed
534	110	112	task25-5	done_confirmed	Framing (Wood)	jhkg,red	(111) 111-1111	2019-08-31 00:00:00	2019-08-13 08:24:11.61399	2019-08-13 08:35:45.889683	Chrysanthemum.jpg	image/jpeg	879394	2019-08-13 08:24:10.863842	1	392	1000.55	2019-08-13 08:35:45.887682	2019-08-13 08:28:57.372602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-12	\N	2019-08-13		not_payed
559	110	112	task02091	posted	Drain Cleaning	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-02 10:15:41.095914	2019-09-02 10:15:41.117332	Chrysanthemum.jpg	image/jpeg	879394	2019-09-02 10:15:39.231736	1	\N	1523.63	\N	\N	Desert.jpg	image/jpeg	845941	2019-09-02 10:15:39.664009	Hydrangeas.jpg	image/jpeg	595284	2019-09-02 10:15:40.020022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-02	\N	\N		not_payed
549	110	\N	task	posted	Drain Cleaning	hhccf	2589933	2019-08-31 00:00:00	2019-08-15 09:05:04.515653	2019-08-15 09:06:08.966213	\N	\N	\N	\N	1	406	250.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-15	2019-08-15	\N		not_payed
550	82	\N	testgj	posted	Sprinklers & Fire Suppression	hv	356	2019-08-15 00:00:00	2019-08-15 19:00:31.549669	2019-08-15 19:00:31.549669	\N	\N	\N	\N	\N	\N	25.99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		2019-08-15	\N	\N		not_payed
542	110	109	task25-5	posted	Drain Cleaning		(111) 111-1111	2019-08-31 00:00:00	2019-08-13 21:41:59.662128	2019-08-13 21:41:59.80312	\N	\N	\N	\N	1	399	20.20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-27	\N	\N		not_payed
563	110	\N	tender02094	posted	Drain Cleaning		(111) 111-1111	2019-09-27 00:00:00	2019-09-02 13:44:20.065694	2019-09-02 13:44:20.065694	\N	\N	\N	\N	1	\N	1452.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-08-28	\N	\N		not_payed
535	110	109	task1437	done_confirmed	Drain Cleaning	fdgfrfg	(111) 111-1111	2019-08-24 00:00:00	2019-08-13 11:38:14.509461	2019-08-13 11:45:32.64102	\N	\N	\N	\N	1	393	2000.00	2019-08-13 11:45:32.638999	2019-08-13 11:42:28.167017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-10	2019-08-13	2019-08-13		not_payed
536	110	109	tesnder1438	done_confirmed	Drain Cleaning	vsdfdse	(111) 111-1111	2019-08-24 00:00:00	2019-08-13 11:38:59.261315	2019-08-13 11:46:10.317208	\N	\N	\N	\N	1	394	200.00	2019-08-13 11:46:10.315091	2019-08-13 11:45:15.35349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-09	2019-08-13	2019-08-13		not_payed
543	110	109	task0406	confirmed	Drain Cleaning		(111) 111-1111	2019-08-17 00:00:00	2019-08-13 21:45:02.873816	2019-08-13 21:45:49.588778	\N	\N	\N	\N	1	400	500.36	\N	2019-08-13 21:45:49.585749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-13	2019-08-13	\N		not_payed
552	110	\N	tender	posted	Drain Cleaning	fgghhj	2589963148	2019-08-31 00:00:00	2019-08-15 20:40:01.474515	2019-08-15 20:40:01.474515	\N	\N	\N	\N	1	\N	3689.96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-15	\N	\N		not_payed
553	110	\N	tender2	posted	Drain Cleaning	gvhhj	2589633	2019-08-31 00:00:00	2019-08-15 20:47:27.297444	2019-08-15 20:47:27.297444	\N	\N	\N	\N	1	\N	2589.96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-15	\N	\N		not_payed
561	110	112	afasdadadad	posted	Framing (Wood)	adasdasdasdasd	(111) 111-1111	2019-09-28 00:00:00	2019-09-02 11:12:17.589873	2019-09-10 13:48:16.810356	\N	\N	\N	\N	1	\N	343434343.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-09-01	\N	\N		not_payed
554	110	109	task	posted	Drain Cleaning	ffghh	258966	2019-08-31 00:00:00	2019-08-15 20:58:15.71263	2019-08-15 20:58:15.723269	\N	\N	\N	\N	1	410	123.97	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-15	\N	\N		not_payed
560	110	\N	tender02092	posted	Drain Cleaning	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-02 11:09:32.572324	2019-09-02 11:09:32.590289	Без_названия_(1).jpg	image/jpeg	7863	2019-09-02 11:09:31.607204	1	\N	1452.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-02	\N	\N		not_payed
538	110	109	task0022	done_confirmed	Drain Cleaning	xgfhgh	(111) 111-1111	2019-08-27 00:00:00	2019-08-13 21:28:28.894625	2019-08-13 21:34:26.710558	\N	\N	\N	\N	1	396	100.55	2019-08-13 21:34:26.708477	2019-08-13 21:28:57.768954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-14	2019-08-13	2019-08-13		not_payed
545	110	109	task1508	posted	Drain Cleaning	fdgfghfgh	(111) 111-1111	2019-08-31 00:00:00	2019-08-15 08:33:36.020651	2019-08-15 08:33:36.178495	Chrysanthemum.jpg	image/jpeg	879394	2019-08-15 08:33:35.560657	1	402	1000.55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-15	\N	\N		not_payed
544	110	109	task1508admin	confirmed	Drain Cleaning		(111) 111-1111	2019-08-31 00:00:00	2019-08-15 08:27:06.947966	2019-08-15 08:45:50.223679	\N	\N	\N	\N	1	401	1000.00	\N	2019-08-15 08:45:50.220464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-15	2019-08-15	\N		not_payed
555	110	109	tas	posted	Drain Cleaning	fvbj	25896	2019-08-31 00:00:00	2019-08-15 21:20:20.307038	2019-08-15 21:20:20.317284	\N	\N	\N	\N	1	411	4999.99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-16	\N	\N		not_payed
539	110	\N	tender0036	posted	Drain Cleaning	eadsasdf	(111) 111-1111	2019-08-23 00:00:00	2019-08-13 21:36:53.320403	2019-08-13 21:37:58.504512	\N	\N	\N	\N	1	\N	1000.50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-01	\N	\N		not_payed
551	110	109	task123	done_confirmed	Drain Cleaning	gffgg	2588963	2019-08-31 00:00:00	2019-08-15 20:38:44.654485	2019-08-15 21:41:13.872078	\N	\N	\N	\N	1	407	2586.96	2019-08-15 21:41:13.8696	2019-08-15 20:44:14.036939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-15	2019-08-15	2019-08-15		not_payed
547	110	\N	tender15082	posted	Drain Cleaning	faerferfter	(111) 111-1111	2019-08-24 00:00:00	2019-08-15 08:47:38.534114	2019-08-15 08:47:38.62433	\N	\N	\N	\N	1	\N	523.52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-14	\N	\N		not_payed
546	110	\N	tender1508	posted	Drain Cleaning	ewfawgfatr	(111) 111-1111	2019-08-29 00:00:00	2019-08-15 08:46:51.532186	2019-08-15 08:46:51.687354	\N	\N	\N	\N	1	\N	198.55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-14	\N	\N		not_payed
556	110	109	task2319	posted	Drain Cleaning	tfghhh	2588963688	2019-08-31 00:00:00	2019-08-17 20:20:01.153127	2019-08-17 20:20:01.209772	\N	\N	\N	\N	1	412	123.70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	f		2019-08-17	\N	\N		not_payed
562	110	109	task02093	posted	Drain Cleaning	test	(111) 111-1111	2019-09-21 00:00:00	2019-09-02 13:39:07.509199	2019-09-02 13:39:07.527699	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-02 13:39:06.685358	1	\N	2365.36	\N	\N	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-09-02 13:39:06.863836	gipsokarton.png	image/png	41077	2019-09-02 13:39:06.949193	Без_названия_(1).jpg	image/jpeg	7863	2019-09-02 13:39:07.058778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-02	\N	\N		not_payed
336	82	109	task for test chat	confirmed	Electrical	Sghgfer xgygsd stjgf fgfd ghgdt cghfse kkh guuh chknh cfyutg xse mkhrw zdyh dghgf chjnf cfyjjh xsty drewf deyuj xd mkgr fghh ftui gui gtedd ffeuii chuhfr fyuhf fhhv	0236988445	2019-02-22 00:00:00	2019-02-10 13:22:38.297455	2019-08-21 18:29:16.138457	edit_1549805044736.png	image/png	1692894	2019-02-10 13:24:28.182746	2	413	100.00	\N	2019-08-21 18:29:16.13625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	t		\N	2019-08-21	\N		not_payed
557	97	112	tender 5 edit2222	done_confirmed	NEW TEST	test	(111) 111-1111	2019-08-28 00:00:00	2019-08-22 08:37:31.279169	2019-09-02 06:33:34.377415	\N	\N	\N	\N	1	414	369.96	2019-09-01 20:44:18.302243	2019-08-22 08:45:27.965775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	t		2019-08-23	2019-08-21	2019-09-01		not_payed
447	97	112	vxvcxvxcvxcvxcv	confirmed	Framing (Steel)			2019-03-15 00:00:00	2019-03-14 21:58:54.761027	2019-09-25 19:31:56.434251	\N	\N	\N	\N	\N	0	3232.00	\N	2019-09-25 19:31:56.430547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	f		2019-03-21	2019-09-25	\N		not_payed
558	110	\N	Lay floor tiles	posted	Flooring & Tile		(111) 111-1111	2019-10-31 00:00:00	2019-09-02 06:43:25.222125	2019-09-02 06:43:25.294007	\N	\N	\N	\N	\N	\N	500.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31	t		2019-10-01	\N	\N	Calgary	not_payed
564	110	109	task02095	done_confirmed	Drain Cleaning	test	(111) 111-1111	2019-10-01 00:00:00	2019-09-02 20:26:49.988086	2019-09-02 20:35:01.109809	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-02 20:26:49.170074	1	\N	1236.56	2019-09-02 20:35:01.107275	2019-09-02 20:27:22.131971	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-09-02 20:26:49.299188	Без_названия_(1).jpg	image/jpeg	7863	2019-09-02 20:26:49.386175	gipsokarton.png	image/png	41077	2019-09-02 20:26:49.455064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-03	2019-09-03	2019-09-02		not_payed
565	110	\N	tender02096	posted	Drain Cleaning	tesr	(111) 111-1111	2019-10-01 00:00:00	2019-09-02 20:31:55.243942	2019-09-02 20:31:55.249897	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-02 20:31:54.673947	1	\N	2563.36	\N	\N	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-09-02 20:31:54.807221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-01	\N	\N		not_payed
566	110	112	task04091	done	Drain Cleaning	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-04 15:54:45.563507	2019-09-04 16:00:12.012548	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-04 15:54:44.721655	1	\N	1236.63	\N	2019-09-04 15:57:08.436697	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-09-04 15:54:44.896364	gipsokarton.png	image/png	41077	2019-09-04 15:54:44.979647	Без_названия_(1).jpg	image/jpeg	7863	2019-09-04 15:54:45.116893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-04	2019-09-04		not_payed
567	110	112	task04092	confirmed	Drain Cleaning	test	(111) 111-1111	2019-09-02 00:00:00	2019-09-04 16:01:37.875125	2019-09-10 17:49:39.656109	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-09-04 16:01:37.336938	1	0	2365.36	\N	2019-09-09 11:28:54.281014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-02	2019-09-02	\N		not_payed
568	110	112	tender 04093	done_confirmed	Drain Cleaning	test		2019-09-30 00:00:00	2019-09-04 16:07:33.613556	2019-09-04 16:09:43.828115	cat_88874816d55d1319965e73f1fdaaa243.jpg	image/jpeg	39477	2019-09-04 16:07:32.912228	1	424	1236.69	2019-09-04 16:09:43.826418	2019-09-04 16:08:45.113779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-09-01	2019-09-04	2019-09-04		not_payed
569	110	112	task04095	done_confirmed	Drain Cleaning	test	2589633	2019-09-30 00:00:00	2019-09-04 17:50:27.631043	2019-09-04 17:52:45.225373	data	image/jpeg	19503	2019-09-04 17:50:27.390585	1	425	3698.69	2019-09-04 17:52:45.221989	2019-09-04 17:51:02.636782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-04	2019-09-04	2019-09-04		not_payed
570	110	112	task04097	done_confirmed	Drain Cleaning	Test	(111) 111-1111	2019-10-09 00:00:00	2019-09-04 18:05:02.298451	2019-09-09 11:10:40.222398	\N	\N	\N	\N	1	426	1236.96	2019-09-09 11:10:40.220454	2019-09-04 18:06:37.767326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-04	2019-09-03	2019-09-09		not_payed
573	110	112	task09092	done_confirmed	NEW TEST	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-09 11:34:53.444402	2019-09-09 11:48:14.062304	\N	\N	\N	\N	1	429	1256.36	2019-09-09 11:48:14.059743	2019-09-09 11:38:24.223268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-09	2019-09-09		not_payed
575	110	112	task 09093app	done_confirmed	NEW TEST	app	25889336	2019-09-29 00:00:00	2019-09-09 11:37:22.222813	2019-09-10 16:45:45.089501	\N	\N	\N	\N	1	430	1258.96	2019-09-09 12:03:11.836804	2019-09-09 11:37:49.264399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-09	2019-09-10	2019-09-09		not_payed
574	110	112	task09093e	posted	NEW TEST	test	(222) 222-2222	2019-09-21 00:00:00	2019-09-09 11:35:45.577473	2019-09-10 16:47:25.810253	Tulips.jpg	image/jpeg	620888	2019-09-10 16:47:25.429028	1	\N	1452.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-07	\N	\N		not_payed
578	113	\N	Stairs Nosings & Materials	posted	Test1508	QTY: 23\r\nDoors\r\nQTY: 24\r\nStairs Nosings & Materials\r\n		2019-09-12 00:00:00	2019-09-11 12:29:40.702584	2019-09-11 12:29:40.702584	\N	\N	\N	\N	\N	\N	1320.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	t		2019-09-11	\N	\N		not_payed
581	113	112	Final Clean and Garbage Removal	done_confirmed	NEW TEST	QTY: 1.0\r\nNew Kitchen\r\nQTY: 0.0\r\nPaint Existing Kitchen\r\nQTY: 10\r\nDoors\r\nQTY: 10\r\nStairs Nosings & Materials\r\nQTY: 10\r\nCloset Doors\r\nQTY: 10\r\nsqft\r\nQTY: 10\r\nDemolition & Disposal\r\nQTY: 10\r\nPaint all walls, doors, trim & Kitchen\r\nQTY: 10\r\nFlooring  - Supply & Install\r\nQTY: 10\r\nLight\r\nQTY: 10\r\nSwitches / Receptacles\r\nQTY: 1.0\r\nTub Surround & New Drywall\r\nQTY: 1.0\r\nSupply and Install Vanity, sink and faucet \r\nQTY: 1.0\r\nAccessories\r\nQTY: 1.0\r\nToilet\r\nQTY: 1.0\r\nFinal Clean and Garbage Removal\r\n		2019-09-30 00:00:00	2019-09-12 12:24:56.413927	2019-09-18 13:02:42.285451	\N	\N	\N	\N	1	436	8288.50	2019-09-12 12:25:42.154427	2019-09-12 12:25:16.992621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-12	2019-09-12		payed
580	113	112	Final Clean and Garbage Removal	done_confirmed	NEW TEST	QTY: 0.0\r\nNew Kitchen\r\nQTY: 0.0\r\nPaint Existing Kitchen\r\nQTY: 10\r\nDoors\r\nQTY: 10\r\nStairs Nosings & Materials\r\nQTY: 10\r\nCloset Doors\r\nQTY: 10\r\nsqft\r\nQTY: 10\r\nDemolition & Disposal\r\nQTY: 10\r\nPaint all walls, doors, trim & Kitchen\r\nQTY: 10\r\nFlooring  - Supply & Install\r\nQTY: 10\r\nLight\r\nQTY: 10\r\nSwitches / Receptacles\r\nQTY: 1.0\r\nFinal Clean and Garbage Removal\r\n		2019-09-30 00:00:00	2019-09-12 07:02:44.071745	2019-09-18 13:02:53.900786	\N	\N	\N	\N	1	435	7657.50	2019-09-12 07:05:47.052722	2019-09-12 07:05:26.587489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-12	2019-09-12		payed
577	110	112	task11091	done_confirmed	NEW TEST	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-11 09:22:36.364184	2019-09-18 13:02:59.551954	Chrysanthemum.jpg	image/jpeg	879394	2019-09-11 09:22:35.697545	1	433	1236.65	2019-09-11 09:25:43.390352	2019-09-11 09:25:08.930813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-01	2019-09-11	2019-09-11		payed
576	110	112	task1009	done_confirmed	NEW TEST	test	(111) 111-1111	2019-09-30 00:00:00	2019-09-10 19:35:01.519614	2019-09-19 08:21:35.586043	\N	\N	\N	\N	1	432	1000.00	2019-09-10 19:36:21.003352	2019-09-10 19:35:54.578094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-09-10	2019-09-10	2019-09-10		payed
598	110	112	ttendre04105	confirmed	Framing (Wood)	admin	(111) 111-1111	2019-10-31 00:00:00	2019-10-04 11:56:52.031319	2019-10-04 12:02:25.591898	445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg	image/jpeg	34810	2019-10-04 11:56:51.533721	1	453	4589.99	\N	2019-10-04 12:02:25.590037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	t		2019-10-01	2019-10-04	\N		\N
588	113	112	Test invoice 	done_confirmed	NEW TEST	There are many variations of passages	(213) 132-2132	2019-10-04 00:00:00	2019-09-25 20:25:46.779375	2019-09-25 20:26:24.039866	\N	\N	\N	\N	1	443	3000.00	2019-09-25 20:26:24.037914	2019-09-25 20:26:03.932088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	f		2019-09-27	2019-09-25	2019-09-25		not_payed
597	110	112	task04104	done_confirmed	Framing (Wood)	test admin	(111) 111-1111	2019-10-31 00:00:00	2019-10-04 11:55:32.882538	2019-10-04 12:01:44.924621	\N	\N	\N	\N	1	452	2452.36	2019-10-04 12:01:44.922731	2019-10-04 11:56:56.105459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	f		2019-10-01	2019-10-04	2019-10-04		\N
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.trades (id, name, range, financial_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, first_name, last_name, street, city, postal_code, phone1, phone2, facebook_id, facebook_token, cardholder_name, card_number, cvk, exp_month, exp_year, country_id, description, balance, blocked_to, unlock_token, locked_at, is_logged_in, token_web, coordinates, coordinates_updated_at, last_address) FROM stdin;
97	peluhnya@dfdfdfdf.com	$2a$11$uO8Nb0ZX/vhcMqzYKRFNZO/OguUdwy/U3znh8RzCBijzUGw7JGFTK	\N	\N	\N	0	\N	\N	\N	\N	2019-03-28 15:23:35.483789	2019-03-28 15:23:35.483789	\N	\N	\N	\N			Shevchenko	Kobelyaki	39200		\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
111	peluhnya@outlook.com	$2a$11$X3ZuIaf1dT/0E.hcpaq5Hud.tV6n1hDm/kFQhIJJ5Cbj6BQkUEMsi	6084664e986547236381cbe13d7299eeb2d80cb1b1c6539cc71fbe3678e74083	2019-08-13 07:32:27.616595	\N	0	\N	\N	\N	\N	2019-07-20 08:25:28.099667	2019-08-13 07:32:27.617946	\N	\N	\N	\N	Garry dfdffd		Shevchenkoe2	Kobelyaki	39200	(121) 212-1212	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
106	k4872319@ukr.net	$2a$11$CSsKdD6/RKTCneJPEqN8cuXKV/Q6zmclGyj9bEMz0u2O7YL2Bg47a	\N	\N	\N	0	\N	\N	\N	\N	2019-07-17 22:13:47.401733	2019-07-19 14:08:00.581959	\N	\N	\N	\N	Mark		456UJ52	Calgary	52L852	(222) 222-2222	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
109	k4872319@yahoo.com	$2a$11$7QUwjLpaVBXxyNXwATYIoeqL40NXUtmq55yQCykuGNt/A1PPSEnIm	\N	\N	\N	1	2019-08-13 11:24:02.38085	2019-08-13 11:24:02.38085	93.77.85.249	93.77.85.249	2019-07-19 19:53:52.845455	2019-08-13 11:24:02.381999	\N	\N	\N	\N	Donna		45G65	Brooks	45p556	(222) 222-2222	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
113	k487231900@yahoo.com	$2a$11$CNFvS4EPy7ikzvYAFj3ZTOubO6l2J9.G4f2vfjjilIU01/8JrCmQK	\N	\N	\N	0	\N	\N	\N	\N	2019-09-02 21:39:23.935465	2019-09-02 21:39:23.935465	\N	\N	\N	\N	Supervisor5						\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
82	mm@mm.mm	$2a$11$DxtiNZSJo0xXglR1WdDqs.qlzX8Lnwm/x2TgVCQzPuekG7n6rjTMW	\N	\N	\N	0	\N	\N	\N	\N	2019-02-06 09:53:56.129936	2019-10-07 08:49:56.283676	data	image/jpeg	21373	2019-07-22 21:25:17.781438	mm							\N	\N		0	0	0	0	0	Роооопае рр	200	\N	\N	\N	f	\N	{"latitude": 48.4638745, "longitude": 35.0443201}	2019-10-07 08:49:56.281686	Dmytra Yavornytskoho Avenue, 65а, Dnipropetrovs'k, Dnipropetrovs'ka oblast, Ukraine, 49000
110	tatyanakipot@yahoo.com	$2a$11$sUMRPAKP99MwD11xM4PTRuO.mj3J.SiboOnJyLt0a8J56nO6NaB4m	\N	\N	\N	1	2019-08-13 21:16:18.391334	2019-08-13 21:16:18.391334	93.77.85.249	93.77.85.249	2019-07-19 20:05:16.919953	2019-09-18 10:55:09.283863	\N	\N	\N	\N	Supervisor2					(111) 111-1111	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{"latitude": 51.0437857, "longitude": -114.0421647}	2019-09-18 10:55:09.281473	806 9 Ave SE, Calgary, AB T2G 0S2, Canada
112	k4872319@gmail.com	$2a$11$/2w6Wxg7bK.4dPN7UIlfx.i6E9lFYA7mQyJDUNffT4yasLCaC51G6	\N	\N	\N	1	2019-09-24 13:06:21.911957	2019-09-24 13:06:21.911957	93.77.85.249	93.77.85.249	2019-08-12 09:10:57.568465	2019-09-24 13:06:21.912415	\N	\N	\N	\N	legal					(222) 222-2222	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	f	\N	{}	\N	\N
8	admin@gmail.com	$2a$11$l3puTTZp6bJQ/Us4Wkl0Yu2wxCW1QbJ0b.GKGq7OagnNLgRjKtLby	\N	\N	\N	352	2019-10-12 15:02:44.161181	2019-10-08 09:42:37.369123	5.248.112.66	87.76.237.83	2018-09-20 12:29:37.458434	2019-10-12 15:02:44.210666	\N	\N	\N	\N	Admin	Astra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	\N	t	imfIftDC-yCWHkTS7o05ibTiBNBYw8ZlZq355nAcTdk	{}	\N	\N
\.


--
-- Data for Name: users_pendings_tasks; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.users_pendings_tasks (id, user_id, task_id, "position", created_at, updated_at) FROM stdin;
141	109	539	7	2019-08-13 21:37:33.657778	2019-09-02 20:37:19.409384
142	109	547	5	2019-08-15 08:49:25.219203	2019-09-02 20:37:19.410339
143	109	546	4	2019-08-15 08:57:29.614214	2019-09-02 20:37:19.411168
144	109	552	3	2019-08-15 20:53:48.301994	2019-09-02 20:37:19.411926
145	109	553	2	2019-08-15 20:54:06.630115	2019-09-02 20:37:19.412657
153	112	574	4	2019-09-09 11:38:09.822001	2019-10-04 13:43:04.302551
154	112	586	3	2019-09-24 13:13:31.490785	2019-10-04 13:43:04.30361
155	112	457	1	2019-09-25 19:26:57.943593	2019-10-04 13:43:04.304449
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.users_roles (user_id, role_id) FROM stdin;
8	1
74	2
75	2
76	2
77	2
81	2
82	3
97	3
106	2
109	2
110	3
111	2
112	2
113	3
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.versions (id, item_type, item_id, event, whodunnit, object, created_at, object_changes) FROM stdin;
1	Task	561	update	8	---\nid: 561\ndate_limit: 2019-09-04 00:00:00.000000000 Z\ndate_start: 2019-09-04\nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: afasdadadad\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: adasdasdasdasd\nphone: "(111) 111-1111"\ncreated_at: 2019-09-02 11:12:17.589873000 Z\nupdated_at: 2019-09-02 11:12:17.599769000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.343434343e9\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 28\ntender: false\napartment: ''\nfact_end: \ncity: ''\n	2019-09-10 08:26:46.692529	---\ndate_start:\n- 2019-09-04\n- 2019-09-05\n
2	Task	561	update	8	---\nid: 561\ndate_limit: 2019-09-04 00:00:00.000000000 Z\ndate_start: 2019-09-05\nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: afasdadadad\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: adasdasdasdasd\nphone: "(111) 111-1111"\ncreated_at: 2019-09-02 11:12:17.589873000 Z\nupdated_at: 2019-09-10 08:26:46.692529000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.343434343e9\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 28\ntender: false\napartment: ''\nfact_end: \ncity: ''\n	2019-09-10 13:48:16.810356	---\ndate_limit:\n- 2019-09-04 00:00:00.000000000 Z\n- 2019-09-28 00:00:00.000000000 Z\ndate_start:\n- 2019-09-05\n- 2019-09-01\n
3	Task	575	update	8	---\nid: 575\ndate_limit: 2019-09-29 00:00:00.000000000 Z\ndate_start: 2019-09-09\nfact_start: 2019-09-09\nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task 09093app\nconcierge_id: 112\nstatus: done_confirmed\nowner_id: 110\ntask_type: NEW TEST\ndescription: app\nphone: '25889336'\ncreated_at: 2019-09-09 11:37:22.222813000 Z\nupdated_at: 2019-09-09 12:03:11.838517000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 430\nbudget: !ruby/object:BigDecimal 27:0.125896e4\ncompleted_at: 2019-09-09 12:03:11.836804000 Z\nconfirmed_at: 2019-09-09 11:37:49.264399000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\nfact_end: 2019-09-09\ncity: ''\n	2019-09-10 16:45:45.089501	---\nfact_start:\n- 2019-09-09\n- 2019-09-10\n
4	Task	574	update	8	---\nid: 574\ntitle: task09093\ndescription: ''\ncity: ''\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nproject_task_id: 32\nconcierge_id: \ntender: true\nowner_id: 110\ndate_limit: 2019-09-30 00:00:00.000000000 Z\nbudget: !ruby/object:BigDecimal 27:0.145236e4\nphone: "(111) 111-1111"\ndate_start: 2019-09-08\nfact_start: \nupdated_at: 2019-09-10 16:47:25.810253073 Z\ntask_type: NEW TEST\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \nstatus: posted\ncreated_at: 2019-09-09 11:35:45.577473000 Z\nsuggestions_counter: 1\nsuggestion_id: \ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \napartment: ''\nfact_end: \n	2019-09-10 16:47:26.13751	---\ntitle:\n- task09093\n- task09093e\ndescription:\n- ''\n- test\nphoto_file_name:\n- \n- Tulips.jpg\nconcierge_id:\n- \n- 112\ntender:\n- true\n- false\ndate_limit:\n- 2019-09-30 00:00:00.000000000 Z\n- 2019-09-21 00:00:00.000000000 Z\nphone:\n- "(111) 111-1111"\n- "(222) 222-2222"\ndate_start:\n- 2019-09-08\n- 2019-09-07\n
5	Task	574	update	8	---\nid: 574\ntitle: task09093e\ndescription: test\ncity: ''\nphoto_file_name: Tulips.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 620888\nphoto_updated_at: 2019-09-10 16:47:25.429028009 Z\nproject_task_id: 32\nconcierge_id: 112\ntender: false\nowner_id: 110\ndate_limit: 2019-09-21 00:00:00.000000000 Z\nbudget: !ruby/object:BigDecimal 27:0.145236e4\nphone: "(222) 222-2222"\ndate_start: 2019-09-07\nfact_start: \nupdated_at: 2019-09-10 16:47:25.810253073 Z\ntask_type: NEW TEST\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \nstatus: posted\ncreated_at: 2019-09-09 11:35:45.577473000 Z\nsuggestions_counter: 1\nsuggestion_id: \ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \napartment: ''\nfact_end: \n	2019-09-10 16:47:25.810253	\N
13	Task	577	update	8	---\nid: 577\nowner_id: 110\nconcierge_id: 112\ntitle: task11091\nstatus: posted\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-11 09:22:36.364184126 Z\nupdated_at: 2019-09-11 09:22:36.374614799 Z\nphoto_file_name: Chrysanthemum.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 879394\nphoto_updated_at: 2019-09-11 09:22:35.697545034 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.123665e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: \nfact_end: \ncity: ''\n	2019-09-11 09:22:36.374614	\N
6	Task	567	update	8	---\nid: 567\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ndate_start: 2019-09-01\nfact_start: 2019-09-09\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_file_size: 34810\nphoto_content_type: image/jpeg\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task04092\nconcierge_id: 112\nstatus: confirmed\nowner_id: 110\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ncreated_at: 2019-09-04 16:01:37.875125000 Z\nupdated_at: 2019-09-09 11:28:54.284185000 Z\nphoto_updated_at: 2019-09-04 16:01:37.336938000 Z\nsuggestions_counter: 1\nsuggestion_id: 0\nbudget: !ruby/object:BigDecimal 27:0.236536e4\ncompleted_at: \nconfirmed_at: 2019-09-09 11:28:54.281014000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\nfact_end: \ncity: ''\n	2019-09-10 17:49:39.656109	---\ndate_limit:\n- 2019-09-30 00:00:00.000000000 Z\n- 2019-09-02 00:00:00.000000000 Z\ndate_start:\n- 2019-09-01\n- 2019-09-02\nfact_start:\n- 2019-09-09\n- 2019-09-02\n
7	Task	576	create	8	\N	2019-09-10 19:35:01.519614	---\nid:\n- \n- 576\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task1009\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.1e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-10\ncity:\n- \n- ''\n
8	Task	576	update	8	---\nsuggestions_counter: 1\nid: 576\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task1009\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-10 19:35:01.519614000 Z\nupdated_at: 2019-09-10 19:35:01.519614000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-09-10\nfact_start: \nfact_end: \ncity: ''\n	2019-09-10 19:35:01.542123	---\nsuggestion_id:\n- \n- 432\n
9	Task	576	update	8	---\nstatus: posted\nid: 576\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task1009\nconcierge_id: 112\nowner_id: 110\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-10 19:35:01.519614000 Z\nupdated_at: 2019-09-10 19:35:01.542123000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 432\nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-10\nfact_end: \ncity: ''\n	2019-09-10 19:35:54.580535	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-10 19:35:54.578094940 Z\nfact_start:\n- \n- 2019-09-10\n
10	Task	576	update	8	---\nconcierge_id: 112\nsuggestion_id: 432\nid: 576\ntitle: task1009\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-10 19:35:01.519614000 Z\nupdated_at: 2019-09-10 19:35:54.580535000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 18:0.1e4\nconfirmed_at: 2019-09-10 19:35:54.578094000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-10\nfact_start: 2019-09-10\ncity: ''\n	2019-09-10 19:36:21.005191	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-10 19:36:21.003352073 Z\nfact_end:\n- \n- 2019-09-10\n
11	Task	577	create	8	\N	2019-09-11 09:22:36.364184	---\nid:\n- \n- 577\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task11091\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nphoto_file_name:\n- \n- Chrysanthemum.jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123665e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-01\ncity:\n- \n- ''\n
12	Task	577	update	8	---\nsuggestions_counter: 1\nid: 577\ntender: false\nsuggestion_id: \nphoto_file_name: Chrysanthemum.jpg\nphoto_file_size: 879394\nphoto_content_type: image/jpeg\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task11091\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-11 09:22:36.364184000 Z\nupdated_at: 2019-09-11 09:22:36.364184000 Z\nphoto_updated_at: 2019-09-11 09:22:35.697545000 Z\nbudget: !ruby/object:BigDecimal 27:0.123665e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-09-01\nfact_start: \nfact_end: \ncity: ''\n	2019-09-11 09:22:36.382855	---\nsuggestion_id:\n- \n- 433\n
35	Task	582	create	8	\N	2019-09-24 13:08:06.502323	---\nid:\n- \n- 582\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task24-1\nstatus:\n- \n- posted\ntask_type:\n- \n- Drain Cleaning\ndescription:\n- \n- ddsafdefr\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123423e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
14	Task	577	update	8	---\nstatus: posted\nid: 577\nconfirmed_at: \nfact_start: \nphoto_file_name: Chrysanthemum.jpg\nphoto_file_size: 879394\nphoto_content_type: image/jpeg\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: task11091\nconcierge_id: 112\nowner_id: 110\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-11 09:22:36.364184000 Z\nupdated_at: 2019-09-11 09:22:36.374614000 Z\nphoto_updated_at: 2019-09-11 09:22:35.697545000 Z\nsuggestions_counter: 1\nsuggestion_id: 433\nbudget: !ruby/object:BigDecimal 27:0.123665e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_end: \ncity: ''\n	2019-09-11 09:25:08.932815	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-11 09:25:08.930813135 Z\nfact_start:\n- \n- 2019-09-11\n
15	Task	577	update	8	---\nconcierge_id: 112\nsuggestion_id: 433\nid: 577\ntitle: task11091\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: Chrysanthemum.jpg\nphoto_file_size: 879394\nphoto_content_type: image/jpeg\nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-11 09:22:36.364184000 Z\nupdated_at: 2019-09-11 09:25:08.932815000 Z\nphoto_updated_at: 2019-09-11 09:22:35.697545000 Z\nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.123665e4\nconfirmed_at: 2019-09-11 09:25:08.930813000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-11\ncity: ''\n	2019-09-11 09:25:43.393572	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-11 09:25:43.390352577 Z\nfact_end:\n- \n- 2019-09-11\n
16	Task	578	create	8	\N	2019-09-11 12:29:40.702584	---\nid:\n- \n- 578\nowner_id:\n- \n- 113\ntitle:\n- \n- Stairs Nosings & Materials\nstatus:\n- \n- posted\ntask_type:\n- \n- Test1508\ndescription:\n- \n- "QTY: 23\\r\\nDoors\\r\\nQTY: 24\\r\\nStairs Nosings & Materials\\r\\n"\nphone:\n- \n- ''\ndate_limit:\n- \n- 2019-09-12 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.132e4\nproject_task_id:\n- \n- 15\ntender:\n- \n- true\ndate_start:\n- \n- 2019-09-11\ncity:\n- \n- ''\n
17	Task	579	create	8	\N	2019-09-12 06:42:15.365156	---\nid:\n- \n- 579\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- New Kitchen\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- "QTY: 1.0\\r\\nNew Kitchen"\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123663e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-01\ncity:\n- \n- ''\n
18	Task	579	update	8	---\nsuggestions_counter: 1\nid: 579\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: New Kitchen\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen"\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 06:42:15.365156000 Z\nupdated_at: 2019-09-12 06:42:15.365156000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.123663e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-09-01\nfact_start: \nfact_end: \ncity: ''\n	2019-09-12 06:42:15.400343	---\nsuggestion_id:\n- \n- 434\n
19	Task	580	create	8	\N	2019-09-12 07:02:44.071745	---\nid:\n- \n- 580\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- Final Clean and Garbage Removal\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- "QTY: 0.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY: 10\\r\\nDoors\\r\\nQTY:\n  10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY: 10\\r\\nsqft\\r\\nQTY:\n  10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors, trim & Kitchen\\r\\nQTY:\n  10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY: 10\\r\\nSwitches /\n  Receptacles\\r\\nQTY: 1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone:\n- \n- ''\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.76575e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-01\ncity:\n- \n- ''\n
20	Task	580	update	8	---\nsuggestions_counter: 1\nid: 580\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: Final Clean and Garbage Removal\nconcierge_id: 112\nstatus: posted\nowner_id: 113\ntask_type: NEW TEST\ndescription: "QTY: 0.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 07:02:44.071745000 Z\nupdated_at: 2019-09-12 07:02:44.071745000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.76575e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-09-01\nfact_start: \nfact_end: \ncity: ''\n	2019-09-12 07:02:44.093202	---\nsuggestion_id:\n- \n- 435\n
44	Task	586	create	8	\N	2019-09-24 13:13:14.013436	---\nid:\n- \n- 586\nowner_id:\n- \n- 110\ntitle:\n- \n- tendre245\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- ''\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.236536e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- true\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
21	Task	579	update	8	---\nstatus: posted\nid: 579\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: New Kitchen\nconcierge_id: 112\nowner_id: 110\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen"\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 06:42:15.365156000 Z\nupdated_at: 2019-09-12 06:42:15.400343000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 434\nbudget: !ruby/object:BigDecimal 27:0.123663e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_end: \ncity: ''\n	2019-09-12 07:04:27.084137	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-12 07:04:27.081465467 Z\nfact_start:\n- \n- 2019-09-12\n
22	Task	580	update	8	---\nstatus: posted\nid: 580\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: Final Clean and Garbage Removal\nconcierge_id: 112\nowner_id: 113\ntask_type: NEW TEST\ndescription: "QTY: 0.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 07:02:44.071745000 Z\nupdated_at: 2019-09-12 07:02:44.093202000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 435\nbudget: !ruby/object:BigDecimal 27:0.76575e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_end: \ncity: ''\n	2019-09-12 07:05:26.589495	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-12 07:05:26.587489134 Z\nfact_start:\n- \n- 2019-09-12\n
23	Task	580	update	8	---\nconcierge_id: 112\nsuggestion_id: 435\nid: 580\ntitle: Final Clean and Garbage Removal\nowner_id: 113\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntask_type: NEW TEST\ndescription: "QTY: 0.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 07:02:44.071745000 Z\nupdated_at: 2019-09-12 07:05:26.589495000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.76575e4\nconfirmed_at: 2019-09-12 07:05:26.587489000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\ncity: ''\n	2019-09-12 07:05:47.054385	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-12 07:05:47.052722850 Z\nfact_end:\n- \n- 2019-09-12\n
24	Task	579	update	8	---\nconcierge_id: 112\nsuggestion_id: 434\nid: 579\ntitle: New Kitchen\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen"\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 06:42:15.365156000 Z\nupdated_at: 2019-09-12 07:04:27.084137000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.123663e4\nconfirmed_at: 2019-09-12 07:04:27.081465000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\ncity: ''\n	2019-09-12 07:06:21.610322	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-12 07:06:21.606709258 Z\nfact_end:\n- \n- 2019-09-12\n
25	Task	581	create	8	\N	2019-09-12 12:24:56.413927	---\nid:\n- \n- 581\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- Final Clean and Garbage Removal\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- "QTY: 1.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY: 10\\r\\nDoors\\r\\nQTY:\n  10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY: 10\\r\\nsqft\\r\\nQTY:\n  10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors, trim & Kitchen\\r\\nQTY:\n  10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY: 10\\r\\nSwitches /\n  Receptacles\\r\\nQTY: 1.0\\r\\nTub Surround & New Drywall\\r\\nQTY: 1.0\\r\\nSupply and\n  Install Vanity, sink and faucet \\r\\nQTY: 1.0\\r\\nAccessories\\r\\nQTY: 1.0\\r\\nToilet\\r\\nQTY:\n  1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone:\n- \n- ''\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.82885e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-01\ncity:\n- \n- ''\n
51	Task	587	create	8	\N	2019-09-25 20:06:47.976246	---\nid:\n- \n- 587\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- Invoice test name\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- Invoice test name\nphone:\n- \n- "(324) 324-4234"\ndate_limit:\n- \n- 2019-09-28 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.25e4\nproject_task_id:\n- \n- 22\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-28\nfact_start:\n- \n- 2019-09-21\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
125	Invoice	41	create	\N	\N	2019-10-02 20:12:48.857183	---\nid:\n- \n- 41\npayable_type:\n- \n- Task\npayable_id:\n- \n- 530\nstate:\n- \n- not_paid\n
126	Invoice	42	create	\N	\N	2019-10-02 20:12:48.860989	---\nid:\n- \n- 42\npayable_type:\n- \n- Task\npayable_id:\n- \n- 531\nstate:\n- \n- not_paid\n
26	Task	581	update	8	---\nsuggestions_counter: 1\nid: 581\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: Final Clean and Garbage Removal\nconcierge_id: 112\nstatus: posted\nowner_id: 113\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nTub Surround & New Drywall\\r\\nQTY: 1.0\\r\\nSupply\n  and Install Vanity, sink and faucet \\r\\nQTY: 1.0\\r\\nAccessories\\r\\nQTY: 1.0\\r\\nToilet\\r\\nQTY:\n  1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 12:24:56.413927000 Z\nupdated_at: 2019-09-12 12:24:56.413927000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.82885e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-09-01\nfact_start: \nfact_end: \ncity: ''\n	2019-09-12 12:24:56.433433	---\nsuggestion_id:\n- \n- 436\n
27	Task	581	update	8	---\nstatus: posted\nid: 581\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntitle: Final Clean and Garbage Removal\nconcierge_id: 112\nowner_id: 113\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nTub Surround & New Drywall\\r\\nQTY: 1.0\\r\\nSupply\n  and Install Vanity, sink and faucet \\r\\nQTY: 1.0\\r\\nAccessories\\r\\nQTY: 1.0\\r\\nToilet\\r\\nQTY:\n  1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 12:24:56.413927000 Z\nupdated_at: 2019-09-12 12:24:56.433433000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 436\nbudget: !ruby/object:BigDecimal 27:0.82885e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_end: \ncity: ''\n	2019-09-12 12:25:16.994462	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-12 12:25:16.992621600 Z\nfact_start:\n- \n- 2019-09-12\n
28	Task	581	update	8	---\nconcierge_id: 112\nsuggestion_id: 436\nid: 581\ntitle: Final Clean and Garbage Removal\nowner_id: 113\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_file_size: \nphoto_content_type: \nphoto1_file_name: \nphoto1_file_size: \nphoto1_content_type: \nphoto2_file_name: \nphoto2_file_size: \nphoto2_content_type: \nphoto3_file_name: \nphoto3_file_size: \nphoto3_content_type: \nphoto4_file_name: \nphoto4_file_size: \nphoto4_content_type: \nphoto5_file_name: \nphoto5_file_size: \nphoto5_content_type: \nphoto6_file_name: \nphoto6_file_size: \nphoto6_content_type: \nphoto7_file_name: \nphoto7_file_size: \nphoto7_content_type: \ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nTub Surround & New Drywall\\r\\nQTY: 1.0\\r\\nSupply\n  and Install Vanity, sink and faucet \\r\\nQTY: 1.0\\r\\nAccessories\\r\\nQTY: 1.0\\r\\nToilet\\r\\nQTY:\n  1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 12:24:56.413927000 Z\nupdated_at: 2019-09-12 12:25:16.994462000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.82885e4\nconfirmed_at: 2019-09-12 12:25:16.992621000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\ncity: ''\n	2019-09-12 12:25:42.157199	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-12 12:25:42.154427430 Z\nfact_end:\n- \n- 2019-09-12\n
29	Task	501	destroy	8	---\nid: 501\nowner_id: 110\nconcierge_id: 109\ntitle: task191\nstatus: confirmed\ntask_type: Drain Cleaning\ndescription: app\nphone: '2589633'\ndate_limit: 2019-07-31 00:00:00.000000000 Z\ncreated_at: 2019-07-19 20:07:42.624532000 Z\nupdated_at: 2019-07-19 20:12:20.929020000 Z\nphoto_file_name: data\nphoto_content_type: image/jpeg\nphoto_file_size: 32801\nphoto_updated_at: 2019-07-19 20:07:42.457854000 Z\nsuggestions_counter: 1\nsuggestion_id: 363\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: 2019-07-19 20:10:36.635658000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 28\ntender: false\napartment: ''\ndate_start: 2019-07-19\nfact_start: 2019-07-04\nfact_end: \ncity: \n	2019-09-16 20:30:02.330441	---\nid:\n- 501\n- \nowner_id:\n- 110\n- \nconcierge_id:\n- 109\n- \ntitle:\n- task191\n- \nstatus:\n- confirmed\n- \ntask_type:\n- Drain Cleaning\n- \ndescription:\n- app\n- \nphone:\n- '2589633'\n- \ndate_limit:\n- 2019-07-31 00:00:00.000000000 Z\n- \nphoto_file_name:\n- data\n- \nsuggestions_counter:\n- 1\n- \nsuggestion_id:\n- 363\n- \nbudget:\n- !ruby/object:BigDecimal 18:0.25e4\n- \ncompleted_at:\n- \n- \nconfirmed_at:\n- 2019-07-19 20:10:36.635658000 Z\n- \nphoto1_file_name:\n- \n- \nphoto2_file_name:\n- \n- \nphoto3_file_name:\n- \n- \nphoto4_file_name:\n- \n- \nphoto5_file_name:\n- \n- \nphoto6_file_name:\n- \n- \nphoto7_file_name:\n- \n- \nproject_task_id:\n- 28\n- \ntender:\n- false\n- \napartment:\n- ''\n- \ndate_start:\n- 2019-07-19\n- \nfact_start:\n- 2019-07-04\n- \nfact_end:\n- \n- \ncity:\n- \n- \n
95	Invoice	11	create	\N	\N	2019-10-02 20:12:48.740877	---\nid:\n- \n- 11\npayable_type:\n- \n- Task\npayable_id:\n- \n- 413\nstate:\n- \n- not_paid\n
96	Invoice	12	create	\N	\N	2019-10-02 20:12:48.745994	---\nid:\n- \n- 12\npayable_type:\n- \n- Task\npayable_id:\n- \n- 419\nstate:\n- \n- not_paid\n
97	Invoice	13	create	\N	\N	2019-10-02 20:12:48.750213	---\nid:\n- \n- 13\npayable_type:\n- \n- Task\npayable_id:\n- \n- 420\nstate:\n- \n- not_paid\n
30	Task	579	update	8	---\nid: 579\nowner_id: 110\nconcierge_id: 112\ntitle: New Kitchen\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen"\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 06:42:15.365156000 Z\nupdated_at: 2019-09-12 07:06:21.610322000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 434\nbudget: !ruby/object:BigDecimal 27:0.123663e4\ncompleted_at: 2019-09-12 07:06:21.606709000 Z\nconfirmed_at: 2019-09-12 07:04:27.081465000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\nfact_end: 2019-09-12\ncity: ''\npay_state: not_payed\n	2019-09-18 13:02:07.666906	---\npay_state:\n- not_payed\n- payed\n
31	Task	581	update	8	---\nid: 581\nowner_id: 113\nconcierge_id: 112\ntitle: Final Clean and Garbage Removal\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: "QTY: 1.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nTub Surround & New Drywall\\r\\nQTY: 1.0\\r\\nSupply\n  and Install Vanity, sink and faucet \\r\\nQTY: 1.0\\r\\nAccessories\\r\\nQTY: 1.0\\r\\nToilet\\r\\nQTY:\n  1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 12:24:56.413927000 Z\nupdated_at: 2019-09-12 12:25:42.157199000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 436\nbudget: !ruby/object:BigDecimal 27:0.82885e4\ncompleted_at: 2019-09-12 12:25:42.154427000 Z\nconfirmed_at: 2019-09-12 12:25:16.992621000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\nfact_end: 2019-09-12\ncity: ''\npay_state: not_payed\n	2019-09-18 13:02:42.285451	---\npay_state:\n- not_payed\n- payed\n
32	Task	580	update	8	---\nid: 580\nowner_id: 113\nconcierge_id: 112\ntitle: Final Clean and Garbage Removal\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: "QTY: 0.0\\r\\nNew Kitchen\\r\\nQTY: 0.0\\r\\nPaint Existing Kitchen\\r\\nQTY:\n  10\\r\\nDoors\\r\\nQTY: 10\\r\\nStairs Nosings & Materials\\r\\nQTY: 10\\r\\nCloset Doors\\r\\nQTY:\n  10\\r\\nsqft\\r\\nQTY: 10\\r\\nDemolition & Disposal\\r\\nQTY: 10\\r\\nPaint all walls, doors,\n  trim & Kitchen\\r\\nQTY: 10\\r\\nFlooring  - Supply & Install\\r\\nQTY: 10\\r\\nLight\\r\\nQTY:\n  10\\r\\nSwitches / Receptacles\\r\\nQTY: 1.0\\r\\nFinal Clean and Garbage Removal\\r\\n"\nphone: ''\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-12 07:02:44.071745000 Z\nupdated_at: 2019-09-12 07:05:47.054385000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 435\nbudget: !ruby/object:BigDecimal 27:0.76575e4\ncompleted_at: 2019-09-12 07:05:47.052722000 Z\nconfirmed_at: 2019-09-12 07:05:26.587489000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-12\nfact_end: 2019-09-12\ncity: ''\npay_state: not_payed\n	2019-09-18 13:02:53.900786	---\npay_state:\n- not_payed\n- payed\n
33	Task	577	update	8	---\nid: 577\nowner_id: 110\nconcierge_id: 112\ntitle: task11091\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-11 09:22:36.364184000 Z\nupdated_at: 2019-09-11 09:25:43.393572000 Z\nphoto_file_name: Chrysanthemum.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 879394\nphoto_updated_at: 2019-09-11 09:22:35.697545000 Z\nsuggestions_counter: 1\nsuggestion_id: 433\nbudget: !ruby/object:BigDecimal 27:0.123665e4\ncompleted_at: 2019-09-11 09:25:43.390352000 Z\nconfirmed_at: 2019-09-11 09:25:08.930813000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-01\nfact_start: 2019-09-11\nfact_end: 2019-09-11\ncity: ''\npay_state: not_payed\n	2019-09-18 13:02:59.551954	---\npay_state:\n- not_payed\n- payed\n
34	Task	576	update	8	---\nid: 576\nowner_id: 110\nconcierge_id: 112\ntitle: task1009\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-10 19:35:01.519614000 Z\nupdated_at: 2019-09-10 19:36:21.005191000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 432\nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: 2019-09-10 19:36:21.003352000 Z\nconfirmed_at: 2019-09-10 19:35:54.578094000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-10\nfact_start: 2019-09-10\nfact_end: 2019-09-10\ncity: ''\npay_state: not_payed\n	2019-09-19 08:21:35.586043	---\npay_state:\n- not_payed\n- payed\n
98	Invoice	14	create	\N	\N	2019-10-02 20:12:48.754293	---\nid:\n- \n- 14\npayable_type:\n- \n- Task\npayable_id:\n- \n- 430\nstate:\n- \n- not_paid\n
36	Task	582	update	8	---\nid: 582\nowner_id: 110\nconcierge_id: 112\ntitle: task24-1\nstatus: posted\ntask_type: Drain Cleaning\ndescription: ddsafdefr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:08:06.502323000 Z\nupdated_at: 2019-09-24 13:08:06.502323000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.123423e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:08:06.570261	---\nsuggestion_id:\n- \n- 437\n
37	Task	583	create	8	\N	2019-09-24 13:08:59.758613	---\nid:\n- \n- 583\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task242\nstatus:\n- \n- posted\ntask_type:\n- \n- Drain Cleaning\ndescription:\n- \n- tesst\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123423e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-23\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
38	Task	583	update	8	---\nid: 583\nowner_id: 110\nconcierge_id: 112\ntitle: task242\nstatus: posted\ntask_type: Drain Cleaning\ndescription: tesst\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:08:59.758613000 Z\nupdated_at: 2019-09-24 13:08:59.758613000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.123423e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-23\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:08:59.775905	---\nsuggestion_id:\n- \n- 438\n
39	Task	584	create	8	\N	2019-09-24 13:09:49.132433	---\nid:\n- \n- 584\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task243\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- retertrr\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123636e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
40	Task	584	update	8	---\nid: 584\nowner_id: 110\nconcierge_id: 112\ntitle: task243\nstatus: posted\ntask_type: Framing (Wood)\ndescription: retertrr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:09:49.132433000 Z\nupdated_at: 2019-09-24 13:09:49.132433000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:09:49.143966	---\nsuggestion_id:\n- \n- 439\n
41	Task	582	update	112	---\nid: 582\nowner_id: 110\nconcierge_id: 112\ntitle: task24-1\nstatus: posted\ntask_type: Drain Cleaning\ndescription: ddsafdefr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:08:06.502323000 Z\nupdated_at: 2019-09-24 13:08:06.570261000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 437\nbudget: !ruby/object:BigDecimal 27:0.123423e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:10:59.103581	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-24 13:10:59.101542923 Z\nfact_start:\n- \n- 2019-09-24\n
42	Task	582	update	112	---\nid: 582\nowner_id: 110\nconcierge_id: 112\ntitle: task24-1\nstatus: confirmed\ntask_type: Drain Cleaning\ndescription: ddsafdefr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:08:06.502323000 Z\nupdated_at: 2019-09-24 13:10:59.103581000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 437\nbudget: !ruby/object:BigDecimal 27:0.123423e4\ncompleted_at: \nconfirmed_at: 2019-09-24 13:10:59.101542000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-24\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:11:02.492489	---\nconfirmed_at:\n- 2019-09-24 13:10:59.101542000 Z\n- 2019-09-24 13:11:02.489864513 Z\n
43	Task	585	create	8	\N	2019-09-24 13:11:49.955434	---\nid:\n- \n- 585\nowner_id:\n- \n- 110\ntitle:\n- \n- tender2444\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- rystyhtyr\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123463e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- true\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
99	Invoice	15	create	\N	\N	2019-10-02 20:12:48.758346	---\nid:\n- \n- 15\npayable_type:\n- \n- Task\npayable_id:\n- \n- 431\nstate:\n- \n- not_paid\n
45	Task	584	update	112	---\nid: 584\nowner_id: 110\nconcierge_id: 112\ntitle: task243\nstatus: posted\ntask_type: Framing (Wood)\ndescription: retertrr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:09:49.132433000 Z\nupdated_at: 2019-09-24 13:09:49.143966000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 439\nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:14:21.926601	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-24 13:14:21.924041343 Z\nfact_start:\n- \n- 2019-09-24\n
46	Task	584	update	8	---\nid: 584\nowner_id: 110\nconcierge_id: 112\ntitle: task243\nstatus: confirmed\ntask_type: Framing (Wood)\ndescription: retertrr\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-24 13:09:49.132433000 Z\nupdated_at: 2019-09-24 13:14:21.926601000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 439\nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nconfirmed_at: 2019-09-24 13:14:21.924041000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-24\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-24 13:15:25.231777	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-24 13:15:25.230081827 Z\nfact_end:\n- \n- 2019-09-24\n
47	Task	447	update	8	---\nid: 447\nowner_id: 97\nconcierge_id: \ntitle: vxvcxvxcvxcvxcv\nstatus: posted\ntask_type: Framing (Steel)\ndescription: ''\nphone: ''\ndate_limit: 2019-03-15 00:00:00.000000000 Z\ncreated_at: 2019-03-14 21:58:54.761027000 Z\nupdated_at: 2019-07-22 19:12:32.132026000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.3232e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: true\napartment: ''\ndate_start: 2019-03-21\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 19:31:39.13216	---\nconcierge_id:\n- \n- 112\ntender:\n- true\n- false\n
48	Task	447	update	112	---\nid: 447\nowner_id: 97\nconcierge_id: 112\ntitle: vxvcxvxcvxcvxcv\nstatus: posted\ntask_type: Framing (Steel)\ndescription: ''\nphone: ''\ndate_limit: 2019-03-15 00:00:00.000000000 Z\ncreated_at: 2019-03-14 21:58:54.761027000 Z\nupdated_at: 2019-09-25 19:31:39.132160000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.3232e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-03-21\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 19:31:50.130148	---\nstatus:\n- posted\n- confirmed\nsuggestion_id:\n- \n- 0\nconfirmed_at:\n- \n- 2019-09-25 19:31:50.128053943 Z\nfact_start:\n- \n- 2019-09-25\n
49	Task	447	update	112	---\nid: 447\nowner_id: 97\nconcierge_id: 112\ntitle: vxvcxvxcvxcvxcv\nstatus: confirmed\ntask_type: Framing (Steel)\ndescription: ''\nphone: ''\ndate_limit: 2019-03-15 00:00:00.000000000 Z\ncreated_at: 2019-03-14 21:58:54.761027000 Z\nupdated_at: 2019-09-25 19:31:50.130148000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: \nsuggestion_id: 0\nbudget: !ruby/object:BigDecimal 18:0.3232e4\ncompleted_at: \nconfirmed_at: 2019-09-25 19:31:50.128053000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-03-21\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 19:31:54.853506	---\nconfirmed_at:\n- 2019-09-25 19:31:50.128053000 Z\n- 2019-09-25 19:31:54.851730711 Z\n
50	Task	447	update	112	---\nid: 447\nowner_id: 97\nconcierge_id: 112\ntitle: vxvcxvxcvxcvxcv\nstatus: confirmed\ntask_type: Framing (Steel)\ndescription: ''\nphone: ''\ndate_limit: 2019-03-15 00:00:00.000000000 Z\ncreated_at: 2019-03-14 21:58:54.761027000 Z\nupdated_at: 2019-09-25 19:31:54.853506000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: \nsuggestion_id: 0\nbudget: !ruby/object:BigDecimal 18:0.3232e4\ncompleted_at: \nconfirmed_at: 2019-09-25 19:31:54.851730000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-03-21\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 19:31:56.434251	---\nconfirmed_at:\n- 2019-09-25 19:31:54.851730000 Z\n- 2019-09-25 19:31:56.430547653 Z\n
52	Task	587	update	8	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: posted\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:06:47.976246000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-21\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:06:48.00101	---\nsuggestion_id:\n- \n- 442\n
53	Task	587	update	112	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: posted\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:06:48.001010000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 442\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-21\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:07:23.341123	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-25 20:07:23.339171181 Z\nfact_start:\n- 2019-09-21\n- 2019-09-25\n
54	Task	587	update	112	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: confirmed\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:07:23.341123000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 442\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: 2019-09-25 20:07:23.339171000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:07:25.777813	---\nconfirmed_at:\n- 2019-09-25 20:07:23.339171000 Z\n- 2019-09-25 20:07:25.774620301 Z\n
55	Task	587	update	112	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: confirmed\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:07:25.777813000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 442\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: 2019-09-25 20:07:25.774620000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:07:31.878492	---\nstatus:\n- confirmed\n- done\nfact_end:\n- \n- 2019-09-25\n
56	Task	587	update	8	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: done\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:07:31.878492000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 442\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: \nconfirmed_at: 2019-09-25 20:07:25.774620000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-25\nfact_end: 2019-09-25\ncity: ''\npay_state: not_payed\n	2019-09-25 20:08:22.329516	---\nstatus:\n- done\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-25 20:08:22.326812990 Z\n
57	Task	588	create	8	\N	2019-09-25 20:25:46.779375	---\nid:\n- \n- 588\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- 'Test invoice '\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- There are many variations of passages\nphone:\n- \n- "(213) 132-2132"\ndate_limit:\n- \n- 2019-10-04 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.3e4\nproject_task_id:\n- \n- 22\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-27\nfact_start:\n- \n- 2019-09-28\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
100	Invoice	16	create	\N	\N	2019-10-02 20:12:48.762388	---\nid:\n- \n- 16\npayable_type:\n- \n- Task\npayable_id:\n- \n- 432\nstate:\n- \n- not_paid\n
101	Invoice	17	create	\N	\N	2019-10-02 20:12:48.766504	---\nid:\n- \n- 17\npayable_type:\n- \n- Task\npayable_id:\n- \n- 437\nstate:\n- \n- not_paid\n
102	Invoice	18	create	\N	\N	2019-10-02 20:12:48.77028	---\nid:\n- \n- 18\npayable_type:\n- \n- Task\npayable_id:\n- \n- 442\nstate:\n- \n- not_paid\n
103	Invoice	19	create	\N	\N	2019-10-02 20:12:48.773994	---\nid:\n- \n- 19\npayable_type:\n- \n- Task\npayable_id:\n- \n- 444\nstate:\n- \n- not_paid\n
104	Invoice	20	create	\N	\N	2019-10-02 20:12:48.77804	---\nid:\n- \n- 20\npayable_type:\n- \n- Task\npayable_id:\n- \n- 447\nstate:\n- \n- not_paid\n
58	Task	588	update	8	---\nid: 588\nowner_id: 113\nconcierge_id: 112\ntitle: 'Test invoice '\nstatus: posted\ntask_type: NEW TEST\ndescription: There are many variations of passages\nphone: "(213) 132-2132"\ndate_limit: 2019-10-04 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:25:46.779375000 Z\nupdated_at: 2019-09-25 20:25:46.779375000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.3e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-28\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:25:46.798545	---\nsuggestion_id:\n- \n- 443\n
59	Task	588	update	112	---\nid: 588\nowner_id: 113\nconcierge_id: 112\ntitle: 'Test invoice '\nstatus: posted\ntask_type: NEW TEST\ndescription: There are many variations of passages\nphone: "(213) 132-2132"\ndate_limit: 2019-10-04 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:25:46.779375000 Z\nupdated_at: 2019-09-25 20:25:46.798545000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 443\nbudget: !ruby/object:BigDecimal 18:0.3e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-28\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:26:03.936008	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-25 20:26:03.932088158 Z\nfact_start:\n- 2019-09-28\n- 2019-09-25\n
60	Task	588	update	112	---\nid: 588\nowner_id: 113\nconcierge_id: 112\ntitle: 'Test invoice '\nstatus: confirmed\ntask_type: NEW TEST\ndescription: There are many variations of passages\nphone: "(213) 132-2132"\ndate_limit: 2019-10-04 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:25:46.779375000 Z\nupdated_at: 2019-09-25 20:26:03.936008000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 443\nbudget: !ruby/object:BigDecimal 18:0.3e4\ncompleted_at: \nconfirmed_at: 2019-09-25 20:26:03.932088000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 20:26:11.650946	---\nstatus:\n- confirmed\n- done\nfact_end:\n- \n- 2019-09-25\n
61	Task	588	update	8	---\nid: 588\nowner_id: 113\nconcierge_id: 112\ntitle: 'Test invoice '\nstatus: done\ntask_type: NEW TEST\ndescription: There are many variations of passages\nphone: "(213) 132-2132"\ndate_limit: 2019-10-04 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:25:46.779375000 Z\nupdated_at: 2019-09-25 20:26:11.650946000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 443\nbudget: !ruby/object:BigDecimal 18:0.3e4\ncompleted_at: \nconfirmed_at: 2019-09-25 20:26:03.932088000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-25\nfact_end: 2019-09-25\ncity: ''\npay_state: not_payed\n	2019-09-25 20:26:24.039866	---\nstatus:\n- done\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-25 20:26:24.037914021 Z\n
62	Task	589	create	8	\N	2019-09-25 21:22:56.100652	---\nid:\n- \n- 589\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- '280228022802'\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- '280228022802'\nphone:\n- \n- "(280) 228-0228"\ndate_limit:\n- \n- 2019-10-05 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.45e4\nproject_task_id:\n- \n- 22\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-27\nfact_start:\n- \n- 2019-10-02\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
63	Task	589	update	8	---\nid: 589\nowner_id: 113\nconcierge_id: 112\ntitle: '280228022802'\nstatus: posted\ntask_type: NEW TEST\ndescription: '280228022802'\nphone: "(280) 228-0228"\ndate_limit: 2019-10-05 00:00:00.000000000 Z\ncreated_at: 2019-09-25 21:22:56.100652000 Z\nupdated_at: 2019-09-25 21:22:56.100652000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.45e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-10-02\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 21:22:56.118703	---\nsuggestion_id:\n- \n- 444\n
105	Invoice	21	create	\N	\N	2019-10-02 20:12:48.781904	---\nid:\n- \n- 21\npayable_type:\n- \n- Task\npayable_id:\n- \n- 449\nstate:\n- \n- not_paid\n
106	Invoice	22	create	\N	\N	2019-10-02 20:12:48.785697	---\nid:\n- \n- 22\npayable_type:\n- \n- Task\npayable_id:\n- \n- 450\nstate:\n- \n- not_paid\n
107	Invoice	23	create	\N	\N	2019-10-02 20:12:48.789361	---\nid:\n- \n- 23\npayable_type:\n- \n- Task\npayable_id:\n- \n- 451\nstate:\n- \n- not_paid\n
108	Invoice	24	create	\N	\N	2019-10-02 20:12:48.792993	---\nid:\n- \n- 24\npayable_type:\n- \n- Task\npayable_id:\n- \n- 452\nstate:\n- \n- not_paid\n
109	Invoice	25	create	\N	\N	2019-10-02 20:12:48.796741	---\nid:\n- \n- 25\npayable_type:\n- \n- Task\npayable_id:\n- \n- 453\nstate:\n- \n- not_paid\n
64	Task	589	update	112	---\nid: 589\nowner_id: 113\nconcierge_id: 112\ntitle: '280228022802'\nstatus: posted\ntask_type: NEW TEST\ndescription: '280228022802'\nphone: "(280) 228-0228"\ndate_limit: 2019-10-05 00:00:00.000000000 Z\ncreated_at: 2019-09-25 21:22:56.100652000 Z\nupdated_at: 2019-09-25 21:22:56.118703000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 444\nbudget: !ruby/object:BigDecimal 18:0.45e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-10-02\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 21:23:08.893823	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-25 21:23:08.892014109 Z\nfact_start:\n- 2019-10-02\n- 2019-09-25\n
65	Task	589	update	112	---\nid: 589\nowner_id: 113\nconcierge_id: 112\ntitle: '280228022802'\nstatus: confirmed\ntask_type: NEW TEST\ndescription: '280228022802'\nphone: "(280) 228-0228"\ndate_limit: 2019-10-05 00:00:00.000000000 Z\ncreated_at: 2019-09-25 21:22:56.100652000 Z\nupdated_at: 2019-09-25 21:23:08.893823000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 444\nbudget: !ruby/object:BigDecimal 18:0.45e4\ncompleted_at: \nconfirmed_at: 2019-09-25 21:23:08.892014000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-25\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-25 21:23:21.232759	---\nstatus:\n- confirmed\n- done\nfact_end:\n- \n- 2019-09-25\n
66	Task	589	update	8	---\nid: 589\nowner_id: 113\nconcierge_id: 112\ntitle: '280228022802'\nstatus: done\ntask_type: NEW TEST\ndescription: '280228022802'\nphone: "(280) 228-0228"\ndate_limit: 2019-10-05 00:00:00.000000000 Z\ncreated_at: 2019-09-25 21:22:56.100652000 Z\nupdated_at: 2019-09-25 21:23:21.232759000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 444\nbudget: !ruby/object:BigDecimal 18:0.45e4\ncompleted_at: \nconfirmed_at: 2019-09-25 21:23:08.892014000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-27\nfact_start: 2019-09-25\nfact_end: 2019-09-25\ncity: ''\npay_state: not_payed\n	2019-09-25 21:23:30.731747	---\nstatus:\n- done\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-25 21:23:30.729667653 Z\n
67	Task	590	create	8	\N	2019-09-26 21:51:08.94416	---\nid:\n- \n- 590\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task2709\nstatus:\n- \n- posted\ntask_type:\n- \n- Drain Cleaning\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nphoto_file_name:\n- \n- 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.1e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
68	Task	590	update	8	---\nid: 590\nowner_id: 110\nconcierge_id: 112\ntitle: task2709\nstatus: posted\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:51:08.944160000 Z\nupdated_at: 2019-09-26 21:51:08.944160000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-09-26 21:51:08.414441000 Z\nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:51:08.96327	---\nsuggestion_id:\n- \n- 445\n
69	Task	590	update	8	---\nid: 590\nowner_id: 110\nconcierge_id: 112\ntitle: task2709\nstatus: posted\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:51:08.944160000 Z\nupdated_at: 2019-09-26 21:51:08.963270000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-09-26 21:51:08.414441000 Z\nsuggestions_counter: 1\nsuggestion_id: 445\nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:51:21.721534	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-26 21:51:21.719011816 Z\nfact_start:\n- \n- 2019-09-26\n
110	Invoice	26	create	\N	\N	2019-10-02 20:12:48.800504	---\nid:\n- \n- 26\npayable_type:\n- \n- Task\npayable_id:\n- \n- 457\nstate:\n- \n- not_paid\n
111	Invoice	27	create	\N	\N	2019-10-02 20:12:48.804247	---\nid:\n- \n- 27\npayable_type:\n- \n- Task\npayable_id:\n- \n- 502\nstate:\n- \n- not_paid\n
112	Invoice	28	create	\N	\N	2019-10-02 20:12:48.807961	---\nid:\n- \n- 28\npayable_type:\n- \n- Task\npayable_id:\n- \n- 503\nstate:\n- \n- not_paid\n
113	Invoice	29	create	\N	\N	2019-10-02 20:12:48.811634	---\nid:\n- \n- 29\npayable_type:\n- \n- Task\npayable_id:\n- \n- 504\nstate:\n- \n- not_paid\n
70	Task	590	update	8	---\nid: 590\nowner_id: 110\nconcierge_id: 112\ntitle: task2709\nstatus: confirmed\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:51:08.944160000 Z\nupdated_at: 2019-09-26 21:51:21.721534000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-09-26 21:51:08.414441000 Z\nsuggestions_counter: 1\nsuggestion_id: 445\nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: \nconfirmed_at: 2019-09-26 21:51:21.719011000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-26\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:51:41.716167	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-26 21:51:41.714351498 Z\nfact_end:\n- \n- 2019-09-26\n
71	Task	591	create	8	\N	2019-09-26 21:56:46.179383	---\nid:\n- \n- 591\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task27095\nstatus:\n- \n- posted\ntask_type:\n- \n- Drain Cleaning\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-09-30 00:00:00.000000000 Z\nphoto_file_name:\n- \n- Без_названия_(1).jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.159636e4\nproject_task_id:\n- \n- 33\ntender:\n- \n- false\ndate_start:\n- \n- 2019-09-22\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
72	Task	591	update	8	---\nid: 591\nowner_id: 110\nconcierge_id: 112\ntitle: task27095\nstatus: posted\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:56:46.179383000 Z\nupdated_at: 2019-09-26 21:56:46.179383000 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-09-26 21:56:45.744035000 Z\nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.159636e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 33\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:56:46.201495	---\nsuggestion_id:\n- \n- 446\n
73	Task	591	update	8	---\nid: 591\nowner_id: 110\nconcierge_id: 112\ntitle: task27095\nstatus: posted\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:56:46.179383558 Z\nupdated_at: 2019-09-26 21:56:46.192341954 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-09-26 21:56:45.744035401 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.159636e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 33\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:56:46.192341	\N
74	Task	591	update	8	---\nid: 591\nowner_id: 110\nconcierge_id: 112\ntitle: task27095\nstatus: posted\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:56:46.179383000 Z\nupdated_at: 2019-09-26 21:56:46.192341000 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-09-26 21:56:45.744035000 Z\nsuggestions_counter: 1\nsuggestion_id: 446\nbudget: !ruby/object:BigDecimal 27:0.159636e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 33\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:56:58.110794	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-09-26 21:56:58.106016925 Z\nfact_start:\n- \n- 2019-09-26\n
75	Task	591	update	8	---\nid: 591\nowner_id: 110\nconcierge_id: 112\ntitle: task27095\nstatus: confirmed\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:56:46.179383000 Z\nupdated_at: 2019-09-26 21:56:58.110794000 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-09-26 21:56:45.744035000 Z\nsuggestions_counter: 1\nsuggestion_id: 446\nbudget: !ruby/object:BigDecimal 27:0.159636e4\ncompleted_at: \nconfirmed_at: 2019-09-26 21:56:58.106016000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 33\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-26\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-09-26 21:57:25.906035	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-09-26 21:57:25.903254421 Z\nfact_end:\n- \n- 2019-09-26\n
114	Invoice	30	create	\N	\N	2019-10-02 20:12:48.815459	---\nid:\n- \n- 30\npayable_type:\n- \n- Task\npayable_id:\n- \n- 505\nstate:\n- \n- not_paid\n
115	Invoice	31	create	\N	\N	2019-10-02 20:12:48.819331	---\nid:\n- \n- 31\npayable_type:\n- \n- Task\npayable_id:\n- \n- 506\nstate:\n- \n- not_paid\n
116	Invoice	32	create	\N	\N	2019-10-02 20:12:48.823613	---\nid:\n- \n- 32\npayable_type:\n- \n- Task\npayable_id:\n- \n- 507\nstate:\n- \n- not_paid\n
76	Task	590	update	8	---\nid: 590\nowner_id: 110\nconcierge_id: 112\ntitle: task2709\nstatus: done_confirmed\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:51:08.944160000 Z\nupdated_at: 2019-09-26 21:51:41.716167000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-09-26 21:51:08.414441000 Z\nsuggestions_counter: 1\nsuggestion_id: 445\nbudget: !ruby/object:BigDecimal 18:0.1e4\ncompleted_at: 2019-09-26 21:51:41.714351000 Z\nconfirmed_at: 2019-09-26 21:51:21.719011000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-26\nfact_end: 2019-09-26\ncity: ''\npay_state: not_payed\n	2019-09-26 22:00:00.296073	---\npay_state:\n- not_payed\n- payed\n
77	Task	591	update	8	---\nid: 591\nowner_id: 110\nconcierge_id: 112\ntitle: task27095\nstatus: done_confirmed\ntask_type: Drain Cleaning\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-09-30 00:00:00.000000000 Z\ncreated_at: 2019-09-26 21:56:46.179383000 Z\nupdated_at: 2019-09-26 21:57:25.906035000 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-09-26 21:56:45.744035000 Z\nsuggestions_counter: 1\nsuggestion_id: 446\nbudget: !ruby/object:BigDecimal 27:0.159636e4\ncompleted_at: 2019-09-26 21:57:25.903254000 Z\nconfirmed_at: 2019-09-26 21:56:58.106016000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 33\ntender: false\napartment: ''\ndate_start: 2019-09-22\nfact_start: 2019-09-26\nfact_end: 2019-09-26\ncity: ''\npay_state: not_payed\n	2019-09-26 22:00:03.05248	---\npay_state:\n- not_payed\n- payed\n
78	Task	592	create	8	\N	2019-10-01 07:31:49.350283	---\nid:\n- \n- 592\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task01101\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- DescriptionDescriptionvvvDescription\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-26 00:00:00.000000000 Z\nphoto_file_name:\n- \n- 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.145236e4\nphoto1_file_name:\n- \n- C_Logo-01.jpg\nphoto2_file_name:\n- \n- cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto3_file_name:\n- \n- gipsokarton.png\nproject_task_id:\n- \n- 34\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\npay_state:\n- \n- not_payed\n
79	Task	592	update	8	---\nid: 592\nowner_id: 110\nconcierge_id: 112\ntitle: task01101\nstatus: posted\ntask_type: Framing (Wood)\ndescription: DescriptionDescriptionvvvDescription\nphone: "(111) 111-1111"\ndate_limit: 2019-10-26 00:00:00.000000000 Z\ncreated_at: 2019-10-01 07:31:49.350283000 Z\nupdated_at: 2019-10-01 07:31:49.350283000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-01 07:31:47.586682000 Z\nsuggestions_counter: 1\nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: C_Logo-01.jpg\nphoto1_content_type: image/jpeg\nphoto1_file_size: 673980\nphoto1_updated_at: 2019-10-01 07:31:47.916967000 Z\nphoto2_file_name: cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto2_content_type: image/jpeg\nphoto2_file_size: 39477\nphoto2_updated_at: 2019-10-01 07:31:48.695499000 Z\nphoto3_file_name: gipsokarton.png\nphoto3_content_type: image/png\nphoto3_file_size: 41077\nphoto3_updated_at: 2019-10-01 07:31:48.778663000 Z\nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 34\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-10-01 07:31:49.397512	---\nsuggestion_id:\n- \n- 447\n
80	Task	592	update	8	---\nid: 592\nowner_id: 110\nconcierge_id: 112\ntitle: task01101\nstatus: posted\ntask_type: Framing (Wood)\ndescription: DescriptionDescriptionvvvDescription\nphone: "(111) 111-1111"\ndate_limit: 2019-10-26 00:00:00.000000000 Z\ncreated_at: 2019-10-01 07:31:49.350283303 Z\nupdated_at: 2019-10-01 07:31:49.379450804 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-01 07:31:47.586682950 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: C_Logo-01.jpg\nphoto1_content_type: image/jpeg\nphoto1_file_size: 673980\nphoto1_updated_at: 2019-10-01 07:31:47.916967353 Z\nphoto2_file_name: cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto2_content_type: image/jpeg\nphoto2_file_size: 39477\nphoto2_updated_at: 2019-10-01 07:31:48.695499862 Z\nphoto3_file_name: gipsokarton.png\nphoto3_content_type: image/png\nphoto3_file_size: 41077\nphoto3_updated_at: 2019-10-01 07:31:48.778663814 Z\nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 34\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-10-01 07:31:49.37945	\N
117	Invoice	33	create	\N	\N	2019-10-02 20:12:48.827319	---\nid:\n- \n- 33\npayable_type:\n- \n- Task\npayable_id:\n- \n- 508\nstate:\n- \n- not_paid\n
118	Invoice	34	create	\N	\N	2019-10-02 20:12:48.831002	---\nid:\n- \n- 34\npayable_type:\n- \n- Task\npayable_id:\n- \n- 509\nstate:\n- \n- not_paid\n
119	Invoice	35	create	\N	\N	2019-10-02 20:12:48.834662	---\nid:\n- \n- 35\npayable_type:\n- \n- Task\npayable_id:\n- \n- 511\nstate:\n- \n- not_paid\n
120	Invoice	36	create	\N	\N	2019-10-02 20:12:48.838307	---\nid:\n- \n- 36\npayable_type:\n- \n- Task\npayable_id:\n- \n- 512\nstate:\n- \n- not_paid\n
121	Invoice	37	create	\N	\N	2019-10-02 20:12:48.841986	---\nid:\n- \n- 37\npayable_type:\n- \n- Task\npayable_id:\n- \n- 513\nstate:\n- \n- not_paid\n
122	Invoice	38	create	\N	\N	2019-10-02 20:12:48.845657	---\nid:\n- \n- 38\npayable_type:\n- \n- Task\npayable_id:\n- \n- 514\nstate:\n- \n- not_paid\n
123	Invoice	39	create	\N	\N	2019-10-02 20:12:48.84959	---\nid:\n- \n- 39\npayable_type:\n- \n- Task\npayable_id:\n- \n- 521\nstate:\n- \n- not_paid\n
124	Invoice	40	create	\N	\N	2019-10-02 20:12:48.853341	---\nid:\n- \n- 40\npayable_type:\n- \n- Task\npayable_id:\n- \n- 524\nstate:\n- \n- not_paid\n
81	Task	592	update	112	---\nid: 592\nowner_id: 110\nconcierge_id: 112\ntitle: task01101\nstatus: posted\ntask_type: Framing (Wood)\ndescription: DescriptionDescriptionvvvDescription\nphone: "(111) 111-1111"\ndate_limit: 2019-10-26 00:00:00.000000000 Z\ncreated_at: 2019-10-01 07:31:49.350283000 Z\nupdated_at: 2019-10-01 07:31:49.379450000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-01 07:31:47.586682000 Z\nsuggestions_counter: 1\nsuggestion_id: 447\nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: C_Logo-01.jpg\nphoto1_content_type: image/jpeg\nphoto1_file_size: 673980\nphoto1_updated_at: 2019-10-01 07:31:47.916967000 Z\nphoto2_file_name: cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto2_content_type: image/jpeg\nphoto2_file_size: 39477\nphoto2_updated_at: 2019-10-01 07:31:48.695499000 Z\nphoto3_file_name: gipsokarton.png\nphoto3_content_type: image/png\nphoto3_file_size: 41077\nphoto3_updated_at: 2019-10-01 07:31:48.778663000 Z\nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 34\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: not_payed\n	2019-10-01 07:35:25.618425	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-01 07:35:25.614563951 Z\nfact_start:\n- \n- 2019-10-01\n
82	Task	592	update	112	---\nid: 592\nowner_id: 110\nconcierge_id: 112\ntitle: task01101\nstatus: confirmed\ntask_type: Framing (Wood)\ndescription: DescriptionDescriptionvvvDescription\nphone: "(111) 111-1111"\ndate_limit: 2019-10-26 00:00:00.000000000 Z\ncreated_at: 2019-10-01 07:31:49.350283000 Z\nupdated_at: 2019-10-01 07:35:25.618425000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-01 07:31:47.586682000 Z\nsuggestions_counter: 1\nsuggestion_id: 447\nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: 2019-10-01 07:35:25.614563000 Z\nphoto1_file_name: C_Logo-01.jpg\nphoto1_content_type: image/jpeg\nphoto1_file_size: 673980\nphoto1_updated_at: 2019-10-01 07:31:47.916967000 Z\nphoto2_file_name: cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto2_content_type: image/jpeg\nphoto2_file_size: 39477\nphoto2_updated_at: 2019-10-01 07:31:48.695499000 Z\nphoto3_file_name: gipsokarton.png\nphoto3_content_type: image/png\nphoto3_file_size: 41077\nphoto3_updated_at: 2019-10-01 07:31:48.778663000 Z\nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 34\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-10-01 07:35:29.915456	---\nconfirmed_at:\n- 2019-10-01 07:35:25.614563000 Z\n- 2019-10-01 07:35:29.906707722 Z\n
83	Task	592	update	112	---\nid: 592\nowner_id: 110\nconcierge_id: 112\ntitle: task01101\nstatus: confirmed\ntask_type: Framing (Wood)\ndescription: DescriptionDescriptionvvvDescription\nphone: "(111) 111-1111"\ndate_limit: 2019-10-26 00:00:00.000000000 Z\ncreated_at: 2019-10-01 07:31:49.350283000 Z\nupdated_at: 2019-10-01 07:35:29.915456000 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-01 07:31:47.586682000 Z\nsuggestions_counter: 1\nsuggestion_id: 447\nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: 2019-10-01 07:35:29.906707000 Z\nphoto1_file_name: C_Logo-01.jpg\nphoto1_content_type: image/jpeg\nphoto1_file_size: 673980\nphoto1_updated_at: 2019-10-01 07:31:47.916967000 Z\nphoto2_file_name: cat_88874816d55d1319965e73f1fdaaa243.jpg\nphoto2_content_type: image/jpeg\nphoto2_file_size: 39477\nphoto2_updated_at: 2019-10-01 07:31:48.695499000 Z\nphoto3_file_name: gipsokarton.png\nphoto3_content_type: image/png\nphoto3_file_size: 41077\nphoto3_updated_at: 2019-10-01 07:31:48.778663000 Z\nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 34\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: not_payed\n	2019-10-01 07:35:32.763685	---\nconfirmed_at:\n- 2019-10-01 07:35:29.906707000 Z\n- 2019-10-01 07:35:32.758561806 Z\n
84	Task	587	update	8	---\nid: 587\nowner_id: 113\nconcierge_id: 112\ntitle: Invoice test name\nstatus: done_confirmed\ntask_type: NEW TEST\ndescription: Invoice test name\nphone: "(324) 324-4234"\ndate_limit: 2019-09-28 00:00:00.000000000 Z\ncreated_at: 2019-09-25 20:06:47.976246000 Z\nupdated_at: 2019-09-25 20:08:22.329516000 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 442\nbudget: !ruby/object:BigDecimal 18:0.25e4\ncompleted_at: 2019-09-25 20:08:22.326812000 Z\nconfirmed_at: 2019-09-25 20:07:25.774620000 Z\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 22\ntender: false\napartment: ''\ndate_start: 2019-09-28\nfact_start: 2019-09-25\nfact_end: 2019-09-25\ncity: ''\npay_state: not_payed\n	2019-10-01 17:32:04.901517	---\npay_state:\n- not_payed\n- payed\n
85	Invoice	1	create	\N	\N	2019-10-02 20:12:48.68773	---\nid:\n- \n- 1\npayable_type:\n- \n- Task\npayable_id:\n- \n- 336\nstate:\n- \n- not_paid\n
86	Invoice	2	create	\N	\N	2019-10-02 20:12:48.707237	---\nid:\n- \n- 2\npayable_type:\n- \n- Task\npayable_id:\n- \n- 345\nstate:\n- \n- not_paid\n
87	Invoice	3	create	\N	\N	2019-10-02 20:12:48.711564	---\nid:\n- \n- 3\npayable_type:\n- \n- Task\npayable_id:\n- \n- 360\nstate:\n- \n- not_paid\n
88	Invoice	4	create	\N	\N	2019-10-02 20:12:48.715301	---\nid:\n- \n- 4\npayable_type:\n- \n- Task\npayable_id:\n- \n- 362\nstate:\n- \n- not_paid\n
89	Invoice	5	create	\N	\N	2019-10-02 20:12:48.719028	---\nid:\n- \n- 5\npayable_type:\n- \n- Task\npayable_id:\n- \n- 392\nstate:\n- \n- not_paid\n
90	Invoice	6	create	\N	\N	2019-10-02 20:12:48.72278	---\nid:\n- \n- 6\npayable_type:\n- \n- Task\npayable_id:\n- \n- 394\nstate:\n- \n- not_paid\n
91	Invoice	7	create	\N	\N	2019-10-02 20:12:48.72633	---\nid:\n- \n- 7\npayable_type:\n- \n- Task\npayable_id:\n- \n- 395\nstate:\n- \n- not_paid\n
92	Invoice	8	create	\N	\N	2019-10-02 20:12:48.730174	---\nid:\n- \n- 8\npayable_type:\n- \n- Task\npayable_id:\n- \n- 396\nstate:\n- \n- not_paid\n
93	Invoice	9	create	\N	\N	2019-10-02 20:12:48.733794	---\nid:\n- \n- 9\npayable_type:\n- \n- Task\npayable_id:\n- \n- 397\nstate:\n- \n- not_paid\n
94	Invoice	10	create	\N	\N	2019-10-02 20:12:48.737351	---\nid:\n- \n- 10\npayable_type:\n- \n- Task\npayable_id:\n- \n- 405\nstate:\n- \n- not_paid\n
127	Invoice	43	create	\N	\N	2019-10-02 20:12:48.864772	---\nid:\n- \n- 43\npayable_type:\n- \n- Task\npayable_id:\n- \n- 532\nstate:\n- \n- not_paid\n
128	Invoice	44	create	\N	\N	2019-10-02 20:12:48.868968	---\nid:\n- \n- 44\npayable_type:\n- \n- Task\npayable_id:\n- \n- 533\nstate:\n- \n- not_paid\n
129	Invoice	45	create	\N	\N	2019-10-02 20:12:48.872731	---\nid:\n- \n- 45\npayable_type:\n- \n- Task\npayable_id:\n- \n- 534\nstate:\n- \n- not_paid\n
130	Invoice	46	create	\N	\N	2019-10-02 20:12:48.876507	---\nid:\n- \n- 46\npayable_type:\n- \n- Task\npayable_id:\n- \n- 535\nstate:\n- \n- not_paid\n
131	Invoice	47	create	\N	\N	2019-10-02 20:12:48.880244	---\nid:\n- \n- 47\npayable_type:\n- \n- Task\npayable_id:\n- \n- 536\nstate:\n- \n- not_paid\n
132	Invoice	48	create	\N	\N	2019-10-02 20:12:48.883934	---\nid:\n- \n- 48\npayable_type:\n- \n- Task\npayable_id:\n- \n- 538\nstate:\n- \n- not_paid\n
133	Invoice	49	create	\N	\N	2019-10-02 20:12:48.888105	---\nid:\n- \n- 49\npayable_type:\n- \n- Task\npayable_id:\n- \n- 539\nstate:\n- \n- not_paid\n
134	Invoice	50	create	\N	\N	2019-10-02 20:12:48.891893	---\nid:\n- \n- 50\npayable_type:\n- \n- Task\npayable_id:\n- \n- 540\nstate:\n- \n- not_paid\n
135	Invoice	51	create	\N	\N	2019-10-02 20:12:48.895551	---\nid:\n- \n- 51\npayable_type:\n- \n- Task\npayable_id:\n- \n- 542\nstate:\n- \n- not_paid\n
136	Invoice	52	create	\N	\N	2019-10-02 20:12:48.89926	---\nid:\n- \n- 52\npayable_type:\n- \n- Task\npayable_id:\n- \n- 543\nstate:\n- \n- not_paid\n
137	Invoice	53	create	\N	\N	2019-10-02 20:12:48.902902	---\nid:\n- \n- 53\npayable_type:\n- \n- Task\npayable_id:\n- \n- 544\nstate:\n- \n- not_paid\n
138	Invoice	54	create	\N	\N	2019-10-02 20:12:48.907338	---\nid:\n- \n- 54\npayable_type:\n- \n- Task\npayable_id:\n- \n- 545\nstate:\n- \n- not_paid\n
139	Invoice	55	create	\N	\N	2019-10-02 20:12:48.911055	---\nid:\n- \n- 55\npayable_type:\n- \n- Task\npayable_id:\n- \n- 546\nstate:\n- \n- not_paid\n
140	Invoice	56	create	\N	\N	2019-10-02 20:12:48.914898	---\nid:\n- \n- 56\npayable_type:\n- \n- Task\npayable_id:\n- \n- 547\nstate:\n- \n- not_paid\n
141	Invoice	57	create	\N	\N	2019-10-02 20:12:48.918638	---\nid:\n- \n- 57\npayable_type:\n- \n- Task\npayable_id:\n- \n- 548\nstate:\n- \n- not_paid\n
142	Invoice	58	create	\N	\N	2019-10-02 20:12:48.922852	---\nid:\n- \n- 58\npayable_type:\n- \n- Task\npayable_id:\n- \n- 549\nstate:\n- \n- not_paid\n
143	Invoice	59	create	\N	\N	2019-10-02 20:12:48.926645	---\nid:\n- \n- 59\npayable_type:\n- \n- Task\npayable_id:\n- \n- 550\nstate:\n- \n- not_paid\n
144	Invoice	60	create	\N	\N	2019-10-02 20:12:48.930422	---\nid:\n- \n- 60\npayable_type:\n- \n- Task\npayable_id:\n- \n- 551\nstate:\n- \n- not_paid\n
145	Invoice	61	create	\N	\N	2019-10-02 20:12:48.934157	---\nid:\n- \n- 61\npayable_type:\n- \n- Task\npayable_id:\n- \n- 552\nstate:\n- \n- not_paid\n
146	Invoice	62	create	\N	\N	2019-10-02 20:12:48.937818	---\nid:\n- \n- 62\npayable_type:\n- \n- Task\npayable_id:\n- \n- 553\nstate:\n- \n- not_paid\n
147	Invoice	63	create	\N	\N	2019-10-02 20:12:48.941562	---\nid:\n- \n- 63\npayable_type:\n- \n- Task\npayable_id:\n- \n- 554\nstate:\n- \n- not_paid\n
148	Invoice	64	create	\N	\N	2019-10-02 20:12:48.945299	---\nid:\n- \n- 64\npayable_type:\n- \n- Task\npayable_id:\n- \n- 555\nstate:\n- \n- not_paid\n
149	Invoice	65	create	\N	\N	2019-10-02 20:12:48.948922	---\nid:\n- \n- 65\npayable_type:\n- \n- Task\npayable_id:\n- \n- 556\nstate:\n- \n- not_paid\n
150	Invoice	66	create	\N	\N	2019-10-02 20:12:48.952553	---\nid:\n- \n- 66\npayable_type:\n- \n- Task\npayable_id:\n- \n- 557\nstate:\n- \n- not_paid\n
151	Invoice	67	create	\N	\N	2019-10-02 20:12:48.956262	---\nid:\n- \n- 67\npayable_type:\n- \n- Task\npayable_id:\n- \n- 558\nstate:\n- \n- not_paid\n
152	Invoice	68	create	\N	\N	2019-10-02 20:12:48.96003	---\nid:\n- \n- 68\npayable_type:\n- \n- Task\npayable_id:\n- \n- 559\nstate:\n- \n- not_paid\n
153	Invoice	69	create	\N	\N	2019-10-02 20:12:48.963801	---\nid:\n- \n- 69\npayable_type:\n- \n- Task\npayable_id:\n- \n- 560\nstate:\n- \n- not_paid\n
154	Invoice	70	create	\N	\N	2019-10-02 20:12:48.96758	---\nid:\n- \n- 70\npayable_type:\n- \n- Task\npayable_id:\n- \n- 561\nstate:\n- \n- not_paid\n
155	Invoice	71	create	\N	\N	2019-10-02 20:12:48.971151	---\nid:\n- \n- 71\npayable_type:\n- \n- Task\npayable_id:\n- \n- 562\nstate:\n- \n- not_paid\n
156	Invoice	72	create	\N	\N	2019-10-02 20:12:48.974742	---\nid:\n- \n- 72\npayable_type:\n- \n- Task\npayable_id:\n- \n- 563\nstate:\n- \n- not_paid\n
157	Invoice	73	create	\N	\N	2019-10-02 20:12:48.978511	---\nid:\n- \n- 73\npayable_type:\n- \n- Task\npayable_id:\n- \n- 564\nstate:\n- \n- not_paid\n
158	Invoice	74	create	\N	\N	2019-10-02 20:12:48.982159	---\nid:\n- \n- 74\npayable_type:\n- \n- Task\npayable_id:\n- \n- 565\nstate:\n- \n- not_paid\n
159	Invoice	75	create	\N	\N	2019-10-02 20:12:48.985823	---\nid:\n- \n- 75\npayable_type:\n- \n- Task\npayable_id:\n- \n- 566\nstate:\n- \n- not_paid\n
160	Invoice	76	create	\N	\N	2019-10-02 20:12:48.989494	---\nid:\n- \n- 76\npayable_type:\n- \n- Task\npayable_id:\n- \n- 567\nstate:\n- \n- not_paid\n
161	Invoice	77	create	\N	\N	2019-10-02 20:12:48.993158	---\nid:\n- \n- 77\npayable_type:\n- \n- Task\npayable_id:\n- \n- 568\nstate:\n- \n- not_paid\n
162	Invoice	78	create	\N	\N	2019-10-02 20:12:48.996804	---\nid:\n- \n- 78\npayable_type:\n- \n- Task\npayable_id:\n- \n- 569\nstate:\n- \n- not_paid\n
163	Invoice	79	create	\N	\N	2019-10-02 20:12:49.000399	---\nid:\n- \n- 79\npayable_type:\n- \n- Task\npayable_id:\n- \n- 570\nstate:\n- \n- not_paid\n
164	Invoice	80	create	\N	\N	2019-10-02 20:12:49.004064	---\nid:\n- \n- 80\npayable_type:\n- \n- Task\npayable_id:\n- \n- 571\nstate:\n- \n- not_paid\n
165	Invoice	81	create	\N	\N	2019-10-02 20:12:49.007818	---\nid:\n- \n- 81\npayable_type:\n- \n- Task\npayable_id:\n- \n- 572\nstate:\n- \n- not_paid\n
166	Invoice	82	create	\N	\N	2019-10-02 20:12:49.011608	---\nid:\n- \n- 82\npayable_type:\n- \n- Task\npayable_id:\n- \n- 573\nstate:\n- \n- not_paid\n
167	Invoice	83	create	\N	\N	2019-10-02 20:12:49.015456	---\nid:\n- \n- 83\npayable_type:\n- \n- Task\npayable_id:\n- \n- 574\nstate:\n- \n- not_paid\n
168	Invoice	84	create	\N	\N	2019-10-02 20:12:49.019266	---\nid:\n- \n- 84\npayable_type:\n- \n- Task\npayable_id:\n- \n- 575\nstate:\n- \n- not_paid\n
169	Invoice	85	create	\N	\N	2019-10-02 20:12:49.023829	---\nid:\n- \n- 85\npayable_type:\n- \n- Task\npayable_id:\n- \n- 576\nstate:\n- \n- not_paid\n
170	Invoice	86	create	\N	\N	2019-10-02 20:12:49.027787	---\nid:\n- \n- 86\npayable_type:\n- \n- Task\npayable_id:\n- \n- 577\nstate:\n- \n- not_paid\n
171	Invoice	87	create	\N	\N	2019-10-02 20:12:49.031631	---\nid:\n- \n- 87\npayable_type:\n- \n- Task\npayable_id:\n- \n- 578\nstate:\n- \n- not_paid\n
172	Invoice	88	create	\N	\N	2019-10-02 20:12:49.03553	---\nid:\n- \n- 88\npayable_type:\n- \n- Task\npayable_id:\n- \n- 579\nstate:\n- \n- not_paid\n
173	Invoice	89	create	\N	\N	2019-10-02 20:12:49.039386	---\nid:\n- \n- 89\npayable_type:\n- \n- Task\npayable_id:\n- \n- 580\nstate:\n- \n- not_paid\n
174	Invoice	90	create	\N	\N	2019-10-02 20:12:49.043273	---\nid:\n- \n- 90\npayable_type:\n- \n- Task\npayable_id:\n- \n- 581\nstate:\n- \n- not_paid\n
175	Invoice	91	create	\N	\N	2019-10-02 20:12:49.047061	---\nid:\n- \n- 91\npayable_type:\n- \n- Task\npayable_id:\n- \n- 582\nstate:\n- \n- not_paid\n
176	Invoice	92	create	\N	\N	2019-10-02 20:12:49.056673	---\nid:\n- \n- 92\npayable_type:\n- \n- Task\npayable_id:\n- \n- 583\nstate:\n- \n- not_paid\n
177	Invoice	93	create	\N	\N	2019-10-02 20:12:49.061607	---\nid:\n- \n- 93\npayable_type:\n- \n- Task\npayable_id:\n- \n- 584\nstate:\n- \n- not_paid\n
178	Invoice	94	create	\N	\N	2019-10-02 20:12:49.065581	---\nid:\n- \n- 94\npayable_type:\n- \n- Task\npayable_id:\n- \n- 585\nstate:\n- \n- not_paid\n
179	Invoice	95	create	\N	\N	2019-10-02 20:12:49.069446	---\nid:\n- \n- 95\npayable_type:\n- \n- Task\npayable_id:\n- \n- 586\nstate:\n- \n- not_paid\n
180	Invoice	96	create	\N	\N	2019-10-02 20:12:49.073361	---\nid:\n- \n- 96\npayable_type:\n- \n- Task\npayable_id:\n- \n- 587\nstate:\n- \n- not_paid\n
181	Invoice	97	create	\N	\N	2019-10-02 20:12:49.077282	---\nid:\n- \n- 97\npayable_type:\n- \n- Task\npayable_id:\n- \n- 588\nstate:\n- \n- not_paid\n
182	Invoice	98	create	\N	\N	2019-10-02 20:12:49.081031	---\nid:\n- \n- 98\npayable_type:\n- \n- Task\npayable_id:\n- \n- 589\nstate:\n- \n- not_paid\n
183	Invoice	99	create	\N	\N	2019-10-02 20:12:49.084882	---\nid:\n- \n- 99\npayable_type:\n- \n- Task\npayable_id:\n- \n- 590\nstate:\n- \n- not_paid\n
184	Invoice	100	create	\N	\N	2019-10-02 20:12:49.089081	---\nid:\n- \n- 100\npayable_type:\n- \n- Task\npayable_id:\n- \n- 591\nstate:\n- \n- not_paid\n
185	Invoice	101	create	\N	\N	2019-10-02 20:12:49.092993	---\nid:\n- \n- 101\npayable_type:\n- \n- Task\npayable_id:\n- \n- 592\nstate:\n- \n- not_paid\n
186	Invoice	100	update	8	---\npayable_id: 591\npayable_type: Task\nid: 100\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.089081000 Z\nupdated_at: 2019-10-02 20:12:49.089081000 Z\n	2019-10-02 20:21:15.678745	---\nstate:\n- not_paid\n- paid\n
187	Invoice	99	update	8	---\npayable_id: 590\npayable_type: Task\nid: 99\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.084882000 Z\nupdated_at: 2019-10-02 20:12:49.084882000 Z\n	2019-10-02 20:21:37.733752	---\nstate:\n- not_paid\n- paid\n
188	Invoice	99	update	8	---\npayable_id: 590\npayable_type: Task\nid: 99\nstate: paid\ncreated_at: 2019-10-02 20:12:49.084882000 Z\nupdated_at: 2019-10-02 20:21:37.733752000 Z\n	2019-10-03 08:40:14.627203	---\nstate:\n- paid\n- not_paid\n
189	Invoice	100	update	8	---\npayable_id: 591\npayable_type: Task\nid: 100\nstate: paid\ncreated_at: 2019-10-02 20:12:49.089081000 Z\nupdated_at: 2019-10-02 20:21:15.678745000 Z\n	2019-10-03 08:42:38.742886	---\nstate:\n- paid\n- not_paid\n
190	Invoice	99	update	8	---\npayable_id: 590\npayable_type: Task\nid: 99\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.084882000 Z\nupdated_at: 2019-10-03 08:40:14.627203000 Z\n	2019-10-03 08:43:18.595497	---\nstate:\n- not_paid\n- paid\n
191	Invoice	100	update	8	---\npayable_id: 591\npayable_type: Task\nid: 100\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.089081000 Z\nupdated_at: 2019-10-03 08:42:38.742886000 Z\n	2019-10-03 08:43:22.115836	---\nstate:\n- not_paid\n- paid\n
192	Invoice	96	update	8	---\npayable_id: 587\npayable_type: Task\nid: 96\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.073361000 Z\nupdated_at: 2019-10-02 20:12:49.073361000 Z\n	2019-10-03 08:43:26.841443	---\nstate:\n- not_paid\n- paid\n
193	Invoice	96	update	8	---\npayable_id: 587\npayable_type: Task\nid: 96\nstate: paid\ncreated_at: 2019-10-02 20:12:49.073361000 Z\nupdated_at: 2019-10-03 08:43:26.841443000 Z\n	2019-10-03 08:43:32.451363	---\nstate:\n- paid\n- not_paid\n
194	Invoice	97	update	8	---\npayable_id: 588\npayable_type: Task\nid: 97\nstate: not_paid\ncreated_at: 2019-10-02 20:12:49.077282000 Z\nupdated_at: 2019-10-02 20:12:49.077282000 Z\n	2019-10-03 11:27:22.326621	---\nstate:\n- not_paid\n- paid\n
195	Invoice	99	update	8	---\npayable_id: 590\npayable_type: Task\nid: 99\nstate: paid\ncreated_at: 2019-10-02 20:12:49.084882000 Z\nupdated_at: 2019-10-03 08:43:18.595497000 Z\n	2019-10-03 11:27:47.048146	---\nstate:\n- paid\n- not_paid\n
196	Task	593	create	8	\N	2019-10-04 08:03:16.501323	---\nid:\n- \n- 593\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task0410\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123636e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-04\ncity:\n- \n- ''\n
197	Task	593	update	8	---\nsuggestions_counter: 1\nid: 593\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task0410\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:03:16.501323000 Z\nupdated_at: 2019-10-04 08:03:16.501323000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-04\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:03:16.528025	---\nsuggestion_id:\n- \n- 448\n
198	Invoice	102	create	8	\N	2019-10-04 08:03:16.543586	---\nid:\n- \n- 102\npayable_type:\n- \n- Task\npayable_id:\n- \n- 593\nstate:\n- \n- not_paid\n
199	Task	593	update	112	---\nbudget: !ruby/object:BigDecimal 27:0.123636e4\ntender: false\nid: 593\nconcierge_id: 112\nstatus: posted\nsuggestion_id: 448\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task0410\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:03:16.501323000 Z\nupdated_at: 2019-10-04 08:03:16.528025000 Z\nphoto_updated_at: \nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-04\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:03:48.916876	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-04 08:03:48.914948258 Z\nfact_start:\n- \n- 2019-10-04\n
219	Task	597	update	8	---\nid: 597\nowner_id: 110\nconcierge_id: 112\ntitle: task04104\nstatus: posted\ntask_type: Framing (Wood)\ndescription: test admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:55:32.882538803 Z\nupdated_at: 2019-10-04 11:55:32.895297984 Z\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto_updated_at: \nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.245236e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 11:55:32.895297	\N
200	Task	593	update	112	---\nbudget: !ruby/object:BigDecimal 27:0.123636e4\ntender: false\nid: 593\nconcierge_id: 112\nstatus: confirmed\nsuggestion_id: 448\nconfirmed_at: 2019-10-04 08:03:48.914948000 Z\nfact_start: 2019-10-04\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task0410\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:03:16.501323000 Z\nupdated_at: 2019-10-04 08:03:48.916876000 Z\nphoto_updated_at: \nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-04\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:03:53.063944	---\nconfirmed_at:\n- 2019-10-04 08:03:48.914948000 Z\n- 2019-10-04 08:03:53.061039009 Z\n
201	Task	593	update	8	---\nconcierge_id: 112\nsuggestion_id: 448\nid: 593\ntitle: task0410\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:03:16.501323000 Z\nupdated_at: 2019-10-04 08:03:53.063944000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.123636e4\nconfirmed_at: 2019-10-04 08:03:53.061039000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-04\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 08:04:04.461801	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 08:04:04.457039809 Z\nfact_end:\n- \n- 2019-10-04\n
202	Task	594	create	8	\N	2019-10-04 08:06:31.186259	---\nid:\n- \n- 594\nowner_id:\n- \n- 110\ntitle:\n- \n- tender04102\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- tesr\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-17 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.145236e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- true\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
203	Invoice	103	create	8	\N	2019-10-04 08:06:31.20118	---\nid:\n- \n- 103\npayable_type:\n- \n- Task\npayable_id:\n- \n- 594\nstate:\n- \n- not_paid\n
204	Task	594	update	110	---\nbudget: !ruby/object:BigDecimal 27:0.145236e4\ntender: true\nid: 594\nconcierge_id: \nowner_id: 110\nstatus: posted\nsuggestion_id: \nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: tender04102\ntask_type: Framing (Wood)\ndescription: tesr\nphone: "(111) 111-1111"\ndate_limit: 2019-10-17 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:06:31.186259000 Z\nupdated_at: 2019-10-04 08:06:31.186259000 Z\nphoto_updated_at: \nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:07:30.228021	---\nbudget:\n- !ruby/object:BigDecimal 27:0.145236e4\n- !ruby/object:BigDecimal 27:0.258996e4\nconcierge_id:\n- \n- 112\nstatus:\n- posted\n- confirmed\nsuggestion_id:\n- \n- 449\nconfirmed_at:\n- \n- 2019-10-04 08:07:30.224185332 Z\nfact_start:\n- \n- 2019-10-04\n
205	Task	595	create	110	\N	2019-10-04 08:11:37.517381	---\nid:\n- \n- 595\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task04103\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- app\nphone:\n- \n- '1478.58'\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.255196e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-04\ncity:\n- \n- ''\n
206	Task	595	update	110	---\nsuggestions_counter: 1\nid: 595\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04103\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: app\nphone: '1478.58'\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:11:37.517381000 Z\nupdated_at: 2019-10-04 08:11:37.517381000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.255196e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-04\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:11:37.52691	---\nsuggestion_id:\n- \n- 450\n
207	Invoice	104	create	110	\N	2019-10-04 08:11:37.534104	---\nid:\n- \n- 104\npayable_type:\n- \n- Task\npayable_id:\n- \n- 595\nstate:\n- \n- not_paid\n
208	Task	595	update	8	---\nstatus: posted\nid: 595\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04103\nconcierge_id: 112\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: app\nphone: '1478.58'\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:11:37.517381000 Z\nupdated_at: 2019-10-04 08:11:37.526910000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 450\nbudget: !ruby/object:BigDecimal 27:0.255196e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-04\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 08:12:47.555162	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-04 08:12:47.550939453 Z\nfact_start:\n- \n- 2019-10-04\n
209	Task	595	update	8	---\nconcierge_id: 112\nsuggestion_id: 450\nid: 595\ntitle: task04103\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: app\nphone: '1478.58'\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:11:37.517381000 Z\nupdated_at: 2019-10-04 08:12:47.555162000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.255196e4\nconfirmed_at: 2019-10-04 08:12:47.550939000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-04\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 08:13:18.961557	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 08:13:18.959681002 Z\nfact_end:\n- \n- 2019-10-04\n
210	Task	594	update	110	---\nconcierge_id: 112\nsuggestion_id: 449\nid: 594\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: tender04102\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: tesr\nphone: "(111) 111-1111"\ndate_limit: 2019-10-17 00:00:00.000000000 Z\ncreated_at: 2019-10-04 08:06:31.186259000 Z\nupdated_at: 2019-10-04 08:07:30.228021000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.258996e4\nconfirmed_at: 2019-10-04 08:07:30.224185000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: true\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 08:13:46.034326	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 08:13:46.031116069 Z\nfact_end:\n- \n- 2019-10-04\n
211	Invoice	103	update	8	---\npayable_id: 594\npayable_type: Task\nid: 103\nstate: not_paid\ncreated_at: 2019-10-04 08:06:31.201180000 Z\nupdated_at: 2019-10-04 08:06:31.201180000 Z\n	2019-10-04 08:22:07.243743	---\nstate:\n- not_paid\n- paid\n
212	Invoice	104	update	8	---\npayable_id: 595\npayable_type: Task\nid: 104\nstate: not_paid\ncreated_at: 2019-10-04 08:11:37.534104000 Z\nupdated_at: 2019-10-04 08:11:37.534104000 Z\n	2019-10-04 08:22:28.666146	---\nstate:\n- not_paid\n- paid\n
213	Invoice	104	update	8	---\npayable_id: 595\npayable_type: Task\nid: 104\nstate: paid\ncreated_at: 2019-10-04 08:11:37.534104000 Z\nupdated_at: 2019-10-04 08:22:28.666146000 Z\n	2019-10-04 08:26:54.699848	---\nstate:\n- paid\n- not_paid\n
214	Task	596	create	8	\N	2019-10-04 09:08:37.591628	---\nid:\n- \n- 596\nowner_id:\n- \n- 113\nconcierge_id:\n- \n- 112\ntitle:\n- \n- Test Invoice PDF\nstatus:\n- \n- posted\ntask_type:\n- \n- NEW TEST\ndescription:\n- \n- ''\nphone:\n- \n- ''\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 18:0.5e3\nproject_task_id:\n- \n- 22\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
215	Task	596	update	8	---\nsuggestions_counter: 1\nid: 596\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: Test Invoice PDF\nconcierge_id: 112\nstatus: posted\nowner_id: 113\ntask_type: NEW TEST\ndescription: ''\nphone: ''\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 09:08:37.591628000 Z\nupdated_at: 2019-10-04 09:08:37.591628000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 18:0.5e3\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 22\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 09:08:37.610884	---\nsuggestion_id:\n- \n- 451\n
216	Invoice	105	create	8	\N	2019-10-04 09:08:37.623191	---\nid:\n- \n- 105\npayable_type:\n- \n- Task\npayable_id:\n- \n- 596\nstate:\n- \n- not_paid\n
217	Task	597	create	8	\N	2019-10-04 11:55:32.882538	---\nid:\n- \n- 597\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task04104\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- test admin\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.245236e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
218	Task	597	update	8	---\nsuggestions_counter: 1\nid: 597\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04104\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:55:32.882538000 Z\nupdated_at: 2019-10-04 11:55:32.882538000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.245236e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 11:55:32.921441	---\nsuggestion_id:\n- \n- 452\n
220	Task	598	create	8	\N	2019-10-04 11:56:52.031319	---\nid:\n- \n- 598\nowner_id:\n- \n- 110\ntitle:\n- \n- ttendre04105\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- admin\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nphoto_file_name:\n- \n- 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.365236e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- true\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
221	Task	598	update	8	---\nid: 598\nowner_id: 110\nconcierge_id: \ntitle: ttendre04105\nstatus: posted\ntask_type: Framing (Wood)\ndescription: admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:56:52.031319026 Z\nupdated_at: 2019-10-04 11:56:52.042504937 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-04 11:56:51.533721280 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.365236e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: true\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 11:56:52.042504	\N
222	Task	597	update	112	---\nbudget: !ruby/object:BigDecimal 27:0.245236e4\ntender: false\nid: 597\nconcierge_id: 112\nstatus: posted\nsuggestion_id: 452\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04104\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:55:32.882538000 Z\nupdated_at: 2019-10-04 11:55:32.895297000 Z\nphoto_updated_at: \nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 11:56:56.109762	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-04 11:56:56.105459571 Z\nfact_start:\n- \n- 2019-10-04\n
223	Task	597	update	112	---\nconcierge_id: 112\nsuggestion_id: 452\nstatus: confirmed\nid: 597\nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04104\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:55:32.882538000 Z\nupdated_at: 2019-10-04 11:56:56.109762000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.245236e4\ncompleted_at: \nconfirmed_at: 2019-10-04 11:56:56.105459000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 12:00:59.527405	---\nstatus:\n- confirmed\n- done\nfact_end:\n- \n- 2019-10-04\n
224	Task	597	update	8	---\nconcierge_id: 112\nsuggestion_id: 452\nid: 597\ntitle: task04104\nowner_id: 110\nstatus: done\ncompleted_at: \nfact_end: 2019-10-04\nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: test admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:55:32.882538000 Z\nupdated_at: 2019-10-04 12:00:59.527405000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.245236e4\nconfirmed_at: 2019-10-04 11:56:56.105459000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 12:01:44.924621	---\nstatus:\n- done\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 12:01:44.922731318 Z\n
225	Task	598	update	110	---\nbudget: !ruby/object:BigDecimal 27:0.365236e4\ntender: true\nid: 598\nconcierge_id: \nowner_id: 110\nstatus: posted\nsuggestion_id: \nconfirmed_at: \nfact_start: \nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: ttendre04105\ntask_type: Framing (Wood)\ndescription: admin\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 11:56:52.031319000 Z\nupdated_at: 2019-10-04 11:56:52.042504000 Z\nphoto_updated_at: 2019-10-04 11:56:51.533721000 Z\nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 12:02:25.591898	---\nbudget:\n- !ruby/object:BigDecimal 27:0.365236e4\n- !ruby/object:BigDecimal 27:0.458999e4\nconcierge_id:\n- \n- 112\nstatus:\n- posted\n- confirmed\nsuggestion_id:\n- \n- 453\nconfirmed_at:\n- \n- 2019-10-04 12:02:25.590037816 Z\nfact_start:\n- \n- 2019-10-04\n
226	Task	599	create	8	\N	2019-10-04 13:26:24.089351	---\nid:\n- \n- 599\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task04106\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-30 00:00:00.000000000 Z\nphoto_file_name:\n- \n- 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.156336e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
227	Task	599	update	8	---\nsuggestions_counter: 1\nid: 599\ntender: false\nsuggestion_id: \nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04106\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-30 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:26:24.089351000 Z\nupdated_at: 2019-10-04 13:26:24.089351000 Z\nphoto_updated_at: 2019-10-04 13:26:23.551362000 Z\nbudget: !ruby/object:BigDecimal 27:0.156336e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 13:26:24.189775	---\nsuggestion_id:\n- \n- 454\n
228	Task	599	update	8	---\nid: 599\nowner_id: 110\nconcierge_id: 112\ntitle: task04106\nstatus: posted\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-30 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:26:24.089351546 Z\nupdated_at: 2019-10-04 13:26:24.132023512 Z\nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto_updated_at: 2019-10-04 13:26:23.551362289 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.156336e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 13:26:24.132023	\N
229	Task	600	create	8	\N	2019-10-04 13:28:15.216781	---\nid:\n- \n- 600\nowner_id:\n- \n- 110\ntitle:\n- \n- tender04107\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- test\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nphoto_file_name:\n- \n- Без_названия_(1).jpg\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.365036e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- true\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
230	Task	600	update	8	---\nid: 600\nowner_id: 110\nconcierge_id: \ntitle: tender04107\nstatus: posted\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:28:15.216781715 Z\nupdated_at: 2019-10-04 13:28:15.229629430 Z\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto_updated_at: 2019-10-04 13:28:14.675593915 Z\nsuggestions_counter: \nsuggestion_id: \nbudget: !ruby/object:BigDecimal 27:0.365036e4\ncompleted_at: \nconfirmed_at: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto1_updated_at: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto2_updated_at: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto3_updated_at: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto4_updated_at: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto5_updated_at: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto6_updated_at: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \nphoto7_updated_at: \nproject_task_id: 32\ntender: true\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-04 13:28:15.229629	\N
231	Task	599	update	112	---\nbudget: !ruby/object:BigDecimal 27:0.156336e4\ntender: false\nid: 599\nconcierge_id: 112\nstatus: posted\nsuggestion_id: 454\nconfirmed_at: \nfact_start: \nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task04106\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-30 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:26:24.089351000 Z\nupdated_at: 2019-10-04 13:26:24.132023000 Z\nphoto_updated_at: 2019-10-04 13:26:23.551362000 Z\nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 13:29:07.117433	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-04 13:29:07.115406197 Z\nfact_start:\n- \n- 2019-10-04\n
232	Task	599	update	8	---\nconcierge_id: 112\nsuggestion_id: 454\nid: 599\ntitle: task04106\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: 445696149_w640_h640_truba-asbestotsementnaya-harkov.jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 34810\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-30 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:26:24.089351000 Z\nupdated_at: 2019-10-04 13:29:07.117433000 Z\nphoto_updated_at: 2019-10-04 13:26:23.551362000 Z\nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.156336e4\nconfirmed_at: 2019-10-04 13:29:07.115406000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 13:30:53.450007	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 13:30:53.447642297 Z\nfact_end:\n- \n- 2019-10-04\n
233	Task	600	update	110	---\nbudget: !ruby/object:BigDecimal 27:0.365036e4\ntender: true\nid: 600\nconcierge_id: \nowner_id: 110\nstatus: posted\nsuggestion_id: \nconfirmed_at: \nfact_start: \nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: tender04107\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:28:15.216781000 Z\nupdated_at: 2019-10-04 13:28:15.229629000 Z\nphoto_updated_at: 2019-10-04 13:28:14.675593000 Z\nsuggestions_counter: 1\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-04 13:43:04.309203	---\nbudget:\n- !ruby/object:BigDecimal 27:0.365036e4\n- !ruby/object:BigDecimal 27:0.399999e4\nconcierge_id:\n- \n- 112\nstatus:\n- posted\n- confirmed\nsuggestion_id:\n- \n- 455\nconfirmed_at:\n- \n- 2019-10-04 13:43:04.307192109 Z\nfact_start:\n- \n- 2019-10-04\n
234	Task	600	update	112	---\nconcierge_id: 112\nsuggestion_id: 455\nstatus: confirmed\nid: 600\nfact_end: \nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: tender04107\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:28:15.216781000 Z\nupdated_at: 2019-10-04 13:43:04.309203000 Z\nphoto_updated_at: 2019-10-04 13:28:14.675593000 Z\nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.399999e4\ncompleted_at: \nconfirmed_at: 2019-10-04 13:43:04.307192000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: true\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 13:43:49.295498	---\nstatus:\n- confirmed\n- done\nfact_end:\n- \n- 2019-10-04\n
235	Task	600	update	8	---\nconcierge_id: 112\nsuggestion_id: 455\nid: 600\ntitle: tender04107\nowner_id: 110\nstatus: done\ncompleted_at: \nfact_end: 2019-10-04\nphoto_file_name: Без_названия_(1).jpg\nphoto_content_type: image/jpeg\nphoto_file_size: 7863\nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: test\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-04 13:28:15.216781000 Z\nupdated_at: 2019-10-04 13:43:49.295498000 Z\nphoto_updated_at: 2019-10-04 13:28:14.675593000 Z\nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.399999e4\nconfirmed_at: 2019-10-04 13:43:04.307192000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: true\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-04\ncity: ''\npay_state: \n	2019-10-04 13:44:05.843402	---\nstatus:\n- done\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-04 13:44:05.841627669 Z\n
236	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: not_paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:26:24.235404000 Z\n	2019-10-04 13:46:26.414365	---\nstate:\n- not_paid\n- paid\n
237	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: not_paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:26:24.235404000 Z\n	2019-10-04 13:46:26.414365	---\nstate:\n- not_paid\n- paid\n
238	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:46:26.414365000 Z\n	2019-10-04 13:49:04.293186	---\nstate:\n- paid\n- not_paid\n
239	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:46:26.414365000 Z\n	2019-10-04 13:49:04.293186	---\nstate:\n- paid\n- not_paid\n
240	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: not_paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:49:04.293186000 Z\n	2019-10-04 13:49:08.345291	---\nstate:\n- not_paid\n- paid\n
241	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: not_paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:49:04.293186000 Z\n	2019-10-04 13:49:08.345291	---\nstate:\n- not_paid\n- paid\n
242	Invoice	109	update	8	---\npayable_id: 600\npayable_type: Task\nid: 109\nstate: not_paid\ncreated_at: 2019-10-04 13:28:15.233211000 Z\nupdated_at: 2019-10-04 13:28:15.233211000 Z\n	2019-10-04 13:50:06.550416	---\nstate:\n- not_paid\n- paid\n
243	Invoice	109	update	8	---\npayable_id: 600\npayable_type: Task\nid: 109\nstate: not_paid\ncreated_at: 2019-10-04 13:28:15.233211000 Z\nupdated_at: 2019-10-04 13:28:15.233211000 Z\n	2019-10-04 13:50:06.550416	---\nstate:\n- not_paid\n- paid\n
244	Invoice	109	update	8	---\npayable_id: 600\npayable_type: Task\nid: 109\nstate: paid\ncreated_at: 2019-10-04 13:28:15.233211000 Z\nupdated_at: 2019-10-04 13:50:06.550416000 Z\n	2019-10-04 13:50:22.345557	---\nstate:\n- paid\n- not_paid\n
245	Invoice	109	update	8	---\npayable_id: 600\npayable_type: Task\nid: 109\nstate: paid\ncreated_at: 2019-10-04 13:28:15.233211000 Z\nupdated_at: 2019-10-04 13:50:06.550416000 Z\n	2019-10-04 13:50:22.345557	---\nstate:\n- paid\n- not_paid\n
246	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:49:08.345291000 Z\n	2019-10-05 06:08:21.016214	---\nstate:\n- paid\n- not_paid\n
247	Invoice	108	update	8	---\npayable_id: 599\npayable_type: Task\nid: 108\nstate: paid\ncreated_at: 2019-10-04 13:26:24.235404000 Z\nupdated_at: 2019-10-04 13:49:08.345291000 Z\n	2019-10-05 06:08:21.016214	---\nstate:\n- paid\n- not_paid\n
248	Task	601	create	8	\N	2019-10-06 18:37:13.38215	---\nid:\n- \n- 601\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task0610\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- app\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.123636e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
249	Task	601	update	8	---\nsuggestions_counter: 1\nid: 601\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task0610\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: app\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 18:37:13.382150000 Z\nupdated_at: 2019-10-06 18:37:13.382150000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-06 18:37:13.39766	---\nsuggestion_id:\n- \n- 456\n
250	Task	601	update	8	---\nstatus: posted\nid: 601\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task0610\nconcierge_id: 112\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: app\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 18:37:13.382150000 Z\nupdated_at: 2019-10-06 18:37:13.397660000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 456\nbudget: !ruby/object:BigDecimal 27:0.123636e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-06 18:37:37.410444	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-06 18:37:37.408826305 Z\nfact_start:\n- \n- 2019-10-06\n
251	Task	601	update	8	---\nconcierge_id: 112\nsuggestion_id: 456\nid: 601\ntitle: task0610\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: app\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 18:37:13.382150000 Z\nupdated_at: 2019-10-06 18:37:37.410444000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.123636e4\nconfirmed_at: 2019-10-06 18:37:37.408826000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-06\ncity: ''\npay_state: \n	2019-10-06 18:38:26.964051	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-06 18:38:26.962110249 Z\nfact_end:\n- \n- 2019-10-06\n
252	Invoice	110	update	8	---\npayable_id: 601\npayable_type: Task\nid: 110\nstate: not_paid\ncreated_at: 2019-10-06 18:37:13.405511000 Z\nupdated_at: 2019-10-06 18:37:13.405511000 Z\n	2019-10-06 18:43:02.661743	---\nstate:\n- not_paid\n- paid\n
253	Invoice	110	update	8	---\npayable_id: 601\npayable_type: Task\nid: 110\nstate: not_paid\ncreated_at: 2019-10-06 18:37:13.405511000 Z\nupdated_at: 2019-10-06 18:37:13.405511000 Z\n	2019-10-06 18:43:02.661743	---\nstate:\n- not_paid\n- paid\n
254	Task	602	create	8	\N	2019-10-06 20:35:38.318996	---\nid:\n- \n- 602\nowner_id:\n- \n- 110\nconcierge_id:\n- \n- 112\ntitle:\n- \n- task06102\nstatus:\n- \n- posted\ntask_type:\n- \n- Framing (Wood)\ndescription:\n- \n- ''\nphone:\n- \n- "(111) 111-1111"\ndate_limit:\n- \n- 2019-10-31 00:00:00.000000000 Z\nbudget:\n- \n- !ruby/object:BigDecimal 27:0.145236e4\nproject_task_id:\n- \n- 32\ntender:\n- \n- false\ndate_start:\n- \n- 2019-10-01\ncity:\n- \n- ''\n
255	Task	602	update	8	---\nsuggestions_counter: 1\nid: 602\ntender: false\nsuggestion_id: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task06102\nconcierge_id: 112\nstatus: posted\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: ''\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 20:35:38.318996000 Z\nupdated_at: 2019-10-06 20:35:38.318996000 Z\nphoto_updated_at: \nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nconfirmed_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\napartment: ''\ndate_start: 2019-10-01\nfact_start: \nfact_end: \ncity: ''\npay_state: \n	2019-10-06 20:35:38.349457	---\nsuggestion_id:\n- \n- 457\n
256	Invoice	111	create	8	\N	2019-10-06 20:35:38.363254	---\nid:\n- \n- 111\npayable_type:\n- \n- Task\npayable_id:\n- \n- 602\nstate:\n- \n- not_paid\n
257	Task	602	update	8	---\nstatus: posted\nid: 602\nconfirmed_at: \nfact_start: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntitle: task06102\nconcierge_id: 112\nowner_id: 110\ntask_type: Framing (Wood)\ndescription: ''\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 20:35:38.318996000 Z\nupdated_at: 2019-10-06 20:35:38.349457000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nsuggestion_id: 457\nbudget: !ruby/object:BigDecimal 27:0.145236e4\ncompleted_at: \nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_end: \ncity: ''\npay_state: \n	2019-10-06 20:36:09.826069	---\nstatus:\n- posted\n- confirmed\nconfirmed_at:\n- \n- 2019-10-06 20:36:09.824474577 Z\nfact_start:\n- \n- 2019-10-06\n
258	Task	602	update	8	---\nconcierge_id: 112\nsuggestion_id: 457\nid: 602\ntitle: task06102\nowner_id: 110\nstatus: confirmed\ncompleted_at: \nfact_end: \nphoto_file_name: \nphoto_content_type: \nphoto_file_size: \nphoto1_file_name: \nphoto1_content_type: \nphoto1_file_size: \nphoto2_file_name: \nphoto2_content_type: \nphoto2_file_size: \nphoto3_file_name: \nphoto3_content_type: \nphoto3_file_size: \nphoto4_file_name: \nphoto4_content_type: \nphoto4_file_size: \nphoto5_file_name: \nphoto5_content_type: \nphoto5_file_size: \nphoto6_file_name: \nphoto6_content_type: \nphoto6_file_size: \nphoto7_file_name: \nphoto7_content_type: \nphoto7_file_size: \ntask_type: Framing (Wood)\ndescription: ''\nphone: "(111) 111-1111"\ndate_limit: 2019-10-31 00:00:00.000000000 Z\ncreated_at: 2019-10-06 20:35:38.318996000 Z\nupdated_at: 2019-10-06 20:36:09.826069000 Z\nphoto_updated_at: \nsuggestions_counter: 1\nbudget: !ruby/object:BigDecimal 27:0.145236e4\nconfirmed_at: 2019-10-06 20:36:09.824474000 Z\nphoto1_updated_at: \nphoto2_updated_at: \nphoto3_updated_at: \nphoto4_updated_at: \nphoto5_updated_at: \nphoto6_updated_at: \nphoto7_updated_at: \nproject_task_id: 32\ntender: false\napartment: ''\ndate_start: 2019-10-01\nfact_start: 2019-10-06\ncity: ''\npay_state: \n	2019-10-06 20:36:38.394317	---\nstatus:\n- confirmed\n- done_confirmed\ncompleted_at:\n- \n- 2019-10-06 20:36:38.392372392 Z\nfact_end:\n- \n- 2019-10-06\n
259	Invoice	111	update	8	---\npayable_id: 602\npayable_type: Task\nid: 111\nstate: not_paid\ncreated_at: 2019-10-06 20:35:38.363254000 Z\nupdated_at: 2019-10-06 20:35:38.363254000 Z\n	2019-10-06 20:38:01.956695	---\nstate:\n- not_paid\n- paid\n
260	Invoice	111	update	8	---\npayable_id: 602\npayable_type: Task\nid: 111\nstate: paid\ncreated_at: 2019-10-06 20:35:38.363254000 Z\nupdated_at: 2019-10-06 20:38:01.956695000 Z\n	2019-10-06 20:38:39.946507	---\nstate:\n- paid\n- not_paid\n
261	Invoice	111	update	8	---\npayable_id: 602\npayable_type: Task\nid: 111\nstate: not_paid\ncreated_at: 2019-10-06 20:35:38.363254000 Z\nupdated_at: 2019-10-06 20:38:39.946507000 Z\n	2019-10-06 20:38:46.397027	---\nstate:\n- not_paid\n- paid\n
\.


--
-- Data for Name: work_zone_visit_logs; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.work_zone_visit_logs (id, user_id, work_zone_id, time_from, time_to, created_at, updated_at, date) FROM stdin;
1	110	16	2019-09-09 17:37:15.181728	2019-09-09 17:37:42.733842	2019-09-09 17:37:15.195525	2019-09-09 17:37:42.74348	2019-09-09
2	110	16	2019-09-09 17:43:12.303155	2019-09-09 17:43:12.303156	2019-09-09 17:43:12.30395	2019-09-09 17:43:12.30395	2019-09-09
3	110	16	2019-09-18 10:55:09.297794	2019-09-18 10:55:09.297796	2019-09-18 10:55:09.299196	2019-09-18 10:55:09.299196	2019-09-18
\.


--
-- Data for Name: work_zones; Type: TABLE DATA; Schema: public; Owner: free_be
--

COPY public.work_zones (id, name, spot_one, spot_two, spot_three, spot_four, created_at, updated_at) FROM stdin;
16	Canada	(51.04391060278729, -114.04217639973365)	(51.04380884072202, -114.0417486711039)	(51.04356755259376, -114.0417425351705)	(51.043717149468335, -114.04240090709737)	2019-01-28 12:14:41.944491	2019-01-28 12:14:41.944491
17	New zone 012	(51.04644581510764, -114.06433869974506)	(51.04644497196837, -114.0642019070853)	(51.04624683381319, -114.0642193414439)	(51.04625020638463, -114.06435479299915)	2019-01-29 21:40:34.740962	2019-01-29 21:40:34.740962
18	New zone 012гл	(51.04644581510764, -114.06433869974506)	(51.04644497196837, -114.0642019070853)	(51.04624683381319, -114.0642193414439)	(51.04625020638463, -114.06435479299915)	2019-01-29 21:40:39.621885	2019-01-29 21:40:39.621885
19	6768768	(51.04644581510764, -114.06433869974506)	(51.04644497196837, -114.0642019070853)	(51.04624683381319, -114.0642193414439)	(51.04625020638463, -114.06435479299915)	2019-01-29 21:40:52.050698	2019-01-29 21:40:52.050698
20	kiev	(50.45287230028607, 30.36302145837726)	(50.46005071095665, 30.455080082179393)	(50.44930937643263, 30.45671983122986)	(50.42166329702941, 30.379687709265227)	2019-01-30 19:56:15.934667	2019-01-30 19:56:15.934667
21	kharkov	(49.9935, 36.230383000000074)	(50.018992205589505, 36.37650942208438)	(49.98621358058553, 36.38664639850117)	(49.97779144341483, 36.35994454821844)	2019-01-30 20:02:03.108051	2019-01-30 20:02:03.108051
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 137, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 137, true);


--
-- Name: addresscs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.addresscs_id_seq', 1011, true);


--
-- Name: business_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.business_partners_id_seq', 222, true);


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.businesses_id_seq', 270, true);


--
-- Name: cash_out_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.cash_out_payments_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.categories_id_seq', 65, true);


--
-- Name: complaints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.complaints_id_seq', 4, true);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.contracts_id_seq', 227, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.devices_id_seq', 1282, true);


--
-- Name: dialogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.dialogs_id_seq', 1, false);


--
-- Name: estimator_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.estimator_types_id_seq', 3, true);


--
-- Name: estimators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.estimators_id_seq', 142, true);


--
-- Name: favorite_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.favorite_tasks_id_seq', 117, true);


--
-- Name: feed_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.feed_notifications_id_seq', 3762, true);


--
-- Name: field_estimators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.field_estimators_id_seq', 171, true);


--
-- Name: financials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.financials_id_seq', 226, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.invoices_id_seq', 111, true);


--
-- Name: line_estimators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.line_estimators_id_seq', 623, true);


--
-- Name: line_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.line_tasks_id_seq', 361, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.messages_id_seq', 2894, true);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1472, true);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.permissions_id_seq', 123, true);


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.places_id_seq', 596, true);


--
-- Name: project_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.project_tasks_id_seq', 34, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.projects_id_seq', 116, true);


--
-- Name: quick_books_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.quick_books_integrations_id_seq', 1, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.ratings_id_seq', 101, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: task_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.task_payments_id_seq', 1, false);


--
-- Name: task_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.task_requests_id_seq', 1, false);


--
-- Name: task_suggestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.task_suggestions_id_seq', 457, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.tasks_id_seq', 602, true);


--
-- Name: trades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.trades_id_seq', 55, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.users_id_seq', 113, true);


--
-- Name: users_pendings_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.users_pendings_tasks_id_seq', 158, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.versions_id_seq', 261, true);


--
-- Name: work_zone_visit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.work_zone_visit_logs_id_seq', 3, true);


--
-- Name: work_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: free_be
--

SELECT pg_catalog.setval('public.work_zones_id_seq', 21, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresscs addresscs_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.addresscs
    ADD CONSTRAINT addresscs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: business_partners business_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.business_partners
    ADD CONSTRAINT business_partners_pkey PRIMARY KEY (id);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: cash_out_payments cash_out_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.cash_out_payments
    ADD CONSTRAINT cash_out_payments_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: complaints complaints_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT complaints_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: dialogs dialogs_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.dialogs
    ADD CONSTRAINT dialogs_pkey PRIMARY KEY (id);


--
-- Name: estimator_types estimator_types_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.estimator_types
    ADD CONSTRAINT estimator_types_pkey PRIMARY KEY (id);


--
-- Name: estimators estimators_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.estimators
    ADD CONSTRAINT estimators_pkey PRIMARY KEY (id);


--
-- Name: favorite_tasks favorite_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.favorite_tasks
    ADD CONSTRAINT favorite_tasks_pkey PRIMARY KEY (id);


--
-- Name: feed_notifications feed_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.feed_notifications
    ADD CONSTRAINT feed_notifications_pkey PRIMARY KEY (id);


--
-- Name: field_estimators field_estimators_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.field_estimators
    ADD CONSTRAINT field_estimators_pkey PRIMARY KEY (id);


--
-- Name: financials financials_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.financials
    ADD CONSTRAINT financials_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: line_estimators line_estimators_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_estimators
    ADD CONSTRAINT line_estimators_pkey PRIMARY KEY (id);


--
-- Name: line_tasks line_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_tasks
    ADD CONSTRAINT line_tasks_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: project_tasks project_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.project_tasks
    ADD CONSTRAINT project_tasks_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: quick_books_integrations quick_books_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.quick_books_integrations
    ADD CONSTRAINT quick_books_integrations_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: task_payments task_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_payments
    ADD CONSTRAINT task_payments_pkey PRIMARY KEY (id);


--
-- Name: task_requests task_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_requests
    ADD CONSTRAINT task_requests_pkey PRIMARY KEY (id);


--
-- Name: task_suggestions task_suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.task_suggestions
    ADD CONSTRAINT task_suggestions_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: users_pendings_tasks users_pendings_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.users_pendings_tasks
    ADD CONSTRAINT users_pendings_tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: work_zone_visit_logs work_zone_visit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zone_visit_logs
    ADD CONSTRAINT work_zone_visit_logs_pkey PRIMARY KEY (id);


--
-- Name: work_zones work_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zones
    ADD CONSTRAINT work_zones_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_business_partners_on_addressc_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_business_partners_on_addressc_id ON public.business_partners USING btree (addressc_id);


--
-- Name: index_business_partners_on_business_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_business_partners_on_business_id ON public.business_partners USING btree (business_id);


--
-- Name: index_businesses_on_addressc_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_businesses_on_addressc_id ON public.businesses USING btree (addressc_id);


--
-- Name: index_businesses_on_contract_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_businesses_on_contract_id ON public.businesses USING btree (contract_id);


--
-- Name: index_contracts_on_user_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_contracts_on_user_id ON public.contracts USING btree (user_id);


--
-- Name: index_estimators_on_project_task_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_estimators_on_project_task_id ON public.estimators USING btree (project_task_id);


--
-- Name: index_field_estimators_on_ancestry; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_field_estimators_on_ancestry ON public.field_estimators USING btree (ancestry);


--
-- Name: index_field_estimators_on_depend_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_field_estimators_on_depend_id ON public.field_estimators USING btree (depend_id);


--
-- Name: index_field_estimators_on_field_estimator_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_field_estimators_on_field_estimator_id ON public.field_estimators USING btree (field_estimator_id);


--
-- Name: index_field_estimators_on_fieldable_type_and_fieldable_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_field_estimators_on_fieldable_type_and_fieldable_id ON public.field_estimators USING btree (fieldable_type, fieldable_id);


--
-- Name: index_financials_on_contract_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_financials_on_contract_id ON public.financials USING btree (contract_id);


--
-- Name: index_invoices_on_payable_type_and_payable_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_invoices_on_payable_type_and_payable_id ON public.invoices USING btree (payable_type, payable_id);


--
-- Name: index_line_estimators_on_estimator_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_line_estimators_on_estimator_id ON public.line_estimators USING btree (estimator_id);


--
-- Name: index_line_estimators_on_field_estimator_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_line_estimators_on_field_estimator_id ON public.line_estimators USING btree (field_estimator_id);


--
-- Name: index_line_estimators_on_task_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_line_estimators_on_task_id ON public.line_estimators USING btree (task_id);


--
-- Name: index_line_tasks_on_task_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_line_tasks_on_task_id ON public.line_tasks USING btree (task_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_permissions_on_role_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_permissions_on_role_id ON public.permissions USING btree (role_id);


--
-- Name: index_projects_on_contract_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_projects_on_contract_id ON public.projects USING btree (contract_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_roles_on_name ON public.roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON public.roles USING btree (name, resource_type, resource_id);


--
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON public.settings USING btree (thing_type, thing_id, var);


--
-- Name: index_tasks_on_project_task_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_tasks_on_project_task_id ON public.tasks USING btree (project_task_id);


--
-- Name: index_trades_on_financial_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_trades_on_financial_id ON public.trades USING btree (financial_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: free_be
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON public.users_roles USING btree (user_id, role_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: index_work_zone_visit_logs_on_user_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_work_zone_visit_logs_on_user_id ON public.work_zone_visit_logs USING btree (user_id);


--
-- Name: index_work_zone_visit_logs_on_work_zone_id; Type: INDEX; Schema: public; Owner: free_be
--

CREATE INDEX index_work_zone_visit_logs_on_work_zone_id ON public.work_zone_visit_logs USING btree (work_zone_id);


--
-- Name: projects fk_rails_003ff37a1f; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_003ff37a1f FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- Name: business_partners fk_rails_0903b11d31; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.business_partners
    ADD CONSTRAINT fk_rails_0903b11d31 FOREIGN KEY (addressc_id) REFERENCES public.addresscs(id);


--
-- Name: businesses fk_rails_1b9f6c6da7; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT fk_rails_1b9f6c6da7 FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- Name: financials fk_rails_2933aed3ba; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.financials
    ADD CONSTRAINT fk_rails_2933aed3ba FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- Name: line_estimators fk_rails_2b32e5634e; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_estimators
    ADD CONSTRAINT fk_rails_2b32e5634e FOREIGN KEY (estimator_id) REFERENCES public.estimators(id);


--
-- Name: work_zone_visit_logs fk_rails_32d55fb52f; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zone_visit_logs
    ADD CONSTRAINT fk_rails_32d55fb52f FOREIGN KEY (work_zone_id) REFERENCES public.work_zones(id);


--
-- Name: businesses fk_rails_3e6dc9f74c; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT fk_rails_3e6dc9f74c FOREIGN KEY (addressc_id) REFERENCES public.addresscs(id);


--
-- Name: line_estimators fk_rails_41837da5f9; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_estimators
    ADD CONSTRAINT fk_rails_41837da5f9 FOREIGN KEY (field_estimator_id) REFERENCES public.field_estimators(id);


--
-- Name: business_partners fk_rails_574eab8ccc; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.business_partners
    ADD CONSTRAINT fk_rails_574eab8ccc FOREIGN KEY (business_id) REFERENCES public.businesses(id);


--
-- Name: line_tasks fk_rails_7145711557; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_tasks
    ADD CONSTRAINT fk_rails_7145711557 FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: field_estimators fk_rails_819f393a66; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.field_estimators
    ADD CONSTRAINT fk_rails_819f393a66 FOREIGN KEY (field_estimator_id) REFERENCES public.field_estimators(id);


--
-- Name: permissions fk_rails_93c739e1a2; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT fk_rails_93c739e1a2 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: estimators fk_rails_989ea60db1; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.estimators
    ADD CONSTRAINT fk_rails_989ea60db1 FOREIGN KEY (project_task_id) REFERENCES public.project_tasks(id);


--
-- Name: tasks fk_rails_af75a0c545; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_af75a0c545 FOREIGN KEY (project_task_id) REFERENCES public.project_tasks(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: work_zone_visit_logs fk_rails_df92cdb945; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.work_zone_visit_logs
    ADD CONSTRAINT fk_rails_df92cdb945 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: trades fk_rails_eebf4d9519; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_eebf4d9519 FOREIGN KEY (financial_id) REFERENCES public.financials(id);


--
-- Name: contracts fk_rails_f191b5ed7a; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT fk_rails_f191b5ed7a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: line_estimators fk_rails_f7a56b9292; Type: FK CONSTRAINT; Schema: public; Owner: free_be
--

ALTER TABLE ONLY public.line_estimators
    ADD CONSTRAINT fk_rails_f7a56b9292 FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- PostgreSQL database dump complete
--

