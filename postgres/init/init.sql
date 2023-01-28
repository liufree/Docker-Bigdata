--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

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

DROP DATABASE IF EXISTS grafana;
--
-- Name: liufree; Type: DATABASE; Schema: -; Owner: liufree
--

CREATE DATABASE grafana WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE grafana OWNER TO liufree;

\connect liufree

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

--CREATE SCHEMA public;


--ALTER SCHEMA public OWNER TO pg_database_owner;
--
--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

-- COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alert; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert (
    id integer,
    version integer,
    dashboard_id integer,
    panel_id integer,
    org_id integer,
    name text,
    message text,
    state text,
    settings text,
    frequency integer,
    handler integer,
    severity text,
    silenced integer,
    execution_error text,
    eval_data text,
    eval_date timestamp without time zone,
    new_state_date timestamp without time zone,
    state_changes integer,
    created timestamp without time zone,
    updated timestamp without time zone,
    "for" integer
);


ALTER TABLE public.alert OWNER TO liufree;

--
-- Name: alert_configuration; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_configuration (
    id integer,
    alertmanager_configuration text,
    configuration_version text,
    created_at integer,
    "default" integer,
    org_id integer
);


ALTER TABLE public.alert_configuration OWNER TO liufree;

--
-- Name: alert_instance; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_instance (
    rule_org_id integer,
    rule_uid text,
    labels text,
    labels_hash text,
    current_state text,
    current_state_since integer,
    last_eval_time integer,
    current_state_end integer
);


ALTER TABLE public.alert_instance OWNER TO liufree;

--
-- Name: alert_notification; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_notification (
    id integer,
    org_id integer,
    name text,
    type text,
    settings text,
    created timestamp without time zone,
    updated timestamp without time zone,
    is_default integer,
    frequency integer,
    send_reminder integer,
    disable_resolve_message integer,
    uid text,
    secure_settings text
);


ALTER TABLE public.alert_notification OWNER TO liufree;

--
-- Name: alert_notification_state; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_notification_state (
    id integer,
    org_id integer,
    alert_id integer,
    notifier_id integer,
    state text,
    version integer,
    updated_at integer,
    alert_rule_state_updated_version integer
);


ALTER TABLE public.alert_notification_state OWNER TO liufree;

--
-- Name: alert_rule; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_rule (
    id integer,
    org_id integer,
    title text,
    condition text,
    data text,
    updated timestamp without time zone,
    interval_seconds integer,
    version integer,
    uid text,
    namespace_uid text,
    rule_group text,
    no_data_state text,
    exec_err_state text,
    "for" integer,
    annotations text,
    labels text,
    dashboard_uid text,
    panel_id integer
);


ALTER TABLE public.alert_rule OWNER TO liufree;

--
-- Name: alert_rule_tag; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_rule_tag (
    id integer,
    alert_id integer,
    tag_id integer
);


ALTER TABLE public.alert_rule_tag OWNER TO liufree;

--
-- Name: alert_rule_version; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.alert_rule_version (
    id integer,
    rule_org_id integer,
    rule_uid text,
    rule_namespace_uid text,
    rule_group text,
    parent_version integer,
    restored_from integer,
    version integer,
    created timestamp without time zone,
    title text,
    condition text,
    data text,
    interval_seconds integer,
    no_data_state text,
    exec_err_state text,
    "for" integer,
    annotations text,
    labels text
);


ALTER TABLE public.alert_rule_version OWNER TO liufree;

--
-- Name: annotation; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.annotation (
    id integer,
    org_id integer,
    alert_id integer,
    user_id integer,
    dashboard_id integer,
    panel_id integer,
    category_id integer,
    type text,
    title text,
    text text,
    metric text,
    prev_state text,
    new_state text,
    data text,
    epoch integer,
    region_id integer,
    tags text,
    created integer,
    updated integer,
    epoch_end integer
);


ALTER TABLE public.annotation OWNER TO liufree;

--
-- Name: annotation_tag; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.annotation_tag (
    id integer,
    annotation_id integer,
    tag_id integer
);


ALTER TABLE public.annotation_tag OWNER TO liufree;

--
-- Name: api_key; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.api_key (
    id integer,
    org_id integer,
    name text,
    key text,
    role text,
    created timestamp without time zone,
    updated timestamp without time zone,
    expires integer,
    service_account_id integer
);


ALTER TABLE public.api_key OWNER TO liufree;

--
-- Name: builtin_role; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.builtin_role (
    id integer,
    role text,
    role_id integer,
    created timestamp without time zone,
    updated timestamp without time zone,
    org_id integer
);


ALTER TABLE public.builtin_role OWNER TO liufree;

--
-- Name: cache_data; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.cache_data (
    cache_key text,
    data bytea,
    expires integer,
    created_at integer
);


ALTER TABLE public.cache_data OWNER TO liufree;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard (
    id integer,
    version integer,
    slug text,
    title text,
    data text,
    org_id integer,
    created timestamp without time zone,
    updated timestamp without time zone,
    updated_by integer,
    created_by integer,
    gnet_id integer,
    plugin_id text,
    folder_id integer,
    is_folder integer,
    has_acl integer,
    uid text
);


ALTER TABLE public.dashboard OWNER TO liufree;

