--
-- PostgreSQL database dump
--

\restrict PH5FG2xIFf1oYXwMjJ3S5tE3e93FnhqvCVByhTFUfsfpa6b5fOcJxjE6QubobxD

-- Dumped from database version 16.9 (415ebe8)
-- Dumped by pg_dump version 16.10

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: about_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.about_section (
    id integer NOT NULL,
    heading_en text,
    heading_ar text,
    content_en text,
    content_ar text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: about_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.about_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: about_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.about_section_id_seq OWNED BY public.about_section.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(20) DEFAULT 'super_admin'::character varying NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: benefits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.benefits (
    id integer NOT NULL,
    icon text,
    title_en character varying,
    title_ar character varying(100),
    description_en text,
    description_ar text,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: benefits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.benefits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: benefits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.benefits_id_seq OWNED BY public.benefits.id;


--
-- Name: contact_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_messages (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(50),
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    selected_round_id integer,
    selected_round_label character varying(255)
);


--
-- Name: contact_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contact_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_messages_id_seq OWNED BY public.contact_messages.id;


--
-- Name: content_item_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_item_translations (
    id integer NOT NULL,
    content_item_id integer NOT NULL,
    lang character varying(5) NOT NULL,
    title character varying(255) NOT NULL,
    summary text,
    body_html text,
    seo_title character varying(200),
    seo_desc text,
    CONSTRAINT content_item_translations_lang_check CHECK (((lang)::text = ANY ((ARRAY['en'::character varying, 'ar'::character varying])::text[])))
);


--
-- Name: content_item_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_item_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_item_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_item_translations_id_seq OWNED BY public.content_item_translations.id;


--
-- Name: content_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_items (
    id integer NOT NULL,
    topic_id integer,
    slug character varying(100) NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    summary_en text,
    summary_ar text,
    body_en text,
    body_ar text,
    hero_image character varying(500),
    status character varying(20) DEFAULT 'published'::character varying,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cta_note_en text,
    cta_note_ar text
);


--
-- Name: content_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_items_id_seq OWNED BY public.content_items.id;


--
-- Name: course_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_details (
    id integer NOT NULL,
    heading_en text,
    heading_ar text,
    duration_en character varying(100),
    duration_ar character varying(100),
    format_en character varying(100),
    format_ar character varying(100),
    fee_en character varying(50),
    fee_ar character varying(50),
    modules_en text,
    modules_ar text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: course_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_details_id_seq OWNED BY public.course_details.id;


--
-- Name: course_rounds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_rounds (
    id integer NOT NULL,
    label_en character varying(255) NOT NULL,
    label_ar character varying(255) NOT NULL,
    start_at timestamp without time zone,
    published smallint DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: course_rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_rounds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_rounds_id_seq OWNED BY public.course_rounds.id;


--
-- Name: faq; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faq (
    id integer NOT NULL,
    question_en text,
    question_ar text,
    answer_en text,
    answer_ar text,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    page_name character varying(50) DEFAULT 'home'::character varying,
    is_enabled boolean DEFAULT true
);


--
-- Name: faq_all_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faq_all_questions (
    id integer NOT NULL,
    question_en text NOT NULL,
    question_ar text NOT NULL,
    answer_en text NOT NULL,
    answer_ar text NOT NULL,
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: faq_all_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faq_all_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faq_all_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faq_all_questions_id_seq OWNED BY public.faq_all_questions.id;


--
-- Name: faq_hero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faq_hero (
    id integer NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    subtitle_en text,
    subtitle_ar text,
    hero_image character varying(500),
    hero_image_alt character varying(150),
    is_published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    hero_image_ar character varying(255),
    hero_image_alt_ar character varying(255)
);


--
-- Name: faq_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faq_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faq_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faq_hero_id_seq OWNED BY public.faq_hero.id;


--
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


--
-- Name: faq_top_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faq_top_questions (
    id integer NOT NULL,
    question_en text NOT NULL,
    question_ar text NOT NULL,
    answer_en text NOT NULL,
    answer_ar text NOT NULL,
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: faq_top_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faq_top_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faq_top_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faq_top_questions_id_seq OWNED BY public.faq_top_questions.id;


--
-- Name: footer_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.footer_settings (
    id integer NOT NULL,
    setting_key character varying(100) NOT NULL,
    setting_value text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: footer_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.footer_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.footer_settings_id_seq OWNED BY public.footer_settings.id;


--
-- Name: hero_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hero_section (
    id integer NOT NULL,
    title_en text,
    title_ar text,
    subtitle_en text,
    subtitle_ar text,
    button_text_en character varying(50),
    button_text_ar character varying(50),
    background_image character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: hero_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hero_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hero_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hero_section_id_seq OWNED BY public.hero_section.id;


--
-- Name: page_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page_content (
    id integer NOT NULL,
    page_id integer NOT NULL,
    section_key character varying(100) NOT NULL,
    lang character varying(5) NOT NULL,
    title character varying(255),
    subtitle character varying(255),
    body_html text,
    image_id integer,
    display_order integer DEFAULT 0 NOT NULL,
    is_active smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT page_content_lang_check CHECK (((lang)::text = ANY ((ARRAY['en'::character varying, 'ar'::character varying])::text[])))
);


--
-- Name: page_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_content_id_seq OWNED BY public.page_content.id;


--
-- Name: page_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page_sections (
    id integer NOT NULL,
    page_name character varying(50) NOT NULL,
    section_key character varying(50) NOT NULL,
    title_en character varying(255),
    title_ar character varying(255),
    subtitle_en character varying(255),
    subtitle_ar character varying(255),
    body_en text,
    body_ar text,
    image character varying(500),
    is_enabled boolean DEFAULT true,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cta_label_en character varying(255),
    cta_label_ar character varying(255),
    cta_link character varying(500)
);


--
-- Name: page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_sections_id_seq OWNED BY public.page_sections.id;


--
-- Name: page_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page_translations (
    id integer NOT NULL,
    page_id integer NOT NULL,
    lang character varying(5) NOT NULL,
    title character varying(200) NOT NULL,
    seo_title character varying(200),
    seo_desc text,
    CONSTRAINT page_translations_lang_check CHECK (((lang)::text = ANY ((ARRAY['en'::character varying, 'ar'::character varying])::text[])))
);


--
-- Name: page_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_translations_id_seq OWNED BY public.page_translations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    slug character varying(100) NOT NULL,
    type character varying(20) DEFAULT 'system'::character varying NOT NULL,
    is_active smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pages_type_check CHECK (((type)::text = ANY ((ARRAY['system'::character varying, 'topic'::character varying])::text[])))
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    setting_key character varying(100) NOT NULL,
    setting_value text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    name_en character varying(100),
    name_ar character varying(100),
    content_en text,
    content_ar text,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_enabled boolean DEFAULT true
);


--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: topic_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topic_translations (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    lang character varying(5) NOT NULL,
    name character varying(200) NOT NULL,
    short_intro text,
    CONSTRAINT topic_translations_lang_check CHECK (((lang)::text = ANY ((ARRAY['en'::character varying, 'ar'::character varying])::text[])))
);


--
-- Name: topic_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topic_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topic_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topic_translations_id_seq OWNED BY public.topic_translations.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    slug character varying(100) NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    intro_en text,
    intro_ar text,
    hero_image character varying(500),
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_tool boolean DEFAULT false,
    hero_overlay_color_start character varying(9),
    hero_overlay_color_end character varying(9),
    hero_overlay_opacity_start integer DEFAULT 90,
    hero_overlay_opacity_end integer DEFAULT 90
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: tp_learn_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tp_learn_section (
    id integer NOT NULL,
    title_en character varying(255),
    title_ar character varying(255),
    subtitle_en text,
    subtitle_ar text,
    is_published smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tp_learn_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tp_learn_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tp_learn_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tp_learn_section_id_seq OWNED BY public.tp_learn_section.id;


--
-- Name: tp_testimonial_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tp_testimonial_links (
    id integer NOT NULL,
    testimonial_id integer NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_published smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tp_testimonial_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tp_testimonial_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tp_testimonial_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tp_testimonial_links_id_seq OWNED BY public.tp_testimonial_links.id;


--
-- Name: training_bonuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_bonuses (
    id integer NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    subtitle_en character varying(255),
    subtitle_ar character varying(255),
    body_en text,
    body_ar text,
    image character varying(500),
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_bonuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_bonuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_bonuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_bonuses_id_seq OWNED BY public.training_bonuses.id;


--
-- Name: training_faq; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_faq (
    id integer NOT NULL,
    question_en character varying(500) NOT NULL,
    question_ar character varying(500) NOT NULL,
    answer_en text NOT NULL,
    answer_ar text NOT NULL,
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_faq_id_seq OWNED BY public.training_faq.id;


--
-- Name: training_hero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_hero (
    id integer NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    subtitle_en text,
    subtitle_ar text,
    hero_image character varying(500),
    cta_label_en character varying(100),
    cta_label_ar character varying(100),
    is_enabled smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cta_link character varying(500) DEFAULT '#contact'::character varying,
    hero_image_alt character varying(150)
);


--
-- Name: training_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_hero_id_seq OWNED BY public.training_hero.id;


--
-- Name: training_journey_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_journey_cards (
    id integer NOT NULL,
    name_en character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    quote_en text NOT NULL,
    quote_ar text NOT NULL,
    icon_image text,
    sort_order integer DEFAULT 0,
    published boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_journey_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_journey_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_journey_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_journey_cards_id_seq OWNED BY public.training_journey_cards.id;


--
-- Name: training_journey_video; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_journey_video (
    id integer NOT NULL,
    video_url text,
    is_enabled boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_journey_video_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_journey_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_journey_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_journey_video_id_seq OWNED BY public.training_journey_video.id;


--
-- Name: training_learn_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_learn_items (
    id integer NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    body_en text,
    body_ar text,
    icon_image character varying(500),
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_learn_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_learn_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_learn_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_learn_items_id_seq OWNED BY public.training_learn_items.id;


--
-- Name: training_outcomes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_outcomes (
    id integer NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    body_en text,
    body_ar text,
    icon_image character varying(500),
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_outcomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_outcomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_outcomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_outcomes_id_seq OWNED BY public.training_outcomes.id;


--
-- Name: training_testimonials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_testimonials (
    id integer NOT NULL,
    name character varying(255),
    role_company character varying(255),
    quote_en text NOT NULL,
    quote_ar text NOT NULL,
    photo character varying(500),
    sort_order integer DEFAULT 0,
    published smallint DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: training_testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_testimonials_id_seq OWNED BY public.training_testimonials.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uploads (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    filepath character varying(255) NOT NULL,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uploads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;


--
-- Name: about_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_section ALTER COLUMN id SET DEFAULT nextval('public.about_section_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: benefits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.benefits ALTER COLUMN id SET DEFAULT nextval('public.benefits_id_seq'::regclass);


--
-- Name: contact_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_messages ALTER COLUMN id SET DEFAULT nextval('public.contact_messages_id_seq'::regclass);


--
-- Name: content_item_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_item_translations ALTER COLUMN id SET DEFAULT nextval('public.content_item_translations_id_seq'::regclass);


--
-- Name: content_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_items ALTER COLUMN id SET DEFAULT nextval('public.content_items_id_seq'::regclass);


--
-- Name: course_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_details ALTER COLUMN id SET DEFAULT nextval('public.course_details_id_seq'::regclass);


--
-- Name: course_rounds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_rounds ALTER COLUMN id SET DEFAULT nextval('public.course_rounds_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: faq_all_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_all_questions ALTER COLUMN id SET DEFAULT nextval('public.faq_all_questions_id_seq'::regclass);


--
-- Name: faq_hero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_hero ALTER COLUMN id SET DEFAULT nextval('public.faq_hero_id_seq'::regclass);


--
-- Name: faq_top_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_top_questions ALTER COLUMN id SET DEFAULT nextval('public.faq_top_questions_id_seq'::regclass);


--
-- Name: footer_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_settings ALTER COLUMN id SET DEFAULT nextval('public.footer_settings_id_seq'::regclass);


--
-- Name: hero_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_section ALTER COLUMN id SET DEFAULT nextval('public.hero_section_id_seq'::regclass);


--
-- Name: page_content id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_content ALTER COLUMN id SET DEFAULT nextval('public.page_content_id_seq'::regclass);


--
-- Name: page_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections ALTER COLUMN id SET DEFAULT nextval('public.page_sections_id_seq'::regclass);


--
-- Name: page_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_translations ALTER COLUMN id SET DEFAULT nextval('public.page_translations_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: topic_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_translations ALTER COLUMN id SET DEFAULT nextval('public.topic_translations_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: tp_learn_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tp_learn_section ALTER COLUMN id SET DEFAULT nextval('public.tp_learn_section_id_seq'::regclass);


--
-- Name: tp_testimonial_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tp_testimonial_links ALTER COLUMN id SET DEFAULT nextval('public.tp_testimonial_links_id_seq'::regclass);


--
-- Name: training_bonuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_bonuses ALTER COLUMN id SET DEFAULT nextval('public.training_bonuses_id_seq'::regclass);


--
-- Name: training_faq id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_faq ALTER COLUMN id SET DEFAULT nextval('public.training_faq_id_seq'::regclass);


--
-- Name: training_hero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_hero ALTER COLUMN id SET DEFAULT nextval('public.training_hero_id_seq'::regclass);


--
-- Name: training_journey_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_journey_cards ALTER COLUMN id SET DEFAULT nextval('public.training_journey_cards_id_seq'::regclass);


--
-- Name: training_journey_video id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_journey_video ALTER COLUMN id SET DEFAULT nextval('public.training_journey_video_id_seq'::regclass);


--
-- Name: training_learn_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_learn_items ALTER COLUMN id SET DEFAULT nextval('public.training_learn_items_id_seq'::regclass);


--
-- Name: training_outcomes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_outcomes ALTER COLUMN id SET DEFAULT nextval('public.training_outcomes_id_seq'::regclass);


--
-- Name: training_testimonials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_testimonials ALTER COLUMN id SET DEFAULT nextval('public.training_testimonials_id_seq'::regclass);


--
-- Name: uploads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);


--
-- Data for Name: about_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.about_section (id, heading_en, heading_ar, content_en, content_ar, created_at) FROM stdin;
1	Why Our Course?	لماذا دورتنا؟	Our course is designed to provide you with practical skills and knowledge that you can apply immediately in your career. With industry-expert instructors and hands-on projects, you will gain the confidence and expertise needed to excel in your field. We offer flexible learning options and comprehensive support to ensure your success.	تم تصميم دورتنا لتزويدك بالمهارات والمعرفة العملية التي يمكنك تطبيقها فورًا في حياتك المهنية. مع مدربين خبراء في الصناعة ومشاريع عملية، ستكتسب الثقة والخبرة اللازمة للتفوق في مجالك. نحن نقدم خيارات تعليمية مرنة ودعمًا شاملاً لضمان نجاحك.	2025-10-27 07:36:50.100552
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, name, email, password, created_at, role) FROM stdin;
1	Admin	admin@example.com	$2y$10$IcZFNKs.1BtKKdUI5DocvOH1p.wPOCWv/R9yDc3uLCqWPli1JYdaW	2025-10-27 07:36:49.744901	super_admin
2	imp	imp@gmail.com	$2y$10$tJovxdc9ewLY1kMPLZZ.t.zEqL2EDklEHSUP1O9Y0rfQlwXuO0sw.	2025-11-24 07:39:31.690039	content_admin
3	ahmed abdelmoaty	ahmed@gmail.com	$2y$10$oOUcCW2DjEdiqQFH/xwPYeaBk5BlsmFykEtfGnA94Ks7t/7Rr1Rsq	2025-11-24 07:41:19.22451	editor
\.


--
-- Data for Name: benefits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.benefits (id, icon, title_en, title_ar, description_en, description_ar, display_order, created_at) FROM stdin;
1	fa-solid fa-laptop-code	Practical Learning	تدريب عملي	Hands-on experience with real-world projects and case studies.	خبرة عملية مع مشاريع ودراسات حالة من العالم الحقيقي.	1	2025-10-27 07:36:50.278241
2	fa-solid fa-chart-line	Career Growth	تطوير مهني	Advance your career with industry-recognized certification.	قم بتطوير حياتك المهنية بشهادة معترف بها في الصناعة.	2	2025-10-27 07:36:50.338224
3	fa-solid fa-headset	Continuous Support	دعم مستمر	Get ongoing support from instructors and peers throughout your journey.	احصل على دعم مستمر من المدربين والأقران طوال رحلتك.	3	2025-10-27 07:36:50.397006
6	fa-solid fa-users	Expert Instructors	مدربون خبراء	Learn from professionals with years of industry experience.	تعلم من محترفين لديهم سنوات من الخبرة في الصناعة.	4	2025-11-10 15:46:52.330024
\.


--
-- Data for Name: contact_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact_messages (id, name, email, phone, message, created_at, selected_round_id, selected_round_label) FROM stdin;
\.


--
-- Data for Name: content_item_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.content_item_translations (id, content_item_id, lang, title, summary, body_html, seo_title, seo_desc) FROM stdin;
\.


--
-- Data for Name: content_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.content_items (id, topic_id, slug, title_en, title_ar, summary_en, summary_ar, body_en, body_ar, hero_image, status, display_order, created_at, cta_note_en, cta_note_ar) FROM stdin;
4	2	dax-basics	DAX Formulas Basics	أساسيات صيغ DAX	Learn Data Analysis Expressions (DAX) to create powerful calculations in Power BI.	تعلم تعبيرات تحليل البيانات (DAX) لإنشاء حسابات قوية في باور بي آي.	<h2>Understanding DAX</h2><p>DAX (Data Analysis Expressions) is a formula language used in Power BI to create custom calculations and aggregations.</p><p>Master DAX to unlock the full potential of Power BI and create sophisticated data models and reports.</p>	<h2>فهم DAX</h2><p>DAX (تعبيرات تحليل البيانات) هي لغة صيغة تُستخدم في Power BI لإنشاء حسابات وتجميعات مخصصة.</p><p>إتقان DAX لإطلاق الإمكانات الكاملة لـ Power BI وإنشاء نماذج بيانات وتقارير متطورة.</p>	https://via.placeholder.com/800x400/FF9800/ffffff?text=DAX+Formulas	published	2	2025-10-28 14:32:40.791434	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
6	3	hypothesis-testing	Hypothesis Testing	اختبار الفرضيات	Understanding how to test hypotheses and make data-driven decisions.	فهم كيفية اختبار الفرضيات واتخاذ قرارات مستندة إلى البيانات.	<h2>Introduction to Hypothesis Testing</h2><p>Hypothesis testing is a statistical method used to make decisions using data. Learn about null and alternative hypotheses, p-values, and significance levels.</p><p>This knowledge is crucial for making informed business decisions based on data analysis.</p>	<h2>مقدمة لاختبار الفرضيات</h2><p>اختبار الفرضيات هو طريقة إحصائية تستخدم لاتخاذ القرارات باستخدام البيانات. تعرف على الفرضيات الصفرية والبديلة وقيم p ومستويات الأهمية.</p><p>هذه المعرفة حاسمة لاتخاذ قرارات تجارية مستنيرة بناءً على تحليل البيانات.</p>	https://via.placeholder.com/800x400/2196F3/ffffff?text=Hypothesis+Testing	published	2	2025-10-28 14:32:41.133925	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
8	4	joins-relationships	SQL Joins and Relationships	الانضمامات والعلاقات في SQL	Master INNER JOIN, LEFT JOIN, and other types of joins to combine data from multiple tables.	أتقن INNER JOIN و LEFT JOIN وأنواع أخرى من الانضمامات لدمج البيانات من جداول متعددة.	<h2>Understanding SQL Joins</h2><p>Joins are used to combine rows from two or more tables based on a related column. Learn about different types of joins and when to use each one.</p><p>This is a critical skill for working with relational databases and performing complex data analysis.</p>	<h2>فهم انضمامات SQL</h2><p>تُستخدم الانضمامات لدمج الصفوف من جدولين أو أكثر بناءً على عمود ذي صلة. تعرف على أنواع مختلفة من الانضمامات ومتى تستخدم كل منها.</p><p>هذه مهارة حاسمة للعمل مع قواعد البيانات العلائقية وإجراء تحليل بيانات معقد.</p>	https://via.placeholder.com/800x400/9C27B0/ffffff?text=SQL+Joins	published	2	2025-10-28 14:32:41.476309	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
5	3	descriptive-statistics	Descriptive Statistics	الإحصاء الوصفي	Learn to summarize and describe the main features of a dataset.	تعلم كيفية تلخيص ووصف الميزات الرئيسية لمجموعة البيانات.	<h2>What is Descriptive Statistics?</h2>\r\n<p>Descriptive statistics provide simple summaries about the sample and the measures. Learn about mean, median, mode, standard deviation, and other key metrics.</p>\r\n<p>These fundamental concepts are essential for any data analyst.</p>	<h2>ما هو الإحصاء الوصفي؟</h2>\r\n<p>توفر الإحصائيات الوصفية ملخصات بسيطة عن العينة والمقاييس. تعرف على المتوسط والوسيط والمنوال والانحراف المعياري والمقاييس الرئيسية الأخرى.</p>\r\n<p>هذه المفاهيم الأساسية ضرورية لأي محلل بيانات.</p>	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1763290681_laptop-power-bi-scaled.jpg	published	1	2025-10-28 14:32:40.963408	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
7	4	basic-queries	SQL Basic Queries	استعلامات SQL الأساسية	Learn the fundamental SQL commands: SELECT, WHERE, ORDER BY, and more.	تعلم أوامر SQL الأساسية: SELECT و WHERE و ORDER BY والمزيد.	<h2>Getting Started with SQL</h2><p>SQL (Structured Query Language) is essential for working with databases. Learn how to write basic queries to select, filter, and sort data.</p><p>Master these fundamentals to start querying databases effectively.</p>	<h2>البدء مع SQL</h2><p>SQL (لغة الاستعلام الهيكلية) ضرورية للعمل مع قواعد البيانات. تعلم كيفية كتابة استعلامات أساسية لتحديد البيانات وتصفيتها وفرزها.</p><p>أتقن هذه الأساسيات لبدء الاستعلام عن قواعد البيانات بشكل فعال.</p>	https://via.placeholder.com/800x400/9C27B0/ffffff?text=SQL+Basics	published	1	2025-10-28 14:32:41.305152	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
2	1	pivot-tables	Mastering Pivot Tables	إتقان الجداول المحورية	Discover how to create powerful pivot tables to summarize and analyze large datasets.	اكتشف كيفية إنشاء جداول محورية قوية لتلخيص وتحليل مجموعات البيانات الكبيرة.	<h2>What are Pivot Tables?</h2>\r\n<p>Pivot tables are one of the most powerful features in Excel for data analysis. They allow you to quickly summarize large amounts of data and gain insights.</p>\r\n<p>Learn how to create, customize, and use pivot tables to transform your raw data into meaningful reports.</p>	<h2>ما هي الجداول المحورية؟</h2>\r\n<p>الجداول المحورية هي واحدة من أقوى الميزات في Excel لتحليل البيانات. إنها تتيح لك تلخيص كميات كبيرة من البيانات بسرعة والحصول على رؤى.</p>\r\n<p>تعلم كيفية إنشاء الجداول المحورية وتخصيصها واستخدامها لتحويل بياناتك الأولية إلى تقارير ذات مغزى.</p>	https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=800	published	2	2025-10-28 14:32:40.45111	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
10	1	power-pivot	Power Pivot for Data Analysis	Power Pivot لتحليل البيانات	Discover how Power Pivot enhances Excel’s data analysis capabilities by enabling advanced modeling, large-scale data handling, and powerful relationships between tables.	اكتشف كيف تُعزز أداة Power Pivot من قدرات Excel في تحليل البيانات من خلال النمذجة المتقدمة والتعامل مع كميات ضخمة من البيانات وإنشاء علاقات قوية بين الجداول.	<h2>What is Power Pivot?</h2>\r\n<p>Power Pivot is an advanced Excel add-in that allows users to perform powerful data analysis and create sophisticated data models. With Power Pivot, you can combine large datasets from multiple sources, build relationships between tables, and perform complex calculations easily.</p>\r\n\r\n<h2>Key Benefits of Power Pivot</h2>\r\n<ul>\r\n<li><strong>Handle Large Datasets:</strong> Work with millions of rows of data efficiently without performance issues.</li>\r\n<li><strong>Data Modeling:</strong> Create relationships between multiple tables just like in a database.</li>\r\n<li><strong>DAX Formulas:</strong> Use Data Analysis Expressions (DAX) to create calculated columns and measures for deeper insights.</li>\r\n<li><strong>Integration with PivotTables:</strong> Combine Power Pivot models with PivotTables to produce interactive reports and dashboards.</li>\r\n</ul>\r\n\r\n<h2>When to Use Power Pivot</h2>\r\n<p>Use Power Pivot when your analysis requires combining multiple data sources, handling large data volumes, or building advanced metrics that go beyond standard Excel formulas. It’s ideal for data analysts, business intelligence professionals, and decision-makers.</p>\r\n\r\n<h2>Conclusion</h2>\r\n<p>Mastering Power Pivot empowers you to turn Excel into a powerful business intelligence tool, helping you gain meaningful insights and make data-driven decisions with confidence.</p>\r\n	<h2>ما هي أداة Power Pivot؟</h2>\r\n<p>تُعد Power Pivot إضافة متقدمة في Excel تُمكِّن المستخدمين من إجراء تحليلات بيانات قوية وإنشاء نماذج بيانات متطورة. باستخدام Power Pivot، يمكنك دمج مجموعات بيانات ضخمة من مصادر متعددة، وإنشاء علاقات بين الجداول، وتنفيذ حسابات معقدة بسهولة.</p>\r\n\r\n<h2>أهم مميزات Power Pivot</h2>\r\n<ul>\r\n<li><strong>التعامل مع كميات ضخمة من البيانات:</strong> يمكنك العمل مع ملايين الصفوف بكفاءة عالية دون بطء في الأداء.</li>\r\n<li><strong>نمذجة البيانات:</strong> إنشاء علاقات بين جداول متعددة بطريقة مشابهة لقواعد البيانات.</li>\r\n<li><strong>استخدام معادلات DAX:</strong> إنشاء أعمدة محسوبة ومقاييس تحليلية للحصول على رؤى أعمق باستخدام لغة DAX.</li>\r\n<li><strong>الدمج مع الجداول المحورية:</strong> يمكنك ربط نماذج Power Pivot مع الجداول المحورية لإنشاء تقارير ولوحات معلومات تفاعلية.</li>\r\n</ul>\r\n\r\n<h2>متى تستخدم Power Pivot؟</h2>\r\n<p>يُفضل استخدام Power Pivot عندما تحتاج إلى تحليل بيانات من مصادر متعددة أو التعامل مع كميات ضخمة من البيانات أو بناء مقاييس متقدمة تتجاوز الدوال التقليدية في Excel. إنها أداة مثالية للمحللين ومديري البيانات ومتخذي القرار.</p>\r\n\r\n<h2>الخاتمة</h2>\r\n<p>إتقانك لأداة Power Pivot سيحول Excel إلى أداة ذكاء أعمال متكاملة، تُساعدك على استخراج رؤى قيّمة واتخاذ قرارات مبنية على البيانات بثقة.</p>\r\n	https://img-c.udemycdn.com/course/750x422/4883818_5f11_2.jpg	published	3	2025-10-29 07:30:09.657109	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.
1	1	formulas-functions	Essential Formulas and Functions	الصيغ والدوال الأساسية	Learn the most commonly used Excel formulas and functions for data analysis.	تعلم صيغ ودوال Excel الأكثر استخدامًا لتحليل البيانات.	<h2>Introduction to Excel Formulas</h2>\r\n<p>Excel formulas are essential tools for data analysis. In this guide, you will learn about VLOOKUP, SUMIF, COUNTIF, and other powerful functions that will help you analyze data efficiently.</p>\r\n<p>Understanding these formulas will significantly improve your productivity and data analysis capabilities.</p>	<h2>مقدمة إلى صيغ Excel</h2>\r\n<p>صيغ Excel هي أدوات أساسية لتحليل البيانات. في هذا الدليل ، ستتعلم عن VLOOKUP و SUMIF و COUNTIF والوظائف القوية الأخرى التي ستساعدك على تحليل البيانات بكفاءة.</p>\r\n<p>فهم هذه الصيغ سيحسن بشكل كبير إنتاجيتك وقدراتك في تحليل البيانات.</p>	https://www.techspot.com/articles-info/2539/images/2022-09-29-image-2.jpg	published	1	2025-10-28 14:32:40.278078	Want to go deeper? Continue your journey inside our full Training Program.	عايز تكمل رحلتك؟ .
3	2	getting-started	Getting Started with Power BI	البدء مع باور بي آي	Your first steps into the world of business intelligence with Power BI.	خطواتك الأولى في عالم ذكاء الأعمال باستخدام باور بي آي.	<h2>Introduction to Power BI</h2>\r\n<p>Power BI is a business analytics service by Microsoft that enables you to visualize your data and share insights across your organization.</p>\r\n<p>This guide will help you understand the basics of Power BI Desktop, connect to data sources, and create your first visualization.</p>	<h2>مقدمة إلى باور بي آي</h2>\r\n<p>باور بي آي هي خدمة تحليلات الأعمال من مايكروسوفت التي تمكنك من تصور بياناتك ومشاركة الرؤى عبر مؤسستك.</p>\r\n<p>سيساعدك هذا الدليل على فهم أساسيات Power BI Desktop والاتصال بمصادر البيانات وإنشاء التصور الأول.</p>	https://plus.unsplash.com/premium_photo-1661443781814-333019eaad2d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=951	published	1	2025-10-28 14:32:40.621203	Want to go deeper? Continue your journey inside our full Training Program.	
13	8	1	A Simple Introduction to Tableau	مقدمة بسيطة عن Tableau	Learn how Tableau helps you turn raw data into clear charts and visuals that make information easier to understand and decisions easier to make.	تعرف على كيفية استخدام Tableau لتحويل البيانات إلى رسوم ومخططات واضحة تسهّل عليك فهم معلوماتك واتخاذ قرارات أفضل.	<h2 data-start="168" data-end="237">why Tableau Is One of the Easiest Tools for Visualizing Your Data</h2>\r\n<p data-start="1084" data-end="1950">Tableau is one of the simplest and fastest tools for understanding your data without needing technical experience, because it turns raw numbers into clear and easy visuals that explain themselves. Instead of spending time reading large, confusing tables, Tableau connects to your data from any source and displays it in clean charts that help you quickly see trends, comparisons, and strengths or weaknesses. Its drag-and-drop interface makes it easy to create simple dashboards that summarize all important information in one page, so anyone can understand the data even without a technical background. The tool is very helpful for students, analysts, and managers who need to view their information quickly and save time when preparing daily or weekly reports. Simply put, Tableau helps you see your data more clearly and make better decisions with minimal effort.</p>	<h2>لماذا يُعد Tableau أفضل أداة لعرض بياناتك بسهولة؟</h2>\r\n<p>يُعد Tableau واحدًا من أبسط وأسرع الأدوات التي تساعدك على فهم بياناتك بدون الحاجة لأي خبرة تقنية، لأنه يتيح لك تحويل الأرقام الخام إلى رسوم واضحة تشرح نفسها بسهولة. بدل ما تضيع وقتك في تحليل جداول كبيرة ومشتتة، Tableau بيجمع البيانات مهما كان مصدرها ويعرضها في شكل رسومات سهلة القراءة تساعدك تشوف الاتجاهات والمقارنات ونقاط القوة أو الضعف في لحظة واحدة. أهم ميزة في Tableau إنه بيشتغل بالسحب والإفلات فقط، فبمجرد ما تختار البيانات تقدر تعمل Dashboard بسيطة تلخص كل المعلومات المهمة في صفحة واحدة يقدر أي شخص يفهمها حتى لو مش متخصص. الأداة مفيدة جدًا للطلاب، المحللين، والمسؤولين اللي محتاجين يشوفوا بياناتهم بشكل أسرع، وبتوفر وقت كبير في تجهيز التقارير اليومية أو الأسبوعية. ببساطة، Tableau بيخليك تشوف المعلومات بشكل أوضح وتاخد قرارات أفضل بأقل مجهود ممكن.</p>	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/tableau-tutorial_6922c167b61ee.png	published	1	2025-11-23 07:49:09.121872		
15	9	looker-studio	A Simple Introduction to Google Looker Studio	مقدمة بسيطة إلى Google Looker Studio	Learn how Looker Studio helps you turn your data into clean and interactive reports effortlessly.	افهم كيف يساعدك Looker Studio في تحويل بياناتك إلى تقارير تفاعلية واضحة بدون أي خبرة تقنية.	<p data-start="3249" data-end="3838">Google Looker Studio is one of the easiest tools for creating clear and interactive data reports, as it allows you to connect information from different sources like Google Sheets, BigQuery, and CSV files, then transform it into clean dashboards ready to share. The drag-and-drop interface makes it simple to build dashboards that highlight trends, important numbers, and key insights within minutes without any technical background. It&rsquo;s great for students, small businesses, managers, and anyone who wants quick, professional reports while saving time on daily or monthly analysis tasks.</p>	<p>يعد Google Looker Studio من أسهل الأدوات التي يمكنك استخدامها لعرض بياناتك بطريقة واضحة وسهلة، لأنه يسمح لك بربط البيانات من مصادر مختلفة مثل Google Sheets وBigQuery وملفات CSV ثم تحويلها إلى تقارير تفاعلية جاهزة للمشاركة. يعتمد Looker Studio على نظام بسيط جدًا قائم على السحب والإفلات، مما يساعدك على بناء Dashboard تعرض أهم الأرقام والاتجاهات في دقائق بدون أي خبرة تقنية. الأداة مفيدة للطلاب، الشركات الصغيرة، صناع القرار، أو أي شخص يريد عرض بياناته بشكل احترافي وسهل الفهم، كما أنها توفر وقتًا كبيرًا في إعداد التقارير اليومية أو الشهرية.</p>	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/Google-Looker-Studio-Tutorial_6922c55d2d7e7.png	published	1	2025-11-23 08:17:21.523766		
\.


--
-- Data for Name: course_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_details (id, heading_en, heading_ar, duration_en, duration_ar, format_en, format_ar, fee_en, fee_ar, modules_en, modules_ar, created_at) FROM stdin;
1	Course Outline	المنهج الدراسي	8 weeks, 50 hours total	8 أسابيع، 50 ساعة إجمالاً	Online live sessions	جلسات مباشرة عبر الإنترنت	10,000 EGP	10,000 جنيه مصري	Module 1: Introduction to the Field\nModule 2: Fundamentals and Core Concepts\nModule 3: Advanced Techniques\nModule 4: Practical Applications\nModule 5: Industry Best Practices\nModule 6: Final Project and Certification	الوحدة 1: مقدمة في المجال\nالوحدة 2: الأساسيات والمفاهيم الأساسية\nالوحدة 3: التقنيات المتقدمة\nالوحدة 4: التطبيقات العملية\nالوحدة 5: أفضل ممارسات الصناعة\nالوحدة 6: المشروع النهائي والشهادة	2025-10-27 07:36:50.633902
\.


--
-- Data for Name: course_rounds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_rounds (id, label_en, label_ar, start_at, published, sort_order, created_at, updated_at) FROM stdin;
3	Monday 03/11/2025 — 10:00 AM	الإثنين 3 نوفمبر 2025 – 10:00 صباحًا	2025-11-03 10:00:00	1	1	2025-11-02 13:29:39.282272	2025-11-02 13:29:39.282272
4	Tuesday 18/11/2025 — 4:00 AM	الثلاثاء 18 نوفمبر 2025 – 4:00 صباحًا	2025-11-18 04:00:00	1	2	2025-11-02 13:34:06.979953	2025-11-02 13:34:42.22398
\.


--
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.faq (id, question_en, question_ar, answer_en, answer_ar, display_order, created_at, page_name, is_enabled) FROM stdin;
8	Will I receive a certificate upon completion?	هل سأحصل على شهادة عند الانتهاء؟	Yes, upon successfully completing all modules and projects, you will receive a professional certificate of completion that you can add to your resume and LinkedIn profile.	نعم ، عند إكمال جميع الوحدات والمشاريع بنجاح ، ستحصل على شهادة احترافية يمكنك إضافتها إلى سيرتك الذاتية وملفك الشخصي على LinkedIn.	4	2025-11-02 13:44:31.017182	course	t
11	What are the prerequisites?	ما هي المتطلبات المسبقة؟	No prior experience is required. However, basic computer skills and enthusiasm to learn are recommended.	لا يلزم خبرة سابقة. ومع ذلك، يوصى بمهارات الكمبيوتر الأساسية والحماس للتعلم.	3	2025-11-02 14:12:28.731559	home	t
7	What tools and software will I learn?	ما هي الأدوات والبرامج التي سأتعلمها؟	You will learn Microsoft Excel, Power BI, SQL, and basic statistical analysis tools. All software required is either free or we provide access during the course.	سوف تتعلم Microsoft Excel و Power BI و SQL وأدوات التحليل الإحصائي الأساسية. جميع البرامج المطلوبة إما مجانية أو نوفر الوصول إليها أثناء الدورة.	2	2025-11-02 13:44:31.017182	course	t
\.


--
-- Data for Name: faq_all_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.faq_all_questions (id, question_en, question_ar, answer_en, answer_ar, sort_order, published, created_at, updated_at) FROM stdin;
1	What software tools will I learn?	ما هي أدوات البرمجيات التي سأتعلمها؟	You will learn Excel, Power BI, SQL, and statistical analysis tools. All software licenses are included in the program fee.	ستتعلم Excel و Power BI و SQL وأدوات التحليل الإحصائي. جميع تراخيص البرامج مشمولة في رسوم البرنامج.	1	1	2025-11-03 14:05:37.020731	2025-11-03 14:05:37.020731
2	Is the training online or in-person?	هل التدريب عبر الإنترنت أم حضوريًا؟	We offer both online and in-person training options. Choose the format that best fits your schedule and learning style.	نقدم خيارات تدريب عبر الإنترنت وحضوريًا. اختر الشكل الذي يناسب جدولك وأسلوب التعلم الخاص بك.	2	1	2025-11-03 14:05:37.020731	2025-11-03 14:05:37.020731
3	What is the cost of the program?	ما هي تكلفة البرنامج؟	Program costs vary by format and duration. Please contact us for current pricing and available payment plans.	تختلف تكاليف البرنامج حسب الشكل والمدة. يرجى الاتصال بنا للحصول على الأسعار الحالية وخطط الدفع المتاحة.	3	1	2025-11-03 14:05:37.020731	2025-11-03 14:05:37.020731
4	Can I access course materials after completion?	هل يمكنني الوصول إلى مواد الدورة بعد الانتهاء؟	Yes, you will have lifetime access to all course materials, including updates and new content additions.	نعم، سيكون لديك وصول مدى الحياة إلى جميع مواد الدورة، بما في ذلك التحديثات وإضافات المحتوى الجديد.	4	1	2025-11-03 14:05:37.020731	2025-11-03 14:05:37.020731
5	Do you offer job placement assistance?	هل تقدمون مساعدة في التوظيف؟	Yes, we provide career guidance, resume reviews, and connect you with our network of hiring partners.	نعم، نقدم إرشادات مهنية ومراجعة السيرة الذاتية ونربطك بشبكتنا من شركاء التوظيف.	5	1	2025-11-03 14:05:37.020731	2025-11-03 14:05:37.020731
\.


--
-- Data for Name: faq_hero; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.faq_hero (id, title_en, title_ar, subtitle_en, subtitle_ar, hero_image, hero_image_alt, is_published, created_at, updated_at, hero_image_ar, hero_image_alt_ar) FROM stdin;
1	Frequently Asked Questions	الأسئلة الشائعة	Find answers to common questions about our training programs	ابحث عن إجابات للأسئلة الشائعة حول برامجنا التدريبية	https://imanagementpro.com/wp-content/uploads/2025/03/Frame-363.png		1	2025-11-03 14:05:28.520872	2025-11-03 14:05:28.520872	https://imanagementpro.com/wp-content/uploads/2025/03/Frame-363.png	
\.


--
-- Data for Name: faq_top_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.faq_top_questions (id, question_en, question_ar, answer_en, answer_ar, sort_order, published, created_at, updated_at) FROM stdin;
1	What is the duration of the training program?	ما هي مدة البرنامج التدريبي؟	Our comprehensive training program runs for 12 weeks with flexible scheduling options to accommodate working professionals.	يستمر برنامجنا التدريبي الشامل لمدة 12 أسبوعًا مع خيارات جدولة مرنة لاستيعاب المهنيين العاملين.	1	1	2025-11-03 14:05:30.76151	2025-11-03 14:05:30.76151
2	Do I need prior experience in data analysis?	هل أحتاج إلى خبرة سابقة في تحليل البيانات؟	No prior experience is required. Our program is designed for beginners and includes foundational concepts before advancing to complex topics.	لا يلزم وجود خبرة سابقة. تم تصميم برنامجنا للمبتدئين ويتضمن مفاهيم أساسية قبل الانتقال إلى الموضوعات المعقدة.	2	1	2025-11-03 14:05:30.76151	2025-11-03 14:05:30.76151
3	Will I receive a certificate upon completion?	هل سأحصل على شهادة عند الانتهاء؟	Yes, you will receive an industry-recognized certificate upon successful completion of the program and final project.	نعم، ستحصل على شهادة معترف بها في الصناعة عند إكمال البرنامج والمشروع النهائي بنجاح.	3	1	2025-11-03 14:05:30.76151	2025-11-03 14:05:30.76151
\.


--
-- Data for Name: footer_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.footer_settings (id, setting_key, setting_value, updated_at) FROM stdin;
3	show_map	true	2025-10-28 14:32:42.685979
5	contact_phone	+1 (555) 123-4567	2025-10-28 14:32:43.026965
6	contact_address_en	123 Data Street, Analytics City	2025-10-28 14:32:43.19905
7	contact_address_ar	123 شارع البيانات، مدينة التحليلات	2025-10-28 14:32:43.370979
1	footer_about_en	IMP (Institute of Management Professionals) was established in 2014 to be a leading training and development house in the Middle East and North Africa region. Our core emphasis is in the activation of human resources through the strategic utilization of artificial intelligence tools.	2025-10-28 14:32:42.341972
2	footer_about_ar	معهد إدارة المحترفين (IMP) تأسس في 2014 ليكون رائداً في التدريب والتطوير في الشرق الأوسط وشمال أفريقيا. نركز على تطوير الموارد البشرية من خلال الاستخدام الاستراتيجي لأدوات الذكاء الاصطناعي.	2025-10-28 14:32:42.515007
14	contact_title_en		2025-11-13 09:45:12.80457
15	contact_title_ar		2025-11-13 09:45:12.925009
16	contact_intro_en		2025-11-13 09:45:13.044135
17	contact_intro_ar		2025-11-13 09:45:13.156355
8	uae_address_en	Business Center, Sharjah Publishing City Free Zone, E311, Sheikh Mohammed Bin Zayed Rd, Al Zahia, Sharjah, U.A.E.	2025-10-28 17:25:12.460059
9	uae_address_ar	مركز الأعمال، نشر الشارقة، المنطقة الحرة، E311، الشيخ محمد بن زايد رود، الزاهية، الشارقة، الإمارات	2025-10-28 17:25:12.80864
10	uae_phone	+971 50 418 0021	2025-10-28 17:25:13.149105
11	egypt_address_en	37 Amman St, Fourth Floor, Eldokki, Giza, Egypt	2025-10-28 17:25:13.614913
12	egypt_address_ar	37 عمان ش، الطابق الرابع، الدقي، الجيزة، مصر	2025-10-28 17:25:13.955693
13	egypt_phone	+20 10 32244125	2025-10-28 17:25:14.296086
4	contact_email	marketing@imanagementpro.com	2025-10-28 14:32:42.857037
18	social_facebook_url	https://www.facebook.com/Management.Professionals.IMP	2025-11-13 09:45:13.669738
19	social_linkedin_url	https://www.linkedin.com/company/institute-of-management-professionals	2025-11-13 09:45:13.782337
20	social_instagram_url	https://www.instagram.com/imp.management.professional	2025-11-13 09:45:13.895228
21	social_x_url	https://x.com/imanagementpro	2025-11-13 09:45:14.017267
\.


--
-- Data for Name: hero_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hero_section (id, title_en, title_ar, subtitle_en, subtitle_ar, button_text_en, button_text_ar, background_image, created_at) FROM stdin;
1	Join Our Professional Course Now!	انضم إلى دورتنا الاحترافية الآن!	Start enhancing your skills with our specialized course tailored to the latest industry trends.	ابدأ في تطوير مهاراتك مع دورتنا المتخصصة المصممة وفقًا لأحدث اتجاهات الصناعة	Enroll Now test	سجل الآن !!! Test		2025-10-27 07:36:49.924615
\.


--
-- Data for Name: page_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page_content (id, page_id, section_key, lang, title, subtitle, body_html, image_id, display_order, is_active, created_at) FROM stdin;
1	1	hero	en	Transform Your Career with Data Analysis	Master Excel, Power BI, Statistics & SQL to become a data-driven professional	<p>Join thousands of professionals who have accelerated their careers by mastering data analysis. Our comprehensive training covers everything from basic spreadsheets to advanced statistical modeling.</p>	\N	1	1	2025-10-28 12:38:55.975321
2	1	hero	ar	حوّل مسيرتك المهنية مع تحليل البيانات	احترف Excel و Power BI والإحصاء و SQL لتصبح محترفًا يعتمد على البيانات	<p>انضم إلى آلاف المحترفين الذين عززوا مسيراتهم المهنية من خلال إتقان تحليل البيانات. يغطي تدريبنا الشامل كل شيء من جداول البيانات الأساسية إلى النمذجة الإحصائية المتقدمة.</p>	\N	1	1	2025-10-28 12:38:56.3264
3	1	why_da	en	Why Data Analysis Matters	Data-driven decisions lead to better business outcomes	<div class="row"><div class="col-md-3 text-center mb-4"><i class="fas fa-chart-line fa-3x text-primary mb-3"></i><h5>Informed Decisions</h5><p>Make better choices backed by data insights</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-bullseye fa-3x text-primary mb-3"></i><h5>Identify Trends</h5><p>Spot patterns and opportunities early</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-rocket fa-3x text-primary mb-3"></i><h5>Drive Growth</h5><p>Optimize operations and increase revenue</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-users fa-3x text-primary mb-3"></i><h5>Understand Customers</h5><p>Know what your customers really want</p></div></div>	\N	2	1	2025-10-28 12:38:56.671861
4	1	why_da	ar	لماذا يهم تحليل البيانات	القرارات المبنية على البيانات تؤدي إلى نتائج أعمال أفضل	<div class="row"><div class="col-md-3 text-center mb-4"><i class="fas fa-chart-line fa-3x text-primary mb-3"></i><h5>قرارات مستنيرة</h5><p>اتخذ خيارات أفضل مدعومة برؤى البيانات</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-bullseye fa-3x text-primary mb-3"></i><h5>تحديد الاتجاهات</h5><p>اكتشف الأنماط والفرص مبكرًا</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-rocket fa-3x text-primary mb-3"></i><h5>دفع النمو</h5><p>حسّن العمليات وزد الإيرادات</p></div><div class="col-md-3 text-center mb-4"><i class="fas fa-users fa-3x text-primary mb-3"></i><h5>فهم العملاء</h5><p>اعرف ما يريده عملاؤك حقًا</p></div></div>	\N	2	1	2025-10-28 12:38:57.028991
5	1	what_learn	en	What You'll Learn	Comprehensive training covering all essential data analysis tools	<ul class="list-unstyled"><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>Excel Mastery:</strong> Formulas, pivot tables, data visualization, and VBA automation</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>Power BI Expertise:</strong> Interactive dashboards, DAX formulas, and data modeling</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>Statistical Analysis:</strong> Hypothesis testing, regression analysis, and predictive modeling</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>SQL Proficiency:</strong> Database queries, joins, subqueries, and optimization</li></ul>	\N	3	1	2025-10-28 12:38:57.370921
6	1	what_learn	ar	ما ستتعلمه	تدريب شامل يغطي جميع أدوات تحليل البيانات الأساسية	<ul class="list-unstyled"><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>إتقان Excel:</strong> الصيغ والجداول المحورية وتصور البيانات وأتمتة VBA</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>خبرة Power BI:</strong> لوحات معلومات تفاعلية وصيغ DAX ونمذجة البيانات</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>التحليل الإحصائي:</strong> اختبار الفرضيات وتحليل الانحدار والنمذجة التنبؤية</li><li class="mb-3"><i class="fas fa-check-circle text-success me-2"></i><strong>إتقان SQL:</strong> استعلامات قاعدة البيانات والربط والاستعلامات الفرعية والتحسين</li></ul>	\N	3	1	2025-10-28 12:38:57.712504
7	1	cta_bottom	en	Ready to Start Your Data Journey?	Join thousands of professionals who have transformed their careers	<p class="lead">Get lifetime access to all courses, updates, and exclusive resources. Start learning at your own pace today!</p>	\N	4	1	2025-10-28 12:38:58.05388
8	1	cta_bottom	ar	هل أنت مستعد لبدء رحلتك في البيانات؟	انضم إلى آلاف المحترفين الذين حولوا مسيراتهم المهنية	<p class="lead">احصل على وصول مدى الحياة إلى جميع الدورات والتحديثات والموارد الحصرية. ابدأ التعلم بالسرعة التي تناسبك اليوم!</p>	\N	4	1	2025-10-28 12:38:58.3992
9	2	about_hero	en	About Learn Data Analysis	Empowering professionals with world-class data analysis skills	<p class="lead">We are committed to helping individuals and organizations unlock the power of data through comprehensive training and practical skills development.</p>	\N	1	1	2025-10-28 13:17:24.287458
10	2	about_hero	ar	حول تعلم تحليل البيانات	تمكين المحترفين بمهارات تحليل بيانات عالمية المستوى	<p class="lead">نحن ملتزمون بمساعدة الأفراد والمؤسسات على إطلاق قوة البيانات من خلال التدريب الشامل وتطوير المهارات العملية.</p>	\N	1	1	2025-10-28 13:17:24.644878
11	2	our_mission	en	Our Mission	Making data analysis accessible to everyone	<p>We believe that data literacy is a critical skill for the modern workforce. Our mission is to provide high-quality, practical training that transforms beginners into confident data professionals.</p><p>Through hands-on learning and real-world projects, we help our students master the tools and techniques used by industry leaders worldwide.</p>	\N	2	1	2025-10-28 13:17:25.007759
12	2	our_mission	ar	مهمتنا	جعل تحليل البيانات في متناول الجميع	<p>نؤمن بأن معرفة البيانات مهارة حاسمة للقوى العاملة الحديثة. مهمتنا هي توفير تدريب عملي عالي الجودة يحول المبتدئين إلى محترفي بيانات واثقين.</p><p>من خلال التعلم العملي والمشاريع الواقعية، نساعد طلابنا على إتقان الأدوات والتقنيات التي يستخدمها قادة الصناعة في جميع أنحاء العالم.</p>	\N	2	1	2025-10-28 13:17:25.36519
13	2	why_choose_us	en	Why Choose Us	Expert instruction, practical skills, proven results	<div class="row"><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>Industry Experts</h5><p>Learn from professionals with years of real-world experience in data analysis and business intelligence.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>Hands-On Learning</h5><p>Practice with real datasets and build a portfolio of projects that demonstrate your skills.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>Flexible Pace</h5><p>Study at your own speed with lifetime access to all course materials and updates.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>Career Support</h5><p>Get guidance on building your data analysis career and showcasing your skills to employers.</p></div></div>	\N	3	1	2025-10-28 13:17:25.722938
14	2	why_choose_us	ar	لماذا تختارنا	تدريس خبير، مهارات عملية، نتائج مثبتة	<div class="row"><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>خبراء الصناعة</h5><p>تعلم من محترفين لديهم سنوات من الخبرة الواقعية في تحليل البيانات وذكاء الأعمال.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>التعلم العملي</h5><p>تدرب على مجموعات بيانات حقيقية وابنِ مجموعة من المشاريع التي تثبت مهاراتك.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>وتيرة مرنة</h5><p>ادرس بسرعتك الخاصة مع وصول مدى الحياة إلى جميع مواد الدورة والتحديثات.</p></div><div class="col-md-6 mb-3"><h5><i class="fas fa-check-circle text-success me-2"></i>دعم مهني</h5><p>احصل على إرشادات حول بناء مسيرتك المهنية في تحليل البيانات وعرض مهاراتك لأصحاب العمل.</p></div></div>	\N	3	1	2025-10-28 13:17:26.074853
15	2	our_approach	en	Our Approach	Learn by doing	<p>We combine theory with practice to ensure you not only understand concepts but can apply them effectively in real-world scenarios.</p><p>Each course is structured to build your skills progressively, starting with fundamentals and advancing to expert-level techniques.</p>	\N	4	1	2025-10-28 13:17:26.42672
16	2	our_approach	ar	نهجنا	التعلم بالممارسة	<p>نجمع بين النظرية والتطبيق لضمان فهمك للمفاهيم وتطبيقها بفعالية في السيناريوهات الواقعية.</p><p>كل دورة منظمة لبناء مهاراتك تدريجيًا، بدءًا من الأساسيات والتقدم إلى تقنيات مستوى الخبراء.</p>	\N	4	1	2025-10-28 13:17:26.779489
\.


--
-- Data for Name: page_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page_sections (id, page_name, section_key, title_en, title_ar, subtitle_en, subtitle_ar, body_en, body_ar, image, is_enabled, display_order, created_at, cta_label_en, cta_label_ar, cta_link) FROM stdin;
3	about	approach	Our Approach	نهجنا	Practical, Hands-on Learning	التعلم العملي التطبيقي	We focus on practical, real-world applications. Our curriculum is designed around actual business scenarios, ensuring that you can immediately apply what you learn. Each course includes hands-on exercises, real datasets, and practical projects.	نركز على التطبيقات العملية في العالم الحقيقي. تم تصميم منهجنا الدراسي حول سيناريوهات الأعمال الفعلية ، مما يضمن أنه يمكنك تطبيق ما تتعلمه على الفور. تتضمن كل دورة تمارين عملية ومجموعات بيانات حقيقية ومشاريع عملية.	https://plus.unsplash.com/premium_photo-1661718074815-1564d2eb920f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=985	t	3	2025-10-28 14:32:41.999419	\N	\N	\N
4	home	why_data	Why Data Analysis?	لماذا تحليل البيانات؟			In today's data-driven world, the ability to analyze and interpret data is more valuable than ever. Data analysis skills open doors to countless career opportunities and enable you to make smarter, evidence-based decisions.	في عالم اليوم القائم على البيانات ، تعد القدرة على تحليل البيانات وتفسيرها أكثر قيمة من أي وقت مضى. تفتح مهارات تحليل البيانات الأبواب أمام فرص وظيفية لا حصر لها وتمكنك من اتخاذ قرارات أكثر ذكاءً تستند إلى الأدلة.		t	1	2025-10-28 14:32:42.169771	Learn More About Our Course	تعرف على المزيد عن دورتنا	course.php
10	course	value_bonuses	Free Practice Modules	وحدات تدريبية مجانية	Hands-on exercises included	تمارين عملية مشمولة	Get access to comprehensive practice modules with real-world datasets to reinforce your learning.	احصل على وصول إلى وحدات تدريبية شاملة مع مجموعات بيانات من العالم الحقيقي لتعزيز تعلمك.		t	1	2025-11-02 13:43:27.738995	\N	\N	\N
14	course	outcomes	Career Advancement	التقدم الوظيفي	\N	\N	90% of our graduates report career growth within 6 months, with many securing data analyst roles in leading companies.	90٪ من خريجينا يبلغون عن نمو وظيفي في غضون 6 أشهر ، حيث يحصل الكثيرون على أدوار محلل البيانات في الشركات الرائدة.	https://img.icons8.com/fluency/96/career.png	t	1	2025-11-02 13:43:42.006547	\N	\N	\N
1	about	intro	About Our Data Analysis Program	حول برنامج تحليل البيانات الخاص بنا	\N	\N	We are dedicated to empowering professionals with cutting-edge data analysis skills. Our comprehensive program covers everything from Excel basics to advanced statistical analysis and business intelligence tools.ASASASAS	نحن ملتزمون بتمكين المهنيين من خلال مهارات تحليل البيانات المتطورة. يغطي برنامجنا الشامل كل شيء من أساسيات Excel إلى التحليل الإحصائي المتقدم وأدوات ذكاء الأعمال.	https://plus.unsplash.com/premium_photo-1661338928715-1f9b263363e9?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870	t	1	2025-10-28 14:32:41.651906	\N	\N	\N
2	about	mission	Our Mission	مهمتنا	Transforming Data into Insights	تحويل البيانات إلى رؤى	Our mission is to make data analysis accessible to everyone. We believe that data-driven decision making is the key to success in today's business environment. Through our expert-led courses, we help students master the tools and techniques needed to excel in data analysis.	مهمتنا هي جعل تحليل البيانات في متناول الجميع. نعتقد أن اتخاذ القرار القائم على البيانات هو مفتاح النجاح في بيئة الأعمال اليوم. من خلال دوراتنا التي يقودها الخبراء ، نساعد الطلاب على إتقان الأدوات والتقنيات اللازمة للتفوق في تحليل البيانات.	https://images.pexels.com/photos/6914634/pexels-photo-6914634.jpeg	t	2	2025-10-28 14:32:41.826298	\N	\N	\N
18	home	highlights	Master In-Demand Skills	إتقان المهارات المطلوبة			Data analysis is one of the fastest-growing and most lucrative career paths. Our comprehensive training prepares you for real-world challenges.	يعد تحليل البيانات من أسرع المسارات الوظيفية نموًا وأكثرها ربحية. يعدك تدريبنا الشامل للتحديات الحقيقية.		t	2	2025-11-02 13:46:06.073401	Learn More About Our Course	تعرف على المزيد عن دورتنا	course.php
5	course	hero	Master Data Analysis	تحليل البيانات المتقدم	Transform your career with professional data analysis skills	حوّل مسارك المهني بمهارات تحليل البيانات الاحترافية			https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.1.0&auto=format&fit=crop&w=1920&q=80	t	1	2025-11-02 13:43:11.348153	Enroll Now	سجل الآن	#contact
17	course	final_cta	Ready to Start Your Data Analysis Journey?	هل أنت مستعد لبدء رحلتك في تحليل البيانات؟	Join hundreds of professionals who transformed their careers	انضم إلى مئات المهنيين الذين حولوا مساراتهم المهنية	Enroll now and get lifetime access to all course materials, updates, and our exclusive community.	سجل الآن واحصل على وصول مدى الحياة إلى جميع مواد الدورة والتحديثات ومجتمعنا الحصري.	\N	t	1	2025-11-02 13:43:45.097386	Enroll Now	سجل الآن	#contact
21	home	final_cta	Ready to Transform Your Career?	هل أنت مستعد لتحويل حياتك المهنية؟			sasaasas	سششسسش		t	3	2025-11-02 13:46:09.81318	Enroll Now	سجل الآن	#contact
13	course	curriculum	Course Curriculum & Modules	منهج الدورة والوحدات	Structured learning path from basics to advanced	مسار تعليمي منظم من الأساسيات إلى المستوى المتقدم	Our curriculum covers 5 comprehensive modules:\r\n\r\nModule 1: Excel Fundamentals - Data cleaning, formulas, functions\r\nModule 2: Advanced Excel - PivotTables, dashboards, macros\r\nModule 3: Power BI - Data modeling, DAX, visualizations\\nModule 4: Statistical Analysis - Descriptive stats, probability, hypothesis testing\\nModule 5: SQL & Databases - Queries, joins, optimization\\n\\nEach module includes video lessons, hands-on exercises, and real-world projects.	يغطي منهجنا الدراسي 5 وحدات شاملة:\\n\\nالوحدة 1: أساسيات Excel - تنظيف البيانات والصيغ والوظائف\\nالوحدة 2: Excel المتقدم - الجداول المحورية ولوحات المعلومات والماكرو\\nالوحدة 3: Power BI - نمذجة البيانات وDAX والتصورات\\nالوحدة 4: التحليل الإحصائي - الإحصاءات الوصفية والاحتمالات واختبار الفرضيات\\nالوحدة 5: SQL وقواعد البيانات - الاستعلامات والانضمامات والتحسين\\n\\nتتضمن كل وحدة دروس فيديو وتمارين عملية ومشاريع من العالم الحقيقي.	https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-4.1.0&auto=format&fit=crop&w=800&q=80	t	1	2025-11-02 13:43:35.877111	Enroll Now		
6	course	what_learn	Data Analysis with Excel	تحليل البيانات باستخدام Excel	<br /><b>Deprecated</b>:  htmlspecialchars(): Passing null to parameter #1 ($string) of type string is deprecated in <b>/home/runner/workspace/admin/page_sections.php</b> on line <b>259</b><br />	<br /><b>Deprecated</b>:  htmlspecialchars(): Passing null to parameter #1 ($string) of type string is deprecated in <b>/home/runner/workspace/admin/page_sections.php</b> on line <b>263</b><br />	Master advanced Excel functions, PivotTables, dashboards, and data visualization techniques for professional reporting.	إتقان وظائف Excel المتقدمة والجداول المحورية ولوحات المعلومات وتقنيات تصور البيانات للتقارير الاحترافية.	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762094282_Screenshot (7).png	t	1	2025-11-02 13:43:20.501949			
22	tools	hero	Master Data Analysis Tools	أتقن أدوات تحليل البيانات	Access a collection of interactive tools designed to make learning data analysis easier, more practical, and tailored to real-world skills — from Excel and SQL to Power BI and beyond.	استكشف مجموعة من الأدوات التفاعلية التي تجعل تعلم تحليل البيانات أسهل وأكثر تطبيقًا، ومصممة لتطوير مهاراتك العملية في Excel وSQL وPower BI وغيرها.	\N	\N	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762951279_Exploratory-Data-Analysis-1-1024x536.png	t	1	2025-11-12 11:24:07.052886	\N	\N	\N
23	tools	intro	Empower Your Learning Journey	انطلق في رحلة تعلمك بثقة	\N	\N	Each tool is built to enhance your skills and make learning data analysis easier, faster, and more practical.	كل أداة صُممت لتطوير مهاراتك وجعل تعلم تحليل البيانات أسهل وأسرع وأكثر تطبيقًا.	\N	f	2	2025-11-12 11:24:27.254078	\N	\N	\N
\.


--
-- Data for Name: page_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page_translations (id, page_id, lang, title, seo_title, seo_desc) FROM stdin;
1	1	en	Home	Learn Data Analysis - Master Excel, Power BI, Statistics & SQL	Transform your career with comprehensive data analysis training. Learn Excel, Power BI, Statistics, and SQL from industry experts.
2	1	ar	الرئيسية	تعلم تحليل البيانات - احترف Excel و Power BI والإحصاء و SQL	حوّل مسيرتك المهنية مع تدريب شامل في تحليل البيانات. تعلم Excel و Power BI والإحصاء و SQL من خبراء الصناعة.
3	2	en	About Us	About Us - Learn Data Analysis	Discover our mission to empower professionals with world-class data analysis skills and transform careers globally.
4	2	ar	من نحن	من نحن - تعلم تحليل البيانات	اكتشف مهمتنا في تمكين المحترفين بمهارات تحليل البيانات عالمية المستوى وتحويل المسيرات المهنية عالميًا.
5	3	en	Excel	Master Microsoft Excel for Data Analysis	Learn advanced Excel techniques including formulas, pivot tables, data visualization, and automation with VBA.
6	3	ar	إكسل	احترف Microsoft Excel لتحليل البيانات	تعلم تقنيات Excel المتقدمة بما في ذلك الصيغ والجداول المحورية وتصور البيانات والأتمتة باستخدام VBA.
7	4	en	Power BI	Master Power BI for Business Intelligence	Create stunning dashboards and reports with Power BI. Learn DAX, data modeling, and advanced visualizations.
8	4	ar	باور بي آي	احترف Power BI لذكاء الأعمال	أنشئ لوحات معلومات وتقارير مذهلة باستخدام Power BI. تعلم DAX ونمذجة البيانات والتصورات المتقدمة.
9	5	en	Statistics	Statistics for Data Analysis	Master statistical concepts essential for data analysis including hypothesis testing, regression, and probability.
10	5	ar	الإحصاء	الإحصاء لتحليل البيانات	احترف المفاهيم الإحصائية الأساسية لتحليل البيانات بما في ذلك اختبار الفرضيات والانحدار والاحتمالات.
11	6	en	SQL	Master SQL for Data Analysis	Learn SQL from basics to advanced queries. Master joins, subqueries, window functions, and database design.
12	6	ar	إس كيو إل	احترف SQL لتحليل البيانات	تعلم SQL من الأساسيات إلى الاستعلامات المتقدمة. احترف الربط والاستعلامات الفرعية ودوال النوافذ وتصميم قواعد البيانات.
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, slug, type, is_active, created_at) FROM stdin;
1	home	system	1	2025-10-28 12:31:01.035241
2	about	system	1	2025-10-28 12:31:01.517656
3	excel	topic	1	2025-10-28 12:31:01.860862
4	power-bi	topic	1	2025-10-28 12:31:02.199582
5	statistics	topic	1	2025-10-28 12:31:02.543073
6	sql	topic	1	2025-10-28 12:31:02.883089
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.site_settings (id, setting_key, setting_value, created_at) FROM stdin;
17	text_dark	#333333	2025-11-15 18:30:12.255924
18	text_light	#666666	2025-11-15 18:30:12.369889
20	font_family_en	'Segoe UI', Tahoma, Geneva, Verdana, sans-serif	2025-11-15 18:30:12.598078
21	font_family_ar	'Tajawal', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif	2025-11-15 18:30:12.712073
22	font_link_en		2025-11-15 18:30:12.826869
23	font_link_ar		2025-11-15 18:30:12.941278
5	contact_email	info@institute.com	2025-10-27 07:36:51.702257
13	contact_recipient_email	admin@example.com	2025-10-28 12:30:14.713695
6	contact_phone	+971 50 418 0021	2025-10-27 07:36:51.761686
7	contact_address_en	E311 Road, New Industrial Area, Sharjah, UAE	2025-10-27 07:36:51.820352
8	contact_address_ar	طريق E311، المنطقة الصناعية الجديدة، الشارقة، الإمارات العربية المتحدة	2025-10-27 07:36:51.879197
9	facebook_url	https://facebook.com	2025-10-27 07:36:51.93857
10	twitter_url	https://twitter.com	2025-10-27 07:36:51.997316
11	linkedin_url	https://linkedin.com	2025-10-27 07:36:52.056411
12	instagram_url	https://instagram.com	2025-10-27 07:36:52.115456
1	site_name_en	Professional Training Institute	2025-10-27 07:36:51.458862
2	site_name_ar	معهد التدريب المهني	2025-10-27 07:36:51.519262
3	logo	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1761751341_Gemini_Generated_Image_e5prpre5prpre5pr (1).png	2025-10-27 07:36:51.579759
15	admin_email		2025-11-15 18:30:11.9597
16	secondary_color	#9D0B0B	2025-11-15 18:30:12.142009
4	primary_color	#910D0D	2025-10-27 07:36:51.638857
19	primary_opacity	100	2025-11-15 18:30:12.483863
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.testimonials (id, name_en, name_ar, content_en, content_ar, display_order, created_at, is_enabled) FROM stdin;
1	Sarah Johnson	سارة جونسون	This course exceeded my expectations! The instructors were knowledgeable and the content was practical and relevant.	هذه الدورة تجاوزت توقعاتي! كان المدربون على دراية وكان المحتوى عمليًا وذا صلة.	1	2025-10-27 07:36:50.81334	t
2	Ahmed Hassan	أحمد حسن	I highly recommend this course to anyone looking to advance their career. The support and resources provided were exceptional.	أوصي بشدة بهذه الدورة لأي شخص يتطلع إلى تطوير مسيرته المهنية. كان الدعم والموارد المقدمة استثنائية.	2	2025-10-27 07:36:50.873239	t
3	Maria Garcia	ماريا غارسيا	The hands-on projects really helped me understand the concepts better. Great learning experience!	ساعدتني المشاريع العملية حقًا على فهم المفاهيم بشكل أفضل. تجربة تعليمية رائعة!	3	2025-10-27 07:36:50.931966	t
\.


--
-- Data for Name: topic_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topic_translations (id, topic_id, lang, name, short_intro) FROM stdin;
1	1	en	Microsoft Excel	Master the most powerful spreadsheet tool for data analysis and business intelligence.
2	2	en	Power BI	Create stunning interactive dashboards and reports with Microsoft Power BI.
3	3	en	Statistics	Learn essential statistical concepts and methods for data-driven decision making.
4	4	en	SQL	Query and manipulate data efficiently with Structured Query Language.
5	1	ar	مايكروسوفت إكسل	احترف أقوى أداة جداول بيانات لتحليل البيانات وذكاء الأعمال.
6	2	ar	باور بي آي	أنشئ لوحات معلومات وتقارير تفاعلية مذهلة باستخدام Microsoft Power BI.
7	3	ar	الإحصاء	تعلم المفاهيم والأساليب الإحصائية الأساسية لاتخاذ القرارات المستندة إلى البيانات.
8	4	ar	لغة الاستعلام المهيكلة	استعلم عن البيانات ومعالجتها بكفاءة باستخدام لغة الاستعلام المهيكلة.
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topics (id, slug, title_en, title_ar, intro_en, intro_ar, hero_image, display_order, created_at, is_tool, hero_overlay_color_start, hero_overlay_color_end, hero_overlay_opacity_start, hero_overlay_opacity_end) FROM stdin;
8	tableau	Tableau	تابلو	Discover the power of Tableau for data analysis and interactive dashboards that help you understand your data and make smarter decisions.	اكتشف قوة تابلو في تحليل البيانات وبناء لوحات معلومات تفاعلية تساعدك على فهم البيانات واتخاذ قرارات أفضل.	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/tableau-features_6922c167d5a85.jpg	5	2025-11-23 07:44:40.406809	t	#1A3ECB	#112EC0	90	90
9	looker	Google Looker Studio	جوجل لوكر ستوديو	Create interactive dashboards and smart reports easily with Google’s free data visualization tool.	اصنع تقارير تفاعلية ولوحات بيانات احترافية بسهولة باستخدام أدوات Google المجانية.	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/looker-studio-overvi_6922c553ec678.png	7	2025-11-23 08:15:00.228867	t	#64C3E3	#1EBDD2	95	95
1	excel	Microsoft Excel	مايكروسوفت إكسل	Master data analysis and visualization with Microsoft Excel. Learn formulas, pivot tables, charts, and advanced data manipulation techniques.	أتقن تحليل البيانات والتصور باستخدام مايكروسوفت إكسل. تعلم الصيغ والجداول المحورية والمخططات وتقنيات معالجة البيانات المتقدمة.	https://edraak-marketing-uploads.edraak.org/Courses/Dashboard-Building-Using-Excel.jpg	1	2025-10-28 14:32:39.417042	t	#2E7D32	#1B5E20	90	90
2	power-bi	Power BI	باور بي آي	Create interactive dashboards and powerful visualizations with Microsoft Power BI. Transform raw data into actionable insights.	قم بإنشاء لوحات معلومات تفاعلية وتصورات قوية باستخدام مايكروسوفت باور بي آي. حول البيانات الأولية إلى رؤى قابلة للتنفيذ.	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1763291067_Untitled_design_12.png	2	2025-10-28 14:32:39.594639	t	#F1B309	#F0AA14	95	95
10	cognos	IBM Cognos	آي بي إم كوجنوس	Powerful reporting and analytics from IBM to help you understand your data and make smarter decisions.	حلول تحليل وتقارير من IBM تساعدك على فهم بياناتك واتخاذ قرارات أفضل بثقة.	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/671227debad428001d97cf23_6922ceb571464.jpg	8	2025-11-23 09:04:11.70246	t	#02253B	#062A3C	90	90
3	statistics	Statistics	الإحصاء	Understand statistical concepts essential for data analysis. Learn hypothesis testing, probability distributions, and statistical inference.	فهم المفاهيم الإحصائية الأساسية لتحليل البيانات. تعلم اختبار الفرضيات وتوزيعات الاحتمالات والاستدلال الإحصائي.	https://previews.123rf.com/images/melpomen/melpomen1902/melpomen190200040/116208214-statistics-with-blurred-city-abstract-lights-background.jpg	3	2025-10-28 14:32:39.765914	f	#009688	#00695C	90	90
4	sql	SQL	لغة الاستعلام المهيكلة	Query and manage databases with SQL. Learn to extract, filter, and analyze data from relational databases efficiently.	الاستعلام عن قواعد البيانات وإدارتها باستخدام SQL. تعلم استخراج البيانات وتصفيتها وتحليلها من قواعد البيانات العلائقية بكفاءة.	https://img.freepik.com/free-vector/gradient-sql-illustration_23-2149247491.jpg	4	2025-10-28 14:32:39.937372	t	#6F40B5	#4C218C	90	90
\.


--
-- Data for Name: tp_learn_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tp_learn_section (id, title_en, title_ar, subtitle_en, subtitle_ar, is_published, created_at, updated_at) FROM stdin;
1	What You'll Learn	ما ستتعلمه	Comprehensive curriculum covering all essential data analysis skills	منهج شامل يغطي جميع مهارات تحليل البيانات الأساسية	1	2025-11-03 08:12:05.669804	2025-11-03 08:12:05.669804
\.


--
-- Data for Name: tp_testimonial_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tp_testimonial_links (id, testimonial_id, sort_order, is_published, created_at) FROM stdin;
2	2	2	1	2025-11-03 08:12:07.177433
1	3	1	1	2025-11-03 08:12:07.177433
\.


--
-- Data for Name: training_bonuses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_bonuses (id, title_en, title_ar, subtitle_en, subtitle_ar, body_en, body_ar, image, sort_order, published, created_at) FROM stdin;
1	Certificate of Completion	شهادة إتمام	Professional Recognition	اعتراف مهني	Receive an accredited certificate upon successful completion	احصل على شهادة معتمدة عند إتمام البرنامج بنجاح	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762683375_certificate.png	0	1	2025-11-02 15:54:15.314778
2	Lifetime Access	وصول مدى الحياة	Learn at Your Pace	تعلم بالسرعة التي تناسبك	Get unlimited access to all course materials and future updates	احصل على وصول غير محدود لجميع مواد الدورة والتحديثات المستقبلية	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762683366_lifetime.png	1	1	2025-11-02 15:54:15.314778
3	Expert Mentorship	إرشاد الخبراء	1-on-1 Support	دعم فردي	Direct access to industry professionals for guidance and support	وصول مباشر للمحترفين في الصناعة للحصول على التوجيه والدعم	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762683361_presentation.png	2	1	2025-11-02 15:54:15.314778
\.


--
-- Data for Name: training_faq; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_faq (id, question_en, question_ar, answer_en, answer_ar, sort_order, published, created_at) FROM stdin;
1	What prerequisites do I need?	ما هي المتطلبات الأساسية المطلوبة؟	No prior experience required! This program is designed for beginners and intermediate learners. Basic computer skills are helpful.	لا يلزم خبرة سابقة! تم تصميم هذا البرنامج للمبتدئين والمتعلمين المتوسطين. مهارات الكمبيوتر الأساسية مفيدة.	0	1	2025-11-02 15:54:28.062861
2	How long is the program?	ما هي مدة البرنامج؟	The program is self-paced and typically takes 8-12 weeks to complete, depending on your schedule and commitment.	البرنامج ذاتي السرعة ويستغرق عادة 8-12 أسبوعًا للإنجاز، حسب جدولك والتزامك.	1	1	2025-11-02 15:54:28.062861
3	Will I receive a certificate?	هل سأحصل على شهادة؟	Yes! Upon successful completion, you will receive an accredited certificate that you can add to your resume and LinkedIn profile.	نعم! عند الإنجاز الناجح، ستحصل على شهادة معتمدة يمكنك إضافتها إلى سيرتك الذاتية وملفك الشخصي على LinkedIn.	2	1	2025-11-02 15:54:28.062861
\.


--
-- Data for Name: training_hero; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_hero (id, title_en, title_ar, subtitle_en, subtitle_ar, hero_image, cta_label_en, cta_label_ar, is_enabled, created_at, updated_at, cta_link, hero_image_alt) FROM stdin;
1	Training Program	البرنامج التدريبي	Master Data Analysis Skills with Expert-Led Training	أتقن مهارات تحليل البيانات مع التدريب بقيادة الخبراء	https://imanagementpro.com/wp-content/uploads/2025/01/Data-A-1.png	Enroll Now	سجل الآن	1	2025-11-02 15:46:55.544093	2025-11-02 15:46:55.544093	#contact-form	
\.


--
-- Data for Name: training_journey_cards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_journey_cards (id, name_en, name_ar, quote_en, quote_ar, icon_image, sort_order, published, created_at, updated_at) FROM stdin;
1	Mohamed Omar Khalil	محمد عمر خليل 	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً	https://imanagementpro.com/wp-content/uploads/2025/02/mentorship_18615147-1-2.png	0	t	2025-11-04 15:27:18.275561	2025-11-04 15:27:18.275561
2	Mariam Fahmy	مريم فهمي 	حابة اشكركم بجد علي المعاملة اللطيفة من المكان كله انا اخدت أكثر من كورس معاكم وكمان شرحت المكان لناس كتير وبالفعل في منهم ابتدأ معاكم زي أنا حبيت المكان جداً بالناس بالمعاملة أتمني ليكم التوفيق والنجاح والاستمرارية\r\n\r\n	حابة اشكركم بجد علي المعاملة اللطيفة من المكان كله انا اخدت أكثر من كورس معاكم وكمان شرحت المكان لناس كتير وبالفعل في منهم ابتدأ معاكم زي أنا حبيت المكان جداً بالناس بالمعاملة أتمني ليكم التوفيق والنجاح والاستمرارية\r\n\r\n	https://imanagementpro.com/wp-content/uploads/2025/02/guarantee_12154893-1.png	0	t	2025-11-04 15:28:04.984598	2025-11-04 15:28:04.984598
3	Mohamed Alnobe	محمد النوبي	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً\r\n\r\n	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً\r\n\r\n	https://imanagementpro.com/wp-content/uploads/2025/02/setting_2134116-1.png	0	t	2025-11-04 15:29:38.457847	2025-11-04 15:29:38.457847
4	Mohamed Alnobe	محمد النوبي	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً\r\n\r\n	الكورس ممتاز وفادني في شغلي جدا وطور من طريقه شغلي في تحليل البيانات جداً شكراً للناس المحترمة في كل حاجة وبالتوفيق ديماً\r\n\r\n	https://imanagementpro.com/wp-content/uploads/2025/02/setting_2134116-1.png	0	t	2025-11-04 16:04:13.417412	2025-11-04 16:04:13.417412
\.


--
-- Data for Name: training_journey_video; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_journey_video (id, video_url, is_enabled, created_at, updated_at) FROM stdin;
1	https://imanagementpro.com/wp-content/uploads/2025/07/Copy-of-Hook-1.mp4	t	2025-11-04 15:10:01.199977	2025-11-04 15:10:01.199977
\.


--
-- Data for Name: training_learn_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_learn_items (id, title_en, title_ar, body_en, body_ar, icon_image, sort_order, published, created_at) FROM stdin;
1	Data Visualization	التصور البصري للبيانات	Master Excel charts, Power BI dashboards, and visual storytelling	إتقان مخططات Excel ولوحات معلومات Power BI وسرد القصص المرئية	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762681967_exploratory-analysis.png	0	1	2025-11-02 15:54:13.690025
2	Statistical Analysis	التحليل الإحصائي	Learn hypothesis testing, regression, and predictive modeling	تعلم اختبار الفرضيات والانحدار والنمذجة التنبؤية	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762682719_scatter-graph%20(1).png	1	1	2025-11-02 15:54:13.690025
3	SQL Mastery	إتقان SQL	Query databases efficiently and extract valuable insights	استعلام قواعد البيانات بكفاءة واستخراج رؤى قيمة	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762682027_database.png	2	1	2025-11-02 15:54:13.690025
4	Real Projects	مشاريع حقيقية	Work on industry-standard case studies and datasets	العمل على دراسات الحالة ومجموعات البيانات القياسية في الصناعة	https://f79ffb49-0368-4b1a-8f31-62462d0b50ba-00-3jqftuy5m8vsc.spock.replit.dev/assets/uploads/1762681958_dashboard%20(1).png	3	1	2025-11-02 15:54:13.690025
\.


--
-- Data for Name: training_outcomes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_outcomes (id, title_en, title_ar, body_en, body_ar, icon_image, sort_order, published, created_at) FROM stdin;
1	Career Advancement	التقدم الوظيفي	Boost your career with in-demand data analysis skills	عزز حياتك المهنية بمهارات تحليل البيانات المطلوبة		0	1	2025-11-02 15:54:18.712604
2	Data-Driven Decisions	قرارات مبنية على البيانات	Make confident business decisions backed by data insights	اتخذ قرارات عمل واثقة مدعومة برؤى البيانات		1	1	2025-11-02 15:54:18.712604
3	Industry Recognition	اعتراف في الصناعة	Join a network of certified data analysis professionals	انضم إلى شبكة من محترفي تحليل البيانات المعتمدين		2	1	2025-11-02 15:54:18.712604
\.


--
-- Data for Name: training_testimonials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.training_testimonials (id, name, role_company, quote_en, quote_ar, photo, sort_order, published, created_at) FROM stdin;
1	Sarah Ahmed	Data Analyst, Tech Corp	This training program transformed my career. The practical approach and expert mentorship made all the difference!	هذا البرنامج التدريبي غيّر مسيرتي المهنية. النهج العملي والإرشاد من الخبراء صنع الفارق!		0	1	2025-11-02 15:54:22.759093
2	Mohammed Ali	Business Intelligence Manager	Best investment I made in my professional development. The skills I learned are directly applicable to my daily work.	أفضل استثمار قمت به في تطويري المهني. المهارات التي تعلمتها قابلة للتطبيق مباشرة في عملي اليومي.		1	1	2025-11-02 15:54:22.759093
\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.uploads (id, filename, filepath, uploaded_at) FROM stdin;
10	Gemini_Generated_Image_569ekr569ekr569e.png	assets/uploads/1761740580_Gemini_Generated_Image_569ekr569ekr569e.png	2025-10-29 12:23:00.831186
11	Gemini_Generated_Image_rt6v6nrt6v6nrt6v.png	assets/uploads/1761740678_Gemini_Generated_Image_rt6v6nrt6v6nrt6v.png	2025-10-29 12:24:38.588574
13	Gemini_Generated_Image_rt6v6nrt6v6nrt6v - Copy.png	assets/uploads/1761742614_Gemini_Generated_Image_rt6v6nrt6v6nrt6v - Copy.png	2025-10-29 12:56:54.537915
14	Gemini_Generated_Image_e5prpre5prpre5pr (1).png	assets/uploads/1761751341_Gemini_Generated_Image_e5prpre5prpre5pr (1).png	2025-10-29 15:22:21.286359
16	pexels-freestockpro-12955671.jpg	assets/uploads/1762161472_pexels-freestockpro-12955671.jpg	2025-11-03 09:17:52.639731
17	dashboard (1).png	assets/uploads/1762681958_dashboard (1).png	2025-11-09 09:52:38.824546
18	exploratory-analysis.png	assets/uploads/1762681967_exploratory-analysis.png	2025-11-09 09:52:47.264552
19	database.png	assets/uploads/1762682027_database.png	2025-11-09 09:53:47.79797
20	chart.png	assets/uploads/1762682706_chart.png	2025-11-09 10:05:06.409515
21	scatter-graph (1).png	assets/uploads/1762682719_scatter-graph (1).png	2025-11-09 10:05:19.711045
22	presentation.png	assets/uploads/1762683361_presentation.png	2025-11-09 10:16:01.585907
23	lifetime.png	assets/uploads/1762683366_lifetime.png	2025-11-09 10:16:06.628836
24	certificate.png	assets/uploads/1762683375_certificate.png	2025-11-09 10:16:15.372261
25	Exploratory-Data-Analysis-1-1024x536.png	assets/uploads/1762951279_Exploratory-Data-Analysis-1-1024x536.png	2025-11-12 12:41:19.68591
26	laptop-power-bi-scaled.jpg	assets/uploads/1763290681_laptop-power-bi-scaled.jpg	2025-11-16 10:58:01.5493
27	Power-BI-Reduce-Visuals-and-Filters-1024x736.png	assets/uploads/1763290936_Power-BI-Reduce-Visuals-and-Filters-1024x736.png	2025-11-16 11:02:16.163018
28	Untitled_design_12.png	assets/uploads/1763291067_Untitled_design_12.png	2025-11-16 11:04:27.411405
29	tableau-tutorial.png	assets/uploads/tableau-tutorial_6922c167b61ee.png	2025-11-23 08:10:15.842339
30	tableau-features.jpg	assets/uploads/tableau-features_6922c167d5a85.jpg	2025-11-23 08:10:16.021385
31	looker-studio-overvi.png	assets/uploads/looker-studio-overvi_6922c553ec678.png	2025-11-23 08:27:00.056652
32	G_looker-studio-dariushpix2025.webp	assets/uploads/G_looker-studio-dariushpix2025_6922c55d1149d.webp	2025-11-23 08:27:09.156975
33	Google-Looker-Studio-Tutorial.png	assets/uploads/Google-Looker-Studio-Tutorial_6922c55d2d7e7.png	2025-11-23 08:27:09.327292
40	IBM-Cognos-analytics-logo-540X280-300x156.jpg	assets/uploads/IBM-Cognos-analytics-logo-540X280-300x156_6922ceb4c6eaa.jpg	2025-11-23 09:07:00.909151
41	cognos_analytics_banner.jpg	assets/uploads/cognos_analytics_banner_6922ceb4e6952.jpg	2025-11-23 09:07:01.090391
42	cognos-illustration.png	assets/uploads/cognos-illustration_6922ceb51ccdd.png	2025-11-23 09:07:01.264196
43	logo.jpg	assets/uploads/logo_6922ceb5473e0.jpg	2025-11-23 09:07:01.436401
44	671227debad428001d97cf23.jpg	assets/uploads/671227debad428001d97cf23_6922ceb571464.jpg	2025-11-23 09:07:01.60853
\.


--
-- Name: about_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.about_section_id_seq', 1, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 3, true);


--
-- Name: benefits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.benefits_id_seq', 7, true);


--
-- Name: contact_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_messages_id_seq', 1, false);


--
-- Name: content_item_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.content_item_translations_id_seq', 1, false);


--
-- Name: content_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.content_items_id_seq', 15, true);


--
-- Name: course_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_details_id_seq', 1, true);


--
-- Name: course_rounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_rounds_id_seq', 4, true);


--
-- Name: faq_all_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faq_all_questions_id_seq', 7, true);


--
-- Name: faq_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faq_hero_id_seq', 1, true);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faq_id_seq', 14, true);


--
-- Name: faq_top_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faq_top_questions_id_seq', 3, true);


--
-- Name: footer_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.footer_settings_id_seq', 21, true);


--
-- Name: hero_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hero_section_id_seq', 1, true);


--
-- Name: page_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_content_id_seq', 16, true);


--
-- Name: page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_sections_id_seq', 23, true);


--
-- Name: page_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_translations_id_seq', 12, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 6, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 23, true);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 3, true);


--
-- Name: topic_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topic_translations_id_seq', 8, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_id_seq', 11, true);


--
-- Name: tp_learn_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tp_learn_section_id_seq', 1, true);


--
-- Name: tp_testimonial_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tp_testimonial_links_id_seq', 2, true);


--
-- Name: training_bonuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_bonuses_id_seq', 6, true);


--
-- Name: training_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_faq_id_seq', 3, true);


--
-- Name: training_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_hero_id_seq', 1, true);


--
-- Name: training_journey_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_journey_cards_id_seq', 5, true);


--
-- Name: training_journey_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_journey_video_id_seq', 1, true);


--
-- Name: training_learn_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_learn_items_id_seq', 5, true);


--
-- Name: training_outcomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_outcomes_id_seq', 3, true);


--
-- Name: training_testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_testimonials_id_seq', 2, true);


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uploads_id_seq', 44, true);


--
-- Name: about_section about_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_section
    ADD CONSTRAINT about_section_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_email_key UNIQUE (email);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: benefits benefits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.benefits
    ADD CONSTRAINT benefits_pkey PRIMARY KEY (id);


--
-- Name: contact_messages contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (id);


--
-- Name: content_item_translations content_item_translations_content_item_id_lang_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_item_translations
    ADD CONSTRAINT content_item_translations_content_item_id_lang_key UNIQUE (content_item_id, lang);


--
-- Name: content_item_translations content_item_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_item_translations
    ADD CONSTRAINT content_item_translations_pkey PRIMARY KEY (id);


--
-- Name: content_items content_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_items
    ADD CONSTRAINT content_items_pkey PRIMARY KEY (id);


--
-- Name: content_items content_items_topic_id_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_items
    ADD CONSTRAINT content_items_topic_id_slug_key UNIQUE (topic_id, slug);


--
-- Name: course_details course_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_details
    ADD CONSTRAINT course_details_pkey PRIMARY KEY (id);


--
-- Name: course_rounds course_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_rounds
    ADD CONSTRAINT course_rounds_pkey PRIMARY KEY (id);


--
-- Name: faq_all_questions faq_all_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_all_questions
    ADD CONSTRAINT faq_all_questions_pkey PRIMARY KEY (id);


--
-- Name: faq_hero faq_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_hero
    ADD CONSTRAINT faq_hero_pkey PRIMARY KEY (id);


--
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- Name: faq_top_questions faq_top_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faq_top_questions
    ADD CONSTRAINT faq_top_questions_pkey PRIMARY KEY (id);


--
-- Name: footer_settings footer_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_settings
    ADD CONSTRAINT footer_settings_pkey PRIMARY KEY (id);


--
-- Name: footer_settings footer_settings_setting_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_settings
    ADD CONSTRAINT footer_settings_setting_key_key UNIQUE (setting_key);


--
-- Name: hero_section hero_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_section
    ADD CONSTRAINT hero_section_pkey PRIMARY KEY (id);


--
-- Name: page_content page_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_pkey PRIMARY KEY (id);


--
-- Name: page_sections page_sections_page_name_section_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_page_name_section_key_key UNIQUE (page_name, section_key);


--
-- Name: page_sections page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_pkey PRIMARY KEY (id);


--
-- Name: page_translations page_translations_page_id_lang_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_translations
    ADD CONSTRAINT page_translations_page_id_lang_key UNIQUE (page_id, lang);


--
-- Name: page_translations page_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_translations
    ADD CONSTRAINT page_translations_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages pages_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_slug_key UNIQUE (slug);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_setting_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_setting_key_key UNIQUE (setting_key);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: topic_translations topic_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_translations
    ADD CONSTRAINT topic_translations_pkey PRIMARY KEY (id);


--
-- Name: topic_translations topic_translations_topic_id_lang_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_translations
    ADD CONSTRAINT topic_translations_topic_id_lang_key UNIQUE (topic_id, lang);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: topics topics_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_slug_key UNIQUE (slug);


--
-- Name: tp_learn_section tp_learn_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tp_learn_section
    ADD CONSTRAINT tp_learn_section_pkey PRIMARY KEY (id);


--
-- Name: tp_testimonial_links tp_testimonial_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tp_testimonial_links
    ADD CONSTRAINT tp_testimonial_links_pkey PRIMARY KEY (id);


--
-- Name: training_bonuses training_bonuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_bonuses
    ADD CONSTRAINT training_bonuses_pkey PRIMARY KEY (id);


--
-- Name: training_faq training_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_faq
    ADD CONSTRAINT training_faq_pkey PRIMARY KEY (id);


--
-- Name: training_hero training_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_hero
    ADD CONSTRAINT training_hero_pkey PRIMARY KEY (id);


--
-- Name: training_journey_cards training_journey_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_journey_cards
    ADD CONSTRAINT training_journey_cards_pkey PRIMARY KEY (id);


--
-- Name: training_journey_video training_journey_video_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_journey_video
    ADD CONSTRAINT training_journey_video_pkey PRIMARY KEY (id);


--
-- Name: training_learn_items training_learn_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_learn_items
    ADD CONSTRAINT training_learn_items_pkey PRIMARY KEY (id);


--
-- Name: training_outcomes training_outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_outcomes
    ADD CONSTRAINT training_outcomes_pkey PRIMARY KEY (id);


--
-- Name: training_testimonials training_testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_testimonials
    ADD CONSTRAINT training_testimonials_pkey PRIMARY KEY (id);


--
-- Name: uploads uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: idx_contact_messages_round_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_contact_messages_round_id ON public.contact_messages USING btree (selected_round_id);


--
-- Name: idx_course_rounds_published; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_course_rounds_published ON public.course_rounds USING btree (published);


--
-- Name: idx_course_rounds_sort_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_course_rounds_sort_order ON public.course_rounds USING btree (sort_order);


--
-- Name: idx_course_rounds_start_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_course_rounds_start_at ON public.course_rounds USING btree (start_at);


--
-- Name: content_items content_items_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_items
    ADD CONSTRAINT content_items_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: page_content page_content_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.uploads(id) ON DELETE SET NULL;


--
-- Name: page_content page_content_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: page_translations page_translations_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_translations
    ADD CONSTRAINT page_translations_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: tp_testimonial_links tp_testimonial_links_testimonial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tp_testimonial_links
    ADD CONSTRAINT tp_testimonial_links_testimonial_id_fkey FOREIGN KEY (testimonial_id) REFERENCES public.testimonials(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict PH5FG2xIFf1oYXwMjJ3S5tE3e93FnhqvCVByhTFUfsfpa6b5fOcJxjE6QubobxD

