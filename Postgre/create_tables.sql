--
-- PostgreSQL database dump
--

\restrict 96nAW4ZCebkCqQWbcm3VoPMGO5rMDF0hiVFgGjpE6KzsruJYqK9cfXgwH7fPwp6

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-12 22:49:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 17262)
-- Name: listoforders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listoforders (
    "Order ID" character varying(25) NOT NULL,
    "Order Date" date NOT NULL,
    "CustomerName" character varying(100) NOT NULL,
    "State" character varying(50),
    "City" character varying(50)
);


ALTER TABLE public.listoforders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17271)
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    detail_id integer NOT NULL,
    "Order ID" character varying(25) NOT NULL,
    "Amount" numeric(10,2),
    "Profit" numeric(10,2),
    "Quantity" integer,
    "Category" character varying(50),
    "Sub-Category" character varying(50)
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17270)
-- Name: orderdetails_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetails_detail_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 220
-- Name: orderdetails_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_detail_id_seq OWNED BY public.orderdetails.detail_id;


--
-- TOC entry 223 (class 1259 OID 17285)
-- Name: salestarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salestarget (
    target_id integer NOT NULL,
    "Month of Order Date" character varying(20) NOT NULL,
    "Category" character varying(50) NOT NULL,
    "Target" numeric(10,2),
    CONSTRAINT "salestarget_Target_check" CHECK (("Target" >= (0)::numeric))
);


ALTER TABLE public.salestarget OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17284)
-- Name: salestarget_target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salestarget_target_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salestarget_target_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 222
-- Name: salestarget_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salestarget_target_id_seq OWNED BY public.salestarget.target_id;