--
-- Name: dashboard_acl; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard_acl (
    id integer,
    org_id integer,
    dashboard_id integer,
    user_id integer,
    team_id integer,
    permission integer,
    role text,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.dashboard_acl OWNER TO liufree;

--
-- Name: dashboard_provisioning; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard_provisioning (
    id integer,
    dashboard_id integer,
    name text,
    external_id text,
    updated integer,
    check_sum text
);


ALTER TABLE public.dashboard_provisioning OWNER TO liufree;

--
-- Name: dashboard_snapshot; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard_snapshot (
    id integer,
    name text,
    key text,
    delete_key text,
    org_id integer,
    user_id integer,
    external integer,
    external_url text,
    dashboard text,
    expires timestamp without time zone,
    created timestamp without time zone,
    updated timestamp without time zone,
    external_delete_url text,
    dashboard_encrypted bytea
);


ALTER TABLE public.dashboard_snapshot OWNER TO liufree;

--
-- Name: dashboard_tag; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard_tag (
    id integer,
    dashboard_id integer,
    term text
);


ALTER TABLE public.dashboard_tag OWNER TO liufree;

--
-- Name: dashboard_version; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.dashboard_version (
    id integer,
    dashboard_id integer,
    parent_version integer,
    restored_from integer,
    version integer,
    created timestamp without time zone,
    created_by integer,
    message text,
    data text
);


ALTER TABLE public.dashboard_version OWNER TO liufree;

--
-- Name: data_keys; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.data_keys (
    name text,
    active integer,
    scope text,
    provider text,
    encrypted_data bytea,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.data_keys OWNER TO liufree;

--
-- Name: data_source; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.data_source (
    id integer,
    org_id integer,
    version integer,
    type text,
    name text,
    access text,
    url text,
    password text,
    "user" text,
    database text,
    basic_auth integer,
    basic_auth_user text,
    basic_auth_password text,
    is_default integer,
    json_data text,
    created timestamp without time zone,
    updated timestamp without time zone,
    with_credentials integer,
    secure_json_data text,
    read_only integer,
    uid text
);


ALTER TABLE public.data_source OWNER TO liufree;

--
-- Name: kv_store; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.kv_store (
    id integer,
    org_id integer,
    namespace text,
    key text,
    value text,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.kv_store OWNER TO liufree;

--
-- Name: library_element; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.library_element (
    id integer,
    org_id integer,
    folder_id integer,
    uid text,
    name text,
    kind integer,
    type text,
    description text,
    model text,
    created timestamp without time zone,
    created_by integer,
    updated timestamp without time zone,
    updated_by integer,
    version integer
);


ALTER TABLE public.library_element OWNER TO liufree;

--
-- Name: library_element_connection; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.library_element_connection (
    id integer,
    element_id integer,
    kind integer,
    connection_id integer,
    created timestamp without time zone,
    created_by integer
);


ALTER TABLE public.library_element_connection OWNER TO liufree;

--
-- Name: login_attempt; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.login_attempt (
    id integer,
    username text,
    ip_address text,
    created integer
);


ALTER TABLE public.login_attempt OWNER TO liufree;

--
-- Name: migration_log; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.migration_log (
    id integer,
    migration_id text,
    sql text,
    success integer,
    error text,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.migration_log OWNER TO liufree;

--
-- Name: ngalert_configuration; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.ngalert_configuration (
    id integer,
    org_id integer,
    alertmanagers text,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.ngalert_configuration OWNER TO liufree;

--
-- Name: org; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.org (
    id integer,
    version integer,
    name text,
    address1 text,
    address2 text,
    city text,
    state text,
    zip_code text,
    country text,
    billing_email text,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.org OWNER TO liufree;

--
-- Name: org_user; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.org_user (
    id integer,
    org_id integer,
    user_id integer,
    role text,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.org_user OWNER TO liufree;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.permission (
    id integer,
    role_id integer,
    action text,
    scope text,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.permission OWNER TO liufree;

--
-- Name: playlist; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.playlist (
    id integer,
    name text,
    "interval" text,
    org_id integer
);


ALTER TABLE public.playlist OWNER TO liufree;

--
-- Name: playlist_item; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.playlist_item (
    id integer,
    playlist_id integer,
    type text,
    value text,
    title text,
    "order" integer
);


ALTER TABLE public.playlist_item OWNER TO liufree;

--
-- Name: plugin_setting; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.plugin_setting (
    id integer,
    org_id integer,
    plugin_id text,
    enabled integer,
    pinned integer,
    json_data text,
    secure_json_data text,
    created timestamp without time zone,
    updated timestamp without time zone,
    plugin_version text
);


ALTER TABLE public.plugin_setting OWNER TO liufree;

--
-- Name: preferences; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.preferences (
    id integer,
    org_id integer,
    user_id integer,
    version integer,
    home_dashboard_id integer,
    timezone text,
    theme text,
    created timestamp without time zone,
    updated timestamp without time zone,
    team_id integer,
    week_start text
);


ALTER TABLE public.preferences OWNER TO liufree;

--
-- Name: quota; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.quota (
    id integer,
    org_id integer,
    user_id integer,
    target text,
    "limit" integer,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.quota OWNER TO liufree;

--
-- Name: role; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.role (
    id integer,
    name text,
    description text,
    version integer,
    org_id integer,
    uid text,
    created timestamp without time zone,
    updated timestamp without time zone,
    display_name text,
    group_name text
);


ALTER TABLE public.role OWNER TO liufree;

--
-- Name: seed_assignment; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.seed_assignment (
    builtin_role text,
    role_name text
);


ALTER TABLE public.seed_assignment OWNER TO liufree;

--
-- Name: server_lock; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.server_lock (
    id integer,
    operation_uid text,
    version integer,
    last_execution integer
);


ALTER TABLE public.server_lock OWNER TO liufree;

--
-- Name: session; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.session (
    key text,
    data bytea,
    expiry integer
);


ALTER TABLE public.session OWNER TO liufree;

--
-- Name: short_url; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.short_url (
    id integer,
    org_id integer,
    uid text,
    path text,
    created_by integer,
    created_at integer,
    last_seen_at integer
);


ALTER TABLE public.short_url OWNER TO liufree;

--
-- Name: sqlite_master; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.sqlite_master (
    type text,
    name text,
    tbl_name text,
    rootpage integer,
    sql text
);


ALTER TABLE public.sqlite_master OWNER TO liufree;

--
-- Name: sqlite_sequence; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.sqlite_sequence (
    name text,
    seq text
);


ALTER TABLE public.sqlite_sequence OWNER TO liufree;

--
-- Name: star; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.star (
    id integer,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.star OWNER TO liufree;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.tag (
    id integer,
    key text,
    value text
);


ALTER TABLE public.tag OWNER TO liufree;

--
-- Name: team; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.team (
    id integer,
    name text,
    org_id integer,
    created timestamp without time zone,
    updated timestamp without time zone,
    email text
);


ALTER TABLE public.team OWNER TO liufree;

--
-- Name: team_member; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.team_member (
    id integer,
    org_id integer,
    team_id integer,
    user_id integer,
    created timestamp without time zone,
    updated timestamp without time zone,
    external integer,
    permission integer
);


ALTER TABLE public.team_member OWNER TO liufree;

--
-- Name: team_role; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.team_role (
    id integer,
    org_id integer,
    team_id integer,
    role_id integer,
    created timestamp without time zone
);


ALTER TABLE public.team_role OWNER TO liufree;

--
-- Name: temp_user; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.temp_user (
    id integer,
    org_id integer,
    version integer,
    email text,
    name text,
    role text,
    code text,
    status text,
    invited_by_user_id integer,
    email_sent integer,
    email_sent_on timestamp without time zone,
    remote_addr text,
    created integer,
    updated integer
);


ALTER TABLE public.temp_user OWNER TO liufree;

--
-- Name: test_data; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.test_data (
    id integer,
    metric1 text,
    metric2 text,
    value_big_int integer,
    value_double double precision,
    value_float double precision,
    value_int integer,
    time_epoch integer,
    time_date_time timestamp without time zone,
    time_time_stamp timestamp without time zone
);


ALTER TABLE public.test_data OWNER TO liufree;

--
-- Name: user; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public."user" (
    id integer,
    version integer,
    login text,
    email text,
    name text,
    password text,
    salt text,
    rands text,
    company text,
    org_id integer,
    is_admin integer,
    email_verified integer,
    theme text,
    created timestamp without time zone,
    updated timestamp without time zone,
    help_flags1 integer,
    last_seen_at timestamp without time zone,
    is_disabled integer,
    is_service_account integer
);


ALTER TABLE public."user" OWNER TO liufree;

--
-- Name: user_auth; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.user_auth (
    id integer,
    user_id integer,
    auth_module text,
    auth_id text,
    created timestamp without time zone,
    o_auth_access_token text,
    o_auth_refresh_token text,
    o_auth_token_type text,
    o_auth_expiry timestamp without time zone
);


ALTER TABLE public.user_auth OWNER TO liufree;

--
-- Name: user_auth_token; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.user_auth_token (
    id integer,
    user_id integer,
    auth_token text,
    prev_auth_token text,
    user_agent text,
    client_ip text,
    auth_token_seen integer,
    seen_at integer,
    rotated_at integer,
    created_at integer,
    updated_at integer,
    revoked_at integer
);


ALTER TABLE public.user_auth_token OWNER TO liufree;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: liufree
--

CREATE TABLE public.user_role (
    id integer,
    org_id integer,
    user_id integer,
    role_id integer,
    created timestamp without time zone
);


ALTER TABLE public.user_role OWNER TO liufree;

--
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert (id, version, dashboard_id, panel_id, org_id, name, message, state, settings, frequency, handler, severity, silenced, execution_error, eval_data, eval_date, new_state_date, state_changes, created, updated, "for") FROM stdin;
\.


--
-- Data for Name: alert_configuration; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_configuration (id, alertmanager_configuration, configuration_version, created_at, "default", org_id) FROM stdin;
1	{\n\t"alertmanager_config": {\n\t\t"route": {\n\t\t\t"receiver": "grafana-default-email"\n\t\t},\n\t\t"receivers": [{\n\t\t\t"name": "grafana-default-email",\n\t\t\t"grafana_managed_receiver_configs": [{\n\t\t\t\t"uid": "",\n\t\t\t\t"name": "email receiver",\n\t\t\t\t"type": "email",\n\t\t\t\t"isDefault": true,\n\t\t\t\t"settings": {\n\t\t\t\t\t"addresses": "<example@email.com>"\n\t\t\t\t}\n\t\t\t}]\n\t\t}]\n\t}\n}\n	v1	1674477212	1	1
\.


--
-- Data for Name: alert_instance; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_instance (rule_org_id, rule_uid, labels, labels_hash, current_state, current_state_since, last_eval_time, current_state_end) FROM stdin;
\.


--
-- Data for Name: alert_notification; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_notification (id, org_id, name, type, settings, created, updated, is_default, frequency, send_reminder, disable_resolve_message, uid, secure_settings) FROM stdin;
\.


--
-- Data for Name: alert_notification_state; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_notification_state (id, org_id, alert_id, notifier_id, state, version, updated_at, alert_rule_state_updated_version) FROM stdin;
\.


--
-- Data for Name: alert_rule; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_rule (id, org_id, title, condition, data, updated, interval_seconds, version, uid, namespace_uid, rule_group, no_data_state, exec_err_state, "for", annotations, labels, dashboard_uid, panel_id) FROM stdin;
\.


--
-- Data for Name: alert_rule_tag; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_rule_tag (id, alert_id, tag_id) FROM stdin;
\.


--
-- Data for Name: alert_rule_version; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.alert_rule_version (id, rule_org_id, rule_uid, rule_namespace_uid, rule_group, parent_version, restored_from, version, created, title, condition, data, interval_seconds, no_data_state, exec_err_state, "for", annotations, labels) FROM stdin;
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.annotation (id, org_id, alert_id, user_id, dashboard_id, panel_id, category_id, type, title, text, metric, prev_state, new_state, data, epoch, region_id, tags, created, updated, epoch_end) FROM stdin;
\.


--
-- Data for Name: annotation_tag; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.annotation_tag (id, annotation_id, tag_id) FROM stdin;
\.


--
-- Data for Name: api_key; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.api_key (id, org_id, name, key, role, created, updated, expires, service_account_id) FROM stdin;
\.


--
-- Data for Name: builtin_role; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.builtin_role (id, role, role_id, created, updated, org_id) FROM stdin;
\.


--
-- Data for Name: cache_data; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.cache_data (cache_key, data, expires, created_at) FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard (id, version, slug, title, data, org_id, created, updated, updated_by, created_by, gnet_id, plugin_id, folder_id, is_folder, has_acl, uid) FROM stdin;
\.


--
-- Data for Name: dashboard_acl; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard_acl (id, org_id, dashboard_id, user_id, team_id, permission, role, created, updated) FROM stdin;
1	-1	-1	\N	\N	1	Viewer	2017-06-20 00:00:00	2017-06-20 00:00:00
2	-1	-1	\N	\N	2	Editor	2017-06-20 00:00:00	2017-06-20 00:00:00
\.


--
-- Data for Name: dashboard_provisioning; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard_provisioning (id, dashboard_id, name, external_id, updated, check_sum) FROM stdin;
\.


--
-- Data for Name: dashboard_snapshot; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard_snapshot (id, name, key, delete_key, org_id, user_id, external, external_url, dashboard, expires, created, updated, external_delete_url, dashboard_encrypted) FROM stdin;
\.


--
-- Data for Name: dashboard_tag; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard_tag (id, dashboard_id, term) FROM stdin;
\.


--
-- Data for Name: dashboard_version; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.dashboard_version (id, dashboard_id, parent_version, restored_from, version, created, created_by, message, data) FROM stdin;
\.


--
-- Data for Name: data_keys; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.data_keys (name, active, scope, provider, encrypted_data, created, updated) FROM stdin;
\.


--
-- Data for Name: data_source; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.data_source (id, org_id, version, type, name, access, url, password, "user", database, basic_auth, basic_auth_user, basic_auth_password, is_default, json_data, created, updated, with_credentials, secure_json_data, read_only, uid) FROM stdin;
\.


--
-- Data for Name: kv_store; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.kv_store (id, org_id, namespace, key, value, created, updated) FROM stdin;
\N	1	alertmanager	notifications		2023-01-23 13:10:58	2023-01-23 13:10:58
\N	1	alertmanager	silences		2023-01-23 13:10:58	2023-01-23 13:10:58
\.


--
-- Data for Name: library_element; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.library_element (id, org_id, folder_id, uid, name, kind, type, description, model, created, created_by, updated, updated_by, version) FROM stdin;
\.


--
-- Data for Name: library_element_connection; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.library_element_connection (id, element_id, kind, connection_id, created, created_by) FROM stdin;
\.


--
-- Data for Name: login_attempt; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.login_attempt (id, username, ip_address, created) FROM stdin;
\.


--
-- Data for Name: migration_log; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.migration_log (id, migration_id, sql, success, error, "timestamp") FROM stdin;
1	create migration_log table	CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `migration_id` TEXT NOT NULL\n, `sql` TEXT NOT NULL\n, `success` INTEGER NOT NULL\n, `error` TEXT NOT NULL\n, `timestamp` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
2	create user table	CREATE TABLE IF NOT EXISTS `user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `login` TEXT NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `password` TEXT NULL\n, `salt` TEXT NULL\n, `rands` TEXT NULL\n, `company` TEXT NULL\n, `account_id` INTEGER NOT NULL\n, `is_admin` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
3	add unique index user.login	CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);	1		2023-01-23 12:33:31
4	add unique index user.email	CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);	1		2023-01-23 12:33:31
5	drop index UQE_user_login - v1	DROP INDEX `UQE_user_login`	1		2023-01-23 12:33:31
6	drop index UQE_user_email - v1	DROP INDEX `UQE_user_email`	1		2023-01-23 12:33:31
7	Rename table user to user_v1 - v1	ALTER TABLE `user` RENAME TO `user_v1`	1		2023-01-23 12:33:31
8	create user table v2	CREATE TABLE IF NOT EXISTS `user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `login` TEXT NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `password` TEXT NULL\n, `salt` TEXT NULL\n, `rands` TEXT NULL\n, `company` TEXT NULL\n, `org_id` INTEGER NOT NULL\n, `is_admin` INTEGER NOT NULL\n, `email_verified` INTEGER NULL\n, `theme` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
9	create index UQE_user_login - v2	CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);	1		2023-01-23 12:33:31
10	create index UQE_user_email - v2	CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);	1		2023-01-23 12:33:31
11	copy data_source v1 to v2	INSERT INTO `user` (`password`\n, `salt`\n, `is_admin`\n, `updated`\n, `id`\n, `version`\n, `login`\n, `company`\n, `org_id`\n, `created`\n, `email`\n, `name`\n, `rands`) SELECT `password`\n, `salt`\n, `is_admin`\n, `updated`\n, `id`\n, `version`\n, `login`\n, `company`\n, `account_id`\n, `created`\n, `email`\n, `name`\n, `rands` FROM `user_v1`	1		2023-01-23 12:33:31
12	Drop old table user_v1	DROP TABLE IF EXISTS `user_v1`	1		2023-01-23 12:33:31
13	Add column help_flags1 to user table	alter table `user` ADD COLUMN `help_flags1` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
14	Update user table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
15	Add last_seen_at column to user	alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL 	1		2023-01-23 12:33:31
16	Add missing user data	code migration	1		2023-01-23 12:33:31
17	Add is_disabled column to user	alter table `user` ADD COLUMN `is_disabled` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
18	Add index user.login/user.email	CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`);	1		2023-01-23 12:33:31
19	Add is_service_account column to user	alter table `user` ADD COLUMN `is_service_account` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
20	create temp user table v1-7	CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `role` TEXT NULL\n, `code` TEXT NOT NULL\n, `status` TEXT NOT NULL\n, `invited_by_user_id` INTEGER NULL\n, `email_sent` INTEGER NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
21	create index IDX_temp_user_email - v1-7	CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);	1		2023-01-23 12:33:31
22	create index IDX_temp_user_org_id - v1-7	CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);	1		2023-01-23 12:33:31
23	create index IDX_temp_user_code - v1-7	CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);	1		2023-01-23 12:33:31
24	create index IDX_temp_user_status - v1-7	CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);	1		2023-01-23 12:33:31
25	Update temp_user table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
26	drop index IDX_temp_user_email - v1	DROP INDEX `IDX_temp_user_email`	1		2023-01-23 12:33:31
27	drop index IDX_temp_user_org_id - v1	DROP INDEX `IDX_temp_user_org_id`	1		2023-01-23 12:33:31
28	drop index IDX_temp_user_code - v1	DROP INDEX `IDX_temp_user_code`	1		2023-01-23 12:33:31
29	drop index IDX_temp_user_status - v1	DROP INDEX `IDX_temp_user_status`	1		2023-01-23 12:33:31
30	Rename table temp_user to temp_user_tmp_qwerty - v1	ALTER TABLE `temp_user` RENAME TO `temp_user_tmp_qwerty`	1		2023-01-23 12:33:31
31	create temp_user v2	CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `role` TEXT NULL\n, `code` TEXT NOT NULL\n, `status` TEXT NOT NULL\n, `invited_by_user_id` INTEGER NULL\n, `email_sent` INTEGER NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` TEXT NULL\n, `created` INTEGER NOT NULL DEFAULT 0\n, `updated` INTEGER NOT NULL DEFAULT 0\n);	1		2023-01-23 12:33:31
32	create index IDX_temp_user_email - v2	CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);	1		2023-01-23 12:33:31
33	create index IDX_temp_user_org_id - v2	CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);	1		2023-01-23 12:33:31
34	create index IDX_temp_user_code - v2	CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);	1		2023-01-23 12:33:31
35	create index IDX_temp_user_status - v2	CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);	1		2023-01-23 12:33:31
36	copy temp_user v1 to v2	INSERT INTO `temp_user` (`remote_addr`\n, `id`\n, `version`\n, `email`\n, `code`\n, `invited_by_user_id`\n, `email_sent_on`\n, `org_id`\n, `name`\n, `role`\n, `status`\n, `email_sent`) SELECT `remote_addr`\n, `id`\n, `version`\n, `email`\n, `code`\n, `invited_by_user_id`\n, `email_sent_on`\n, `org_id`\n, `name`\n, `role`\n, `status`\n, `email_sent` FROM `temp_user_tmp_qwerty`	1		2023-01-23 12:33:31
37	drop temp_user_tmp_qwerty	DROP TABLE IF EXISTS `temp_user_tmp_qwerty`	1		2023-01-23 12:33:31
38	Set created for temp users that will otherwise prematurely expire	code migration	1		2023-01-23 12:33:31
39	create star table	CREATE TABLE IF NOT EXISTS `star` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:31
40	add unique index star.user_id_dashboard_id	CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);	1		2023-01-23 12:33:31
85	create index IDX_dashboard_provisioning_dashboard_id_name - v2	CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);	1		2023-01-23 12:33:31
41	create org table v1	CREATE TABLE IF NOT EXISTS `org` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `address1` TEXT NULL\n, `address2` TEXT NULL\n, `city` TEXT NULL\n, `state` TEXT NULL\n, `zip_code` TEXT NULL\n, `country` TEXT NULL\n, `billing_email` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
42	create index UQE_org_name - v1	CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);	1		2023-01-23 12:33:31
43	create org_user table v1	CREATE TABLE IF NOT EXISTS `org_user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `role` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
44	create index IDX_org_user_org_id - v1	CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);	1		2023-01-23 12:33:31
45	create index UQE_org_user_org_id_user_id - v1	CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);	1		2023-01-23 12:33:31
46	create index IDX_org_user_user_id - v1	CREATE INDEX `IDX_org_user_user_id` ON `org_user` (`user_id`);	1		2023-01-23 12:33:31
47	Update org table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
48	Update org_user table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
49	Migrate all Read Only Viewers to Viewers	UPDATE org_user SET role = 'Viewer' WHERE role = 'Read Only Editor'	1		2023-01-23 12:33:31
50	create dashboard table	CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `slug` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `account_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
51	add index dashboard.account_id	CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);	1		2023-01-23 12:33:31
52	add unique index dashboard_account_id_slug	CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);	1		2023-01-23 12:33:31
53	create dashboard_tag table	CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `term` TEXT NOT NULL\n);	1		2023-01-23 12:33:31
54	add unique index dashboard_tag.dasboard_id_term	CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);	1		2023-01-23 12:33:31
55	drop index UQE_dashboard_tag_dashboard_id_term - v1	DROP INDEX `UQE_dashboard_tag_dashboard_id_term`	1		2023-01-23 12:33:31
56	Rename table dashboard to dashboard_v1 - v1	ALTER TABLE `dashboard` RENAME TO `dashboard_v1`	1		2023-01-23 12:33:31
57	create dashboard v2	CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `slug` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
58	create index IDX_dashboard_org_id - v2	CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);	1		2023-01-23 12:33:31
59	create index UQE_dashboard_org_id_slug - v2	CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);	1		2023-01-23 12:33:31
60	copy dashboard v1 to v2	INSERT INTO `dashboard` (`slug`\n, `title`\n, `data`\n, `org_id`\n, `created`\n, `updated`\n, `id`\n, `version`) SELECT `slug`\n, `title`\n, `data`\n, `account_id`\n, `created`\n, `updated`\n, `id`\n, `version` FROM `dashboard_v1`	1		2023-01-23 12:33:31
61	drop table dashboard_v1	DROP TABLE IF EXISTS `dashboard_v1`	1		2023-01-23 12:33:31
62	alter dashboard.data to mediumtext v1	SELECT 0;	1		2023-01-23 12:33:31
63	Add column updated_by in dashboard - v2	alter table `dashboard` ADD COLUMN `updated_by` INTEGER NULL 	1		2023-01-23 12:33:31
64	Add column created_by in dashboard - v2	alter table `dashboard` ADD COLUMN `created_by` INTEGER NULL 	1		2023-01-23 12:33:31
65	Add column gnetId in dashboard	alter table `dashboard` ADD COLUMN `gnet_id` INTEGER NULL 	1		2023-01-23 12:33:31
66	Add index for gnetId in dashboard	CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);	1		2023-01-23 12:33:31
67	Add column plugin_id in dashboard	alter table `dashboard` ADD COLUMN `plugin_id` TEXT NULL 	1		2023-01-23 12:33:31
68	Add index for plugin_id in dashboard	CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);	1		2023-01-23 12:33:31
69	Add index for dashboard_id in dashboard_tag	CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);	1		2023-01-23 12:33:31
70	Update dashboard table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
71	Update dashboard_tag table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
72	Add column folder_id in dashboard	alter table `dashboard` ADD COLUMN `folder_id` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
73	Add column isFolder in dashboard	alter table `dashboard` ADD COLUMN `is_folder` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
74	Add column has_acl in dashboard	alter table `dashboard` ADD COLUMN `has_acl` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
75	Add column uid in dashboard	alter table `dashboard` ADD COLUMN `uid` TEXT NULL 	1		2023-01-23 12:33:31
76	Update uid column values in dashboard	UPDATE dashboard SET uid=printf('%09d',id) WHERE uid IS NULL;	1		2023-01-23 12:33:31
77	Add unique index dashboard_org_id_uid	CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);	1		2023-01-23 12:33:31
78	Remove unique index org_id_slug	DROP INDEX `UQE_dashboard_org_id_slug`	1		2023-01-23 12:33:31
79	Update dashboard title length	-- NOT REQUIRED	1		2023-01-23 12:33:31
80	Add unique index for dashboard_org_id_title_folder_id	CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);	1		2023-01-23 12:33:31
81	create dashboard_provisioning	CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NULL\n, `name` TEXT NOT NULL\n, `external_id` TEXT NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
82	Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1	ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`	1		2023-01-23 12:33:31
83	create dashboard_provisioning v2	CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NULL\n, `name` TEXT NOT NULL\n, `external_id` TEXT NOT NULL\n, `updated` INTEGER NOT NULL DEFAULT 0\n);	1		2023-01-23 12:33:31
84	create index IDX_dashboard_provisioning_dashboard_id - v2	CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);	1		2023-01-23 12:33:31
86	copy dashboard_provisioning v1 to v2	INSERT INTO `dashboard_provisioning` (`id`\n, `dashboard_id`\n, `name`\n, `external_id`) SELECT `id`\n, `dashboard_id`\n, `name`\n, `external_id` FROM `dashboard_provisioning_tmp_qwerty`	1		2023-01-23 12:33:31
87	drop dashboard_provisioning_tmp_qwerty	DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`	1		2023-01-23 12:33:31
88	Add check_sum column	alter table `dashboard_provisioning` ADD COLUMN `check_sum` TEXT NULL 	1		2023-01-23 12:33:31
89	Add index for dashboard_title	CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`);	1		2023-01-23 12:33:31
90	delete tags for deleted dashboards	DELETE FROM dashboard_tag WHERE dashboard_id NOT IN (SELECT id FROM dashboard)	1		2023-01-23 12:33:31
91	delete stars for deleted dashboards	DELETE FROM star WHERE dashboard_id NOT IN (SELECT id FROM dashboard)	1		2023-01-23 12:33:31
92	Add index for dashboard_is_folder	CREATE INDEX `IDX_dashboard_is_folder` ON `dashboard` (`is_folder`);	1		2023-01-23 12:33:31
93	create data_source table	CREATE TABLE IF NOT EXISTS `data_source` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `account_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `name` TEXT NOT NULL\n, `access` TEXT NOT NULL\n, `url` TEXT NOT NULL\n, `password` TEXT NULL\n, `user` TEXT NULL\n, `database` TEXT NULL\n, `basic_auth` INTEGER NOT NULL\n, `basic_auth_user` TEXT NULL\n, `basic_auth_password` TEXT NULL\n, `is_default` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
94	add index data_source.account_id	CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);	1		2023-01-23 12:33:31
95	add unique index data_source.account_id_name	CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);	1		2023-01-23 12:33:31
96	drop index IDX_data_source_account_id - v1	DROP INDEX `IDX_data_source_account_id`	1		2023-01-23 12:33:31
97	drop index UQE_data_source_account_id_name - v1	DROP INDEX `UQE_data_source_account_id_name`	1		2023-01-23 12:33:31
98	Rename table data_source to data_source_v1 - v1	ALTER TABLE `data_source` RENAME TO `data_source_v1`	1		2023-01-23 12:33:31
99	create data_source table v2	CREATE TABLE IF NOT EXISTS `data_source` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `name` TEXT NOT NULL\n, `access` TEXT NOT NULL\n, `url` TEXT NOT NULL\n, `password` TEXT NULL\n, `user` TEXT NULL\n, `database` TEXT NULL\n, `basic_auth` INTEGER NOT NULL\n, `basic_auth_user` TEXT NULL\n, `basic_auth_password` TEXT NULL\n, `is_default` INTEGER NOT NULL\n, `json_data` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
100	create index IDX_data_source_org_id - v2	CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);	1		2023-01-23 12:33:31
101	create index UQE_data_source_org_id_name - v2	CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);	1		2023-01-23 12:33:31
102	copy data_source v1 to v2	INSERT INTO `data_source` (`basic_auth`\n, `id`\n, `version`\n, `access`\n, `basic_auth_user`\n, `basic_auth_password`\n, `is_default`\n, `created`\n, `updated`\n, `org_id`\n, `type`\n, `database`\n, `url`\n, `user`\n, `name`\n, `password`) SELECT `basic_auth`\n, `id`\n, `version`\n, `access`\n, `basic_auth_user`\n, `basic_auth_password`\n, `is_default`\n, `created`\n, `updated`\n, `account_id`\n, `type`\n, `database`\n, `url`\n, `user`\n, `name`\n, `password` FROM `data_source_v1`	1		2023-01-23 12:33:31
103	Drop old table data_source_v1 #2	DROP TABLE IF EXISTS `data_source_v1`	1		2023-01-23 12:33:31
104	Add column with_credentials	alter table `data_source` ADD COLUMN `with_credentials` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
105	Add secure json data column	alter table `data_source` ADD COLUMN `secure_json_data` TEXT NULL 	1		2023-01-23 12:33:31
106	Update data_source table charset	-- NOT REQUIRED	1		2023-01-23 12:33:31
107	Update initial version to 1	UPDATE data_source SET version = 1 WHERE version = 0	1		2023-01-23 12:33:31
108	Add read_only data column	alter table `data_source` ADD COLUMN `read_only` INTEGER NULL 	1		2023-01-23 12:33:31
109	Migrate logging ds to loki ds	UPDATE data_source SET type = 'loki' WHERE type = 'logging'	1		2023-01-23 12:33:31
110	Update json_data with nulls	UPDATE data_source SET json_data = '{}' WHERE json_data is null	1		2023-01-23 12:33:31
111	Add uid column	alter table `data_source` ADD COLUMN `uid` TEXT NOT NULL DEFAULT 0 	1		2023-01-23 12:33:31
112	Update uid value	UPDATE data_source SET uid=printf('%09d',id);	1		2023-01-23 12:33:31
113	Add unique index datasource_org_id_uid	CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`);	1		2023-01-23 12:33:31
114	add unique index datasource_org_id_is_default	CREATE INDEX `IDX_data_source_org_id_is_default` ON `data_source` (`org_id`,`is_default`);	1		2023-01-23 12:33:31
115	create api_key table	CREATE TABLE IF NOT EXISTS `api_key` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `account_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `role` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:31
116	add index api_key.account_id	CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);	1		2023-01-23 12:33:31
117	add index api_key.key	CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);	1		2023-01-23 12:33:31
118	add index api_key.account_id_name	CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);	1		2023-01-23 12:33:31
119	drop index IDX_api_key_account_id - v1	DROP INDEX `IDX_api_key_account_id`	1		2023-01-23 12:33:31
120	drop index UQE_api_key_key - v1	DROP INDEX `UQE_api_key_key`	1		2023-01-23 12:33:31
121	drop index UQE_api_key_account_id_name - v1	DROP INDEX `UQE_api_key_account_id_name`	1		2023-01-23 12:33:31
122	Rename table api_key to api_key_v1 - v1	ALTER TABLE `api_key` RENAME TO `api_key_v1`	1		2023-01-23 12:33:31
123	create api_key table v2	CREATE TABLE IF NOT EXISTS `api_key` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `role` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
124	create index IDX_api_key_org_id - v2	CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);	1		2023-01-23 12:33:32
125	create index UQE_api_key_key - v2	CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);	1		2023-01-23 12:33:32
126	create index UQE_api_key_org_id_name - v2	CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);	1		2023-01-23 12:33:32
127	copy api_key v1 to v2	INSERT INTO `api_key` (`key`\n, `role`\n, `created`\n, `updated`\n, `id`\n, `org_id`\n, `name`) SELECT `key`\n, `role`\n, `created`\n, `updated`\n, `id`\n, `account_id`\n, `name` FROM `api_key_v1`	1		2023-01-23 12:33:32
128	Drop old table api_key_v1	DROP TABLE IF EXISTS `api_key_v1`	1		2023-01-23 12:33:32
129	Update api_key table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
130	Add expires to api_key table	alter table `api_key` ADD COLUMN `expires` INTEGER NULL 	1		2023-01-23 12:33:32
131	Add service account foreign key	alter table `api_key` ADD COLUMN `service_account_id` INTEGER NULL 	1		2023-01-23 12:33:32
132	create dashboard_snapshot table v4	CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `dashboard` TEXT NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
133	drop table dashboard_snapshot_v4 #1	DROP TABLE IF EXISTS `dashboard_snapshot`	1		2023-01-23 12:33:32
134	create dashboard_snapshot table v5 #2	CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `delete_key` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `external` INTEGER NOT NULL\n, `external_url` TEXT NOT NULL\n, `dashboard` TEXT NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
135	create index UQE_dashboard_snapshot_key - v5	CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);	1		2023-01-23 12:33:32
136	create index UQE_dashboard_snapshot_delete_key - v5	CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);	1		2023-01-23 12:33:32
137	create index IDX_dashboard_snapshot_user_id - v5	CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);	1		2023-01-23 12:33:32
138	alter dashboard_snapshot to mediumtext v2	SELECT 0;	1		2023-01-23 12:33:32
139	Update dashboard_snapshot table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
140	Add column external_delete_url to dashboard_snapshots table	alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` TEXT NULL 	1		2023-01-23 12:33:32
141	Add encrypted dashboard json column	alter table `dashboard_snapshot` ADD COLUMN `dashboard_encrypted` BLOB NULL 	1		2023-01-23 12:33:32
142	Change dashboard_encrypted column to MEDIUMBLOB	SELECT 0;	1		2023-01-23 12:33:32
143	create quota table v1	CREATE TABLE IF NOT EXISTS `quota` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NULL\n, `user_id` INTEGER NULL\n, `target` TEXT NOT NULL\n, `limit` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
144	create index UQE_quota_org_id_user_id_target - v1	CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);	1		2023-01-23 12:33:32
145	Update quota table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
146	create plugin_setting table	CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NULL\n, `plugin_id` TEXT NOT NULL\n, `enabled` INTEGER NOT NULL\n, `pinned` INTEGER NOT NULL\n, `json_data` TEXT NULL\n, `secure_json_data` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
147	create index UQE_plugin_setting_org_id_plugin_id - v1	CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);	1		2023-01-23 12:33:32
148	Add column plugin_version to plugin_settings	alter table `plugin_setting` ADD COLUMN `plugin_version` TEXT NULL 	1		2023-01-23 12:33:32
149	Update plugin_setting table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
150	create session table	CREATE TABLE IF NOT EXISTS `session` (\n`key` TEXT PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
151	Drop old table playlist table	DROP TABLE IF EXISTS `playlist`	1		2023-01-23 12:33:32
152	Drop old table playlist_item table	DROP TABLE IF EXISTS `playlist_item`	1		2023-01-23 12:33:32
153	create playlist table v2	CREATE TABLE IF NOT EXISTS `playlist` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `interval` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
154	create playlist item table v2	CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `playlist_id` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `value` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `order` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
155	Update playlist table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
156	Update playlist_item table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
157	drop preferences table v2	DROP TABLE IF EXISTS `preferences`	1		2023-01-23 12:33:32
158	drop preferences table v3	DROP TABLE IF EXISTS `preferences`	1		2023-01-23 12:33:32
159	create preferences table v3	CREATE TABLE IF NOT EXISTS `preferences` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `home_dashboard_id` INTEGER NOT NULL\n, `timezone` TEXT NOT NULL\n, `theme` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
160	Update preferences table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
161	Add column team_id in preferences	alter table `preferences` ADD COLUMN `team_id` INTEGER NULL 	1		2023-01-23 12:33:32
162	Update team_id column values in preferences	UPDATE preferences SET team_id=0 WHERE team_id IS NULL;	1		2023-01-23 12:33:32
163	Add column week_start in preferences	alter table `preferences` ADD COLUMN `week_start` TEXT NULL 	1		2023-01-23 12:33:32
164	create alert table v1	CREATE TABLE IF NOT EXISTS `alert` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `panel_id` INTEGER NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `message` TEXT NOT NULL\n, `state` TEXT NOT NULL\n, `settings` TEXT NOT NULL\n, `frequency` INTEGER NOT NULL\n, `handler` INTEGER NOT NULL\n, `severity` TEXT NOT NULL\n, `silenced` INTEGER NOT NULL\n, `execution_error` TEXT NOT NULL\n, `eval_data` TEXT NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
165	add index alert org_id & id 	CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);	1		2023-01-23 12:33:32
166	add index alert state	CREATE INDEX `IDX_alert_state` ON `alert` (`state`);	1		2023-01-23 12:33:32
167	add index alert dashboard_id	CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);	1		2023-01-23 12:33:32
168	Create alert_rule_tag table v1	CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
169	Add unique index alert_rule_tag.alert_id_tag_id	CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);	1		2023-01-23 12:33:32
170	drop index UQE_alert_rule_tag_alert_id_tag_id - v1	DROP INDEX `UQE_alert_rule_tag_alert_id_tag_id`	1		2023-01-23 12:33:32
171	Rename table alert_rule_tag to alert_rule_tag_v1 - v1	ALTER TABLE `alert_rule_tag` RENAME TO `alert_rule_tag_v1`	1		2023-01-23 12:33:32
172	Create alert_rule_tag table v2	CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `alert_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
173	create index UQE_alert_rule_tag_alert_id_tag_id - Add unique index alert_rule_tag.alert_id_tag_id V2	CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);	1		2023-01-23 12:33:32
174	copy alert_rule_tag v1 to v2	INSERT INTO `alert_rule_tag` (`alert_id`\n, `tag_id`) SELECT `alert_id`\n, `tag_id` FROM `alert_rule_tag_v1`	1		2023-01-23 12:33:32
175	drop table alert_rule_tag_v1	DROP TABLE IF EXISTS `alert_rule_tag_v1`	1		2023-01-23 12:33:32
176	create alert_notification table v1	CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `type` TEXT NOT NULL\n, `settings` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
177	Add column is_default	alter table `alert_notification` ADD COLUMN `is_default` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
178	Add column frequency	alter table `alert_notification` ADD COLUMN `frequency` INTEGER NULL 	1		2023-01-23 12:33:32
179	Add column send_reminder	alter table `alert_notification` ADD COLUMN `send_reminder` INTEGER NULL DEFAULT 0 	1		2023-01-23 12:33:32
180	Add column disable_resolve_message	alter table `alert_notification` ADD COLUMN `disable_resolve_message` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
181	add index alert_notification org_id & name	CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);	1		2023-01-23 12:33:32
182	Update alert table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
183	Update alert_notification table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
184	create notification_journal table v1	CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alert_id` INTEGER NOT NULL\n, `notifier_id` INTEGER NOT NULL\n, `sent_at` INTEGER NOT NULL\n, `success` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
185	add index notification_journal org_id & alert_id & notifier_id	CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);	1		2023-01-23 12:33:32
186	drop alert_notification_journal	DROP TABLE IF EXISTS `alert_notification_journal`	1		2023-01-23 12:33:32
187	create alert_notification_state table v1	CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alert_id` INTEGER NOT NULL\n, `notifier_id` INTEGER NOT NULL\n, `state` TEXT NOT NULL\n, `version` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n, `alert_rule_state_updated_version` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
188	add index alert_notification_state org_id & alert_id & notifier_id	CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);	1		2023-01-23 12:33:32
189	Add for to alert table	alter table `alert` ADD COLUMN `for` INTEGER NULL 	1		2023-01-23 12:33:32
190	Add column uid in alert_notification	alter table `alert_notification` ADD COLUMN `uid` TEXT NULL 	1		2023-01-23 12:33:32
191	Update uid column values in alert_notification	UPDATE alert_notification SET uid=printf('%09d',id) WHERE uid IS NULL;	1		2023-01-23 12:33:32
192	Add unique index alert_notification_org_id_uid	CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);	1		2023-01-23 12:33:32
193	Remove unique index org_id_name	DROP INDEX `UQE_alert_notification_org_id_name`	1		2023-01-23 12:33:32
194	Add column secure_settings in alert_notification	alter table `alert_notification` ADD COLUMN `secure_settings` TEXT NULL 	1		2023-01-23 12:33:32
195	alter alert.settings to mediumtext	SELECT 0;	1		2023-01-23 12:33:32
196	Add non-unique index alert_notification_state_alert_id	CREATE INDEX `IDX_alert_notification_state_alert_id` ON `alert_notification_state` (`alert_id`);	1		2023-01-23 12:33:32
197	Add non-unique index alert_rule_tag_alert_id	CREATE INDEX `IDX_alert_rule_tag_alert_id` ON `alert_rule_tag` (`alert_id`);	1		2023-01-23 12:33:32
198	Drop old annotation table v4	DROP TABLE IF EXISTS `annotation`	1		2023-01-23 12:33:32
199	create annotation table v5	CREATE TABLE IF NOT EXISTS `annotation` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alert_id` INTEGER NULL\n, `user_id` INTEGER NULL\n, `dashboard_id` INTEGER NULL\n, `panel_id` INTEGER NULL\n, `category_id` INTEGER NULL\n, `type` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `text` TEXT NOT NULL\n, `metric` TEXT NULL\n, `prev_state` TEXT NOT NULL\n, `new_state` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `epoch` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
200	add index annotation 0 v3	CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);	1		2023-01-23 12:33:32
201	add index annotation 1 v3	CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);	1		2023-01-23 12:33:32
202	add index annotation 2 v3	CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);	1		2023-01-23 12:33:32
203	add index annotation 3 v3	CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);	1		2023-01-23 12:33:32
204	add index annotation 4 v3	CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);	1		2023-01-23 12:33:32
205	Update annotation table charset	-- NOT REQUIRED	1		2023-01-23 12:33:32
206	Add column region_id to annotation table	alter table `annotation` ADD COLUMN `region_id` INTEGER NULL DEFAULT 0 	1		2023-01-23 12:33:32
207	Drop category_id index	DROP INDEX `IDX_annotation_org_id_category_id`	1		2023-01-23 12:33:32
208	Add column tags to annotation table	alter table `annotation` ADD COLUMN `tags` TEXT NULL 	1		2023-01-23 12:33:32
209	Create annotation_tag table v2	CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
210	Add unique index annotation_tag.annotation_id_tag_id	CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);	1		2023-01-23 12:33:32
211	drop index UQE_annotation_tag_annotation_id_tag_id - v2	DROP INDEX `UQE_annotation_tag_annotation_id_tag_id`	1		2023-01-23 12:33:32
212	Rename table annotation_tag to annotation_tag_v2 - v2	ALTER TABLE `annotation_tag` RENAME TO `annotation_tag_v2`	1		2023-01-23 12:33:32
213	Create annotation_tag table v3	CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `annotation_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
214	create index UQE_annotation_tag_annotation_id_tag_id - Add unique index annotation_tag.annotation_id_tag_id V3	CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);	1		2023-01-23 12:33:32
215	copy annotation_tag v2 to v3	INSERT INTO `annotation_tag` (`annotation_id`\n, `tag_id`) SELECT `annotation_id`\n, `tag_id` FROM `annotation_tag_v2`	1		2023-01-23 12:33:32
216	drop table annotation_tag_v2	DROP TABLE IF EXISTS `annotation_tag_v2`	1		2023-01-23 12:33:32
217	Update alert annotations and set TEXT to empty	UPDATE annotation SET TEXT = '' WHERE alert_id > 0	1		2023-01-23 12:33:32
218	Add created time to annotation table	alter table `annotation` ADD COLUMN `created` INTEGER NULL DEFAULT 0 	1		2023-01-23 12:33:32
219	Add updated time to annotation table	alter table `annotation` ADD COLUMN `updated` INTEGER NULL DEFAULT 0 	1		2023-01-23 12:33:32
220	Add index for created in annotation table	CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);	1		2023-01-23 12:33:32
221	Add index for updated in annotation table	CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);	1		2023-01-23 12:33:32
222	Convert existing annotations from seconds to milliseconds	UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999	1		2023-01-23 12:33:32
223	Add epoch_end column	alter table `annotation` ADD COLUMN `epoch_end` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
224	Add index for epoch_end	CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);	1		2023-01-23 12:33:32
225	Make epoch_end the same as epoch	UPDATE annotation SET epoch_end = epoch	1		2023-01-23 12:33:32
226	Move region to single row	code migration	1		2023-01-23 12:33:32
227	Remove index org_id_epoch from annotation table	DROP INDEX `IDX_annotation_org_id_epoch`	1		2023-01-23 12:33:32
228	Remove index org_id_dashboard_id_panel_id_epoch from annotation table	DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch`	1		2023-01-23 12:33:32
229	Add index for org_id_dashboard_id_epoch_end_epoch on annotation table	CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);	1		2023-01-23 12:33:32
230	Add index for org_id_epoch_end_epoch on annotation table	CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);	1		2023-01-23 12:33:32
231	Remove index org_id_epoch_epoch_end from annotation table	DROP INDEX `IDX_annotation_org_id_epoch_epoch_end`	1		2023-01-23 12:33:32
232	Add index for alert_id on annotation table	CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);	1		2023-01-23 12:33:32
233	create test_data table	CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `metric1` TEXT NULL\n, `metric2` TEXT NULL\n, `value_big_int` INTEGER NULL\n, `value_double` REAL NULL\n, `value_float` REAL NULL\n, `value_int` INTEGER NULL\n, `time_epoch` INTEGER NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
234	create dashboard_version table v1	CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `parent_version` INTEGER NOT NULL\n, `restored_from` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n, `message` TEXT NOT NULL\n, `data` TEXT NOT NULL\n);	1		2023-01-23 12:33:32
235	add index dashboard_version.dashboard_id	CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);	1		2023-01-23 12:33:32
236	add unique index dashboard_version.dashboard_id and dashboard_version.version	CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);	1		2023-01-23 12:33:32
237	Set dashboard version to 1 where 0	UPDATE dashboard SET version = 1 WHERE version = 0	1		2023-01-23 12:33:32
238	save existing dashboard data in dashboard_version table v1	INSERT INTO dashboard_version\n(\n\tdashboard_id,\n\tversion,\n\tparent_version,\n\trestored_from,\n\tcreated,\n\tcreated_by,\n\tmessage,\n\tdata\n)\nSELECT\n\tdashboard.id,\n\tdashboard.version,\n\tdashboard.version,\n\tdashboard.version,\n\tdashboard.updated,\n\tCOALESCE(dashboard.updated_by, -1),\n\t'',\n\tdashboard.data\nFROM dashboard;	1		2023-01-23 12:33:32
239	alter dashboard_version.data to mediumtext v1	SELECT 0;	1		2023-01-23 12:33:32
240	create team table	CREATE TABLE IF NOT EXISTS `team` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
241	add index team.org_id	CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);	1		2023-01-23 12:33:32
242	add unique index team_org_id_name	CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);	1		2023-01-23 12:33:32
243	create team member table	CREATE TABLE IF NOT EXISTS `team_member` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `team_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
244	add index team_member.org_id	CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);	1		2023-01-23 12:33:32
245	add unique index team_member_org_id_team_id_user_id	CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);	1		2023-01-23 12:33:32
246	add index team_member.team_id	CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`);	1		2023-01-23 12:33:32
247	Add column email to team table	alter table `team` ADD COLUMN `email` TEXT NULL 	1		2023-01-23 12:33:32
248	Add column external to team_member table	alter table `team_member` ADD COLUMN `external` INTEGER NULL 	1		2023-01-23 12:33:32
249	Add column permission to team_member table	alter table `team_member` ADD COLUMN `permission` INTEGER NULL 	1		2023-01-23 12:33:32
250	create dashboard acl table	CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `user_id` INTEGER NULL\n, `team_id` INTEGER NULL\n, `permission` INTEGER NOT NULL DEFAULT 4\n, `role` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
251	add index dashboard_acl_dashboard_id	CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);	1		2023-01-23 12:33:32
252	add unique index dashboard_acl_dashboard_id_user_id	CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);	1		2023-01-23 12:33:32
253	add unique index dashboard_acl_dashboard_id_team_id	CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);	1		2023-01-23 12:33:32
254	add index dashboard_acl_user_id	CREATE INDEX `IDX_dashboard_acl_user_id` ON `dashboard_acl` (`user_id`);	1		2023-01-23 12:33:32
255	add index dashboard_acl_team_id	CREATE INDEX `IDX_dashboard_acl_team_id` ON `dashboard_acl` (`team_id`);	1		2023-01-23 12:33:32
256	add index dashboard_acl_org_id_role	CREATE INDEX `IDX_dashboard_acl_org_id_role` ON `dashboard_acl` (`org_id`,`role`);	1		2023-01-23 12:33:32
257	add index dashboard_permission	CREATE INDEX `IDX_dashboard_acl_permission` ON `dashboard_acl` (`permission`);	1		2023-01-23 12:33:32
258	save default acl rules in dashboard_acl table	\nINSERT INTO dashboard_acl\n\t(\n\t\torg_id,\n\t\tdashboard_id,\n\t\tpermission,\n\t\trole,\n\t\tcreated,\n\t\tupdated\n\t)\n\tVALUES\n\t\t(-1,-1, 1,'Viewer','2017-06-20','2017-06-20'),\n\t\t(-1,-1, 2,'Editor','2017-06-20','2017-06-20')\n\t	1		2023-01-23 12:33:32
259	delete acl rules for deleted dashboards and folders	DELETE FROM dashboard_acl WHERE dashboard_id NOT IN (SELECT id FROM dashboard) AND dashboard_id != -1	1		2023-01-23 12:33:32
260	create tag table	CREATE TABLE IF NOT EXISTS `tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `key` TEXT NOT NULL\n, `value` TEXT NOT NULL\n);	1		2023-01-23 12:33:32
261	add index tag.key_value	CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);	1		2023-01-23 12:33:32
262	create login attempt table	CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `username` TEXT NOT NULL\n, `ip_address` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
263	add index login_attempt.username	CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);	1		2023-01-23 12:33:32
264	drop index IDX_login_attempt_username - v1	DROP INDEX `IDX_login_attempt_username`	1		2023-01-23 12:33:32
265	Rename table login_attempt to login_attempt_tmp_qwerty - v1	ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`	1		2023-01-23 12:33:32
266	create login_attempt v2	CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `username` TEXT NOT NULL\n, `ip_address` TEXT NOT NULL\n, `created` INTEGER NOT NULL DEFAULT 0\n);	1		2023-01-23 12:33:32
267	create index IDX_login_attempt_username - v2	CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);	1		2023-01-23 12:33:32
268	copy login_attempt v1 to v2	INSERT INTO `login_attempt` (`ip_address`\n, `id`\n, `username`) SELECT `ip_address`\n, `id`\n, `username` FROM `login_attempt_tmp_qwerty`	1		2023-01-23 12:33:32
269	drop login_attempt_tmp_qwerty	DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`	1		2023-01-23 12:33:32
270	create user auth table	CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `auth_module` TEXT NOT NULL\n, `auth_id` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
271	create index IDX_user_auth_auth_module_auth_id - v1	CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);	1		2023-01-23 12:33:32
272	alter user_auth.auth_id to length 190	SELECT 0;	1		2023-01-23 12:33:32
273	Add OAuth access token to user_auth	alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT NULL 	1		2023-01-23 12:33:32
274	Add OAuth refresh token to user_auth	alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT NULL 	1		2023-01-23 12:33:32
275	Add OAuth token type to user_auth	alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT NULL 	1		2023-01-23 12:33:32
276	Add OAuth expiry to user_auth	alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL 	1		2023-01-23 12:33:32
277	Add index to user_id column in user_auth	CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);	1		2023-01-23 12:33:32
278	create server_lock table	CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `operation_uid` TEXT NOT NULL\n, `version` INTEGER NOT NULL\n, `last_execution` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
279	add index server_lock.operation_uid	CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);	1		2023-01-23 12:33:32
280	create user auth token table	CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `auth_token` TEXT NOT NULL\n, `prev_auth_token` TEXT NOT NULL\n, `user_agent` TEXT NOT NULL\n, `client_ip` TEXT NOT NULL\n, `auth_token_seen` INTEGER NOT NULL\n, `seen_at` INTEGER NULL\n, `rotated_at` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
281	add unique index user_auth_token.auth_token	CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);	1		2023-01-23 12:33:32
282	add unique index user_auth_token.prev_auth_token	CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);	1		2023-01-23 12:33:32
283	add index user_auth_token.user_id	CREATE INDEX `IDX_user_auth_token_user_id` ON `user_auth_token` (`user_id`);	1		2023-01-23 12:33:32
284	Add revoked_at to the user auth token	alter table `user_auth_token` ADD COLUMN `revoked_at` INTEGER NULL 	1		2023-01-23 12:33:32
285	create cache_data table	CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` TEXT PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
286	add unique index cache_data.cache_key	CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);	1		2023-01-23 12:33:32
287	create short_url table v1	CREATE TABLE IF NOT EXISTS `short_url` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `path` TEXT NOT NULL\n, `created_by` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n, `last_seen_at` INTEGER NULL\n);	1		2023-01-23 12:33:32
288	add index short_url.org_id-uid	CREATE UNIQUE INDEX `UQE_short_url_org_id_uid` ON `short_url` (`org_id`,`uid`);	1		2023-01-23 12:33:32
289	delete alert_definition table	DROP TABLE IF EXISTS `alert_definition`	1		2023-01-23 12:33:32
290	recreate alert_definition table	CREATE TABLE IF NOT EXISTS `alert_definition` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` INTEGER NOT NULL DEFAULT 60\n, `version` INTEGER NOT NULL DEFAULT 0\n, `uid` TEXT NOT NULL DEFAULT 0\n);	1		2023-01-23 12:33:32
291	add index in alert_definition on org_id and title columns	CREATE INDEX `IDX_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);	1		2023-01-23 12:33:32
292	add index in alert_definition on org_id and uid columns	CREATE INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);	1		2023-01-23 12:33:32
293	alter alert_definition table data column to mediumtext in mysql	SELECT 0;	1		2023-01-23 12:33:32
294	drop index in alert_definition on org_id and title columns	DROP INDEX `IDX_alert_definition_org_id_title`	1		2023-01-23 12:33:32
295	drop index in alert_definition on org_id and uid columns	DROP INDEX `IDX_alert_definition_org_id_uid`	1		2023-01-23 12:33:32
296	add unique index in alert_definition on org_id and title columns	CREATE UNIQUE INDEX `UQE_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);	1		2023-01-23 12:33:32
297	add unique index in alert_definition on org_id and uid columns	CREATE UNIQUE INDEX `UQE_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);	1		2023-01-23 12:33:32
298	Add column paused in alert_definition	alter table `alert_definition` ADD COLUMN `paused` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
299	drop alert_definition table	DROP TABLE IF EXISTS `alert_definition`	1		2023-01-23 12:33:32
300	delete alert_definition_version table	DROP TABLE IF EXISTS `alert_definition_version`	1		2023-01-23 12:33:32
301	recreate alert_definition_version table	CREATE TABLE IF NOT EXISTS `alert_definition_version` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `alert_definition_id` INTEGER NOT NULL\n, `alert_definition_uid` TEXT NOT NULL DEFAULT 0\n, `parent_version` INTEGER NOT NULL\n, `restored_from` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `interval_seconds` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
302	add index in alert_definition_version table on alert_definition_id and version columns	CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_id_version` ON `alert_definition_version` (`alert_definition_id`,`version`);	1		2023-01-23 12:33:32
303	add index in alert_definition_version table on alert_definition_uid and version columns	CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_uid_version` ON `alert_definition_version` (`alert_definition_uid`,`version`);	1		2023-01-23 12:33:32
304	alter alert_definition_version table data column to mediumtext in mysql	SELECT 0;	1		2023-01-23 12:33:32
305	drop alert_definition_version table	DROP TABLE IF EXISTS `alert_definition_version`	1		2023-01-23 12:33:32
306	create alert_instance table	CREATE TABLE IF NOT EXISTS `alert_instance` (\n`def_org_id` INTEGER NOT NULL\n, `def_uid` TEXT NOT NULL DEFAULT 0\n, `labels` TEXT NOT NULL\n, `labels_hash` TEXT NOT NULL\n, `current_state` TEXT NOT NULL\n, `current_state_since` INTEGER NOT NULL\n, `last_eval_time` INTEGER NOT NULL\n, PRIMARY KEY ( `def_org_id`,`def_uid`,`labels_hash` ));	1		2023-01-23 12:33:32
307	add index in alert_instance table on def_org_id, def_uid and current_state columns	CREATE INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance` (`def_org_id`,`def_uid`,`current_state`);	1		2023-01-23 12:33:32
308	add index in alert_instance table on def_org_id, current_state columns	CREATE INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance` (`def_org_id`,`current_state`);	1		2023-01-23 12:33:32
309	add column current_state_end to alert_instance	alter table `alert_instance` ADD COLUMN `current_state_end` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
310	remove index def_org_id, def_uid, current_state on alert_instance	DROP INDEX `IDX_alert_instance_def_org_id_def_uid_current_state`	1		2023-01-23 12:33:32
311	remove index def_org_id, current_state on alert_instance	DROP INDEX `IDX_alert_instance_def_org_id_current_state`	1		2023-01-23 12:33:32
312	rename def_org_id to rule_org_id in alert_instance	ALTER TABLE alert_instance RENAME COLUMN def_org_id TO rule_org_id;	1		2023-01-23 12:33:32
313	rename def_uid to rule_uid in alert_instance	ALTER TABLE alert_instance RENAME COLUMN def_uid TO rule_uid;	1		2023-01-23 12:33:32
314	add index rule_org_id, rule_uid, current_state on alert_instance	CREATE INDEX `IDX_alert_instance_rule_org_id_rule_uid_current_state` ON `alert_instance` (`rule_org_id`,`rule_uid`,`current_state`);	1		2023-01-23 12:33:32
315	add index rule_org_id, current_state on alert_instance	CREATE INDEX `IDX_alert_instance_rule_org_id_current_state` ON `alert_instance` (`rule_org_id`,`current_state`);	1		2023-01-23 12:33:32
316	create alert_rule table	CREATE TABLE IF NOT EXISTS `alert_rule` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` INTEGER NOT NULL DEFAULT 60\n, `version` INTEGER NOT NULL DEFAULT 0\n, `uid` TEXT NOT NULL DEFAULT 0\n, `namespace_uid` TEXT NOT NULL\n, `rule_group` TEXT NOT NULL\n, `no_data_state` TEXT NOT NULL DEFAULT 'NoData'\n, `exec_err_state` TEXT NOT NULL DEFAULT 'Alerting'\n);	1		2023-01-23 12:33:32
317	add index in alert_rule on org_id and title columns	CREATE UNIQUE INDEX `UQE_alert_rule_org_id_title` ON `alert_rule` (`org_id`,`title`);	1		2023-01-23 12:33:32
318	add index in alert_rule on org_id and uid columns	CREATE UNIQUE INDEX `UQE_alert_rule_org_id_uid` ON `alert_rule` (`org_id`,`uid`);	1		2023-01-23 12:33:32
319	add index in alert_rule on org_id, namespace_uid, group_uid columns	CREATE INDEX `IDX_alert_rule_org_id_namespace_uid_rule_group` ON `alert_rule` (`org_id`,`namespace_uid`,`rule_group`);	1		2023-01-23 12:33:32
320	alter alert_rule table data column to mediumtext in mysql	SELECT 0;	1		2023-01-23 12:33:32
321	add column for to alert_rule	alter table `alert_rule` ADD COLUMN `for` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
322	add column annotations to alert_rule	alter table `alert_rule` ADD COLUMN `annotations` TEXT NULL 	1		2023-01-23 12:33:32
323	add column labels to alert_rule	alter table `alert_rule` ADD COLUMN `labels` TEXT NULL 	1		2023-01-23 12:33:32
324	remove unique index from alert_rule on org_id, title columns	DROP INDEX `UQE_alert_rule_org_id_title`	1		2023-01-23 12:33:32
325	add index in alert_rule on org_id, namespase_uid and title columns	CREATE UNIQUE INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule` (`org_id`,`namespace_uid`,`title`);	1		2023-01-23 12:33:32
326	add dashboard_uid column to alert_rule	alter table `alert_rule` ADD COLUMN `dashboard_uid` TEXT NULL 	1		2023-01-23 12:33:32
327	add panel_id column to alert_rule	alter table `alert_rule` ADD COLUMN `panel_id` INTEGER NULL 	1		2023-01-23 12:33:32
328	add index in alert_rule on org_id, dashboard_uid and panel_id columns	CREATE INDEX `IDX_alert_rule_org_id_dashboard_uid_panel_id` ON `alert_rule` (`org_id`,`dashboard_uid`,`panel_id`);	1		2023-01-23 12:33:32
363	create team role table	CREATE TABLE IF NOT EXISTS `team_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `team_id` INTEGER NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
364	add index team_role.org_id	CREATE INDEX `IDX_team_role_org_id` ON `team_role` (`org_id`);	1		2023-01-23 12:33:32
329	create alert_rule_version table	CREATE TABLE IF NOT EXISTS `alert_rule_version` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `rule_org_id` INTEGER NOT NULL\n, `rule_uid` TEXT NOT NULL DEFAULT 0\n, `rule_namespace_uid` TEXT NOT NULL\n, `rule_group` TEXT NOT NULL\n, `parent_version` INTEGER NOT NULL\n, `restored_from` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `interval_seconds` INTEGER NOT NULL\n, `no_data_state` TEXT NOT NULL DEFAULT 'NoData'\n, `exec_err_state` TEXT NOT NULL DEFAULT 'Alerting'\n);	1		2023-01-23 12:33:32
330	add index in alert_rule_version table on rule_org_id, rule_uid and version columns	CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`version`);	1		2023-01-23 12:33:32
331	add index in alert_rule_version table on rule_org_id, rule_namespace_uid and rule_group columns	CREATE INDEX `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` ON `alert_rule_version` (`rule_org_id`,`rule_namespace_uid`,`rule_group`);	1		2023-01-23 12:33:32
332	alter alert_rule_version table data column to mediumtext in mysql	SELECT 0;	1		2023-01-23 12:33:32
333	add column for to alert_rule_version	alter table `alert_rule_version` ADD COLUMN `for` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
334	add column annotations to alert_rule_version	alter table `alert_rule_version` ADD COLUMN `annotations` TEXT NULL 	1		2023-01-23 12:33:32
335	add column labels to alert_rule_version	alter table `alert_rule_version` ADD COLUMN `labels` TEXT NULL 	1		2023-01-23 12:33:32
336	create_alert_configuration_table	CREATE TABLE IF NOT EXISTS `alert_configuration` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `alertmanager_configuration` TEXT NOT NULL\n, `configuration_version` TEXT NOT NULL\n, `created_at` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
337	Add column default in alert_configuration	alter table `alert_configuration` ADD COLUMN `default` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
338	alert alert_configuration alertmanager_configuration column from TEXT to MEDIUMTEXT if mysql	SELECT 0;	1		2023-01-23 12:33:32
339	add column org_id in alert_configuration	alter table `alert_configuration` ADD COLUMN `org_id` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
340	add index in alert_configuration table on org_id column	CREATE INDEX `IDX_alert_configuration_org_id` ON `alert_configuration` (`org_id`);	1		2023-01-23 12:33:32
341	create_ngalert_configuration_table	CREATE TABLE IF NOT EXISTS `ngalert_configuration` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alertmanagers` TEXT NULL\n, `created_at` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
342	add index in ngalert_configuration on org_id column	CREATE UNIQUE INDEX `UQE_ngalert_configuration_org_id` ON `ngalert_configuration` (`org_id`);	1		2023-01-23 12:33:32
343	move dashboard alerts to unified alerting	code migration	1		2023-01-23 12:33:32
344	create library_element table v1	CREATE TABLE IF NOT EXISTS `library_element` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `folder_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `name` TEXT NOT NULL\n, `kind` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `description` TEXT NOT NULL\n, `model` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
345	add index library_element org_id-folder_id-name-kind	CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_id_name_kind` ON `library_element` (`org_id`,`folder_id`,`name`,`kind`);	1		2023-01-23 12:33:32
346	create library_element_connection table v1	CREATE TABLE IF NOT EXISTS `library_element_connection` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `element_id` INTEGER NOT NULL\n, `kind` INTEGER NOT NULL\n, `connection_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n);	1		2023-01-23 12:33:32
347	add index library_element_connection element_id-kind-connection_id	CREATE UNIQUE INDEX `UQE_library_element_connection_element_id_kind_connection_id` ON `library_element_connection` (`element_id`,`kind`,`connection_id`);	1		2023-01-23 12:33:32
348	add unique index library_element org_id_uid	CREATE UNIQUE INDEX `UQE_library_element_org_id_uid` ON `library_element` (`org_id`,`uid`);	1		2023-01-23 12:33:32
349	clone move dashboard alerts to unified alerting	code migration	1		2023-01-23 12:33:32
350	create data_keys table	CREATE TABLE IF NOT EXISTS `data_keys` (\n`name` TEXT PRIMARY KEY NOT NULL\n, `active` INTEGER NOT NULL\n, `scope` TEXT NOT NULL\n, `provider` TEXT NOT NULL\n, `encrypted_data` BLOB NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
351	create kv_store table v1	CREATE TABLE IF NOT EXISTS `kv_store` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `namespace` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `value` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
352	add index kv_store.org_id-namespace-key	CREATE UNIQUE INDEX `UQE_kv_store_org_id_namespace_key` ON `kv_store` (`org_id`,`namespace`,`key`);	1		2023-01-23 12:33:32
353	update dashboard_uid and panel_id from existing annotations	set dashboard_uid and panel_id migration	1		2023-01-23 12:33:32
354	create permission table	CREATE TABLE IF NOT EXISTS `permission` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `role_id` INTEGER NOT NULL\n, `action` TEXT NOT NULL\n, `scope` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
355	add unique index permission.role_id	CREATE INDEX `IDX_permission_role_id` ON `permission` (`role_id`);	1		2023-01-23 12:33:32
356	add unique index role_id_action_scope	CREATE UNIQUE INDEX `UQE_permission_role_id_action_scope` ON `permission` (`role_id`,`action`,`scope`);	1		2023-01-23 12:33:32
357	create role table	CREATE TABLE IF NOT EXISTS `role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `description` TEXT NULL\n, `version` INTEGER NOT NULL\n, `org_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
358	add column display_name	alter table `role` ADD COLUMN `display_name` TEXT NULL 	1		2023-01-23 12:33:32
359	add column group_name	alter table `role` ADD COLUMN `group_name` TEXT NULL 	1		2023-01-23 12:33:32
360	add index role.org_id	CREATE INDEX `IDX_role_org_id` ON `role` (`org_id`);	1		2023-01-23 12:33:32
361	add unique index role_org_id_name	CREATE UNIQUE INDEX `UQE_role_org_id_name` ON `role` (`org_id`,`name`);	1		2023-01-23 12:33:32
362	add index role_org_id_uid	CREATE UNIQUE INDEX `UQE_role_org_id_uid` ON `role` (`org_id`,`uid`);	1		2023-01-23 12:33:32
365	add unique index team_role_org_id_team_id_role_id	CREATE UNIQUE INDEX `UQE_team_role_org_id_team_id_role_id` ON `team_role` (`org_id`,`team_id`,`role_id`);	1		2023-01-23 12:33:32
366	add index team_role.team_id	CREATE INDEX `IDX_team_role_team_id` ON `team_role` (`team_id`);	1		2023-01-23 12:33:32
367	create user role table	CREATE TABLE IF NOT EXISTS `user_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
368	add index user_role.org_id	CREATE INDEX `IDX_user_role_org_id` ON `user_role` (`org_id`);	1		2023-01-23 12:33:32
369	add unique index user_role_org_id_user_id_role_id	CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role` (`org_id`,`user_id`,`role_id`);	1		2023-01-23 12:33:32
370	add index user_role.user_id	CREATE INDEX `IDX_user_role_user_id` ON `user_role` (`user_id`);	1		2023-01-23 12:33:32
371	create builtin role table	CREATE TABLE IF NOT EXISTS `builtin_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `role` TEXT NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n);	1		2023-01-23 12:33:32
372	add index builtin_role.role_id	CREATE INDEX `IDX_builtin_role_role_id` ON `builtin_role` (`role_id`);	1		2023-01-23 12:33:32
373	add index builtin_role.name	CREATE INDEX `IDX_builtin_role_role` ON `builtin_role` (`role`);	1		2023-01-23 12:33:32
374	Add column org_id to builtin_role table	alter table `builtin_role` ADD COLUMN `org_id` INTEGER NOT NULL DEFAULT 0 	1		2023-01-23 12:33:32
375	add index builtin_role.org_id	CREATE INDEX `IDX_builtin_role_org_id` ON `builtin_role` (`org_id`);	1		2023-01-23 12:33:32
376	add unique index builtin_role_org_id_role_id_role	CREATE UNIQUE INDEX `UQE_builtin_role_org_id_role_id_role` ON `builtin_role` (`org_id`,`role_id`,`role`);	1		2023-01-23 12:33:32
377	Remove unique index role_org_id_uid	DROP INDEX `UQE_role_org_id_uid`	1		2023-01-23 12:33:32
378	add unique index role.uid	CREATE UNIQUE INDEX `UQE_role_uid` ON `role` (`uid`);	1		2023-01-23 12:33:32
379	create seed assignment table	CREATE TABLE IF NOT EXISTS `seed_assignment` (\n`builtin_role` TEXT NOT NULL\n, `role_name` TEXT NOT NULL\n);	1		2023-01-23 12:33:32
380	add unique index builtin_role_role_name	CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);	1		2023-01-23 12:33:32
\.


--
-- Data for Name: ngalert_configuration; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.ngalert_configuration (id, org_id, alertmanagers, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.org (id, version, name, address1, address2, city, state, zip_code, country, billing_email, created, updated) FROM stdin;
1	0	Main Org.							\N	2023-01-23 12:33:32	2023-01-23 12:33:32
\.


--
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.org_user (id, org_id, user_id, role, created, updated) FROM stdin;
1	1	1	Admin	2023-01-23 12:33:32	2023-01-23 12:33:32
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.permission (id, role_id, action, scope, created, updated) FROM stdin;
\.


--
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.playlist (id, name, "interval", org_id) FROM stdin;
\.


--
-- Data for Name: playlist_item; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.playlist_item (id, playlist_id, type, value, title, "order") FROM stdin;
\.


--
-- Data for Name: plugin_setting; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.plugin_setting (id, org_id, plugin_id, enabled, pinned, json_data, secure_json_data, created, updated, plugin_version) FROM stdin;
\.


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.preferences (id, org_id, user_id, version, home_dashboard_id, timezone, theme, created, updated, team_id, week_start) FROM stdin;
\.


--
-- Data for Name: quota; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.quota (id, org_id, user_id, target, "limit", created, updated) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.role (id, name, description, version, org_id, uid, created, updated, display_name, group_name) FROM stdin;
\.


--
-- Data for Name: seed_assignment; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.seed_assignment (builtin_role, role_name) FROM stdin;
\.


--
-- Data for Name: server_lock; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.server_lock (id, operation_uid, version, last_execution) FROM stdin;
1	cleanup expired auth tokens	1	1674477212
\N	delete old login attempts	0	0
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.session (key, data, expiry) FROM stdin;
\.


--
-- Data for Name: short_url; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.short_url (id, org_id, uid, path, created_by, created_at, last_seen_at) FROM stdin;
\.


--
-- Data for Name: sqlite_master; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.sqlite_master (type, name, tbl_name, rootpage, sql) FROM stdin;
table	migration_log	migration_log	2	CREATE TABLE `migration_log` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `migration_id` TEXT NOT NULL\n, `sql` TEXT NOT NULL\n, `success` INTEGER NOT NULL\n, `error` TEXT NOT NULL\n, `timestamp` DATETIME NOT NULL\n)
table	sqlite_sequence	sqlite_sequence	3	CREATE TABLE sqlite_sequence(name,seq)
table	user	user	6	CREATE TABLE `user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `login` TEXT NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `password` TEXT NULL\n, `salt` TEXT NULL\n, `rands` TEXT NULL\n, `company` TEXT NULL\n, `org_id` INTEGER NOT NULL\n, `is_admin` INTEGER NOT NULL\n, `email_verified` INTEGER NULL\n, `theme` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `help_flags1` INTEGER NOT NULL DEFAULT 0, `last_seen_at` DATETIME NULL, `is_disabled` INTEGER NOT NULL DEFAULT 0, `is_service_account` INTEGER NOT NULL DEFAULT 0)
index	UQE_user_login	user	5	CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`)
index	UQE_user_email	user	7	CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`)
index	IDX_user_login_email	user	4	CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`)
table	temp_user	temp_user	10	CREATE TABLE `temp_user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `email` TEXT NOT NULL\n, `name` TEXT NULL\n, `role` TEXT NULL\n, `code` TEXT NOT NULL\n, `status` TEXT NOT NULL\n, `invited_by_user_id` INTEGER NULL\n, `email_sent` INTEGER NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` TEXT NULL\n, `created` INTEGER NOT NULL DEFAULT 0\n, `updated` INTEGER NOT NULL DEFAULT 0\n)
index	IDX_temp_user_email	temp_user	11	CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`)
index	IDX_temp_user_org_id	temp_user	14	CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`)
index	IDX_temp_user_code	temp_user	9	CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`)
index	IDX_temp_user_status	temp_user	15	CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`)
table	star	star	8	CREATE TABLE `star` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n)
index	UQE_star_user_id_dashboard_id	star	16	CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`)
table	org	org	17	CREATE TABLE `org` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `address1` TEXT NULL\n, `address2` TEXT NULL\n, `city` TEXT NULL\n, `state` TEXT NULL\n, `zip_code` TEXT NULL\n, `country` TEXT NULL\n, `billing_email` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	UQE_org_name	org	18	CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`)
table	org_user	org_user	19	CREATE TABLE `org_user` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `role` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	IDX_org_user_org_id	org_user	20	CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`)
index	UQE_org_user_org_id_user_id	org_user	21	CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`)
index	IDX_org_user_user_id	org_user	22	CREATE INDEX `IDX_org_user_user_id` ON `org_user` (`user_id`)
table	dashboard_tag	dashboard_tag	28	CREATE TABLE `dashboard_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `term` TEXT NOT NULL\n)
table	dashboard	dashboard	30	CREATE TABLE `dashboard` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `slug` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` INTEGER NULL, `created_by` INTEGER NULL, `gnet_id` INTEGER NULL, `plugin_id` TEXT NULL, `folder_id` INTEGER NOT NULL DEFAULT 0, `is_folder` INTEGER NOT NULL DEFAULT 0, `has_acl` INTEGER NOT NULL DEFAULT 0, `uid` TEXT NULL)
index	IDX_dashboard_org_id	dashboard	31	CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`)
index	IDX_dashboard_gnet_id	dashboard	24	CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`)
index	IDX_dashboard_org_id_plugin_id	dashboard	25	CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`)
index	IDX_dashboard_tag_dashboard_id	dashboard_tag	26	CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`)
index	UQE_dashboard_org_id_uid	dashboard	34	CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`)
index	UQE_dashboard_org_id_folder_id_title	dashboard	32	CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`)
table	dashboard_provisioning	dashboard_provisioning	36	CREATE TABLE `dashboard_provisioning` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NULL\n, `name` TEXT NOT NULL\n, `external_id` TEXT NOT NULL\n, `updated` INTEGER NOT NULL DEFAULT 0\n, `check_sum` TEXT NULL)
index	IDX_dashboard_provisioning_dashboard_id	dashboard_provisioning	37	CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`)
index	IDX_dashboard_provisioning_dashboard_id_name	dashboard_provisioning	38	CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`)
index	IDX_dashboard_title	dashboard	35	CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`)
index	IDX_dashboard_is_folder	dashboard	39	CREATE INDEX `IDX_dashboard_is_folder` ON `dashboard` (`is_folder`)
table	data_source	data_source	42	CREATE TABLE `data_source` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `name` TEXT NOT NULL\n, `access` TEXT NOT NULL\n, `url` TEXT NOT NULL\n, `password` TEXT NULL\n, `user` TEXT NULL\n, `database` TEXT NULL\n, `basic_auth` INTEGER NOT NULL\n, `basic_auth_user` TEXT NULL\n, `basic_auth_password` TEXT NULL\n, `is_default` INTEGER NOT NULL\n, `json_data` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `with_credentials` INTEGER NOT NULL DEFAULT 0, `secure_json_data` TEXT NULL, `read_only` INTEGER NULL, `uid` TEXT NOT NULL DEFAULT 0)
index	IDX_data_source_org_id	data_source	43	CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`)
index	UQE_data_source_org_id_name	data_source	44	CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`)
index	UQE_data_source_org_id_uid	data_source	40	CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`)
index	IDX_data_source_org_id_is_default	data_source	45	CREATE INDEX `IDX_data_source_org_id_is_default` ON `data_source` (`org_id`,`is_default`)
table	api_key	api_key	49	CREATE TABLE `api_key` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `role` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `expires` INTEGER NULL, `service_account_id` INTEGER NULL)
index	IDX_api_key_org_id	api_key	47	CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`)
index	UQE_api_key_key	api_key	50	CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`)
index	UQE_api_key_org_id_name	api_key	52	CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`)
table	dashboard_snapshot	dashboard_snapshot	46	CREATE TABLE `dashboard_snapshot` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `delete_key` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `external` INTEGER NOT NULL\n, `external_url` TEXT NOT NULL\n, `dashboard` TEXT NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `external_delete_url` TEXT NULL, `dashboard_encrypted` BLOB NULL)
index	UQE_dashboard_snapshot_key	dashboard_snapshot	53	CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`)
index	UQE_dashboard_snapshot_delete_key	dashboard_snapshot	54	CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`)
index	IDX_dashboard_snapshot_user_id	dashboard_snapshot	55	CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`)
table	quota	quota	56	CREATE TABLE `quota` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NULL\n, `user_id` INTEGER NULL\n, `target` TEXT NOT NULL\n, `limit` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	UQE_quota_org_id_user_id_target	quota	57	CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`)
table	plugin_setting	plugin_setting	59	CREATE TABLE `plugin_setting` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NULL\n, `plugin_id` TEXT NOT NULL\n, `enabled` INTEGER NOT NULL\n, `pinned` INTEGER NOT NULL\n, `json_data` TEXT NULL\n, `secure_json_data` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `plugin_version` TEXT NULL)
index	UQE_plugin_setting_org_id_plugin_id	plugin_setting	60	CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`)
table	session	session	61	CREATE TABLE `session` (\n`key` TEXT PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER NOT NULL\n)
index	sqlite_autoindex_session_1	session	62	\N
table	playlist	playlist	63	CREATE TABLE `playlist` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `interval` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n)
table	playlist_item	playlist_item	64	CREATE TABLE `playlist_item` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `playlist_id` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `value` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `order` INTEGER NOT NULL\n)
table	preferences	preferences	65	CREATE TABLE `preferences` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `home_dashboard_id` INTEGER NOT NULL\n, `timezone` TEXT NOT NULL\n, `theme` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `team_id` INTEGER NULL, `week_start` TEXT NULL)
table	alert	alert	66	CREATE TABLE `alert` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `version` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `panel_id` INTEGER NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `message` TEXT NOT NULL\n, `state` TEXT NOT NULL\n, `settings` TEXT NOT NULL\n, `frequency` INTEGER NOT NULL\n, `handler` INTEGER NOT NULL\n, `severity` TEXT NOT NULL\n, `silenced` INTEGER NOT NULL\n, `execution_error` TEXT NOT NULL\n, `eval_data` TEXT NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `for` INTEGER NULL)
index	IDX_alert_org_id_id	alert	67	CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`)
index	IDX_alert_state	alert	68	CREATE INDEX `IDX_alert_state` ON `alert` (`state`)
index	IDX_alert_dashboard_id	alert	69	CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`)
table	alert_rule_tag	alert_rule_tag	72	CREATE TABLE `alert_rule_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `alert_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n)
index	UQE_alert_rule_tag_alert_id_tag_id	alert_rule_tag	74	CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`)
table	alert_notification	alert_notification	70	CREATE TABLE `alert_notification` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `name` TEXT NOT NULL\n, `type` TEXT NOT NULL\n, `settings` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `is_default` INTEGER NOT NULL DEFAULT 0, `frequency` INTEGER NULL, `send_reminder` INTEGER NULL DEFAULT 0, `disable_resolve_message` INTEGER NOT NULL DEFAULT 0, `uid` TEXT NULL, `secure_settings` TEXT NULL)
table	alert_notification_state	alert_notification_state	76	CREATE TABLE `alert_notification_state` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alert_id` INTEGER NOT NULL\n, `notifier_id` INTEGER NOT NULL\n, `state` TEXT NOT NULL\n, `version` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n, `alert_rule_state_updated_version` INTEGER NOT NULL\n)
index	UQE_alert_notification_state_org_id_alert_id_notifier_id	alert_notification_state	77	CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`)
index	UQE_alert_notification_org_id_uid	alert_notification	79	CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`)
index	IDX_alert_notification_state_alert_id	alert_notification_state	75	CREATE INDEX `IDX_alert_notification_state_alert_id` ON `alert_notification_state` (`alert_id`)
index	IDX_alert_rule_tag_alert_id	alert_rule_tag	80	CREATE INDEX `IDX_alert_rule_tag_alert_id` ON `alert_rule_tag` (`alert_id`)
table	server_lock	server_lock	122	CREATE TABLE `server_lock` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `operation_uid` TEXT NOT NULL\n, `version` INTEGER NOT NULL\n, `last_execution` INTEGER NOT NULL\n)
index	UQE_server_lock_operation_uid	server_lock	123	CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`)
table	annotation	annotation	81	CREATE TABLE `annotation` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alert_id` INTEGER NULL\n, `user_id` INTEGER NULL\n, `dashboard_id` INTEGER NULL\n, `panel_id` INTEGER NULL\n, `category_id` INTEGER NULL\n, `type` TEXT NOT NULL\n, `title` TEXT NOT NULL\n, `text` TEXT NOT NULL\n, `metric` TEXT NULL\n, `prev_state` TEXT NOT NULL\n, `new_state` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `epoch` INTEGER NOT NULL\n, `region_id` INTEGER NULL DEFAULT 0, `tags` TEXT NULL, `created` INTEGER NULL DEFAULT 0, `updated` INTEGER NULL DEFAULT 0, `epoch_end` INTEGER NOT NULL DEFAULT 0)
index	IDX_annotation_org_id_alert_id	annotation	82	CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`)
index	IDX_annotation_org_id_type	annotation	83	CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`)
table	annotation_tag	annotation_tag	87	CREATE TABLE `annotation_tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `annotation_id` INTEGER NOT NULL\n, `tag_id` INTEGER NOT NULL\n)
index	UQE_annotation_tag_annotation_id_tag_id	annotation_tag	88	CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`)
index	IDX_annotation_org_id_created	annotation	84	CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`)
index	IDX_annotation_org_id_updated	annotation	90	CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`)
index	IDX_annotation_org_id_dashboard_id_epoch_end_epoch	annotation	85	CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`)
index	IDX_annotation_org_id_epoch_end_epoch	annotation	86	CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`)
index	IDX_annotation_alert_id	annotation	91	CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`)
table	test_data	test_data	93	CREATE TABLE `test_data` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `metric1` TEXT NULL\n, `metric2` TEXT NULL\n, `value_big_int` INTEGER NULL\n, `value_double` REAL NULL\n, `value_float` REAL NULL\n, `value_int` INTEGER NULL\n, `time_epoch` INTEGER NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` DATETIME NOT NULL\n)
table	dashboard_version	dashboard_version	94	CREATE TABLE `dashboard_version` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `parent_version` INTEGER NOT NULL\n, `restored_from` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n, `message` TEXT NOT NULL\n, `data` TEXT NOT NULL\n)
index	IDX_dashboard_version_dashboard_id	dashboard_version	95	CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`)
index	UQE_dashboard_version_dashboard_id_version	dashboard_version	96	CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`)
table	team	team	98	CREATE TABLE `team` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `email` TEXT NULL)
index	IDX_team_org_id	team	99	CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`)
index	UQE_team_org_id_name	team	100	CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`)
table	team_member	team_member	101	CREATE TABLE `team_member` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `team_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `external` INTEGER NULL, `permission` INTEGER NULL)
index	IDX_team_member_org_id	team_member	102	CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`)
index	UQE_team_member_org_id_team_id_user_id	team_member	103	CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`)
index	IDX_team_member_team_id	team_member	104	CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`)
table	dashboard_acl	dashboard_acl	105	CREATE TABLE `dashboard_acl` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `dashboard_id` INTEGER NOT NULL\n, `user_id` INTEGER NULL\n, `team_id` INTEGER NULL\n, `permission` INTEGER NOT NULL DEFAULT 4\n, `role` TEXT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	IDX_dashboard_acl_dashboard_id	dashboard_acl	106	CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`)
index	UQE_dashboard_acl_dashboard_id_user_id	dashboard_acl	107	CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`)
index	UQE_dashboard_acl_dashboard_id_team_id	dashboard_acl	108	CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`)
index	IDX_dashboard_acl_user_id	dashboard_acl	109	CREATE INDEX `IDX_dashboard_acl_user_id` ON `dashboard_acl` (`user_id`)
index	IDX_dashboard_acl_team_id	dashboard_acl	111	CREATE INDEX `IDX_dashboard_acl_team_id` ON `dashboard_acl` (`team_id`)
index	IDX_dashboard_acl_org_id_role	dashboard_acl	112	CREATE INDEX `IDX_dashboard_acl_org_id_role` ON `dashboard_acl` (`org_id`,`role`)
index	IDX_dashboard_acl_permission	dashboard_acl	113	CREATE INDEX `IDX_dashboard_acl_permission` ON `dashboard_acl` (`permission`)
table	tag	tag	114	CREATE TABLE `tag` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `key` TEXT NOT NULL\n, `value` TEXT NOT NULL\n)
index	UQE_tag_key_value	tag	116	CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`)
table	login_attempt	login_attempt	118	CREATE TABLE `login_attempt` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `username` TEXT NOT NULL\n, `ip_address` TEXT NOT NULL\n, `created` INTEGER NOT NULL DEFAULT 0\n)
index	IDX_login_attempt_username	login_attempt	119	CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`)
table	user_auth	user_auth	117	CREATE TABLE `user_auth` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `auth_module` TEXT NOT NULL\n, `auth_id` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `o_auth_access_token` TEXT NULL, `o_auth_refresh_token` TEXT NULL, `o_auth_token_type` TEXT NULL, `o_auth_expiry` DATETIME NULL)
index	IDX_user_auth_auth_module_auth_id	user_auth	120	CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`)
index	IDX_user_auth_user_id	user_auth	121	CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`)
index	UQE_library_element_org_id_uid	library_element	159	CREATE UNIQUE INDEX `UQE_library_element_org_id_uid` ON `library_element` (`org_id`,`uid`)
table	user_auth_token	user_auth_token	124	CREATE TABLE `user_auth_token` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `user_id` INTEGER NOT NULL\n, `auth_token` TEXT NOT NULL\n, `prev_auth_token` TEXT NOT NULL\n, `user_agent` TEXT NOT NULL\n, `client_ip` TEXT NOT NULL\n, `auth_token_seen` INTEGER NOT NULL\n, `seen_at` INTEGER NULL\n, `rotated_at` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n, `revoked_at` INTEGER NULL)
index	UQE_user_auth_token_auth_token	user_auth_token	125	CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`)
index	UQE_user_auth_token_prev_auth_token	user_auth_token	126	CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`)
index	IDX_user_auth_token_user_id	user_auth_token	127	CREATE INDEX `IDX_user_auth_token_user_id` ON `user_auth_token` (`user_id`)
table	cache_data	cache_data	129	CREATE TABLE `cache_data` (\n`cache_key` TEXT PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n)
index	sqlite_autoindex_cache_data_1	cache_data	130	\N
index	UQE_cache_data_cache_key	cache_data	131	CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`)
table	short_url	short_url	132	CREATE TABLE `short_url` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `path` TEXT NOT NULL\n, `created_by` INTEGER NOT NULL\n, `created_at` INTEGER NOT NULL\n, `last_seen_at` INTEGER NULL\n)
index	UQE_short_url_org_id_uid	short_url	133	CREATE UNIQUE INDEX `UQE_short_url_org_id_uid` ON `short_url` (`org_id`,`uid`)
table	alert_instance	alert_instance	134	CREATE TABLE `alert_instance` (\n"rule_org_id" INTEGER NOT NULL\n, "rule_uid" TEXT NOT NULL DEFAULT 0\n, `labels` TEXT NOT NULL\n, `labels_hash` TEXT NOT NULL\n, `current_state` TEXT NOT NULL\n, `current_state_since` INTEGER NOT NULL\n, `last_eval_time` INTEGER NOT NULL\n, `current_state_end` INTEGER NOT NULL DEFAULT 0, PRIMARY KEY ( "rule_org_id","rule_uid",`labels_hash` ))
index	sqlite_autoindex_alert_instance_1	alert_instance	136	\N
index	IDX_alert_instance_rule_org_id_rule_uid_current_state	alert_instance	139	CREATE INDEX `IDX_alert_instance_rule_org_id_rule_uid_current_state` ON `alert_instance` (`rule_org_id`,`rule_uid`,`current_state`)
index	IDX_alert_instance_rule_org_id_current_state	alert_instance	137	CREATE INDEX `IDX_alert_instance_rule_org_id_current_state` ON `alert_instance` (`rule_org_id`,`current_state`)
table	alert_rule	alert_rule	140	CREATE TABLE `alert_rule` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` INTEGER NOT NULL DEFAULT 60\n, `version` INTEGER NOT NULL DEFAULT 0\n, `uid` TEXT NOT NULL DEFAULT 0\n, `namespace_uid` TEXT NOT NULL\n, `rule_group` TEXT NOT NULL\n, `no_data_state` TEXT NOT NULL DEFAULT 'NoData'\n, `exec_err_state` TEXT NOT NULL DEFAULT 'Alerting'\n, `for` INTEGER NOT NULL DEFAULT 0, `annotations` TEXT NULL, `labels` TEXT NULL, `dashboard_uid` TEXT NULL, `panel_id` INTEGER NULL)
index	UQE_alert_rule_org_id_uid	alert_rule	142	CREATE UNIQUE INDEX `UQE_alert_rule_org_id_uid` ON `alert_rule` (`org_id`,`uid`)
index	IDX_alert_rule_org_id_namespace_uid_rule_group	alert_rule	143	CREATE INDEX `IDX_alert_rule_org_id_namespace_uid_rule_group` ON `alert_rule` (`org_id`,`namespace_uid`,`rule_group`)
index	UQE_alert_rule_org_id_namespace_uid_title	alert_rule	141	CREATE UNIQUE INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule` (`org_id`,`namespace_uid`,`title`)
index	IDX_alert_rule_org_id_dashboard_uid_panel_id	alert_rule	145	CREATE INDEX `IDX_alert_rule_org_id_dashboard_uid_panel_id` ON `alert_rule` (`org_id`,`dashboard_uid`,`panel_id`)
table	alert_rule_version	alert_rule_version	146	CREATE TABLE `alert_rule_version` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `rule_org_id` INTEGER NOT NULL\n, `rule_uid` TEXT NOT NULL DEFAULT 0\n, `rule_namespace_uid` TEXT NOT NULL\n, `rule_group` TEXT NOT NULL\n, `parent_version` INTEGER NOT NULL\n, `restored_from` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `title` TEXT NOT NULL\n, `condition` TEXT NOT NULL\n, `data` TEXT NOT NULL\n, `interval_seconds` INTEGER NOT NULL\n, `no_data_state` TEXT NOT NULL DEFAULT 'NoData'\n, `exec_err_state` TEXT NOT NULL DEFAULT 'Alerting'\n, `for` INTEGER NOT NULL DEFAULT 0, `annotations` TEXT NULL, `labels` TEXT NULL)
index	UQE_alert_rule_version_rule_org_id_rule_uid_version	alert_rule_version	147	CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`version`)
index	IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group	alert_rule_version	148	CREATE INDEX `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` ON `alert_rule_version` (`rule_org_id`,`rule_namespace_uid`,`rule_group`)
table	alert_configuration	alert_configuration	149	CREATE TABLE `alert_configuration` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `alertmanager_configuration` TEXT NOT NULL\n, `configuration_version` TEXT NOT NULL\n, `created_at` INTEGER NOT NULL\n, `default` INTEGER NOT NULL DEFAULT 0, `org_id` INTEGER NOT NULL DEFAULT 0)
index	IDX_alert_configuration_org_id	alert_configuration	151	CREATE INDEX `IDX_alert_configuration_org_id` ON `alert_configuration` (`org_id`)
table	ngalert_configuration	ngalert_configuration	152	CREATE TABLE `ngalert_configuration` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `alertmanagers` TEXT NULL\n, `created_at` INTEGER NOT NULL\n, `updated_at` INTEGER NOT NULL\n)
index	UQE_ngalert_configuration_org_id	ngalert_configuration	153	CREATE UNIQUE INDEX `UQE_ngalert_configuration_org_id` ON `ngalert_configuration` (`org_id`)
table	library_element	library_element	155	CREATE TABLE `library_element` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `folder_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `name` TEXT NOT NULL\n, `kind` INTEGER NOT NULL\n, `type` TEXT NOT NULL\n, `description` TEXT NOT NULL\n, `model` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` INTEGER NOT NULL\n, `version` INTEGER NOT NULL\n)
index	UQE_library_element_org_id_folder_id_name_kind	library_element	156	CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_id_name_kind` ON `library_element` (`org_id`,`folder_id`,`name`,`kind`)
table	library_element_connection	library_element_connection	157	CREATE TABLE `library_element_connection` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `element_id` INTEGER NOT NULL\n, `kind` INTEGER NOT NULL\n, `connection_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` INTEGER NOT NULL\n)
index	UQE_library_element_connection_element_id_kind_connection_id	library_element_connection	158	CREATE UNIQUE INDEX `UQE_library_element_connection_element_id_kind_connection_id` ON `library_element_connection` (`element_id`,`kind`,`connection_id`)
table	data_keys	data_keys	160	CREATE TABLE `data_keys` (\n`name` TEXT PRIMARY KEY NOT NULL\n, `active` INTEGER NOT NULL\n, `scope` TEXT NOT NULL\n, `provider` TEXT NOT NULL\n, `encrypted_data` BLOB NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	sqlite_autoindex_data_keys_1	data_keys	161	\N
table	kv_store	kv_store	162	CREATE TABLE `kv_store` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `namespace` TEXT NOT NULL\n, `key` TEXT NOT NULL\n, `value` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	UQE_kv_store_org_id_namespace_key	kv_store	163	CREATE UNIQUE INDEX `UQE_kv_store_org_id_namespace_key` ON `kv_store` (`org_id`,`namespace`,`key`)
table	permission	permission	164	CREATE TABLE `permission` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `role_id` INTEGER NOT NULL\n, `action` TEXT NOT NULL\n, `scope` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n)
index	IDX_permission_role_id	permission	165	CREATE INDEX `IDX_permission_role_id` ON `permission` (`role_id`)
index	UQE_permission_role_id_action_scope	permission	166	CREATE UNIQUE INDEX `UQE_permission_role_id_action_scope` ON `permission` (`role_id`,`action`,`scope`)
table	role	role	167	CREATE TABLE `role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `name` TEXT NOT NULL\n, `description` TEXT NULL\n, `version` INTEGER NOT NULL\n, `org_id` INTEGER NOT NULL\n, `uid` TEXT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `display_name` TEXT NULL, `group_name` TEXT NULL)
index	IDX_role_org_id	role	169	CREATE INDEX `IDX_role_org_id` ON `role` (`org_id`)
index	UQE_role_org_id_name	role	170	CREATE UNIQUE INDEX `UQE_role_org_id_name` ON `role` (`org_id`,`name`)
table	team_role	team_role	172	CREATE TABLE `team_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `team_id` INTEGER NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n)
index	IDX_team_role_org_id	team_role	174	CREATE INDEX `IDX_team_role_org_id` ON `team_role` (`org_id`)
index	UQE_team_role_org_id_team_id_role_id	team_role	175	CREATE UNIQUE INDEX `UQE_team_role_org_id_team_id_role_id` ON `team_role` (`org_id`,`team_id`,`role_id`)
index	IDX_team_role_team_id	team_role	176	CREATE INDEX `IDX_team_role_team_id` ON `team_role` (`team_id`)
table	user_role	user_role	177	CREATE TABLE `user_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `org_id` INTEGER NOT NULL\n, `user_id` INTEGER NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n)
index	IDX_user_role_org_id	user_role	178	CREATE INDEX `IDX_user_role_org_id` ON `user_role` (`org_id`)
index	UQE_user_role_org_id_user_id_role_id	user_role	179	CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role` (`org_id`,`user_id`,`role_id`)
index	IDX_user_role_user_id	user_role	180	CREATE INDEX `IDX_user_role_user_id` ON `user_role` (`user_id`)
table	builtin_role	builtin_role	181	CREATE TABLE `builtin_role` (\n`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL\n, `role` TEXT NOT NULL\n, `role_id` INTEGER NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `org_id` INTEGER NOT NULL DEFAULT 0)
index	IDX_builtin_role_role_id	builtin_role	182	CREATE INDEX `IDX_builtin_role_role_id` ON `builtin_role` (`role_id`)
index	IDX_builtin_role_role	builtin_role	183	CREATE INDEX `IDX_builtin_role_role` ON `builtin_role` (`role`)
index	IDX_builtin_role_org_id	builtin_role	184	CREATE INDEX `IDX_builtin_role_org_id` ON `builtin_role` (`org_id`)
index	UQE_builtin_role_org_id_role_id_role	builtin_role	185	CREATE UNIQUE INDEX `UQE_builtin_role_org_id_role_id_role` ON `builtin_role` (`org_id`,`role_id`,`role`)
index	UQE_role_uid	role	171	CREATE UNIQUE INDEX `UQE_role_uid` ON `role` (`uid`)
table	seed_assignment	seed_assignment	186	CREATE TABLE `seed_assignment` (\n`builtin_role` TEXT NOT NULL\n, `role_name` TEXT NOT NULL\n)
index	UQE_seed_assignment_builtin_role_role_name	seed_assignment	187	CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`)
\.