--
-- TOC entry 4764 (class 2604 OID 17274)
-- Name: orderdetails detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN detail_id SET DEFAULT nextval('public.orderdetails_detail_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 17288)
-- Name: salestarget target_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salestarget ALTER COLUMN target_id SET DEFAULT nextval('public.salestarget_target_id_seq'::regclass);


--
-- TOC entry 4921 (class 0 OID 17262)
-- Dependencies: 219
-- Data for Name: listoforders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listoforders ("Order ID", "Order Date", "CustomerName", "State", "City") FROM stdin;
B-25601	2018-04-01	Bharat	Gujarat	Ahmedabad
B-25602	2018-04-01	Pearl	Maharashtra	Pune
B-25603	2018-04-03	Jahan	Madhya Pradesh	Bhopal
B-25604	2018-04-03	Divsha	Rajasthan	Jaipur
B-25605	2018-04-05	Kasheen	West Bengal	Kolkata
B-25606	2018-04-06	Hazel	Karnataka	Bangalore
B-25607	2018-04-06	Sonakshi	Jammu and Kashmir	Kashmir
B-25608	2018-04-08	Aarushi	Tamil Nadu	Chennai
B-25609	2018-04-09	Jitesh	Uttar Pradesh	Lucknow
B-25610	2018-04-09	Yogesh	Bihar	Patna
B-25611	2018-04-11	Anita	Kerala 	Thiruvananthapuram
B-25612	2018-04-12	Shrichand	Punjab	Chandigarh
B-25613	2018-04-12	Mukesh	Haryana	Chandigarh
B-25614	2018-04-13	Vandana	Himachal Pradesh	Simla
B-25615	2018-04-15	Bhavna	Sikkim	Gangtok
B-25616	2018-04-15	Kanak	Goa	Goa
B-25617	2018-04-17	Sagar	Nagaland	Kohima
B-25618	2018-04-18	Manju	Andhra Pradesh	Hyderabad
B-25619	2018-04-18	Ramesh	Gujarat	Ahmedabad
B-25620	2018-04-20	Sarita	Maharashtra	Pune
B-25621	2018-04-20	Deepak	Madhya Pradesh	Bhopal
B-25622	2018-04-22	Monisha	Rajasthan	Jaipur
B-25623	2018-04-22	Atharv	West Bengal	Kolkata
B-25624	2018-04-22	Vini	Karnataka	Bangalore
B-25625	2018-04-23	Pinky	Jammu and Kashmir	Kashmir
B-25626	2018-04-23	Bhishm	Maharashtra	Mumbai
B-25627	2018-04-23	Hitika	Madhya Pradesh	Indore
B-25628	2018-04-24	Pooja	Bihar	Patna
B-25629	2018-04-24	Hemant	Kerala 	Thiruvananthapuram
B-25630	2018-04-24	Sahil	Punjab	Chandigarh
B-25631	2018-04-24	Ritu	Haryana	Chandigarh
B-25632	2018-04-25	Manish	Himachal Pradesh	Simla
B-25633	2018-04-26	Amit	Sikkim	Gangtok
B-25634	2018-04-26	Sanjay	Goa	Goa
B-25635	2018-04-26	Nidhi	Nagaland	Kohima
B-25636	2018-04-26	Nishi	Maharashtra	Mumbai
B-25637	2018-04-26	Ashmi	Madhya Pradesh	Indore
B-25638	2018-04-26	Parth	Maharashtra	Pune
B-25639	2018-04-27	Lisha	Madhya Pradesh	Bhopal
B-25640	2018-04-27	Paridhi	Rajasthan	Jaipur
B-25641	2018-04-27	Parishi	West Bengal	Kolkata
B-25642	2018-04-28	Ajay	Karnataka	Bangalore
B-25643	2018-04-29	Kirti	Jammu and Kashmir	Kashmir
B-25644	2018-04-30	Mayank	Maharashtra	Mumbai
B-25645	2018-05-01	Yaanvi	Madhya Pradesh	Indore
B-25646	2018-05-01	Sonal	Bihar	Patna
B-25647	2018-05-03	Sharda	Kerala 	Thiruvananthapuram
B-25648	2018-05-04	Aditya	Punjab	Chandigarh
B-25649	2018-05-05	Rachna	Haryana	Chandigarh
B-25650	2018-05-06	Chirag	Maharashtra	Mumbai
B-25651	2018-05-07	Anurag	Madhya Pradesh	Indore
B-25652	2018-05-08	Tushina	Goa	Goa
B-25653	2018-05-08	Farah	Nagaland	Kohima
B-25654	2018-05-10	Sabah	Maharashtra	Mumbai
B-25655	2018-05-11	Nida	Madhya Pradesh	Indore
B-25656	2018-05-11	Priyanka	Maharashtra	Pune
B-25657	2018-05-13	Tulika	Madhya Pradesh	Bhopal
B-25658	2018-05-14	Shefali	Rajasthan	Jaipur
B-25659	2018-05-15	Sanskriti	West Bengal	Kolkata
B-25660	2018-05-16	Shruti	Karnataka	Bangalore
B-25661	2018-05-17	Subhashree	Jammu and Kashmir	Kashmir
B-25662	2018-05-17	Sweta	Maharashtra	Mumbai
B-25663	2018-05-19	Pournamasi	Madhya Pradesh	Indore
B-25664	2018-05-20	Pratyusmita	Bihar	Patna
B-25665	2018-05-21	Chayanika	Kerala 	Thiruvananthapuram
B-25666	2018-05-22	Tanvi	Punjab	Chandigarh
B-25667	2018-05-23	Anjali	Haryana	Chandigarh
B-25668	2018-05-24	Rhea	Himachal Pradesh	Simla
B-25669	2018-05-25	Piyali	Sikkim	Gangtok
B-25670	2018-05-25	Charika	Goa	Goa
B-25671	2018-05-27	Mitali	Nagaland	Kohima
B-25672	2018-05-28	Akanksha	Andhra Pradesh	Hyderabad
B-25673	2018-05-28	Arsheen	Gujarat	Ahmedabad
B-25674	2018-05-28	Mahima	Maharashtra	Pune
B-25675	2018-05-31	Shreya	Madhya Pradesh	Bhopal
B-25676	2018-06-01	Chandni	Rajasthan	Jaipur
B-25677	2018-06-02	Ekta	West Bengal	Kolkata
B-25678	2018-06-03	Bathina	Karnataka	Bangalore
B-25679	2018-06-04	Avni	Maharashtra	Mumbai
B-25680	2018-06-04	Aayushi	Madhya Pradesh	Indore
B-25681	2018-06-04	Bhawna	Madhya Pradesh	Indore
B-25682	2018-06-07	Krutika	Bihar	Patna
B-25683	2018-06-08	Shreya	Kerala 	Thiruvananthapuram
B-25684	2018-06-09	Samiksha	Maharashtra	Mumbai
B-25685	2018-06-10	Sheetal	Madhya Pradesh	Indore
B-25686	2018-06-11	Pooja	Himachal Pradesh	Simla
B-25687	2018-06-11	Sanjna	Maharashtra	Mumbai
B-25688	2018-06-11	Swetha	Madhya Pradesh	Indore
B-25689	2018-06-14	Bhaggyasree	Maharashtra	Mumbai
B-25690	2018-06-15	Gunjan	Madhya Pradesh	Indore
B-25691	2018-06-16	Akancha	Maharashtra	Mumbai
B-25692	2018-06-17	Rashmi	Madhya Pradesh	Indore
B-25693	2018-06-18	Parna	Madhya Pradesh	Bhopal
B-25694	2018-06-18	Subhasmita	Rajasthan	Jaipur
B-25695	2018-06-18	Suhani	West Bengal	Kolkata
B-25696	2018-06-21	Noopur	Karnataka	Bangalore
B-25697	2018-06-22	Vijay	Jammu and Kashmir	Kashmir
B-25698	2018-06-23	Amisha	Tamil Nadu	Chennai
B-25699	2018-06-24	Kritika	Uttar Pradesh	Lucknow
B-25700	2018-06-25	Shubhi	Maharashtra	Mumbai
B-25701	2018-06-26	Maithilee	Madhya Pradesh	Indore
B-25702	2018-06-27	Shaily	Maharashtra	Mumbai
B-25703	2018-06-28	Ekta	Madhya Pradesh	Indore
B-25704	2018-06-29	Riya	Maharashtra	Mumbai
B-25705	2018-06-30	Shweta	Madhya Pradesh	Indore
B-25706	2018-07-01	Swetlana	Goa	Goa
B-25707	2018-07-01	Shivani	Maharashtra	Mumbai
B-25708	2018-07-01	Kishwar	Madhya Pradesh	Indore
B-25709	2018-07-01	Aakanksha	Madhya Pradesh	Indore
B-25710	2018-07-05	Megha	Maharashtra	Pune
B-25711	2018-07-06	Sakshi	Madhya Pradesh	Bhopal
B-25712	2018-07-07	Adhvaita	Rajasthan	Jaipur
B-25713	2018-07-08	Raksha	West Bengal	Kolkata
B-25714	2018-07-09	Stuti	Karnataka	Bangalore
B-25715	2018-07-10	Srishti	Jammu and Kashmir	Kashmir
B-25716	2018-07-11	Surabhi	Tamil Nadu	Chennai
B-25717	2018-07-12	Manshul	Uttar Pradesh	Lucknow
B-25718	2018-07-12	Anjali	Maharashtra	Mumbai
B-25719	2018-07-12	Rashmi	Madhya Pradesh	Indore
B-25720	2018-07-15	Namrata	Punjab	Chandigarh
B-25721	2018-07-16	Anchal	Haryana	Chandigarh
B-25722	2018-07-17	Inderpreet	Himachal Pradesh	Simla
B-25723	2018-07-18	Wale	Maharashtra	Mumbai
B-25724	2018-07-19	Sheetal	Madhya Pradesh	Indore
B-25725	2018-07-20	Anisha	Nagaland	Kohima
B-25726	2018-07-21	Kiran	Maharashtra	Mumbai
B-25727	2018-07-22	Turumella	Madhya Pradesh	Indore
B-25728	2018-07-22	Ameesha	Maharashtra	Pune
B-25729	2018-07-22	Madhulika	Madhya Pradesh	Bhopal
B-25730	2018-07-22	Rishabh	Rajasthan	Jaipur
B-25731	2018-07-26	Akash	West Bengal	Kolkata
B-25732	2018-07-27	Anubhaw	Karnataka	Bangalore
B-25733	2018-07-28	Dhirajendu	Maharashtra	Mumbai
B-25734	2018-07-29	Pranav	Madhya Pradesh	Indore
B-25735	2018-07-30	Arindam	Uttar Pradesh	Lucknow
B-25736	2018-07-31	Akshat	Maharashtra	Mumbai
B-25737	2018-08-01	Shubham	Madhya Pradesh	Indore
B-25738	2018-08-02	Ayush	Punjab	Chandigarh
B-25739	2018-08-03	Daksh	Haryana	Chandigarh
B-25740	2018-08-03	Rane	Maharashtra	Mumbai
B-25741	2018-08-03	Navdeep	Madhya Pradesh	Indore
B-25742	2018-08-03	Ashwin	Goa	Goa
B-25743	2018-08-07	Aman	Nagaland	Kohima
B-25744	2018-08-08	Devendra	Andhra Pradesh	Hyderabad
B-25745	2018-08-09	Kartik	Gujarat	Ahmedabad
B-25746	2018-08-10	Shivam	Maharashtra	Pune
B-25747	2018-08-11	Harsh	Madhya Pradesh	Bhopal
B-25748	2018-08-12	Nitant	Rajasthan	Jaipur
B-25749	2018-08-13	Ayush	Maharashtra	Mumbai
B-25750	2018-08-14	Priyanshu	Madhya Pradesh	Indore
B-25751	2018-08-14	Nishant	Maharashtra	Mumbai
B-25752	2018-08-14	Vaibhav	Madhya Pradesh	Indore
B-25753	2018-08-17	Shivam	Uttar Pradesh	Lucknow
B-25754	2018-08-18	Akshay	Bihar	Patna
B-25755	2018-08-19	Shourya	Kerala 	Thiruvananthapuram
B-25756	2018-08-20	Mohan	Maharashtra	Mumbai
B-25757	2018-08-21	Mohit	Madhya Pradesh	Indore
B-25758	2018-08-22	Shubham	Himachal Pradesh	Simla
B-25759	2018-08-23	Soumya	Sikkim	Gangtok
B-25760	2018-08-24	Pooja	Goa	Goa
B-25761	2018-08-25	Surabhi	Maharashtra	Mumbai
B-25762	2018-08-26	Anudeep	Madhya Pradesh	Indore
B-25763	2018-08-27	Noshiba	Gujarat	Ahmedabad
B-25764	2018-08-28	Sanjova	Maharashtra	Pune
B-25765	2018-08-29	Meghana	Madhya Pradesh	Bhopal
B-25766	2018-08-30	Surabhi	Rajasthan	Jaipur
B-25767	2018-08-31	Ashmeet	West Bengal	Kolkata
B-25768	2018-09-01	Shreyoshe	Karnataka	Bangalore
B-25769	2018-09-02	Surbhi	Maharashtra	Mumbai
B-25770	2018-09-02	Sakshi	Madhya Pradesh	Indore
B-25771	2018-09-02	Vaibhavi	Uttar Pradesh	Lucknow
B-25772	2018-09-02	Sanjana	Bihar	Patna
B-25773	2018-09-06	Shreya	Kerala 	Thiruvananthapuram
B-25774	2018-09-07	Snehal	Punjab	Chandigarh
B-25775	2018-09-08	Duhita	Haryana	Chandigarh
B-25776	2018-09-09	Mousam	Maharashtra	Mumbai
B-25777	2018-09-10	Aditi	Madhya Pradesh	Indore
B-25778	2018-09-11	Surabhi	Maharashtra	Mumbai
B-25779	2018-09-12	Savi	Madhya Pradesh	Indore
B-25780	2018-09-13	Teena	Andhra Pradesh	Hyderabad
B-25781	2018-09-14	Rutuja	Gujarat	Ahmedabad
B-25782	2018-09-15	Aayushi	Maharashtra	Mumbai
B-25783	2018-09-15	Shivangi	Madhya Pradesh	Indore
B-25784	2018-09-15	Rohit	Rajasthan	Jaipur
B-25785	2018-09-15	Ayush	West Bengal	Kolkata
B-25786	2018-09-19	Abhishek	Karnataka	Bangalore
B-25787	2018-09-20	Asish	Jammu and Kashmir	Kashmir
B-25788	2018-09-21	Dinesh	Tamil Nadu	Chennai
B-25789	2018-09-22	Akshay	Uttar Pradesh	Lucknow
B-25790	2018-09-23	Sajal	Bihar	Patna
B-25791	2018-09-24	Avish	Kerala 	Thiruvananthapuram
B-25792	2018-09-24	Abhishek	Maharashtra	Mumbai
B-25793	2018-09-24	Siddharth	Madhya Pradesh	Indore
B-25794	2018-09-24	Aditya	Himachal Pradesh	Simla
B-25795	2018-09-24	Sukant	Sikkim	Gangtok
B-25796	2018-09-24	Sukrith	Maharashtra	Mumbai
B-25797	2018-09-30	Sauptik	Madhya Pradesh	Indore
B-25798	2018-10-01	Shishu	Andhra Pradesh	Hyderabad
B-25799	2018-10-01	Divyansh	Gujarat	Ahmedabad
B-25800	2018-10-01	Ishit	Maharashtra	Pune
B-25801	2018-10-01	Aryan	Madhya Pradesh	Bhopal
B-25802	2018-10-05	Yash	Maharashtra	Mumbai
B-25803	2018-10-05	Shivanshu	Madhya Pradesh	Indore
B-25804	2018-10-05	Sudheer	Karnataka	Bangalore
B-25805	2018-10-05	Ankit	Maharashtra	Mumbai
B-25806	2018-10-06	Dhanraj	Madhya Pradesh	Indore
B-25807	2018-10-07	Vipul	Uttar Pradesh	Lucknow
B-25808	2018-10-08	Apsingekar	Bihar	Patna
B-25809	2018-10-09	Suman	Kerala 	Thiruvananthapuram
B-25810	2018-10-10	Nripraj	Punjab	Chandigarh
B-25811	2018-10-10	Utsav	Maharashtra	Mumbai
B-25812	2018-10-10	Kshitij	Madhya Pradesh	Indore
B-25813	2018-10-10	Hrisheekesh	Maharashtra	Mumbai
B-25814	2018-10-10	Swapnil	Madhya Pradesh	Indore
B-25815	2018-10-10	Harsh	Nagaland	Kohima
B-25816	2018-10-12	Mane	Andhra Pradesh	Hyderabad
B-25817	2018-10-13	Praneet	Maharashtra	Mumbai
B-25818	2018-10-14	Sandeep	Madhya Pradesh	Indore
B-25819	2018-10-15	Ankur	Madhya Pradesh	Bhopal
B-25820	2018-10-16	Dheeraj	Rajasthan	Jaipur
B-25821	2018-10-16	Ajay	West Bengal	Kolkata
B-25822	2018-10-18	Tejas	Karnataka	Bangalore
B-25823	2018-10-18	Rohan	Maharashtra	Mumbai
B-25824	2018-10-20	Shyam	Madhya Pradesh	Indore
B-25825	2018-10-21	Kartik	Madhya Pradesh	Indore
B-25826	2018-10-22	Tanushree	Maharashtra	Mumbai
B-25827	2018-10-23	Sheetal	Madhya Pradesh	Indore
B-25828	2018-10-24	Nikita	Punjab	Chandigarh
B-25829	2018-10-25	Apoorva	Haryana	Chandigarh
B-25830	2018-10-26	Aastha	Himachal Pradesh	Simla
B-25831	2018-10-27	Mahima	Sikkim	Gangtok
B-25832	2018-10-28	Harshita	Maharashtra	Mumbai
B-25833	2018-10-29	Krishna	Madhya Pradesh	Indore
B-25834	2018-10-29	Ananya	Andhra Pradesh	Hyderabad
B-25835	2018-10-29	Moumita	Gujarat	Ahmedabad
B-25836	2018-10-29	Arti	Maharashtra	Pune
B-25837	2018-10-29	Palak	Maharashtra	Mumbai
B-25838	2018-10-29	Sanjana	Madhya Pradesh	Indore
B-25839	2018-10-30	Pranjali	West Bengal	Kolkata
B-25840	2018-10-31	Sneha	Karnataka	Bangalore
B-25841	2018-11-01	Ashvini	Maharashtra	Mumbai
B-25842	2018-11-02	Sheetal	Madhya Pradesh	Indore
B-25843	2018-11-03	Mrunal	Maharashtra	Mumbai
B-25844	2018-11-03	Swati	Madhya Pradesh	Indore
B-25845	2018-11-03	Snel	Kerala 	Thiruvananthapuram
B-25846	2018-11-03	Soodesh	Punjab	Chandigarh
B-25847	2018-11-03	Aniket	Haryana	Chandigarh
B-25848	2018-11-03	Rohan	Himachal Pradesh	Simla
B-25849	2018-11-04	K	Sikkim	Gangtok
B-25850	2018-11-05	Abhishek	Goa	Goa
B-25851	2018-11-06	Kushal	Nagaland	Kohima
B-25852	2018-11-07	Soumyabrata	Andhra Pradesh	Hyderabad
B-25853	2018-11-08	Gaurav	Gujarat	Ahmedabad
B-25854	2018-11-08	Shubham	Maharashtra	Pune
B-25855	2018-11-08	Abhijeet	Madhya Pradesh	Bhopal
B-25856	2018-11-10	Abhijeet	Maharashtra	Mumbai
B-25857	2018-11-10	Anand	Madhya Pradesh	Indore
B-25858	2018-11-13	Swapnil	Maharashtra	Mumbai
B-25859	2018-11-14	Chikku	Madhya Pradesh	Indore
B-25860	2018-11-15	Akshay	Tamil Nadu	Chennai
B-25861	2018-11-15	Aayush	Uttar Pradesh	Lucknow
B-25862	2018-11-15	Amol	Bihar	Patna
B-25863	2018-11-15	Manibalan	Kerala 	Thiruvananthapuram
B-25864	2018-11-15	Aromal	Maharashtra	Mumbai
B-25865	2018-11-15	Arun	Madhya Pradesh	Indore
B-25866	2018-11-16	Komal	Himachal Pradesh	Simla
B-25867	2018-11-17	Ankit	Sikkim	Gangtok
B-25868	2018-11-18	Vikash	Goa	Goa
B-25869	2018-11-19	Parakh	Nagaland	Kohima
B-25870	2018-11-20	Pranav	Andhra Pradesh	Hyderabad
B-25871	2018-11-21	Gunjal	Gujarat	Surat
B-25872	2018-11-22	Saurabh	Maharashtra	Mumbai
B-25873	2018-11-23	Divyeta	Madhya Pradesh	Indore
B-25874	2018-11-24	Megha	Rajasthan	Udaipur
B-25875	2018-11-24	Divyeshkumar	Uttar Pradesh	Allahabad
B-25876	2018-11-24	Bhosale	Punjab	Amritsar
B-25877	2018-11-24	Dashyam	Gujarat	Surat
B-25878	2018-11-24	Mrinal	Maharashtra	Mumbai
B-25879	2018-11-24	Siddharth	Madhya Pradesh	Indore
B-25880	2018-11-24	Apoorv	Rajasthan	Udaipur
B-25881	2018-11-25	Pooja	Uttar Pradesh	Allahabad
B-25882	2018-11-26	Masurkar	Punjab	Amritsar
B-25883	2018-11-27	Saptadeep	Gujarat	Surat
B-25884	2018-11-28	Sumeet	Maharashtra	Mumbai
B-25885	2018-11-28	Shatayu	Madhya Pradesh	Indore
B-25886	2018-11-28	Brijesh	Rajasthan	Udaipur
B-25887	2018-12-01	Vedant	Uttar Pradesh	Allahabad
B-25888	2018-12-02	Rohan	Punjab	Amritsar
B-25889	2018-12-03	Abhishek	Gujarat	Surat
B-25890	2018-12-04	Divyansha	Maharashtra	Mumbai
B-25891	2018-12-04	Shivani	Madhya Pradesh	Indore
B-25892	2018-12-04	Aditi	Rajasthan	Udaipur
B-25893	2018-12-04	Aashna	Uttar Pradesh	Allahabad
B-25894	2018-12-04	Monu	Punjab	Amritsar
B-25895	2018-12-04	Sathya	Gujarat	Surat
B-25896	2018-12-05	Aman	Maharashtra	Mumbai
B-25897	2018-12-06	Rohan	Madhya Pradesh	Indore
B-25898	2018-12-07	Abhishek	Rajasthan	Udaipur
B-25899	2018-12-08	Aishwarya	Uttar Pradesh	Allahabad
B-25900	2018-12-09	Anand	Punjab	Amritsar
B-25901	2018-12-10	Suraj	Gujarat	Surat
B-25902	2018-12-10	Ishpreet	Maharashtra	Mumbai
B-25903	2018-12-10	Amlan	Madhya Pradesh	Indore
B-25904	2018-12-10	Swapnil	Delhi	Delhi
B-25905	2018-12-11	Bhargav	Madhya Pradesh	Delhi
B-25906	2018-12-11	Abhijit	Delhi	Delhi
B-25907	2018-12-11	Jaydeep	Madhya Pradesh	Bhopal
B-25908	2018-12-12	Pradeep	Delhi	Delhi
B-25909	2018-12-13	Sujay	Madhya Pradesh	Delhi
B-25910	2018-12-14	Jay	Delhi	Delhi
B-25911	2018-12-15	Phalguni	Madhya Pradesh	Bhopal
B-25912	2018-12-16	Preksha	Delhi	Delhi
B-25913	2018-12-17	Geetanjali	Madhya Pradesh	Delhi
B-25914	2018-12-18	Kajal	Delhi	Delhi
B-25915	2018-12-19	Sukruta	Punjab	Amritsar
B-25916	2018-12-20	Utkarsh	Gujarat	Surat
B-25917	2018-12-21	Sanjay	Maharashtra	Mumbai
B-25918	2018-12-22	Karandeep	Madhya Pradesh	Indore
B-25919	2018-12-23	Neha	Rajasthan	Udaipur
B-25920	2018-12-24	Jayanti	Uttar Pradesh	Allahabad
B-25921	2018-12-25	Sandra	Punjab	Amritsar
B-25922	2018-12-26	Akshata	Gujarat	Surat
B-25923	2018-12-27	Vishakha	Maharashtra	Mumbai
B-25924	2018-12-28	Prajakta	Karnataka	Bangalore
B-25925	2018-12-29	Shruti	Maharashtra	Mumbai
B-25926	2018-12-30	Dipali	Madhya Pradesh	Indore
B-25927	2018-12-31	Shreya	Uttar Pradesh	Lucknow
B-25928	2019-01-01	Smriti	Bihar	Patna
B-25929	2019-01-02	Girase	Kerala 	Thiruvananthapuram
B-25930	2019-01-03	Monica	Punjab	Chandigarh
B-25931	2019-01-04	Sidharth	Maharashtra	Mumbai
B-25932	2019-01-04	Bhutekar	Madhya Pradesh	Indore
B-25933	2019-01-04	Shikhar	Maharashtra	Mumbai
B-25934	2019-01-04	Rahul	Madhya Pradesh	Indore
B-25935	2019-01-04	Sudhir	Nagaland	Kohima
B-25936	2019-01-05	Nikhil	Punjab	Chandigarh
B-25937	2019-01-05	Ankit	Haryana	Chandigarh
B-25938	2019-01-05	Shikhar	Himachal Pradesh	Simla
B-25939	2019-01-05	Vineet	Sikkim	Gangtok
B-25940	2019-01-06	Vivek	Goa	Goa
B-25941	2019-01-07	Jaideep	Nagaland	Kohima
B-25942	2019-01-08	Ankur	Andhra Pradesh	Hyderabad
B-25943	2019-01-09	Shardul	Gujarat	Ahmedabad
B-25944	2019-01-10	Syed	Maharashtra	Pune
B-25945	2019-01-11	Mhatre	Madhya Pradesh	Indore
B-25946	2019-01-12	Saurabh	Andhra Pradesh	Hyderabad
B-25947	2019-01-13	Chetan	Gujarat	Ahmedabad
B-25948	2019-01-13	Mukund	Maharashtra	Pune
B-25949	2019-01-13	Shantanu	Maharashtra	Mumbai
B-25950	2019-01-13	Shruti	Madhya Pradesh	Indore
B-25951	2019-01-13	Jesal	West Bengal	Kolkata
B-25952	2019-01-13	Priyanka	Madhya Pradesh	Indore
B-25953	2019-01-14	Krutika	Andhra Pradesh	Hyderabad
B-25954	2019-01-14	Trupti	Gujarat	Ahmedabad
B-25955	2019-01-16	Soumya	Maharashtra	Pune
B-25956	2019-01-17	Shreya	Maharashtra	Mumbai
B-25957	2019-01-18	Mahima	Madhya Pradesh	Indore
B-25958	2019-01-18	Aparajita	West Bengal	Kolkata
B-25959	2019-01-18	Muskan	Madhya Pradesh	Indore
B-25960	2019-01-18	Shreya	Andhra Pradesh	Hyderabad
B-25961	2019-01-18	Surbhi	Gujarat	Ahmedabad
B-25962	2019-01-19	Tejeswini	Maharashtra	Pune
B-25963	2019-01-19	Pratiksha	Maharashtra	Mumbai
B-25964	2019-01-20	Oshin	Madhya Pradesh	Indore
B-25965	2019-01-21	Saloni	West Bengal	Kolkata
B-25966	2019-01-21	Soumya	Rajasthan	Udaipur
B-25967	2019-01-21	Komal	Uttar Pradesh	Allahabad
B-25968	2019-01-21	Paromita	Punjab	Amritsar
B-25969	2019-01-21	Shreyshi	Gujarat	Surat
B-25970	2019-01-22	Rhea	Maharashtra	Mumbai
B-25971	2019-01-22	Mitali	Madhya Pradesh	Indore
B-25972	2019-01-23	Jesslyn	Rajasthan	Udaipur
B-25973	2019-01-24	Seema	Uttar Pradesh	Allahabad
B-25974	2019-01-25	Manisha	Rajasthan	Udaipur
B-25975	2019-01-25	Priyanka	Uttar Pradesh	Allahabad
B-25976	2019-01-25	Piyam	Punjab	Amritsar
B-25977	2019-01-27	Aayushi	Gujarat	Surat
B-25978	2019-01-27	Parin	Maharashtra	Mumbai
B-25979	2019-01-27	Shivangi	Madhya Pradesh	Indore
B-25980	2019-01-27	Shweta	Rajasthan	Udaipur
B-25981	2019-01-28	Amruta	Delhi	Delhi
B-25982	2019-01-29	Hemangi	Delhi	Delhi
B-25983	2019-01-30	Atul	Delhi	Delhi
B-25984	2019-01-30	Kajal	Delhi	Delhi
B-25985	2019-01-31	Ginny	Madhya Pradesh	Indore
B-25986	2019-01-31	Shweta	Rajasthan	Udaipur
B-25987	2019-01-31	Manjiri	Delhi	Delhi
B-25988	2019-01-31	Nirja	Delhi	Delhi
B-25989	2019-02-01	Anjali	Delhi	Delhi
B-25990	2019-02-02	Mugdha	Delhi	Delhi
B-25991	2019-02-03	Mansi	Madhya Pradesh	Indore
B-25992	2019-02-03	Gaurav	Rajasthan	Udaipur
B-25993	2019-02-03	Harshal	Delhi	Delhi
B-25994	2019-02-03	Omkar	Delhi	Delhi
B-25995	2019-02-04	Yohann	Delhi	Delhi
B-25996	2019-02-04	Prashant	Delhi	Delhi
B-25997	2019-02-04	Yogesh	Madhya Pradesh	Indore
B-25998	2019-02-04	Anmol	Rajasthan	Udaipur
B-25999	2019-02-05	Diwakar	Delhi	Delhi
B-26000	2019-02-06	Shubham	Delhi	Delhi
B-26001	2019-02-07	Patil	Delhi	Delhi
B-26002	2019-02-08	Harsh	Delhi	Delhi
B-26003	2019-02-08	Hitesh	Madhya Pradesh	Bhopal
B-26004	2019-02-08	Nandita	Rajasthan	Jaipur
B-26005	2019-02-08	Parnavi	West Bengal	Kolkata
B-26006	2019-02-09	Arpita	Karnataka	Bangalore
B-26007	2019-02-09	Shubham	Jammu and Kashmir	Kashmir
B-26008	2019-02-09	Kalyani	Tamil Nadu	Chennai
B-26009	2019-02-10	Komal	Uttar Pradesh	Lucknow
B-26010	2019-02-11	Kartikay	Bihar	Patna
B-26011	2019-02-12	Bharat	Gujarat	Ahmedabad
B-26012	2019-02-13	Pearl	Maharashtra	Pune
B-26013	2019-02-13	Jahan	Madhya Pradesh	Bhopal
B-26014	2019-02-13	Divsha	Rajasthan	Jaipur
B-26015	2019-02-14	Kasheen	West Bengal	Kolkata
B-26016	2019-02-14	Hazel	Karnataka	Bangalore
B-26017	2019-02-14	Sonakshi	Jammu and Kashmir	Kashmir
B-26018	2019-02-14	Aarushi	Tamil Nadu	Chennai
B-26019	2019-02-15	Jitesh	Uttar Pradesh	Lucknow
B-26020	2019-02-16	Yogesh	Bihar	Patna
B-26021	2019-02-17	Anita	Kerala 	Thiruvananthapuram
B-26022	2019-02-18	Shrichand	Punjab	Chandigarh
B-26023	2019-02-19	Mukesh	Haryana	Chandigarh
B-26024	2019-02-19	Vandana	Himachal Pradesh	Simla
B-26025	2019-02-19	Bhavna	Sikkim	Gangtok
B-26026	2019-02-19	Kanak	Goa	Goa
B-26027	2019-02-20	Sagar	Nagaland	Kohima
B-26028	2019-02-20	Manju	Andhra Pradesh	Hyderabad
B-26029	2019-02-20	Ramesh	Gujarat	Ahmedabad
B-26030	2019-02-21	Sarita	Maharashtra	Pune
B-26031	2019-02-22	Deepak	Madhya Pradesh	Bhopal
B-26032	2019-02-22	Monisha	Rajasthan	Jaipur
B-26033	2019-02-22	Atharv	West Bengal	Kolkata
B-26034	2019-02-23	Vini	Karnataka	Bangalore
B-26035	2019-02-23	Pinky	Jammu and Kashmir	Kashmir
B-26036	2019-02-23	Bhishm	Maharashtra	Mumbai
B-26037	2019-02-23	Hitika	Madhya Pradesh	Indore
B-26038	2019-02-24	Pooja	Bihar	Patna
B-26039	2019-02-25	Hemant	Kerala 	Thiruvananthapuram
B-26040	2019-02-26	Sahil	Punjab	Chandigarh
B-26041	2019-02-27	Ritu	Haryana	Chandigarh
B-26042	2019-02-28	Manish	Himachal Pradesh	Simla
B-26043	2019-03-01	Amit	Sikkim	Gangtok
B-26044	2019-03-02	Sanjay	Goa	Goa
B-26045	2019-03-03	Nidhi	Nagaland	Kohima
B-26046	2019-03-04	Nishi	Maharashtra	Mumbai
B-26047	2019-03-04	Ashmi	Madhya Pradesh	Indore
B-26048	2019-03-04	Parth	Maharashtra	Pune
B-26049	2019-03-05	Lisha	Madhya Pradesh	Bhopal
B-26050	2019-03-06	Paridhi	Rajasthan	Jaipur
B-26051	2019-03-07	Parishi	West Bengal	Kolkata
B-26052	2019-03-08	Ajay	Karnataka	Bangalore
B-26053	2019-03-09	Kirti	Jammu and Kashmir	Kashmir
B-26054	2019-03-10	Mayank	Maharashtra	Mumbai
B-26055	2019-03-10	Yaanvi	Madhya Pradesh	Indore
B-26056	2019-03-10	Sonal	Bihar	Patna
B-26057	2019-03-10	Sharda	Kerala 	Thiruvananthapuram
B-26058	2019-03-11	Aditya	Punjab	Chandigarh
B-26059	2019-03-12	Rachna	Haryana	Chandigarh
B-26060	2019-03-13	Chirag	Maharashtra	Mumbai
B-26061	2019-03-14	Anurag	Madhya Pradesh	Indore
B-26062	2019-03-15	Tushina	Goa	Goa
B-26063	2019-03-15	Farah	Nagaland	Kohima
B-26064	2019-03-16	Ankita	Maharashtra	Mumbai
B-26065	2019-03-16	Nida	Madhya Pradesh	Indore
B-26066	2019-03-16	Priyanka	Maharashtra	Pune
B-26067	2019-03-16	Tulika	Madhya Pradesh	Bhopal
B-26068	2019-03-16	Shefali	Rajasthan	Jaipur
B-26069	2019-03-17	Sanskriti	West Bengal	Kolkata
B-26070	2019-03-18	Shruti	Karnataka	Bangalore
B-26071	2019-03-19	Subhashree	Jammu and Kashmir	Kashmir
B-26072	2019-03-20	Sweta	Maharashtra	Mumbai
B-26073	2019-03-21	Pournamasi	Madhya Pradesh	Indore
B-26074	2019-03-21	Bharat	Gujarat	Ahmedabad
B-26075	2019-03-21	Pearl	Maharashtra	Pune
B-26076	2019-03-21	Jahan	Madhya Pradesh	Bhopal
B-26077	2019-03-22	Divsha	Rajasthan	Jaipur
B-26078	2019-03-22	Kasheen	West Bengal	Kolkata
B-26079	2019-03-22	Hazel	Karnataka	Bangalore
B-26080	2019-03-22	Sonakshi	Jammu and Kashmir	Kashmir
B-26081	2019-03-22	Aarushi	Tamil Nadu	Chennai
B-26082	2019-03-23	Jitesh	Uttar Pradesh	Lucknow
B-26083	2019-03-24	Yogesh	Bihar	Patna
B-26084	2019-03-25	Anita	Kerala 	Thiruvananthapuram
B-26085	2019-03-26	Shrichand	Punjab	Chandigarh
B-26086	2019-03-26	Mukesh	Haryana	Chandigarh
B-26087	2019-03-26	Vandana	Himachal Pradesh	Simla
B-26088	2019-03-26	Bhavna	Sikkim	Gangtok
B-26089	2019-03-26	Kanak	Goa	Goa
B-26090	2019-03-27	Sagar	Nagaland	Kohima
B-26091	2019-03-27	Manju	Andhra Pradesh	Hyderabad
B-26092	2019-03-27	Ramesh	Gujarat	Ahmedabad
B-26093	2019-03-27	Sarita	Maharashtra	Pune
B-26094	2019-03-27	Deepak	Madhya Pradesh	Bhopal
B-26095	2019-03-28	Monisha	Rajasthan	Jaipur
B-26096	2019-03-28	Atharv	West Bengal	Kolkata
B-26097	2019-03-28	Vini	Karnataka	Bangalore
B-26098	2019-03-29	Pinky	Jammu and Kashmir	Kashmir
B-26099	2019-03-30	Bhishm	Maharashtra	Mumbai
B-26100	2019-03-31	Hitika	Madhya Pradesh	Indore
\.


--
-- TOC entry 4923 (class 0 OID 17271)
-- Dependencies: 221
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (detail_id, "Order ID", "Amount", "Profit", "Quantity", "Category", "Sub-Category") FROM stdin;
1	B-25601	1275.00	-1148.00	7	Furniture	Bookcases
2	B-25601	66.00	-12.00	5	Clothing	Stole
3	B-25601	8.00	-2.00	3	Clothing	Hankerchief
4	B-25601	80.00	-56.00	4	Electronics	Electronic Games
5	B-25602	168.00	-111.00	2	Electronics	Phones
6	B-25602	424.00	-272.00	5	Electronics	Phones
7	B-25602	2617.00	1151.00	4	Electronics	Phones
8	B-25602	561.00	212.00	3	Clothing	Saree
9	B-25602	119.00	-5.00	8	Clothing	Saree
10	B-25603	1355.00	-60.00	5	Clothing	Trousers
11	B-25603	24.00	-30.00	1	Furniture	Chairs
12	B-25603	193.00	-166.00	3	Clothing	Saree
13	B-25603	180.00	5.00	3	Clothing	Trousers
14	B-25603	116.00	16.00	4	Clothing	Stole
15	B-25603	107.00	36.00	6	Clothing	Stole
16	B-25603	12.00	1.00	2	Clothing	Hankerchief
17	B-25603	38.00	18.00	1	Clothing	Kurti
18	B-25604	65.00	17.00	2	Clothing	T-shirt
19	B-25604	157.00	5.00	9	Clothing	Saree
20	B-25605	75.00	0.00	7	Clothing	Saree
21	B-25606	87.00	4.00	2	Clothing	Shirt
22	B-25607	50.00	15.00	4	Clothing	Leggings
23	B-25608	1364.00	-1864.00	5	Furniture	Tables
24	B-25608	476.00	0.00	3	Furniture	Chairs
25	B-25608	257.00	23.00	5	Clothing	Hankerchief
26	B-25608	856.00	385.00	6	Electronics	Printers
27	B-25609	485.00	29.00	4	Electronics	Electronic Games
28	B-25609	25.00	-5.00	4	Clothing	Saree
29	B-25610	1076.00	-38.00	4	Electronics	Printers
30	B-25610	107.00	-54.00	4	Clothing	Stole
31	B-25610	68.00	-55.00	5	Electronics	Accessories
32	B-25610	781.00	-594.00	6	Electronics	Printers
33	B-25610	43.00	0.00	3	Clothing	Saree
34	B-25610	30.00	-5.00	2	Furniture	Furnishings
35	B-25611	160.00	-59.00	2	Clothing	Saree
36	B-25612	259.00	-55.00	2	Furniture	Chairs
37	B-25613	1603.00	0.00	9	Clothing	Saree
38	B-25614	494.00	54.00	4	Furniture	Bookcases
39	B-25614	98.00	-12.00	2	Electronics	Electronic Games
40	B-25615	68.00	20.00	5	Clothing	Hankerchief
41	B-25616	42.00	12.00	5	Clothing	Hankerchief
42	B-25616	116.00	-56.00	5	Clothing	Stole
43	B-25616	22.00	-2.00	3	Clothing	Hankerchief
44	B-25616	14.00	-2.00	3	Clothing	Hankerchief
45	B-25617	305.00	-270.00	5	Electronics	Electronic Games
46	B-25618	362.00	127.00	1	Furniture	Bookcases
47	B-25618	12.00	0.00	2	Clothing	Hankerchief
48	B-25619	353.00	90.00	8	Clothing	Saree
49	B-25620	193.00	46.00	1	Electronics	Printers
50	B-25621	233.00	-10.00	5	Electronics	Electronic Games
51	B-25621	228.00	63.00	3	Electronics	Electronic Games
52	B-25621	333.00	-15.00	3	Electronics	Phones
53	B-25622	534.00	0.00	3	Clothing	Saree
54	B-25623	53.00	1.00	4	Clothing	Stole
55	B-25623	158.00	69.00	3	Clothing	Stole
56	B-25623	149.00	-87.00	4	Clothing	Saree
57	B-25623	105.00	20.00	2	Clothing	Stole
58	B-25624	26.00	12.00	3	Clothing	Hankerchief
59	B-25625	97.00	29.00	2	Clothing	Hankerchief
60	B-25625	59.00	30.00	3	Clothing	Leggings
61	B-25625	635.00	-349.00	5	Clothing	Saree
62	B-25626	46.00	-14.00	1	Electronics	Phones
63	B-25626	1103.00	-276.00	3	Furniture	Chairs
64	B-25627	55.00	-39.00	4	Clothing	Stole
65	B-25628	45.00	13.00	4	Clothing	Skirt
66	B-25628	24.00	-9.00	4	Clothing	Saree
67	B-25628	35.00	-8.00	2	Furniture	Furnishings
68	B-25629	1560.00	421.00	3	Clothing	Trousers
69	B-25630	133.00	12.00	5	Clothing	Stole
70	B-25630	114.00	-39.00	5	Clothing	Kurti
71	B-25630	143.00	-129.00	2	Electronics	Phones
72	B-25630	40.00	-7.00	3	Clothing	Stole
73	B-25630	34.00	-22.00	4	Clothing	T-shirt
74	B-25630	42.00	-26.00	2	Clothing	Kurti
75	B-25631	89.00	-89.00	2	Furniture	Furnishings
76	B-25632	19.00	-2.00	2	Clothing	Leggings
77	B-25633	249.00	-130.00	4	Electronics	Phones
78	B-25633	711.00	-8.00	4	Clothing	Saree
79	B-25633	496.00	-79.00	2	Clothing	Trousers
80	B-25634	389.00	-83.00	3	Furniture	Chairs
81	B-25635	40.00	16.00	3	Clothing	Hankerchief
82	B-25635	23.00	2.00	2	Clothing	Skirt
83	B-25635	382.00	30.00	3	Clothing	Saree
84	B-25636	637.00	113.00	5	Clothing	Saree
85	B-25637	117.00	14.00	3	Clothing	Shirt
86	B-25638	182.00	-11.00	3	Furniture	Bookcases
87	B-25638	880.00	97.00	8	Furniture	Furnishings
88	B-25638	154.00	39.00	3	Clothing	Hankerchief
89	B-25638	816.00	-96.00	3	Electronics	Printers
90	B-25639	1629.00	-153.00	3	Electronics	Phones
91	B-25640	68.00	-62.00	2	Clothing	Trousers
92	B-25640	314.00	-239.00	13	Clothing	Hankerchief
93	B-25640	122.00	-47.00	4	Clothing	Saree
94	B-25641	22.00	-6.00	1	Furniture	Furnishings
95	B-25642	434.00	26.00	11	Clothing	Shirt
96	B-25643	1061.00	-36.00	8	Furniture	Bookcases
97	B-25643	50.00	-44.00	2	Clothing	Hankerchief
98	B-25643	37.00	-23.00	4	Clothing	Shirt
99	B-25643	263.00	-63.00	2	Electronics	Electronic Games
100	B-25643	36.00	-7.00	1	Electronics	Electronic Games
101	B-25644	76.00	-92.00	8	Furniture	Furnishings
102	B-25645	273.00	-87.00	4	Electronics	Phones
103	B-25645	86.00	0.00	4	Clothing	T-shirt
104	B-25645	133.00	-42.00	1	Electronics	Printers
105	B-25645	183.00	-66.00	5	Electronics	Phones
106	B-25646	20.00	-8.00	2	Clothing	Saree
107	B-25647	42.00	-6.00	4	Clothing	Saree
108	B-25648	100.00	-23.00	1	Electronics	Phones
109	B-25648	30.00	13.00	1	Clothing	T-shirt
110	B-25648	55.00	-26.00	4	Clothing	Saree
111	B-25648	130.00	-41.00	4	Clothing	Saree
112	B-25649	27.00	-25.00	2	Clothing	Stole
113	B-25650	245.00	-78.00	2	Electronics	Printers
114	B-25650	211.00	-105.00	2	Clothing	Saree
115	B-25650	31.00	-2.00	2	Clothing	Saree
116	B-25650	28.00	-26.00	2	Clothing	Stole
117	B-25650	512.00	-225.00	5	Clothing	Saree
118	B-25650	925.00	-447.00	5	Electronics	Electronic Games
119	B-25650	238.00	20.00	2	Clothing	Saree
120	B-25650	351.00	-47.00	8	Electronics	Phones
121	B-25650	269.00	111.00	3	Clothing	Trousers
122	B-25651	200.00	-60.00	4	Furniture	Bookcases
123	B-25651	44.00	-8.00	3	Clothing	Stole
124	B-25651	7.00	0.00	1	Clothing	Leggings
125	B-25651	11.00	-4.00	2	Clothing	Skirt
126	B-25651	16.00	-10.00	2	Clothing	T-shirt
127	B-25651	172.00	-103.00	3	Furniture	Chairs
128	B-25651	49.00	3.00	1	Clothing	Shirt
129	B-25651	823.00	-18.00	7	Furniture	Chairs
130	B-25651	23.00	4.00	1	Clothing	Saree
131	B-25651	457.00	-41.00	4	Clothing	Saree
132	B-25652	24.00	-21.00	7	Clothing	Skirt
133	B-25652	25.00	-2.00	5	Clothing	Hankerchief
134	B-25652	174.00	-70.00	3	Electronics	Accessories
135	B-25652	206.00	-206.00	3	Clothing	Saree
136	B-25652	21.00	-13.00	3	Clothing	Leggings
137	B-25652	34.00	-6.00	4	Clothing	Leggings
138	B-25652	9.00	-6.00	2	Clothing	Hankerchief
139	B-25653	1279.00	-640.00	8	Electronics	Printers
140	B-25653	28.00	-3.00	2	Clothing	Saree
141	B-25653	427.00	-50.00	7	Electronics	Phones
142	B-25653	168.00	-10.00	3	Electronics	Accessories
143	B-25653	1327.00	318.00	8	Furniture	Chairs
144	B-25653	195.00	-117.00	5	Electronics	Phones
145	B-25653	115.00	25.00	1	Electronics	Accessories
146	B-25653	668.00	-31.00	3	Electronics	Printers
147	B-25653	227.00	102.00	8	Electronics	Accessories
148	B-25654	34.00	12.00	3	Clothing	Hankerchief
149	B-25654	229.00	-23.00	2	Clothing	Saree
150	B-25654	54.00	-3.00	3	Clothing	Saree
151	B-25654	269.00	-86.00	2	Electronics	Electronic Games
152	B-25654	122.00	-21.00	3	Furniture	Furnishings
153	B-25654	105.00	46.00	2	Clothing	Stole
154	B-25654	450.00	-90.00	3	Electronics	Printers
155	B-25654	121.00	-17.00	3	Furniture	Furnishings
156	B-25655	44.00	-26.00	3	Clothing	Hankerchief
157	B-25655	7.00	-4.00	3	Clothing	Hankerchief
158	B-25655	396.00	-31.00	9	Clothing	Saree
159	B-25655	97.00	-62.00	2	Clothing	Trousers
160	B-25655	110.00	-68.00	4	Clothing	Saree
161	B-25655	312.00	-312.00	7	Furniture	Chairs
162	B-25655	9.00	-6.00	2	Clothing	Skirt
163	B-25655	6.00	-3.00	1	Clothing	Hankerchief
164	B-25655	74.00	23.00	8	Clothing	Skirt
165	B-25656	534.00	0.00	3	Clothing	Saree
166	B-25656	30.00	-5.00	5	Clothing	Stole
167	B-25656	61.00	-23.00	2	Clothing	Saree
168	B-25656	6.00	3.00	1	Clothing	Hankerchief
169	B-25656	24.00	-1.00	2	Clothing	Hankerchief
170	B-25656	56.00	18.00	2	Clothing	Hankerchief
171	B-25656	406.00	126.00	2	Clothing	Saree
172	B-25656	624.00	37.00	2	Electronics	Electronic Games
173	B-25656	101.00	18.00	9	Clothing	Skirt
174	B-25656	1389.00	680.00	7	Clothing	Saree
175	B-25656	651.00	169.00	5	Electronics	Printers
176	B-25656	13.00	-1.00	3	Clothing	Hankerchief
177	B-25657	1021.00	-48.00	4	Electronics	Electronic Games
178	B-25657	32.00	-22.00	5	Clothing	Saree
179	B-25657	332.00	-43.00	6	Electronics	Phones
180	B-25657	288.00	-180.00	4	Furniture	Chairs
181	B-25658	27.00	9.00	2	Clothing	T-shirt
182	B-25659	148.00	72.00	7	Clothing	T-shirt
183	B-25660	245.00	-78.00	3	Clothing	Saree
184	B-25661	19.00	-15.00	3	Clothing	Hankerchief
185	B-25661	224.00	-81.00	3	Furniture	Chairs
186	B-25661	58.00	-42.00	2	Furniture	Chairs
187	B-25661	145.00	-104.00	5	Furniture	Chairs
188	B-25661	55.00	-33.00	2	Furniture	Chairs
189	B-25661	7.00	-1.00	2	Clothing	Hankerchief
190	B-25662	24.00	-2.00	2	Clothing	T-shirt
191	B-25662	86.00	-21.00	1	Electronics	Electronic Games
192	B-25662	385.00	-77.00	11	Furniture	Furnishings
193	B-25663	294.00	138.00	2	Electronics	Printers
194	B-25664	444.00	-200.00	4	Electronics	Phones
195	B-25664	785.00	52.00	2	Electronics	Phones
196	B-25664	258.00	-27.00	2	Electronics	Phones
197	B-25664	83.00	-48.00	1	Furniture	Bookcases
198	B-25665	166.00	-113.00	4	Electronics	Accessories
199	B-25666	934.00	-916.00	7	Electronics	Electronic Games
200	B-25667	11.00	-2.00	4	Clothing	Hankerchief
201	B-25667	41.00	6.00	5	Clothing	Skirt
202	B-25667	344.00	-34.00	3	Clothing	Saree
203	B-25667	1030.00	206.00	8	Electronics	Printers
204	B-25667	516.00	69.00	4	Furniture	Bookcases
205	B-25668	123.00	17.00	3	Furniture	Furnishings
206	B-25669	610.00	-66.00	2	Furniture	Tables
207	B-25670	74.00	29.00	3	Clothing	Stole
208	B-25670	24.00	1.00	2	Clothing	Hankerchief
209	B-25670	14.00	2.00	1	Clothing	Hankerchief
210	B-25670	656.00	-36.00	2	Furniture	Bookcases
211	B-25671	832.00	0.00	3	Clothing	Trousers
212	B-25672	27.00	-15.00	1	Clothing	Stole
213	B-25673	143.00	-124.00	5	Clothing	Saree
214	B-25673	44.00	-17.00	5	Clothing	Saree
215	B-25673	45.00	-2.00	4	Clothing	Shirt
216	B-25673	16.00	-1.00	1	Clothing	Saree
217	B-25673	37.00	-5.00	3	Clothing	T-shirt
218	B-25674	17.00	-12.00	5	Clothing	Skirt
219	B-25675	929.00	-93.00	9	Clothing	Saree
220	B-25676	342.00	-103.00	4	Electronics	Electronic Games
221	B-25676	1263.00	-56.00	5	Clothing	Trousers
222	B-25676	674.00	-187.00	2	Furniture	Tables
223	B-25676	32.00	6.00	3	Clothing	Shirt
224	B-25676	79.00	36.00	4	Clothing	Shirt
225	B-25677	20.00	-2.00	1	Electronics	Accessories
226	B-25678	64.00	-7.00	3	Clothing	Saree
227	B-25678	7.00	-3.00	2	Clothing	Skirt
228	B-25678	327.00	-39.00	1	Electronics	Phones
229	B-25678	27.00	-25.00	2	Clothing	Shirt
230	B-25679	76.00	-50.00	1	Clothing	Saree
231	B-25680	73.00	-25.00	3	Clothing	Saree
232	B-25681	68.00	-27.00	3	Electronics	Accessories
233	B-25681	523.00	204.00	7	Clothing	Trousers
234	B-25681	44.00	-3.00	1	Clothing	Saree
235	B-25681	243.00	-14.00	2	Furniture	Chairs
236	B-25681	1625.00	-77.00	3	Electronics	Phones
237	B-25681	1096.00	-658.00	7	Electronics	Electronic Games
238	B-25682	545.00	-73.00	11	Electronics	Phones
239	B-25683	433.00	26.00	3	Electronics	Printers
240	B-25683	245.00	-3.00	4	Electronics	Phones
241	B-25683	155.00	56.00	3	Furniture	Furnishings
242	B-25683	148.00	52.00	5	Clothing	Stole
243	B-25683	86.00	-55.00	6	Clothing	Saree
244	B-25684	134.00	42.00	2	Furniture	Chairs
245	B-25685	51.00	7.00	2	Furniture	Furnishings
246	B-25685	529.00	137.00	3	Electronics	Phones
247	B-25685	264.00	-30.00	3	Furniture	Furnishings
248	B-25685	45.00	-2.00	4	Clothing	Shirt
249	B-25686	381.00	-13.00	2	Clothing	Saree
250	B-25686	332.00	-503.00	3	Electronics	Printers
251	B-25686	1829.00	-56.00	6	Furniture	Tables
252	B-25687	17.00	6.00	1	Clothing	Stole
253	B-25687	357.00	139.00	2	Clothing	Saree
254	B-25687	51.00	21.00	3	Clothing	T-shirt
255	B-25687	387.00	-213.00	5	Clothing	Saree
256	B-25687	14.00	-1.00	4	Clothing	Kurti
257	B-25688	352.00	-345.00	5	Clothing	Saree
258	B-25689	469.00	-459.00	3	Electronics	Electronic Games
259	B-25689	97.00	17.00	2	Clothing	Stole
260	B-25689	149.00	36.00	3	Clothing	Stole
261	B-25690	31.00	10.00	3	Clothing	Skirt
262	B-25691	714.00	56.00	4	Clothing	Saree
263	B-25691	75.00	-25.00	3	Clothing	Stole
264	B-25691	17.00	-9.00	3	Clothing	Stole
265	B-25692	141.00	28.00	7	Furniture	Furnishings
266	B-25693	76.00	-72.00	9	Clothing	Hankerchief
267	B-25693	632.00	-316.00	6	Clothing	Saree
268	B-25693	32.00	-16.00	6	Clothing	Saree
269	B-25693	68.00	-30.00	1	Electronics	Phones
270	B-25693	82.00	-39.00	5	Clothing	T-shirt
271	B-25693	72.00	-49.00	1	Electronics	Phones
272	B-25693	13.00	-13.00	2	Clothing	Skirt
273	B-25694	167.00	43.00	7	Clothing	T-shirt
274	B-25695	171.00	14.00	9	Clothing	Shirt
275	B-25696	117.00	-6.00	3	Electronics	Phones
276	B-25696	116.00	-4.00	1	Clothing	Saree
277	B-25696	887.00	80.00	3	Electronics	Printers
278	B-25696	275.00	-275.00	4	Clothing	Saree
279	B-25696	44.00	7.00	3	Clothing	Kurti
280	B-25696	168.00	-9.00	3	Clothing	Saree
281	B-25697	114.00	8.00	3	Electronics	Accessories
282	B-25697	1300.00	-16.00	8	Electronics	Printers
283	B-25697	4.00	-3.00	1	Clothing	Skirt
284	B-25697	73.00	-7.00	1	Electronics	Phones
285	B-25697	67.00	-42.00	3	Clothing	Stole
286	B-25697	322.00	-193.00	5	Electronics	Printers
287	B-25697	115.00	-39.00	3	Clothing	Trousers
288	B-25698	87.00	-83.00	5	Clothing	Kurti
289	B-25698	27.00	-6.00	4	Clothing	Hankerchief
290	B-25698	207.00	-153.00	3	Clothing	Saree
291	B-25698	516.00	-392.00	8	Furniture	Chairs
292	B-25698	7.00	-2.00	1	Clothing	Hankerchief
293	B-25698	65.00	-16.00	2	Electronics	Phones
294	B-25699	20.00	-22.00	1	Furniture	Furnishings
295	B-25699	49.00	-31.00	2	Clothing	Stole
296	B-25699	34.00	-13.00	5	Clothing	Leggings
297	B-25699	21.00	-5.00	1	Electronics	Accessories
298	B-25700	129.00	-75.00	5	Clothing	Shirt
299	B-25700	44.00	-32.00	3	Clothing	Stole
300	B-25700	7.00	-3.00	2	Clothing	Hankerchief
301	B-25701	10.00	-8.00	2	Clothing	Skirt
302	B-25701	33.00	-29.00	3	Clothing	Shirt
303	B-25701	98.00	-45.00	2	Furniture	Chairs
304	B-25701	33.00	-12.00	5	Clothing	Hankerchief
305	B-25702	75.00	0.00	3	Clothing	Shirt
306	B-25702	424.00	-17.00	9	Furniture	Chairs
307	B-25702	31.00	-3.00	4	Clothing	Saree
308	B-25702	941.00	-203.00	3	Furniture	Tables
309	B-25702	306.00	-147.00	3	Clothing	Saree
310	B-25703	42.00	-23.00	2	Furniture	Furnishings
311	B-25703	17.00	-3.00	2	Clothing	Stole
312	B-25703	32.00	-5.00	5	Clothing	Hankerchief
313	B-25703	231.00	-190.00	9	Clothing	Hankerchief
314	B-25703	22.00	-15.00	4	Clothing	Kurti
315	B-25703	97.00	-45.00	4	Clothing	Saree
316	B-25703	47.00	-27.00	4	Clothing	Saree
317	B-25703	186.00	-141.00	9	Clothing	Shirt
318	B-25704	126.00	-63.00	3	Electronics	Accessories
319	B-25704	102.00	0.00	3	Electronics	Phones
320	B-25705	46.00	0.00	2	Electronics	Electronic Games
321	B-25706	31.00	-11.00	4	Clothing	Stole
322	B-25707	8.00	-6.00	1	Clothing	Stole
323	B-25708	191.00	13.00	8	Furniture	Furnishings
324	B-25708	709.00	-100.00	5	Electronics	Phones
325	B-25708	81.00	-51.00	7	Clothing	Stole
326	B-25708	32.00	-8.00	2	Clothing	Stole
327	B-25709	33.00	-12.00	7	Clothing	Saree
328	B-25709	41.00	-6.00	1	Furniture	Chairs
329	B-25710	216.00	-38.00	6	Furniture	Furnishings
330	B-25710	616.00	-69.00	7	Furniture	Furnishings
331	B-25710	10.00	-1.00	1	Clothing	Leggings
332	B-25710	25.00	0.00	4	Clothing	Skirt
333	B-25710	53.00	-18.00	4	Clothing	T-shirt
334	B-25710	13.00	-8.00	1	Clothing	T-shirt
335	B-25711	100.00	-58.00	4	Clothing	Hankerchief
336	B-25712	193.00	-275.00	3	Electronics	Phones
337	B-25713	158.00	-63.00	4	Furniture	Chairs
338	B-25714	11.00	-5.00	2	Clothing	Hankerchief
339	B-25714	340.00	20.00	7	Clothing	Shirt
340	B-25715	416.00	137.00	3	Electronics	Phones
341	B-25716	58.00	0.00	4	Clothing	Saree
342	B-25717	561.00	212.00	3	Clothing	Saree
343	B-25717	138.00	-3.00	5	Clothing	Saree
344	B-25717	90.00	17.00	3	Clothing	Shirt
345	B-25717	55.00	-33.00	2	Furniture	Chairs
346	B-25718	371.00	115.00	1	Furniture	Bookcases
347	B-25718	460.00	31.00	3	Furniture	Bookcases
348	B-25719	29.00	10.00	2	Clothing	Stole
349	B-25720	30.00	-35.00	1	Furniture	Chairs
350	B-25721	29.00	-18.00	7	Clothing	Skirt
351	B-25721	191.00	51.00	5	Clothing	Shirt
352	B-25721	149.00	-40.00	2	Electronics	Phones
353	B-25722	48.00	-8.00	8	Clothing	Stole
354	B-25723	26.00	-24.00	1	Clothing	Stole
355	B-25723	16.00	-12.00	2	Clothing	Stole
356	B-25723	12.00	-7.00	2	Clothing	Leggings
357	B-25723	76.00	-54.00	3	Electronics	Electronic Games
358	B-25724	168.00	-51.00	2	Furniture	Bookcases
359	B-25725	23.00	-5.00	7	Clothing	Hankerchief
360	B-25725	26.00	-5.00	2	Clothing	Stole
361	B-25725	144.00	-7.00	4	Electronics	Electronic Games
362	B-25726	490.00	-128.00	8	Furniture	Bookcases
363	B-25727	57.00	-48.00	6	Clothing	Leggings
364	B-25727	327.00	114.00	4	Clothing	Trousers
365	B-25728	1055.00	264.00	4	Electronics	Printers
366	B-25728	771.00	-424.00	2	Electronics	Phones
367	B-25728	322.00	-113.00	4	Clothing	Saree
368	B-25729	1549.00	-439.00	4	Electronics	Phones
369	B-25730	1145.00	-706.00	3	Electronics	Phones
370	B-25730	473.00	42.00	4	Furniture	Chairs
371	B-25730	96.00	22.00	5	Clothing	Stole
372	B-25730	18.00	8.00	2	Clothing	Hankerchief
373	B-25730	187.00	30.00	4	Electronics	Accessories
374	B-25730	83.00	-81.00	3	Furniture	Chairs
375	B-25731	131.00	-154.00	8	Furniture	Furnishings
376	B-25732	16.00	-5.00	2	Clothing	Stole
377	B-25733	43.00	-43.00	7	Clothing	Stole
378	B-25733	30.00	-10.00	2	Clothing	Stole
379	B-25733	23.00	-6.00	4	Clothing	Hankerchief
380	B-25734	108.00	-19.00	3	Electronics	Electronic Games
381	B-25735	12.00	-2.00	3	Clothing	Hankerchief
382	B-25735	7.00	-1.00	2	Clothing	Skirt
383	B-25735	15.00	-7.00	1	Clothing	Hankerchief
384	B-25736	31.00	-7.00	5	Clothing	Skirt
385	B-25737	187.00	-15.00	3	Clothing	Trousers
386	B-25738	70.00	-14.00	2	Furniture	Furnishings
387	B-25738	72.00	-6.00	3	Clothing	Saree
388	B-25738	1069.00	0.00	6	Clothing	Saree
389	B-25738	148.00	-91.00	2	Electronics	Phones
390	B-25739	133.00	-56.00	2	Furniture	Chairs
391	B-25740	40.00	-37.00	3	Clothing	Stole
392	B-25740	7.00	0.00	2	Clothing	Skirt
393	B-25740	58.00	-8.00	2	Clothing	Saree
394	B-25741	482.00	-6.00	7	Electronics	Electronic Games
395	B-25742	11.00	-8.00	2	Clothing	Skirt
396	B-25743	143.00	-124.00	5	Clothing	Saree
397	B-25743	9.00	-5.00	1	Clothing	Saree
398	B-25743	503.00	-56.00	2	Clothing	Trousers
399	B-25743	74.00	-51.00	3	Clothing	Stole
400	B-25743	56.00	0.00	4	Clothing	Hankerchief
401	B-25744	373.00	-254.00	6	Electronics	Printers
402	B-25745	44.00	-8.00	3	Clothing	Stole
403	B-25745	296.00	-225.00	11	Clothing	Saree
404	B-25745	670.00	15.00	5	Furniture	Bookcases
405	B-25745	132.00	-79.00	5	Furniture	Furnishings
406	B-25746	87.00	16.00	2	Clothing	Saree
407	B-25747	877.00	395.00	2	Furniture	Bookcases
408	B-25748	141.00	10.00	4	Clothing	Shirt
409	B-25748	224.00	58.00	3	Electronics	Phones
410	B-25748	8.00	-1.00	2	Clothing	Leggings
411	B-25748	47.00	-21.00	2	Electronics	Electronic Games
412	B-25749	1052.00	-82.00	3	Furniture	Bookcases
413	B-25750	212.00	-24.00	2	Furniture	Chairs
414	B-25750	42.00	-15.00	12	Clothing	Skirt
415	B-25750	208.00	-25.00	2	Clothing	Saree
416	B-25750	22.00	-12.00	3	Clothing	Stole
417	B-25750	539.00	-146.00	7	Furniture	Furnishings
418	B-25750	78.00	-6.00	2	Furniture	Furnishings
419	B-25750	20.00	-18.00	2	Clothing	Saree
420	B-25750	19.00	-1.00	1	Clothing	Shirt
421	B-25750	73.00	-31.00	1	Furniture	Bookcases
422	B-25751	10.00	-8.00	1	Clothing	Kurti
423	B-25751	14.00	-3.00	2	Clothing	Leggings
424	B-25751	68.00	-56.00	2	Electronics	Phones
425	B-25751	106.00	0.00	2	Electronics	Phones
426	B-25751	43.00	-5.00	2	Clothing	Saree
427	B-25751	43.00	21.00	3	Clothing	Shirt
428	B-25751	534.00	5.00	2	Electronics	Electronic Games
429	B-25751	32.00	7.00	3	Clothing	Hankerchief
430	B-25751	65.00	-4.00	6	Clothing	Hankerchief
431	B-25751	221.00	-15.00	2	Electronics	Electronic Games
432	B-25752	1361.00	197.00	9	Furniture	Bookcases
433	B-25752	761.00	266.00	9	Electronics	Electronic Games
434	B-25752	76.00	27.00	5	Clothing	Stole
435	B-25752	91.00	15.00	6	Clothing	T-shirt
436	B-25752	8.00	-2.00	2	Clothing	Hankerchief
437	B-25752	735.00	-235.00	6	Electronics	Printers
438	B-25752	33.00	-27.00	1	Furniture	Chairs
439	B-25753	62.00	-56.00	5	Clothing	Kurti
440	B-25753	27.00	-20.00	2	Clothing	Hankerchief
441	B-25753	65.00	-52.00	3	Electronics	Accessories
442	B-25753	47.00	-114.00	5	Furniture	Furnishings
443	B-25753	341.00	-85.00	6	Clothing	Trousers
444	B-25753	107.00	31.00	5	Clothing	T-shirt
445	B-25753	154.00	22.00	7	Clothing	T-shirt
446	B-25753	620.00	82.00	6	Electronics	Accessories
447	B-25753	77.00	-43.00	8	Clothing	Stole
448	B-25754	72.00	-46.00	7	Clothing	Kurti
449	B-25754	41.00	-14.00	5	Clothing	Leggings
450	B-25754	30.00	-23.00	2	Clothing	Saree
451	B-25754	93.00	-65.00	4	Clothing	Stole
452	B-25754	19.00	0.00	3	Clothing	Skirt
453	B-25754	9.00	-1.00	3	Clothing	Skirt
454	B-25754	319.00	-312.00	5	Clothing	Saree
455	B-25754	262.00	-215.00	2	Electronics	Printers
456	B-25755	37.00	-53.00	3	Clothing	Saree
457	B-25755	257.00	-3.00	2	Furniture	Bookcases
458	B-25755	80.00	-19.00	5	Clothing	Stole
459	B-25755	321.00	-315.00	5	Clothing	Saree
460	B-25755	47.00	-3.00	2	Clothing	Stole
461	B-25755	593.00	213.00	4	Furniture	Bookcases
462	B-25755	134.00	-34.00	2	Furniture	Chairs
463	B-25755	1709.00	564.00	3	Clothing	Trousers
464	B-25755	27.00	4.00	2	Clothing	Saree
465	B-25756	465.00	-33.00	4	Electronics	Phones
466	B-25756	643.00	-45.00	2	Electronics	Printers
467	B-25756	204.00	-276.00	3	Furniture	Bookcases
468	B-25756	729.00	-492.00	5	Furniture	Bookcases
469	B-25756	29.00	-24.00	4	Clothing	Leggings
470	B-25757	17.00	-13.00	4	Clothing	Skirt
471	B-25757	34.00	-11.00	5	Clothing	T-shirt
472	B-25757	98.00	9.00	2	Furniture	Furnishings
473	B-25757	3151.00	-35.00	7	Clothing	Trousers
474	B-25757	53.00	15.00	2	Clothing	Stole
475	B-25757	165.00	30.00	3	Clothing	Stole
476	B-25757	211.00	19.00	8	Clothing	Stole
477	B-25757	106.00	15.00	7	Clothing	Hankerchief
478	B-25757	14.00	5.00	1	Clothing	Hankerchief
479	B-25757	17.00	7.00	3	Clothing	Hankerchief
480	B-25757	46.00	14.00	5	Clothing	Skirt
481	B-25758	8.00	-2.00	1	Clothing	Stole
482	B-25759	20.00	-9.00	6	Clothing	Hankerchief
483	B-25760	322.00	-193.00	5	Electronics	Printers
484	B-25761	2188.00	1050.00	5	Furniture	Bookcases
485	B-25761	328.00	-15.00	3	Electronics	Electronic Games
486	B-25761	418.00	70.00	7	Electronics	Phones
487	B-25761	40.00	0.00	3	Clothing	Saree
488	B-25761	102.00	-90.00	1	Clothing	Saree
489	B-25761	263.00	-31.00	9	Electronics	Electronic Games
490	B-25762	1316.00	-527.00	7	Electronics	Electronic Games
491	B-25762	27.00	4.00	3	Clothing	Skirt
492	B-25762	98.00	-5.00	2	Clothing	Saree
493	B-25763	58.00	-52.00	3	Furniture	Chairs
494	B-25764	119.00	43.00	5	Clothing	T-shirt
495	B-25764	765.00	-153.00	2	Electronics	Phones
496	B-25764	26.00	0.00	2	Clothing	Kurti
497	B-25764	24.00	-24.00	2	Clothing	Saree
498	B-25765	139.00	14.00	3	Clothing	Stole
499	B-25766	220.00	-19.00	2	Clothing	Saree
500	B-25767	299.00	-28.00	3	Electronics	Electronic Games
501	B-25767	9.00	-9.00	2	Clothing	Kurti
502	B-25767	74.00	-59.00	2	Electronics	Accessories
503	B-25767	29.00	-3.00	3	Clothing	Saree
504	B-25767	48.00	-22.00	2	Clothing	Saree
505	B-25768	1582.00	-443.00	6	Clothing	Trousers
506	B-25769	355.00	-4.00	2	Clothing	Saree
507	B-25770	375.00	180.00	3	Furniture	Bookcases
508	B-25770	299.00	113.00	2	Furniture	Bookcases
509	B-25770	287.00	-280.00	12	Furniture	Chairs
510	B-25770	110.00	35.00	1	Furniture	Furnishings
511	B-25771	148.00	59.00	3	Clothing	Hankerchief
512	B-25772	1183.00	106.00	4	Electronics	Printers
513	B-25773	248.00	-70.00	3	Furniture	Chairs
514	B-25773	85.00	-9.00	4	Clothing	Saree
515	B-25773	24.00	-14.00	2	Clothing	Saree
516	B-25773	209.00	-21.00	2	Electronics	Electronic Games
517	B-25773	224.00	-143.00	3	Furniture	Chairs
518	B-25774	38.00	-6.00	2	Furniture	Furnishings
519	B-25775	50.00	-17.00	2	Clothing	Stole
520	B-25776	47.00	-20.00	2	Clothing	Kurti
521	B-25777	61.00	-25.00	4	Electronics	Accessories
522	B-25777	69.00	-67.00	4	Clothing	Kurti
523	B-25777	59.00	-46.00	7	Clothing	T-shirt
524	B-25777	117.00	17.00	6	Clothing	Kurti
525	B-25777	1076.00	-38.00	4	Electronics	Printers
526	B-25778	1506.00	-266.00	6	Electronics	Printers
527	B-25778	109.00	-6.00	6	Clothing	Saree
528	B-25778	933.00	166.00	5	Clothing	Saree
529	B-25778	724.00	-447.00	4	Electronics	Electronic Games
530	B-25779	1361.00	-980.00	3	Furniture	Tables
531	B-25780	137.00	-41.00	3	Electronics	Phones
532	B-25781	60.00	-49.00	8	Clothing	Hankerchief
533	B-25781	30.00	-25.00	2	Clothing	T-shirt
534	B-25781	767.00	-353.00	5	Clothing	Trousers
535	B-25781	45.00	-28.00	2	Clothing	Stole
536	B-25781	25.00	-1.00	4	Clothing	Kurti
537	B-25781	584.00	-444.00	7	Electronics	Printers
538	B-25782	335.00	-22.00	7	Furniture	Chairs
539	B-25783	25.00	-11.00	1	Clothing	Stole
540	B-25783	30.00	-6.00	2	Clothing	Hankerchief
541	B-25783	33.00	-10.00	6	Clothing	Leggings
542	B-25783	21.00	-17.00	3	Clothing	Shirt
543	B-25783	26.00	2.00	2	Clothing	Hankerchief
544	B-25784	15.00	4.00	1	Clothing	Hankerchief
545	B-25785	595.00	292.00	3	Clothing	Saree
546	B-25785	45.00	0.00	2	Clothing	T-shirt
547	B-25785	192.00	-146.00	3	Clothing	Saree
548	B-25785	26.00	-25.00	3	Clothing	Saree
549	B-25786	1854.00	433.00	5	Furniture	Bookcases
550	B-25786	623.00	-192.00	3	Furniture	Tables
551	B-25786	44.00	-34.00	3	Clothing	Stole
552	B-25786	17.00	-11.00	3	Clothing	Skirt
553	B-25787	556.00	-209.00	7	Clothing	Saree
554	B-25787	40.00	-12.00	3	Clothing	Shirt
555	B-25787	229.00	-41.00	8	Electronics	Accessories
556	B-25787	140.00	-58.00	4	Furniture	Furnishings
557	B-25788	12.00	3.00	1	Clothing	Stole
558	B-25789	30.00	0.00	1	Clothing	Kurti
559	B-25789	313.00	-13.00	5	Furniture	Bookcases
560	B-25789	67.00	-86.00	9	Furniture	Furnishings
561	B-25790	42.00	-3.00	1	Electronics	Electronic Games
562	B-25791	253.00	-63.00	2	Clothing	Saree
563	B-25791	565.00	66.00	7	Clothing	Saree
564	B-25791	175.00	77.00	3	Clothing	Saree
565	B-25792	74.00	-25.00	3	Clothing	Stole
566	B-25793	40.00	-33.00	5	Clothing	Hankerchief
567	B-25793	63.00	-24.00	6	Clothing	Kurti
568	B-25793	60.00	-12.00	4	Clothing	Hankerchief
569	B-25793	257.00	-252.00	4	Clothing	Saree
570	B-25793	24.00	-1.00	4	Clothing	Skirt
571	B-25793	18.00	1.00	3	Clothing	Hankerchief
572	B-25793	1402.00	109.00	11	Clothing	Saree
573	B-25794	176.00	37.00	6	Electronics	Accessories
574	B-25795	276.00	-21.00	2	Electronics	Phones
575	B-25796	37.00	-6.00	1	Clothing	Saree
576	B-25796	28.00	1.00	1	Electronics	Accessories
577	B-25796	239.00	-162.00	5	Furniture	Chairs
578	B-25796	78.00	-64.00	7	Clothing	Stole
579	B-25796	632.00	-316.00	6	Clothing	Saree
580	B-25796	559.00	-19.00	2	Clothing	Trousers
581	B-25796	148.00	0.00	3	Clothing	Saree
582	B-25797	976.00	293.00	4	Electronics	Accessories
583	B-25797	148.00	-101.00	2	Furniture	Bookcases
584	B-25797	413.00	-314.00	9	Furniture	Chairs
585	B-25797	89.00	-4.00	5	Clothing	Saree
586	B-25797	1630.00	-802.00	5	Furniture	Tables
587	B-25797	31.00	1.00	2	Clothing	Hankerchief
588	B-25798	379.00	63.00	2	Clothing	Saree
589	B-25798	448.00	148.00	2	Electronics	Printers
590	B-25798	2830.00	-1981.00	13	Furniture	Bookcases
591	B-25798	47.00	-3.00	2	Clothing	Stole
592	B-25798	38.00	-13.00	3	Clothing	Stole
593	B-25798	61.00	-50.00	4	Clothing	Hankerchief
594	B-25799	205.00	-119.00	3	Clothing	Saree
595	B-25799	47.00	-27.00	4	Clothing	Saree
596	B-25799	45.00	-15.00	2	Furniture	Chairs
597	B-25799	70.00	-64.00	5	Clothing	Stole
598	B-25800	122.00	-66.00	9	Electronics	Accessories
599	B-25800	21.00	-6.00	3	Clothing	Leggings
600	B-25800	45.00	12.00	7	Clothing	Hankerchief
601	B-25801	64.00	6.00	4	Clothing	Saree
602	B-25801	49.00	-31.00	2	Clothing	Stole
603	B-25801	21.00	-10.00	4	Clothing	Leggings
604	B-25801	15.00	-2.00	1	Clothing	T-shirt
605	B-25802	27.00	-7.00	5	Clothing	Saree
606	B-25802	633.00	-633.00	11	Electronics	Accessories
607	B-25802	13.00	-9.00	2	Clothing	Skirt
608	B-25802	23.00	-3.00	1	Clothing	Shirt
609	B-25802	95.00	5.00	2	Clothing	Stole
610	B-25803	106.00	12.00	3	Clothing	Trousers
611	B-25803	269.00	91.00	1	Electronics	Electronic Games
612	B-25803	536.00	91.00	1	Clothing	Trousers
613	B-25803	137.00	5.00	5	Clothing	Shirt
614	B-25803	757.00	371.00	2	Electronics	Printers
615	B-25803	511.00	194.00	3	Furniture	Chairs
616	B-25803	185.00	48.00	4	Clothing	Stole
617	B-25803	765.00	8.00	6	Clothing	Saree
618	B-25804	156.00	36.00	5	Clothing	T-shirt
619	B-25804	321.00	26.00	3	Electronics	Printers
620	B-25805	112.00	15.00	2	Furniture	Chairs
621	B-25806	632.00	-114.00	4	Furniture	Tables
622	B-25807	16.00	6.00	1	Clothing	Stole
623	B-25808	63.00	17.00	6	Clothing	Leggings
624	B-25808	146.00	-63.00	3	Electronics	Electronic Games
625	B-25808	59.00	21.00	2	Clothing	Stole
626	B-25808	210.00	50.00	4	Clothing	Hankerchief
627	B-25809	154.00	54.00	3	Clothing	Hankerchief
628	B-25809	53.00	24.00	1	Clothing	Hankerchief
629	B-25810	26.00	10.00	4	Clothing	Hankerchief
630	B-25810	1120.00	199.00	6	Clothing	Saree
631	B-25810	45.00	6.00	3	Clothing	Shirt
632	B-25810	307.00	74.00	3	Electronics	Accessories
633	B-25810	92.00	42.00	2	Clothing	Stole
634	B-25810	29.00	8.00	5	Clothing	Hankerchief
635	B-25811	126.00	52.00	4	Clothing	Hankerchief
636	B-25812	259.00	47.00	5	Clothing	Hankerchief
637	B-25813	911.00	202.00	7	Furniture	Chairs
638	B-25814	118.00	35.00	7	Clothing	T-shirt
639	B-25814	462.00	169.00	4	Clothing	Saree
640	B-25815	35.00	14.00	2	Clothing	Stole
641	B-25816	391.00	113.00	8	Clothing	Stole
642	B-25817	743.00	89.00	5	Electronics	Printers
643	B-25818	75.00	28.00	9	Clothing	Hankerchief
644	B-25818	36.00	0.00	4	Clothing	Kurti
645	B-25818	32.00	11.00	2	Clothing	Leggings
646	B-25818	94.00	20.00	2	Furniture	Furnishings
647	B-25818	28.00	14.00	4	Clothing	Hankerchief
648	B-25819	417.00	49.00	3	Electronics	Electronic Games
649	B-25820	119.00	1.00	1	Furniture	Chairs
650	B-25821	60.00	21.00	4	Clothing	Stole
651	B-25821	17.00	0.00	1	Clothing	Hankerchief
652	B-25821	125.00	0.00	3	Electronics	Accessories
653	B-25822	34.00	13.00	2	Clothing	Saree
654	B-25823	2103.00	322.00	8	Electronics	Electronic Games
655	B-25823	104.00	2.00	2	Furniture	Furnishings
656	B-25823	59.00	6.00	1	Electronics	Accessories
657	B-25823	103.00	50.00	2	Furniture	Furnishings
658	B-25824	101.00	38.00	2	Furniture	Furnishings
659	B-25825	911.00	355.00	5	Electronics	Phones
660	B-25825	115.00	25.00	6	Clothing	Stole
661	B-25825	140.00	6.00	5	Clothing	Saree
662	B-25826	637.00	261.00	2	Electronics	Printers
663	B-25827	156.00	21.00	3	Furniture	Chairs
664	B-25828	537.00	107.00	3	Clothing	Saree
665	B-25828	15.00	2.00	1	Clothing	Leggings
666	B-25828	128.00	-3.00	3	Clothing	Saree
667	B-25828	222.00	35.00	5	Clothing	Saree
668	B-25829	345.00	38.00	7	Clothing	Hankerchief
669	B-25830	41.00	11.00	6	Clothing	Hankerchief
670	B-25830	54.00	1.00	2	Clothing	Saree
671	B-25830	71.00	0.00	8	Clothing	Skirt
672	B-25830	93.00	15.00	2	Electronics	Accessories
673	B-25830	1063.00	64.00	7	Electronics	Phones
674	B-25830	1954.00	782.00	3	Electronics	Phones
675	B-25831	693.00	254.00	6	Clothing	Saree
676	B-25832	504.00	116.00	3	Furniture	Bookcases
677	B-25833	64.00	27.00	5	Clothing	Hankerchief
678	B-25833	36.00	4.00	9	Clothing	Hankerchief
679	B-25833	45.00	16.00	3	Clothing	Stole
680	B-25834	16.00	5.00	1	Clothing	Stole
681	B-25835	52.00	11.00	5	Clothing	Leggings
682	B-25835	27.00	2.00	2	Clothing	Leggings
683	B-25835	155.00	26.00	3	Clothing	Stole
684	B-25836	1298.00	65.00	9	Electronics	Printers
685	B-25837	263.00	50.00	5	Clothing	Stole
686	B-25838	70.00	26.00	5	Clothing	Hankerchief
687	B-25838	81.00	19.00	7	Clothing	Hankerchief
688	B-25838	955.00	305.00	3	Electronics	Printers
689	B-25838	161.00	40.00	3	Clothing	Stole
690	B-25839	1250.00	486.00	7	Clothing	Saree
691	B-25840	246.00	61.00	2	Furniture	Bookcases
692	B-25840	298.00	74.00	2	Furniture	Bookcases
693	B-25840	262.00	64.00	6	Clothing	Saree
694	B-25841	22.00	11.00	2	Clothing	Skirt
695	B-25842	1543.00	370.00	8	Electronics	Printers
696	B-25843	50.00	7.00	6	Clothing	Skirt
697	B-25843	214.00	30.00	3	Electronics	Accessories
698	B-25843	255.00	74.00	5	Clothing	Hankerchief
699	B-25843	18.00	6.00	3	Clothing	Hankerchief
700	B-25843	45.00	0.00	2	Clothing	Stole
701	B-25844	86.00	8.00	2	Clothing	Saree
702	B-25845	274.00	-7.00	4	Electronics	Phones
703	B-25845	82.00	33.00	4	Clothing	Kurti
704	B-25845	757.00	371.00	2	Electronics	Printers
705	B-25845	132.00	54.00	5	Clothing	Stole
706	B-25846	94.00	7.00	7	Clothing	Leggings
707	B-25847	643.00	225.00	2	Electronics	Printers
708	B-25847	264.00	71.00	10	Furniture	Furnishings
709	B-25848	147.00	21.00	3	Furniture	Furnishings
710	B-25848	16.00	8.00	2	Clothing	Hankerchief
711	B-25848	648.00	50.00	6	Electronics	Electronic Games
712	B-25849	336.00	123.00	3	Electronics	Phones
713	B-25850	45.00	1.00	3	Clothing	T-shirt
714	B-25850	93.00	-1.00	2	Clothing	Hankerchief
715	B-25850	52.00	18.00	5	Clothing	Leggings
716	B-25850	148.00	24.00	3	Clothing	Stole
717	B-25850	24.00	1.00	4	Clothing	Hankerchief
718	B-25850	513.00	215.00	2	Electronics	Accessories
719	B-25850	117.00	36.00	2	Clothing	Trousers
720	B-25850	916.00	192.00	11	Electronics	Phones
721	B-25850	485.00	199.00	4	Clothing	Saree
722	B-25851	10.00	2.00	2	Clothing	Hankerchief
723	B-25851	300.00	42.00	2	Electronics	Printers
724	B-25851	57.00	27.00	2	Clothing	T-shirt
725	B-25851	103.00	46.00	2	Clothing	Saree
726	B-25851	336.00	71.00	3	Furniture	Bookcases
727	B-25851	53.00	24.00	6	Clothing	Hankerchief
728	B-25851	90.00	29.00	5	Clothing	T-shirt
729	B-25851	62.00	1.00	3	Clothing	Saree
730	B-25851	135.00	54.00	5	Clothing	Kurti
731	B-25851	237.00	47.00	9	Clothing	T-shirt
732	B-25852	320.00	144.00	1	Electronics	Printers
733	B-25852	24.00	1.00	2	Clothing	Hankerchief
734	B-25852	45.00	12.00	4	Clothing	Hankerchief
735	B-25852	97.00	17.00	2	Clothing	Stole
736	B-25852	50.00	16.00	1	Clothing	Stole
737	B-25852	869.00	67.00	4	Furniture	Tables
738	B-25852	105.00	33.00	5	Clothing	Kurti
739	B-25853	39.00	16.00	6	Clothing	Skirt
740	B-25853	30.00	14.00	3	Clothing	Hankerchief
741	B-25853	26.00	11.00	2	Clothing	Hankerchief
742	B-25853	19.00	6.00	2	Clothing	Saree
743	B-25853	579.00	139.00	3	Electronics	Printers
744	B-25853	2093.00	721.00	5	Furniture	Chairs
745	B-25853	95.00	11.00	4	Furniture	Furnishings
746	B-25853	128.00	4.00	3	Clothing	Saree
747	B-25853	199.00	48.00	4	Clothing	Stole
748	B-25854	149.00	48.00	6	Clothing	Stole
749	B-25854	436.00	131.00	9	Clothing	Hankerchief
750	B-25854	76.00	19.00	3	Clothing	Hankerchief
751	B-25854	88.00	16.00	4	Clothing	Stole
752	B-25854	342.00	154.00	7	Furniture	Furnishings
753	B-25854	40.00	16.00	3	Clothing	Hankerchief
754	B-25854	53.00	-2.00	3	Clothing	Saree
755	B-25854	381.00	144.00	2	Clothing	Saree
756	B-25855	829.00	19.00	4	Electronics	Printers
757	B-25855	442.00	31.00	2	Electronics	Electronic Games
758	B-25855	90.00	17.00	3	Clothing	Hankerchief
759	B-25855	98.00	12.00	2	Clothing	Hankerchief
760	B-25855	61.00	30.00	2	Clothing	Hankerchief
761	B-25855	1027.00	441.00	8	Clothing	Saree
762	B-25855	1319.00	567.00	5	Electronics	Printers
763	B-25855	197.00	73.00	1	Furniture	Bookcases
764	B-25855	550.00	242.00	5	Furniture	Furnishings
765	B-25856	74.00	29.00	3	Clothing	Stole
766	B-25856	10.00	2.00	2	Clothing	Skirt
767	B-25856	689.00	90.00	5	Clothing	Saree
768	B-25856	257.00	3.00	2	Clothing	Saree
769	B-25856	48.00	6.00	1	Clothing	Saree
770	B-25857	324.00	39.00	8	Electronics	Accessories
771	B-25857	598.00	166.00	4	Furniture	Bookcases
772	B-25857	227.00	59.00	2	Furniture	Furnishings
773	B-25858	22.00	8.00	3	Clothing	Hankerchief
774	B-25858	29.00	11.00	4	Clothing	Skirt
775	B-25858	27.00	5.00	2	Clothing	Skirt
776	B-25858	82.00	13.00	2	Clothing	Shirt
777	B-25858	294.00	109.00	7	Electronics	Accessories
778	B-25858	16.00	0.00	1	Clothing	Saree
779	B-25858	245.00	30.00	2	Clothing	Saree
780	B-25858	223.00	27.00	2	Furniture	Bookcases
781	B-25858	2457.00	665.00	11	Electronics	Electronic Games
782	B-25859	724.00	253.00	2	Furniture	Bookcases
783	B-25860	112.00	24.00	3	Clothing	Kurti
784	B-25861	128.00	4.00	3	Clothing	Saree
785	B-25861	50.00	3.00	2	Clothing	Stole
786	B-25861	62.00	6.00	5	Clothing	Hankerchief
787	B-25861	44.00	14.00	3	Clothing	Hankerchief
788	B-25861	56.00	18.00	2	Clothing	Hankerchief
789	B-25861	216.00	-83.00	3	Electronics	Electronic Games
790	B-25862	2061.00	701.00	5	Furniture	Bookcases
791	B-25862	121.00	41.00	4	Clothing	Stole
792	B-25862	80.00	3.00	3	Clothing	Stole
793	B-25863	189.00	87.00	7	Clothing	Stole
794	B-25864	100.00	6.00	4	Clothing	Stole
795	B-25864	17.00	5.00	1	Clothing	Hankerchief
796	B-25864	22.00	8.00	2	Clothing	Leggings
797	B-25864	27.00	9.00	2	Clothing	Hankerchief
798	B-25865	85.00	-1.00	3	Clothing	Saree
799	B-25866	51.00	14.00	2	Clothing	Stole
800	B-25867	31.00	14.00	3	Clothing	Stole
801	B-25867	240.00	12.00	6	Clothing	Kurti
802	B-25867	163.00	26.00	4	Clothing	Shirt
803	B-25868	170.00	73.00	2	Electronics	Accessories
804	B-25868	62.00	-1.00	1	Electronics	Phones
805	B-25868	1118.00	206.00	2	Furniture	Tables
806	B-25869	86.00	9.00	3	Clothing	Saree
807	B-25870	10.00	4.00	1	Clothing	Kurti
808	B-25870	845.00	84.00	7	Clothing	Saree
809	B-25870	57.00	7.00	3	Furniture	Furnishings
810	B-25870	473.00	113.00	9	Clothing	Hankerchief
811	B-25871	118.00	25.00	4	Clothing	Hankerchief
812	B-25872	57.00	27.00	2	Clothing	Shirt
813	B-25873	66.00	12.00	3	Clothing	Stole
814	B-25873	367.00	73.00	3	Electronics	Electronic Games
815	B-25873	7.00	1.00	1	Clothing	Hankerchief
816	B-25873	1275.00	357.00	2	Electronics	Phones
817	B-25873	42.00	12.00	2	Clothing	Kurti
818	B-25874	124.00	54.00	5	Clothing	T-shirt
819	B-25875	248.00	8.00	2	Clothing	Saree
820	B-25876	282.00	14.00	4	Clothing	Trousers
821	B-25877	1137.00	568.00	2	Clothing	Trousers
822	B-25877	269.00	33.00	5	Furniture	Chairs
823	B-25877	24.00	8.00	2	Clothing	Skirt
824	B-25878	165.00	46.00	3	Furniture	Furnishings
825	B-25878	46.00	0.00	4	Clothing	Leggings
826	B-25878	84.00	41.00	3	Clothing	T-shirt
827	B-25878	140.00	15.00	5	Clothing	Stole
828	B-25878	741.00	267.00	5	Furniture	Bookcases
829	B-25878	719.00	303.00	6	Furniture	Chairs
830	B-25879	57.00	28.00	2	Clothing	Kurti
831	B-25880	108.00	37.00	2	Clothing	Stole
832	B-25881	37.00	3.00	3	Clothing	Hankerchief
833	B-25881	26.00	9.00	2	Clothing	Leggings
834	B-25881	1351.00	111.00	6	Electronics	Electronic Games
835	B-25881	2244.00	247.00	4	Clothing	Trousers
836	B-25881	36.00	7.00	3	Clothing	Leggings
837	B-25881	2115.00	23.00	5	Furniture	Chairs
838	B-25882	121.00	19.00	4	Clothing	Stole
839	B-25883	146.00	42.00	5	Clothing	Hankerchief
840	B-25883	105.00	26.00	8	Clothing	Leggings
841	B-25883	127.00	29.00	3	Furniture	Furnishings
842	B-25883	16.00	-15.00	4	Clothing	Hankerchief
843	B-25883	10.00	-2.00	2	Clothing	Leggings
844	B-25884	24.00	2.00	4	Clothing	Hankerchief
845	B-25885	94.00	27.00	2	Clothing	Shirt
846	B-25885	394.00	146.00	2	Furniture	Bookcases
847	B-25885	734.00	248.00	2	Furniture	Chairs
848	B-25885	349.00	0.00	7	Clothing	Stole
849	B-25886	89.00	17.00	2	Clothing	Stole
850	B-25886	502.00	84.00	4	Electronics	Phones
851	B-25886	63.00	1.00	4	Clothing	T-shirt
852	B-25886	107.00	37.00	3	Clothing	Shirt
853	B-25887	83.00	6.00	6	Clothing	Shirt
854	B-25887	2125.00	234.00	6	Electronics	Printers
855	B-25888	18.00	2.00	3	Clothing	Hankerchief
856	B-25888	223.00	4.00	3	Electronics	Phones
857	B-25888	646.00	213.00	3	Electronics	Electronic Games
858	B-25889	31.00	10.00	1	Clothing	Kurti
859	B-25889	119.00	43.00	7	Clothing	Kurti
860	B-25889	114.00	11.00	4	Clothing	T-shirt
861	B-25890	465.00	207.00	9	Clothing	Saree
862	B-25891	25.00	2.00	2	Clothing	Hankerchief
863	B-25891	97.00	36.00	7	Clothing	Hankerchief
864	B-25891	121.00	41.00	4	Clothing	Stole
865	B-25892	139.00	30.00	3	Clothing	Shirt
866	B-25893	355.00	114.00	7	Clothing	Stole
867	B-25893	61.00	11.00	3	Clothing	Kurti
868	B-25893	149.00	15.00	3	Clothing	Saree
869	B-25893	688.00	103.00	6	Electronics	Accessories
870	B-25893	372.00	59.00	3	Electronics	Printers
871	B-25893	223.00	62.00	7	Clothing	Shirt
872	B-25893	83.00	12.00	3	Clothing	Stole
873	B-25894	1246.00	62.00	3	Furniture	Bookcases
874	B-25895	388.00	93.00	2	Furniture	Bookcases
875	B-25896	31.00	11.00	3	Clothing	Skirt
876	B-25896	42.00	7.00	2	Clothing	Kurti
877	B-25896	190.00	68.00	8	Clothing	T-shirt
878	B-25896	103.00	36.00	2	Clothing	Hankerchief
879	B-25896	287.00	66.00	6	Clothing	Kurti
880	B-25896	23.00	4.00	2	Clothing	Skirt
881	B-25896	79.00	-2.00	2	Furniture	Furnishings
882	B-25897	43.00	5.00	3	Clothing	Stole
883	B-25897	33.00	10.00	3	Clothing	Hankerchief
884	B-25897	24.00	11.00	5	Clothing	Hankerchief
885	B-25897	734.00	213.00	6	Electronics	Electronic Games
886	B-25898	33.00	13.00	3	Clothing	Leggings
887	B-25898	499.00	33.00	4	Clothing	Saree
888	B-25898	147.00	73.00	3	Clothing	Stole
889	B-25898	53.00	5.00	3	Clothing	T-shirt
890	B-25898	171.00	2.00	2	Electronics	Electronic Games
891	B-25898	915.00	-99.00	3	Furniture	Tables
892	B-25898	191.00	93.00	4	Clothing	Shirt
893	B-25898	857.00	274.00	2	Furniture	Tables
894	B-25899	22.00	9.00	2	Clothing	Leggings
895	B-25899	28.00	6.00	4	Clothing	Skirt
896	B-25899	43.00	17.00	1	Clothing	Saree
897	B-25899	846.00	9.00	2	Furniture	Chairs
898	B-25900	15.00	2.00	1	Clothing	Leggings
899	B-25900	140.00	68.00	5	Clothing	T-shirt
900	B-25900	210.00	62.00	2	Electronics	Phones
901	B-25901	158.00	38.00	3	Clothing	Hankerchief
902	B-25901	90.00	27.00	2	Clothing	T-shirt
903	B-25901	159.00	2.00	3	Furniture	Furnishings
904	B-25901	61.00	28.00	2	Clothing	Hankerchief
905	B-25902	79.00	6.00	7	Clothing	Saree
906	B-25902	268.00	6.00	2	Furniture	Bookcases
907	B-25902	802.00	120.00	7	Electronics	Accessories
908	B-25902	1700.00	85.00	3	Clothing	Trousers
909	B-25902	154.00	26.00	4	Electronics	Accessories
910	B-25903	455.00	77.00	8	Electronics	Accessories
911	B-25903	19.00	8.00	2	Clothing	Hankerchief
912	B-25903	25.00	11.00	3	Clothing	Leggings
913	B-25903	37.00	17.00	3	Clothing	Hankerchief
914	B-25903	60.00	-10.00	2	Furniture	Furnishings
915	B-25903	204.00	94.00	4	Clothing	Hankerchief
916	B-25903	74.00	33.00	2	Clothing	Shirt
917	B-25903	336.00	57.00	2	Electronics	Phones
918	B-25904	871.00	131.00	2	Furniture	Bookcases
919	B-25904	83.00	12.00	2	Furniture	Chairs
920	B-25905	152.00	50.00	6	Clothing	Stole
921	B-25906	78.00	27.00	3	Clothing	Stole
922	B-25907	30.00	11.00	5	Clothing	Hankerchief
923	B-25908	179.00	25.00	5	Clothing	Kurti
924	B-25909	168.00	56.00	3	Clothing	Saree
925	B-25909	108.00	22.00	3	Electronics	Accessories
926	B-25909	1622.00	248.00	3	Electronics	Phones
927	B-25909	323.00	122.00	5	Electronics	Phones
928	B-25909	12.00	2.00	2	Clothing	Skirt
929	B-25910	125.00	15.00	5	Clothing	Shirt
930	B-25910	685.00	7.00	7	Clothing	Trousers
931	B-25910	850.00	289.00	5	Electronics	Electronic Games
932	B-25910	1622.00	-624.00	5	Furniture	Tables
933	B-25910	259.00	47.00	5	Clothing	Hankerchief
934	B-25910	33.00	1.00	2	Clothing	Shirt
935	B-25911	40.00	15.00	1	Clothing	Kurti
936	B-25912	102.00	11.00	6	Clothing	T-shirt
937	B-25913	103.00	21.00	7	Clothing	Stole
938	B-25914	460.00	143.00	3	Furniture	Chairs
939	B-25914	125.00	22.00	3	Clothing	Stole
940	B-25915	277.00	3.00	1	Electronics	Electronic Games
941	B-25916	80.00	26.00	9	Clothing	Skirt
942	B-25917	100.00	12.00	2	Clothing	T-shirt
943	B-25918	244.00	122.00	5	Furniture	Furnishings
944	B-25919	28.00	4.00	1	Clothing	T-shirt
945	B-25919	110.00	12.00	7	Clothing	Stole
946	B-25919	636.00	204.00	2	Electronics	Printers
947	B-25919	1599.00	37.00	6	Electronics	Electronic Games
948	B-25919	977.00	244.00	7	Electronics	Phones
949	B-25920	100.00	7.00	2	Clothing	T-shirt
950	B-25921	170.00	19.00	5	Clothing	T-shirt
951	B-25921	84.00	-42.00	2	Electronics	Accessories
952	B-25921	71.00	-44.00	5	Electronics	Accessories
953	B-25922	52.00	18.00	2	Clothing	Stole
954	B-25923	226.00	58.00	3	Electronics	Accessories
955	B-25923	484.00	28.00	3	Electronics	Printers
956	B-25923	253.00	-11.00	1	Clothing	Trousers
957	B-25923	3873.00	891.00	6	Electronics	Phones
958	B-25924	148.00	54.00	2	Furniture	Chairs
959	B-25925	27.00	12.00	1	Clothing	Stole
960	B-25925	314.00	-41.00	3	Electronics	Electronic Games
961	B-25925	1228.00	14.00	3	Furniture	Chairs
962	B-25926	57.00	6.00	5	Clothing	Leggings
963	B-25927	200.00	7.00	4	Electronics	Electronic Games
964	B-25928	25.00	10.00	1	Furniture	Furnishings
965	B-25928	122.00	15.00	3	Electronics	Accessories
966	B-25929	1308.00	536.00	3	Furniture	Bookcases
967	B-25929	216.00	-135.00	3	Furniture	Chairs
968	B-25929	154.00	-85.00	3	Furniture	Chairs
969	B-25930	40.00	13.00	3	Clothing	T-shirt
970	B-25930	351.00	-94.00	5	Electronics	Electronic Games
971	B-25930	595.00	119.00	4	Furniture	Bookcases
972	B-25930	151.00	29.00	5	Clothing	Hankerchief
973	B-25930	58.00	17.00	2	Clothing	Hankerchief
974	B-25930	202.00	89.00	9	Clothing	T-shirt
975	B-25931	73.00	-36.00	3	Furniture	Chairs
976	B-25932	71.00	-14.00	4	Furniture	Furnishings
977	B-25933	81.00	-44.00	3	Clothing	Stole
978	B-25933	412.00	-412.00	6	Clothing	Saree
979	B-25933	207.00	-100.00	2	Clothing	Saree
980	B-25934	105.00	33.00	6	Clothing	Saree
981	B-25935	162.00	20.00	3	Furniture	Chairs
982	B-25935	150.00	32.00	3	Clothing	Hankerchief
983	B-25935	1657.00	460.00	4	Furniture	Chairs
984	B-25936	61.00	25.00	4	Clothing	Saree
985	B-25937	1101.00	352.00	3	Furniture	Bookcases
986	B-25938	61.00	1.00	2	Furniture	Furnishings
987	B-25938	59.00	25.00	3	Clothing	Stole
988	B-25939	61.00	18.00	2	Electronics	Accessories
989	B-25939	136.00	41.00	3	Electronics	Accessories
990	B-25939	469.00	33.00	4	Electronics	Electronic Games
991	B-25940	55.00	4.00	2	Clothing	Stole
992	B-25940	13.00	3.00	2	Clothing	Hankerchief
993	B-25940	46.00	0.00	4	Clothing	Leggings
994	B-25941	177.00	41.00	4	Clothing	Shirt
995	B-25942	646.00	-23.00	2	Electronics	Printers
996	B-25943	48.00	20.00	4	Clothing	Stole
997	B-25943	26.00	7.00	4	Clothing	Hankerchief
998	B-25943	149.00	15.00	3	Clothing	Saree
999	B-25943	1547.00	340.00	6	Electronics	Accessories
1000	B-25943	137.00	38.00	5	Clothing	Hankerchief
1001	B-25944	169.00	38.00	3	Clothing	Saree
1002	B-25945	245.00	10.00	2	Furniture	Bookcases
1003	B-25945	60.00	3.00	3	Clothing	Saree
1004	B-25945	63.00	14.00	2	Clothing	Shirt
1005	B-25945	765.00	-36.00	3	Electronics	Electronic Games
1006	B-25946	146.00	7.00	2	Electronics	Phones
1007	B-25947	290.00	35.00	6	Clothing	Hankerchief
1008	B-25947	207.00	33.00	2	Electronics	Accessories
1009	B-25948	152.00	23.00	3	Furniture	Furnishings
1010	B-25949	24.00	11.00	3	Clothing	Hankerchief
1011	B-25949	140.00	57.00	2	Clothing	Trousers
1012	B-25949	151.00	9.00	3	Clothing	Hankerchief
1013	B-25950	13.00	4.00	1	Clothing	Leggings
1014	B-25950	54.00	27.00	2	Clothing	Stole
1015	B-25950	644.00	167.00	2	Electronics	Printers
1016	B-25950	261.00	13.00	6	Clothing	Shirt
1017	B-25950	1622.00	95.00	5	Electronics	Printers
1018	B-25950	190.00	19.00	9	Furniture	Furnishings
1019	B-25950	158.00	-29.00	10	Clothing	Hankerchief
1020	B-25950	136.00	-33.00	5	Clothing	Saree
1021	B-25950	133.00	5.00	5	Clothing	Stole
1022	B-25951	102.00	13.00	2	Clothing	Stole
1023	B-25951	50.00	14.00	1	Electronics	Electronic Games
1024	B-25951	111.00	11.00	9	Clothing	Hankerchief
1025	B-25951	120.00	23.00	5	Clothing	Stole
1026	B-25951	40.00	18.00	1	Electronics	Accessories
1027	B-25951	250.00	100.00	3	Clothing	Trousers
1028	B-25951	89.00	29.00	2	Clothing	Stole
1029	B-25951	30.00	5.00	2	Clothing	Kurti
1030	B-25951	248.00	105.00	2	Electronics	Phones
1031	B-25951	742.00	198.00	2	Furniture	Bookcases
1032	B-25952	14.00	0.00	4	Clothing	Hankerchief
1033	B-25952	87.00	32.00	9	Clothing	Skirt
1034	B-25952	935.00	114.00	4	Electronics	Electronic Games
1035	B-25952	173.00	69.00	3	Furniture	Chairs
1036	B-25952	352.00	18.00	5	Clothing	Trousers
1037	B-25952	147.00	48.00	3	Clothing	Saree
1038	B-25952	44.00	14.00	3	Clothing	Hankerchief
1039	B-25953	22.00	-8.00	4	Clothing	Hankerchief
1040	B-25953	188.00	-193.00	2	Electronics	Electronic Games
1041	B-25953	81.00	41.00	3	Clothing	Stole
1042	B-25953	44.00	2.00	3	Clothing	Hankerchief
1043	B-25953	116.00	22.00	1	Electronics	Accessories
1044	B-25953	67.00	20.00	4	Clothing	T-shirt
1045	B-25953	744.00	119.00	6	Electronics	Printers
1046	B-25953	1218.00	352.00	9	Furniture	Bookcases
1047	B-25953	87.00	36.00	5	Clothing	Stole
1048	B-25954	891.00	0.00	5	Clothing	Saree
1049	B-25954	146.00	66.00	1	Electronics	Phones
1050	B-25954	44.00	10.00	3	Clothing	Stole
1051	B-25954	27.00	0.00	2	Clothing	Leggings
1052	B-25954	48.00	11.00	2	Clothing	Shirt
1053	B-25954	189.00	60.00	4	Furniture	Furnishings
1054	B-25954	524.00	-25.00	2	Electronics	Electronic Games
1055	B-25954	148.00	9.00	1	Electronics	Electronic Games
1056	B-25955	1716.00	309.00	7	Electronics	Accessories
1057	B-25955	45.00	8.00	4	Clothing	Skirt
1058	B-25955	39.00	2.00	2	Clothing	Saree
1059	B-25955	110.00	20.00	5	Clothing	Stole
1060	B-25955	54.00	14.00	3	Clothing	T-shirt
1061	B-25955	954.00	95.00	3	Electronics	Printers
1062	B-25955	2927.00	146.00	8	Furniture	Bookcases
1063	B-25955	294.00	62.00	9	Clothing	T-shirt
1064	B-25955	200.00	13.00	5	Electronics	Phones
1065	B-25956	89.00	-37.00	4	Clothing	Shirt
1066	B-25956	59.00	10.00	2	Clothing	Hankerchief
1067	B-25956	33.00	10.00	3	Clothing	Hankerchief
1068	B-25956	474.00	56.00	4	Electronics	Phones
1069	B-25956	140.00	28.00	2	Electronics	Phones
1070	B-25957	147.00	73.00	3	Clothing	Stole
1071	B-25957	16.00	2.00	1	Clothing	Saree
1072	B-25957	1157.00	-13.00	9	Furniture	Bookcases
1073	B-25958	105.00	25.00	2	Clothing	Hankerchief
1074	B-25958	360.00	32.00	3	Clothing	Saree
1075	B-25959	252.00	56.00	2	Electronics	Phones
1076	B-25959	681.00	259.00	4	Furniture	Chairs
1077	B-25959	32.00	2.00	2	Clothing	Kurti
1078	B-25959	132.00	49.00	3	Clothing	Shirt
1079	B-25959	637.00	212.00	8	Electronics	Phones
1080	B-25959	429.00	17.00	3	Furniture	Chairs
1081	B-25959	82.00	24.00	6	Clothing	Hankerchief
1082	B-25959	23.00	8.00	2	Clothing	Hankerchief
1083	B-25960	171.00	-140.00	2	Furniture	Bookcases
1084	B-25961	34.00	-12.00	5	Clothing	Leggings
1085	B-25961	366.00	84.00	3	Furniture	Bookcases
1086	B-25961	26.00	3.00	3	Clothing	Skirt
1087	B-25961	446.00	53.00	3	Electronics	Printers
1088	B-25961	48.00	16.00	3	Clothing	Shirt
1089	B-25961	34.00	10.00	3	Clothing	Skirt
1090	B-25962	260.00	68.00	2	Electronics	Printers
1091	B-25962	312.00	62.00	1	Electronics	Electronic Games
1092	B-25962	544.00	-152.00	3	Furniture	Bookcases
1093	B-25963	53.00	8.00	3	Furniture	Furnishings
1094	B-25964	199.00	0.00	4	Clothing	Stole
1095	B-25964	89.00	6.00	5	Clothing	Saree
1096	B-25964	1270.00	546.00	11	Electronics	Electronic Games
1097	B-25964	346.00	108.00	3	Furniture	Chairs
1098	B-25965	17.00	7.00	3	Clothing	Hankerchief
1099	B-25966	510.00	234.00	6	Electronics	Electronic Games
1100	B-25967	17.00	2.00	2	Clothing	Skirt
1101	B-25967	119.00	-24.00	4	Furniture	Furnishings
1102	B-25967	229.00	59.00	9	Clothing	Saree
1103	B-25968	811.00	154.00	7	Electronics	Accessories
1104	B-25969	720.00	43.00	2	Electronics	Printers
1105	B-25969	2452.00	191.00	7	Furniture	Bookcases
1106	B-25969	171.00	17.00	6	Clothing	T-shirt
1107	B-25970	203.00	84.00	2	Electronics	Printers
1108	B-25970	742.00	198.00	2	Furniture	Bookcases
1109	B-25970	111.00	9.00	4	Clothing	Stole
1110	B-25970	365.00	107.00	3	Electronics	Phones
1111	B-25971	244.00	83.00	2	Furniture	Bookcases
1112	B-25972	115.00	47.00	2	Electronics	Accessories
1113	B-25973	571.00	108.00	12	Clothing	Stole
1114	B-25973	398.00	111.00	8	Clothing	Hankerchief
1115	B-25973	79.00	39.00	2	Clothing	Shirt
1116	B-25973	39.00	14.00	5	Clothing	Leggings
1117	B-25973	4141.00	1698.00	13	Electronics	Printers
1118	B-25974	662.00	240.00	2	Furniture	Bookcases
1119	B-25975	29.00	2.00	3	Clothing	Skirt
1120	B-25976	193.00	8.00	4	Clothing	T-shirt
1121	B-25977	27.00	1.00	1	Clothing	Stole
1122	B-25977	74.00	29.00	3	Clothing	Stole
1123	B-25977	180.00	54.00	4	Clothing	T-shirt
1124	B-25978	1063.00	-175.00	4	Electronics	Electronic Games
1125	B-25978	341.00	160.00	7	Clothing	Stole
1126	B-25979	560.00	44.00	3	Clothing	Saree
1127	B-25979	57.00	27.00	2	Clothing	Shirt
1128	B-25979	284.00	45.00	2	Furniture	Bookcases
1129	B-25979	12.00	1.00	2	Clothing	Hankerchief
1130	B-25979	82.00	27.00	3	Clothing	Kurti
1131	B-25980	22.00	11.00	3	Clothing	Kurti
1132	B-25981	42.00	13.00	3	Clothing	Leggings
1133	B-25981	54.00	12.00	3	Clothing	Saree
1134	B-25981	62.00	8.00	2	Clothing	T-shirt
1135	B-25981	245.00	91.00	2	Furniture	Bookcases
1136	B-25981	867.00	251.00	5	Electronics	Phones
1137	B-25981	48.00	2.00	3	Clothing	Stole
1138	B-25982	13.00	3.00	1	Clothing	Leggings
1139	B-25983	230.00	5.00	2	Clothing	Saree
1140	B-25983	32.00	-12.00	1	Furniture	Chairs
1141	B-25983	161.00	-229.00	8	Furniture	Furnishings
1142	B-25983	50.00	-4.00	6	Clothing	T-shirt
1143	B-25983	561.00	118.00	5	Furniture	Bookcases
1144	B-25984	304.00	97.00	6	Clothing	Stole
1145	B-25985	197.00	20.00	4	Clothing	Kurti
1146	B-25985	108.00	26.00	4	Clothing	Shirt
1147	B-25985	32.00	8.00	5	Clothing	Hankerchief
1148	B-25985	44.00	11.00	4	Clothing	Stole
1149	B-25986	749.00	307.00	7	Furniture	Furnishings
1150	B-25986	71.00	4.00	5	Clothing	Leggings
1151	B-25986	487.00	-23.00	3	Electronics	Printers
1152	B-25986	918.00	22.00	9	Electronics	Electronic Games
1153	B-25987	299.00	0.00	6	Clothing	Stole
1154	B-25987	88.00	11.00	7	Clothing	Hankerchief
1155	B-25988	79.00	24.00	9	Clothing	Skirt
1156	B-25989	44.00	14.00	3	Clothing	Hankerchief
1157	B-25989	10.00	5.00	1	Clothing	Stole
1158	B-25989	42.00	15.00	1	Electronics	Accessories
1159	B-25989	330.00	81.00	1	Furniture	Bookcases
1160	B-25989	338.00	41.00	7	Clothing	Hankerchief
1161	B-25990	71.00	32.00	3	Clothing	Saree
1162	B-25991	188.00	13.00	7	Clothing	Shirt
1163	B-25991	90.00	30.00	2	Furniture	Chairs
1164	B-25991	13.00	5.00	2	Clothing	Hankerchief
1165	B-25992	141.00	41.00	3	Clothing	Shirt
1166	B-25993	44.00	8.00	2	Clothing	Stole
1167	B-25993	610.00	208.00	3	Electronics	Printers
1168	B-25993	4363.00	305.00	5	Furniture	Tables
1169	B-25993	414.00	199.00	3	Electronics	Phones
1170	B-25993	221.00	26.00	7	Furniture	Furnishings
1171	B-25993	201.00	32.00	4	Furniture	Furnishings
1172	B-25993	173.00	86.00	1	Electronics	Printers
1173	B-25994	196.00	-7.00	5	Electronics	Phones
1174	B-25995	1314.00	342.00	3	Furniture	Bookcases
1175	B-25996	62.00	6.00	6	Clothing	Skirt
1176	B-25996	31.00	2.00	2	Clothing	Hankerchief
1177	B-25996	217.00	72.00	2	Furniture	Furnishings
1178	B-25996	286.00	140.00	6	Clothing	Shirt
1179	B-25996	333.00	50.00	2	Electronics	Phones
1180	B-25996	47.00	1.00	2	Clothing	Stole
1181	B-25996	18.00	4.00	1	Clothing	Saree
1182	B-25997	16.00	6.00	3	Clothing	Hankerchief
1183	B-25997	231.00	99.00	2	Electronics	Electronic Games
1184	B-25997	2292.00	127.00	7	Furniture	Bookcases
1185	B-25997	48.00	15.00	1	Clothing	Hankerchief
1186	B-25998	50.00	-28.00	5	Furniture	Furnishings
1187	B-25999	26.00	-17.00	1	Clothing	Stole
1188	B-25999	93.00	-65.00	4	Clothing	Stole
1189	B-25999	152.00	-3.00	5	Clothing	Saree
1190	B-25999	51.00	-49.00	2	Electronics	Electronic Games
1191	B-25999	352.00	74.00	8	Clothing	Stole
1192	B-25999	129.00	11.00	2	Electronics	Phones
1193	B-25999	223.00	62.00	7	Clothing	Shirt
1194	B-25999	770.00	323.00	3	Electronics	Accessories
1195	B-25999	222.00	74.00	5	Clothing	Hankerchief
1196	B-25999	215.00	-30.00	2	Clothing	Saree
1197	B-25999	109.00	40.00	1	Furniture	Furnishings
1198	B-26000	43.00	9.00	4	Clothing	Skirt
1199	B-26000	676.00	151.00	3	Electronics	Printers
1200	B-26000	597.00	93.00	4	Furniture	Chairs
1201	B-26001	13.00	0.00	2	Clothing	Hankerchief
1202	B-26001	149.00	17.00	4	Furniture	Furnishings
1203	B-26001	8.00	2.00	2	Clothing	Skirt
1204	B-26001	50.00	9.00	6	Clothing	Skirt
1205	B-26002	80.00	22.00	3	Clothing	Stole
1206	B-26002	276.00	52.00	5	Clothing	Saree
1207	B-26002	71.00	19.00	3	Clothing	T-shirt
1208	B-26002	141.00	7.00	7	Clothing	Saree
1209	B-26002	113.00	28.00	2	Clothing	Saree
1210	B-26003	315.00	-8.00	3	Furniture	Chairs
1211	B-26003	128.00	47.00	4	Clothing	Hankerchief
1212	B-26003	652.00	13.00	6	Furniture	Furnishings
1213	B-26003	114.00	41.00	6	Furniture	Furnishings
1214	B-26003	79.00	16.00	3	Clothing	T-shirt
1215	B-26003	498.00	-116.00	4	Clothing	Saree
1216	B-26003	1745.00	122.00	2	Furniture	Tables
1217	B-26003	17.00	2.00	2	Clothing	Skirt
1218	B-26004	147.00	44.00	3	Clothing	Saree
1219	B-26004	162.00	73.00	2	Electronics	Electronic Games
1220	B-26005	87.00	10.00	3	Clothing	Stole
1221	B-26006	1301.00	573.00	5	Electronics	Accessories
1222	B-26007	311.00	72.00	2	Furniture	Bookcases
1223	B-26008	22.00	4.00	1	Clothing	Stole
1224	B-26008	206.00	51.00	4	Clothing	Hankerchief
1225	B-26008	57.00	24.00	5	Clothing	Leggings
1226	B-26008	10.00	-1.00	1	Clothing	Saree
1227	B-26009	285.00	128.00	2	Electronics	Printers
1228	B-26009	195.00	12.00	9	Clothing	Shirt
1229	B-26010	527.00	26.00	3	Electronics	Electronic Games
1230	B-26010	29.00	3.00	2	Clothing	Stole
1231	B-26010	85.00	13.00	2	Clothing	Shirt
1232	B-26010	18.00	2.00	3	Clothing	Hankerchief
1233	B-26010	176.00	-13.00	5	Furniture	Furnishings
1234	B-26010	55.00	3.00	3	Clothing	T-shirt
1235	B-26011	93.00	44.00	2	Clothing	Stole
1236	B-26012	21.00	8.00	2	Clothing	Saree
1237	B-26013	29.00	10.00	3	Clothing	Skirt
1238	B-26014	406.00	97.00	7	Furniture	Chairs
1239	B-26014	278.00	39.00	5	Furniture	Chairs
1240	B-26015	128.00	55.00	1	Clothing	Saree
1241	B-26016	74.00	9.00	3	Clothing	Shirt
1242	B-26016	202.00	4.00	4	Clothing	Hankerchief
1243	B-26016	429.00	61.00	3	Electronics	Electronic Games
1244	B-26016	134.00	-13.00	3	Electronics	Electronic Games
1245	B-26017	78.00	7.00	1	Furniture	Chairs
1246	B-26018	326.00	107.00	3	Furniture	Furnishings
1247	B-26018	61.00	8.00	4	Clothing	Hankerchief
1248	B-26019	585.00	175.00	13	Clothing	T-shirt
1249	B-26020	319.00	102.00	6	Electronics	Accessories
1250	B-26021	122.00	59.00	7	Furniture	Furnishings
1251	B-26021	49.00	21.00	1	Clothing	Stole
1252	B-26021	21.00	-12.00	3	Clothing	Hankerchief
1253	B-26022	1824.00	-1303.00	8	Electronics	Phones
1254	B-26023	1117.00	447.00	10	Furniture	Bookcases
1255	B-26023	29.00	0.00	3	Furniture	Furnishings
1256	B-26023	66.00	22.00	3	Clothing	Stole
1257	B-26023	59.00	21.00	2	Clothing	Stole
1258	B-26024	168.00	18.00	6	Clothing	Stole
1259	B-26025	155.00	5.00	3	Clothing	Stole
1260	B-26025	32.00	1.00	2	Clothing	Stole
1261	B-26025	41.00	19.00	5	Clothing	Hankerchief
1262	B-26026	255.00	76.00	9	Clothing	Hankerchief
1263	B-26026	25.00	2.00	3	Clothing	Kurti
1264	B-26027	54.00	8.00	4	Clothing	T-shirt
1265	B-26028	77.00	36.00	2	Clothing	Shirt
1266	B-26028	115.00	0.00	1	Electronics	Accessories
1267	B-26028	1272.00	547.00	2	Electronics	Phones
1268	B-26029	21.00	10.00	1	Clothing	T-shirt
1269	B-26030	92.00	5.00	6	Clothing	Hankerchief
1270	B-26030	11.00	5.00	1	Clothing	Skirt
1271	B-26030	221.00	35.00	4	Electronics	Accessories
1272	B-26030	50.00	25.00	5	Clothing	Stole
1273	B-26030	89.00	36.00	3	Clothing	Shirt
1274	B-26030	291.00	93.00	2	Electronics	Printers
1275	B-26031	67.00	9.00	4	Clothing	Leggings
1276	B-26032	47.00	15.00	5	Clothing	Saree
1277	B-26033	774.00	170.00	3	Electronics	Accessories
1278	B-26033	143.00	32.00	1	Furniture	Bookcases
1279	B-26033	111.00	35.00	5	Clothing	Shirt
1280	B-26034	425.00	183.00	5	Electronics	Accessories
1281	B-26035	291.00	119.00	11	Clothing	Saree
1282	B-26035	520.00	151.00	3	Electronics	Phones
1283	B-26035	369.00	15.00	3	Electronics	Electronic Games
1284	B-26036	341.00	44.00	7	Furniture	Furnishings
1285	B-26037	171.00	68.00	7	Clothing	Stole
1286	B-26038	41.00	19.00	2	Clothing	T-shirt
1287	B-26038	130.00	61.00	3	Clothing	Shirt
1288	B-26038	52.00	14.00	2	Clothing	Stole
1289	B-26038	30.00	6.00	1	Clothing	T-shirt
1290	B-26039	83.00	34.00	5	Clothing	Shirt
1291	B-26040	38.00	9.00	2	Clothing	Stole
1292	B-26040	113.00	24.00	4	Clothing	Hankerchief
1293	B-26040	833.00	93.00	3	Clothing	Trousers
1294	B-26041	176.00	-28.00	5	Furniture	Furnishings
1295	B-26042	36.00	15.00	3	Clothing	Stole
1296	B-26043	185.00	48.00	4	Clothing	Stole
1297	B-26043	62.00	28.00	5	Clothing	Hankerchief
1298	B-26043	79.00	5.00	6	Clothing	Hankerchief
1299	B-26043	30.00	12.00	3	Clothing	Skirt
1300	B-26043	122.00	50.00	7	Clothing	Stole
1301	B-26044	28.00	10.00	3	Clothing	Skirt
1302	B-26045	302.00	75.00	6	Furniture	Furnishings
1303	B-26045	376.00	0.00	7	Clothing	Stole
1304	B-26045	179.00	77.00	1	Clothing	Saree
1305	B-26045	27.00	5.00	1	Clothing	Stole
1306	B-26046	32.00	3.00	8	Clothing	Hankerchief
1307	B-26047	55.00	12.00	5	Clothing	Skirt
1308	B-26048	163.00	81.00	2	Electronics	Accessories
1309	B-26048	401.00	13.00	6	Furniture	Chairs
1310	B-26048	1461.00	202.00	5	Furniture	Tables
1311	B-26048	1104.00	209.00	4	Clothing	Trousers
1312	B-26049	100.00	28.00	2	Clothing	Hankerchief
1313	B-26050	325.00	32.00	7	Clothing	T-shirt
1314	B-26050	169.00	55.00	4	Clothing	Saree
1315	B-26050	487.00	143.00	4	Electronics	Phones
1316	B-26050	166.00	27.00	2	Electronics	Accessories
1317	B-26050	79.00	32.00	3	Clothing	Saree
1318	B-26050	32.00	6.00	3	Clothing	Shirt
1319	B-26050	38.00	9.00	2	Clothing	Stole
1320	B-26050	284.00	44.00	6	Clothing	Hankerchief
1321	B-26050	382.00	92.00	2	Electronics	Printers
1322	B-26051	184.00	85.00	6	Clothing	T-shirt
1323	B-26051	676.00	195.00	5	Furniture	Bookcases
1324	B-26051	669.00	74.00	5	Furniture	Bookcases
1325	B-26051	80.00	22.00	3	Clothing	Stole
1326	B-26051	216.00	50.00	4	Clothing	Stole
1327	B-26051	85.00	24.00	10	Clothing	Hankerchief
1328	B-26051	382.00	119.00	2	Clothing	Saree
1329	B-26051	490.00	88.00	2	Electronics	Accessories
1330	B-26051	1337.00	147.00	7	Electronics	Printers
1331	B-26051	600.00	102.00	5	Electronics	Electronic Games
1332	B-26052	78.00	28.00	6	Clothing	Kurti
1333	B-26052	101.00	16.00	4	Clothing	T-shirt
1334	B-26052	145.00	0.00	3	Clothing	Saree
1335	B-26052	148.00	23.00	4	Clothing	Kurti
1336	B-26052	15.00	1.00	1	Clothing	Shirt
1337	B-26052	25.00	7.00	2	Clothing	Stole
1338	B-26052	774.00	170.00	3	Electronics	Accessories
1339	B-26053	17.00	1.00	2	Clothing	Skirt
1340	B-26053	246.00	61.00	2	Furniture	Bookcases
1341	B-26053	425.00	208.00	7	Clothing	Saree
1342	B-26053	93.00	31.00	3	Electronics	Accessories
1343	B-26053	594.00	89.00	3	Furniture	Bookcases
1344	B-26053	85.00	2.00	6	Clothing	Stole
1345	B-26053	27.00	6.00	3	Clothing	Skirt
1346	B-26053	120.00	1.00	1	Furniture	Chairs
1347	B-26053	162.00	55.00	3	Clothing	Stole
1348	B-26054	246.00	98.00	5	Clothing	Hankerchief
1349	B-26054	88.00	20.00	2	Clothing	Saree
1350	B-26054	88.00	19.00	2	Clothing	Shirt
1351	B-26054	139.00	21.00	3	Electronics	Accessories
1352	B-26054	139.00	36.00	3	Clothing	Stole
1353	B-26054	138.00	11.00	5	Clothing	Stole
1354	B-26054	156.00	23.00	3	Clothing	Stole
1355	B-26054	559.00	174.00	2	Electronics	Electronic Games
1356	B-26055	227.00	48.00	5	Clothing	Stole
1357	B-26055	5729.00	64.00	14	Furniture	Chairs
1358	B-26055	94.00	27.00	2	Clothing	T-shirt
1359	B-26055	213.00	4.00	14	Clothing	Shirt
1360	B-26055	250.00	-12.00	2	Electronics	Printers
1361	B-26055	43.00	11.00	1	Clothing	Saree
1362	B-26055	1218.00	420.00	8	Furniture	Bookcases
1363	B-26055	671.00	114.00	9	Electronics	Phones
1364	B-26055	57.00	7.00	2	Clothing	Shirt
1365	B-26056	70.00	24.00	3	Clothing	Stole
1366	B-26056	47.00	20.00	7	Clothing	Hankerchief
1367	B-26056	33.00	9.00	2	Clothing	Hankerchief
1368	B-26056	424.00	161.00	2	Clothing	Saree
1369	B-26056	391.00	90.00	6	Electronics	Phones
1370	B-26056	15.00	6.00	2	Clothing	Hankerchief
1371	B-26056	101.00	11.00	2	Clothing	Hankerchief
1372	B-26056	31.00	9.00	2	Clothing	Hankerchief
1373	B-26056	220.00	40.00	2	Electronics	Accessories
1374	B-26056	213.00	-145.00	3	Furniture	Bookcases
1375	B-26056	19.00	-18.00	4	Clothing	Kurti
1376	B-26056	206.00	18.00	4	Clothing	Hankerchief
1377	B-26057	736.00	346.00	5	Electronics	Printers
1378	B-26057	54.00	8.00	4	Clothing	T-shirt
1379	B-26057	659.00	-37.00	2	Furniture	Bookcases
1380	B-26057	224.00	87.00	3	Clothing	Trousers
1381	B-26058	212.00	97.00	7	Clothing	Hankerchief
1382	B-26059	20.00	6.00	1	Clothing	T-shirt
1383	B-26060	382.00	68.00	3	Clothing	Saree
1384	B-26061	508.00	203.00	2	Electronics	Accessories
1385	B-26061	965.00	-68.00	3	Electronics	Printers
1386	B-26061	206.00	12.00	1	Electronics	Printers
1387	B-26061	642.00	180.00	5	Clothing	Saree
1388	B-26061	109.00	52.00	2	Clothing	Stole
1389	B-26061	27.00	8.00	2	Clothing	T-shirt
1390	B-26062	44.00	-40.00	3	Clothing	Stole
1391	B-26062	50.00	-17.00	2	Clothing	Stole
1392	B-26062	13.00	-2.00	1	Clothing	Stole
1393	B-26063	241.00	-77.00	4	Electronics	Electronic Games
1394	B-26064	75.00	2.00	5	Clothing	Leggings
1395	B-26064	61.00	3.00	4	Clothing	Hankerchief
1396	B-26064	122.00	38.00	6	Clothing	T-shirt
1397	B-26064	22.00	0.00	2	Clothing	Saree
1398	B-26065	146.00	19.00	5	Clothing	Stole
1399	B-26066	86.00	22.00	2	Clothing	Saree
1400	B-26067	618.00	27.00	4	Furniture	Bookcases
1401	B-26067	53.00	2.00	4	Clothing	Hankerchief
1402	B-26067	1120.00	199.00	6	Clothing	Saree
1403	B-26067	1137.00	-14.00	7	Electronics	Printers
1404	B-26067	67.00	2.00	4	Clothing	T-shirt
1405	B-26068	193.00	33.00	5	Electronics	Accessories
1406	B-26069	55.00	18.00	2	Clothing	Kurti
1407	B-26070	54.00	12.00	4	Clothing	Shirt
1408	B-26070	582.00	262.00	5	Furniture	Furnishings
1409	B-26070	75.00	29.00	1	Clothing	Trousers
1410	B-26070	14.00	7.00	2	Clothing	Hankerchief
1411	B-26071	21.00	4.00	3	Clothing	Hankerchief
1412	B-26072	313.00	44.00	3	Electronics	Electronic Games
1413	B-26073	37.00	17.00	3	Clothing	Hankerchief
1414	B-26073	290.00	110.00	9	Clothing	Stole
1415	B-26073	122.00	11.00	4	Clothing	Hankerchief
1416	B-26073	29.00	9.00	3	Clothing	Saree
1417	B-26073	1514.00	742.00	4	Electronics	Printers
1418	B-26074	57.00	21.00	4	Clothing	Leggings
1419	B-26075	34.00	12.00	2	Clothing	Stole
1420	B-26076	91.00	22.00	2	Clothing	Stole
1421	B-26076	133.00	46.00	5	Clothing	Shirt
1422	B-26076	60.00	13.00	2	Clothing	T-shirt
1423	B-26076	19.00	4.00	2	Clothing	Saree
1424	B-26076	450.00	190.00	4	Furniture	Bookcases
1425	B-26077	62.00	11.00	7	Clothing	Hankerchief
1426	B-26078	17.00	8.00	2	Clothing	Skirt
1427	B-26078	44.00	20.00	2	Clothing	T-shirt
1428	B-26078	557.00	111.00	2	Electronics	Electronic Games
1429	B-26078	137.00	63.00	3	Clothing	Stole
1430	B-26079	18.00	3.00	2	Clothing	Hankerchief
1431	B-26080	109.00	35.00	6	Clothing	T-shirt
1432	B-26081	359.00	-338.00	5	Furniture	Bookcases
1433	B-26081	93.00	-84.00	3	Clothing	Saree
1434	B-26081	169.00	0.00	3	Electronics	Accessories
1435	B-26081	79.00	33.00	4	Clothing	Stole
1436	B-26081	24.00	11.00	3	Clothing	Hankerchief
1437	B-26081	637.00	50.00	5	Clothing	Saree
1438	B-26082	95.00	5.00	2	Clothing	Stole
1439	B-26083	43.00	8.00	3	Clothing	Leggings
1440	B-26083	145.00	16.00	3	Clothing	T-shirt
1441	B-26083	34.00	3.00	3	Clothing	Saree
1442	B-26083	143.00	6.00	2	Electronics	Accessories
1443	B-26083	45.00	17.00	1	Electronics	Accessories
1444	B-26084	209.00	-63.00	4	Electronics	Electronic Games
1445	B-26085	86.00	22.00	2	Clothing	Saree
1446	B-26085	1487.00	624.00	3	Clothing	Trousers
1447	B-26085	40.00	17.00	2	Clothing	Stole
1448	B-26085	132.00	-10.00	3	Clothing	Saree
1449	B-26086	43.00	17.00	2	Clothing	T-shirt
1450	B-26086	762.00	101.00	6	Electronics	Printers
1451	B-26086	25.00	2.00	2	Clothing	Hankerchief
1452	B-26087	119.00	56.00	7	Clothing	Saree
1453	B-26087	46.00	13.00	3	Clothing	Hankerchief
1454	B-26087	311.00	40.00	1	Electronics	Electronic Games
1455	B-26087	40.00	10.00	2	Clothing	Stole
1456	B-26087	180.00	0.00	8	Clothing	Stole
1457	B-26088	11.00	5.00	2	Clothing	Hankerchief
1458	B-26089	59.00	24.00	6	Clothing	Kurti
1459	B-26089	27.00	4.00	1	Clothing	Hankerchief
1460	B-26089	139.00	14.00	3	Clothing	Kurti
1461	B-26090	80.00	22.00	3	Clothing	Stole
1462	B-26091	158.00	69.00	3	Clothing	Stole
1463	B-26091	29.00	10.00	4	Clothing	Hankerchief
1464	B-26091	59.00	10.00	4	Clothing	Leggings
1465	B-26092	97.00	14.00	2	Clothing	T-shirt
1466	B-26093	33.00	-1.00	1	Clothing	Saree
1467	B-26093	2847.00	712.00	8	Electronics	Printers
1468	B-26093	852.00	51.00	5	Furniture	Bookcases
1469	B-26093	492.00	187.00	2	Electronics	Accessories
1470	B-26093	81.00	41.00	5	Clothing	Leggings
1471	B-26093	49.00	5.00	4	Clothing	Hankerchief
1472	B-26093	148.00	25.00	3	Clothing	Saree
1473	B-26094	152.00	50.00	6	Clothing	Stole
1474	B-26095	6.00	1.00	1	Clothing	Kurti
1475	B-26096	45.00	9.00	3	Clothing	Leggings
1476	B-26096	103.00	46.00	2	Clothing	Saree
1477	B-26096	140.00	56.00	4	Clothing	Shirt
1478	B-26096	88.00	11.00	3	Electronics	Accessories
1479	B-26096	451.00	25.00	3	Electronics	Phones
1480	B-26096	264.00	-26.00	3	Clothing	Trousers
1481	B-26097	97.00	12.00	2	Clothing	Hankerchief
1482	B-26097	14.00	5.00	1	Clothing	Hankerchief
1483	B-26097	19.00	8.00	2	Clothing	Hankerchief
1484	B-26097	39.00	18.00	2	Clothing	Leggings
1485	B-26097	185.00	-26.00	6	Furniture	Chairs
1486	B-26097	663.00	-212.00	5	Electronics	Printers
1487	B-26097	671.00	-309.00	5	Electronics	Electronic Games
1488	B-26098	82.00	8.00	3	Electronics	Accessories
1489	B-26098	497.00	179.00	3	Furniture	Chairs
1490	B-26098	96.00	48.00	5	Clothing	Leggings
1491	B-26098	409.00	86.00	3	Clothing	Saree
1492	B-26098	59.00	15.00	2	Clothing	T-shirt
1493	B-26098	46.00	14.00	5	Clothing	Skirt
1494	B-26099	9.00	3.00	1	Clothing	Skirt
1495	B-26099	207.00	37.00	4	Clothing	Hankerchief
1496	B-26099	835.00	267.00	5	Electronics	Phones
1497	B-26099	2366.00	552.00	5	Clothing	Trousers
1498	B-26100	828.00	230.00	2	Furniture	Chairs
1499	B-26100	34.00	10.00	2	Clothing	T-shirt
1500	B-26100	72.00	16.00	2	Clothing	Shirt
\.


--
-- TOC entry 4925 (class 0 OID 17285)
-- Dependencies: 223
-- Data for Name: salestarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salestarget (target_id, "Month of Order Date", "Category", "Target") FROM stdin;
1	Apr-18	Furniture	10400.00
2	May-18	Furniture	10500.00
3	Jun-18	Furniture	10600.00
4	Jul-18	Furniture	10800.00
5	Aug-18	Furniture	10900.00
6	Sep-18	Furniture	11000.00
7	Oct-18	Furniture	11100.00
8	Nov-18	Furniture	11300.00
9	Dec-18	Furniture	11400.00
10	Jan-19	Furniture	11500.00
11	Feb-19	Furniture	11600.00
12	Mar-19	Furniture	11800.00
13	Apr-18	Clothing	12000.00
14	May-18	Clothing	12000.00
15	Jun-18	Clothing	12000.00
16	Jul-18	Clothing	14000.00
17	Aug-18	Clothing	14000.00
18	Sep-18	Clothing	14000.00
19	Oct-18	Clothing	16000.00
20	Nov-18	Clothing	16000.00
21	Dec-18	Clothing	16000.00
22	Jan-19	Clothing	16000.00
23	Feb-19	Clothing	16000.00
24	Mar-19	Clothing	16000.00
25	Apr-18	Electronics	9000.00
26	May-18	Electronics	9000.00
27	Jun-18	Electronics	9000.00
28	Jul-18	Electronics	9000.00
29	Aug-18	Electronics	9000.00
30	Sep-18	Electronics	9000.00
31	Oct-18	Electronics	9000.00
32	Nov-18	Electronics	9000.00
33	Dec-18	Electronics	9000.00
34	Jan-19	Electronics	16000.00
35	Feb-19	Electronics	16000.00
36	Mar-19	Electronics	16000.00
\.


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 220
-- Name: orderdetails_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_detail_id_seq', 1500, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 222
-- Name: salestarget_target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salestarget_target_id_seq', 36, true);


--
-- TOC entry 4768 (class 2606 OID 17269)
-- Name: listoforders listoforders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listoforders
    ADD CONSTRAINT listoforders_pkey PRIMARY KEY ("Order ID");


--
-- TOC entry 4770 (class 2606 OID 17278)
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (detail_id);


--
-- TOC entry 4772 (class 2606 OID 17294)
-- Name: salestarget salestarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salestarget
    ADD CONSTRAINT salestarget_pkey PRIMARY KEY (target_id);


--
-- TOC entry 4773 (class 2606 OID 17279)
-- Name: orderdetails fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT fk_order_id FOREIGN KEY ("Order ID") REFERENCES public.listoforders("Order ID") ON DELETE CASCADE;


-- Completed on 2026-01-12 22:49:14

--
-- PostgreSQL database dump complete
--

\unrestrict 96nAW4ZCebkCqQWbcm3VoPMGO5rMDF0hiVFgGjpE6KzsruJYqK9cfXgwH7fPwp6