--
-- Data for Name: sqlite_sequence; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.sqlite_sequence (name, seq) FROM stdin;
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.star (id, user_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.tag (id, key, value) FROM stdin;
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.team (id, name, org_id, created, updated, email) FROM stdin;
\.


--
-- Data for Name: team_member; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.team_member (id, org_id, team_id, user_id, created, updated, external, permission) FROM stdin;
\.


--
-- Data for Name: team_role; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.team_role (id, org_id, team_id, role_id, created) FROM stdin;
\.


--
-- Data for Name: temp_user; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.temp_user (id, org_id, version, email, name, role, code, status, invited_by_user_id, email_sent, email_sent_on, remote_addr, created, updated) FROM stdin;
\.


--
-- Data for Name: test_data; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.test_data (id, metric1, metric2, value_big_int, value_double, value_float, value_int, time_epoch, time_date_time, time_time_stamp) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public."user" (id, version, login, email, name, password, salt, rands, company, org_id, is_admin, email_verified, theme, created, updated, help_flags1, last_seen_at, is_disabled, is_service_account) FROM stdin;
1	0	admin	admin@localhost		e7c462241e31cc4a2cc3db9e85b503f41a2631d02bae966a15fef77bf58e4fa049f1ff11b49fecb9ce83f1ec43277a26b128	jdwGffmIaY	424SplFiEp		1	1	0		2023-01-23 12:33:32	2023-01-23 12:33:32	0	2013-01-23 12:33:32	0	0
\.


--
-- Data for Name: user_auth; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.user_auth (id, user_id, auth_module, auth_id, created, o_auth_access_token, o_auth_refresh_token, o_auth_token_type, o_auth_expiry) FROM stdin;
\.


--
-- Data for Name: user_auth_token; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.user_auth_token (id, user_id, auth_token, prev_auth_token, user_agent, client_ip, auth_token_seen, seen_at, rotated_at, created_at, updated_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: liufree
--

COPY public.user_role (id, org_id, user_id, role_id, created) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

