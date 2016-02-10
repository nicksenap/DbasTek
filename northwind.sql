--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE categories (
    categoryid integer NOT NULL,
    categoryname character varying(15),
    description text
);


ALTER TABLE public.categories OWNER TO mjm;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE customers (
    customerid character varying(5) NOT NULL,
    companyname character varying(40),
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


ALTER TABLE public.customers OWNER TO mjm;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE employees (
    employeeid integer NOT NULL,
    lastname character varying(20),
    firstname character varying(10),
    title character varying(30),
    titleofcourtesy character varying(25),
    birthdate date,
    hiredate date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    homephone character varying(24),
    extension character varying(4),
    photo character varying(254),
    notes text,
    reportsto integer
);


ALTER TABLE public.employees OWNER TO mjm;

--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE orderdetails (
    orderid integer NOT NULL,
    productid integer NOT NULL,
    unitprice integer,
    quantity smallint,
    discount real
);


ALTER TABLE public.orderdetails OWNER TO mjm;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE orders (
    orderid integer NOT NULL,
    customerid character varying(5),
    employeeid integer,
    orderdate date,
    requireddate date,
    shippeddate date,
    shipvia integer,
    freight integer,
    shipname character varying(40),
    shipaddress character varying(60),
    shipcity character varying(15),
    shipregion character varying(15),
    shippostalcode character varying(10),
    shipcountry character varying(15)
);


ALTER TABLE public.orders OWNER TO mjm;

--
-- Name: products; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE products (
    productid integer NOT NULL,
    productname character varying(40),
    supplierid integer,
    categoryid integer,
    quantityperunit character varying(20),
    unitprice integer,
    unitsinstock smallint,
    unitsonorder smallint,
    reorderlevel smallint,
    discontinued character(1)
);


ALTER TABLE public.products OWNER TO mjm;

--
-- Name: shippers; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE shippers (
    shipperid integer NOT NULL,
    companyname character varying(40),
    phone character varying(24)
);


ALTER TABLE public.shippers OWNER TO mjm;

--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: mjm; Tablespace: 
--

CREATE TABLE suppliers (
    supplierid integer NOT NULL,
    companyname character varying(40),
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


ALTER TABLE public.suppliers OWNER TO mjm;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY categories (categoryid, categoryname, description) FROM stdin;
1	Beverages	Soft drinks, coffees, teas, beers, and ales
2	Condiments	Sweet and savory sauces, relishes, spreads, and seasonings
3	Confections	Desserts, candies, and sweet breads
4	Dairy Products	Cheeses
5	Grains/Cereals	Breads, crackers, pasta, and cereal
6	Meat/Poultry	Prepared meats
7	Produce	Dried fruit and bean curd
8	Seafood	Seaweed and fish
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) FROM stdin;
ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	\N	12209	Germany	030-0074321	030-0076545
ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Owner	Avda. de la Constitucion 2222	Mexico D.F.	\N	05021	Mexico	(5) 555-4729	(5) 555-3745
ANTON	Antonio Moreno Taqueria	Antonio Moreno	Owner	Mataderos  2312	Mexico D.F.	\N	05023	Mexico	(5) 555-3932	\N
AROUT	Around the Horn	Thomas Hardy	Sales Representative	120 Hanover Sq.	London	\N	WA1 1DP	UK	(171) 555-7788	(171) 555-6750
BLAUS	Blauer See Delikatessen	Hanna Moos	Sales Representative	Forsterstr. 57	Mannheim	\N	68306	Germany	0621-08460	0621-08924
BLONP	Blondel père et fils	Frederique Citeaux	Marketing Manager	24, place Kleber	Strasbourg	\N	67000	France	88.60.15.31	88.60.15.32
BOLID	Bolido Comidas preparadas	Martin Sommer	Owner	C/ Araquil, 67	Madrid	\N	28023	Spain	(91) 555 22 82	(91) 555 91 99
BONAP	Bon app'	Laurence Lebihan	Owner	12, rue des Bouchers	Marseille	\N	13008	France	91.24.45.40	91.24.45.41
BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Accounting Manager	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada	(604) 555-4729	(604) 555-3745
BSBEV	B's Beverages	Victoria Ashworth	Sales Representative	Fauntleroy Circus	London	\N	EC2 5NT	UK	(171) 555-1212	\N
CACTU	Cactus Comidas para llevar	Patricio Simpson	Sales Agent	Cerrito 333	Buenos Aires	\N	1010	Argentina	(1) 135-5555	(1) 135-4892
CENTC	Centro comercial Moctezuma	Francisco Chang	Marketing Manager	Sierras de Granada 9993	Mexico D.F.	\N	05022	Mexico	(5) 555-3392	(5) 555-7293
CHOPS	Chop-suey Chinese	Yang Wang	Owner	Hauptstr. 29	Bern	\N	3012	Switzerland	0452-076545	\N
COMMI	Comercio Mineiro	Pedro Afonso	Sales Associate	Av. dos Lusiadas, 23	São Paulo	SP	05432-043	Brazil	(11) 555-7647	\N
CONSH	Consolidated Holdings	Elizabeth Brown	Sales Representative	Berkeley Gardens\n12  Brewery 	London	\N	WX1 6LT	UK	(171) 555-2282	(171) 555-9199
DRACD	Drachenblut Delikatessen	Sven Ottlieb	Order Administrator	Walserweg 21	Aachen	\N	52066	Germany	0241-039123	0241-059428
DUMON	Du monde entier	Janine Labrune	Owner	67, rue des Cinquante Otages	Nantes	\N	44000	France	40.67.88.88	40.67.89.89
EASTC	Eastern Connection	Ann Devon	Sales Agent	35 King George	London	\N	WX3 6FW	UK	(171) 555-0297	(171) 555-3373
ERNSH	Ernst Handel	Roland Mendel	Sales Manager	Kirchgasse 6	Graz	\N	8010	Austria	7675-3425	7675-3426
FAMIA	Familia Arquibaldo	Aria Cruz	Marketing Assistant	Rua Oros, 92	São Paulo	SP	05442-030	Brazil	(11) 555-9857	\N
FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Accounting Manager	C/ Moralzarzal, 86	Madrid	\N	28034	Spain	(91) 555 94 44	(91) 555 55 93
FOLIG	Folies gourmandes	Martine Rance	Assistant Sales Agent	184, chaussee de Tournai	Lille	\N	59000	France	20.16.10.16	20.16.10.17
FRANK	Frankenversand	Peter Franken	Marketing Manager	Berliner Platz 43	Munchen	\N	80805	Germany	089-0877310	089-0877451
FRANR	France restauration	Carine Schmitt	Marketing Manager	54, rue Royale	Nantes	\N	44000	France	40.32.21.21	40.32.21.20
FRANS	Franchi S.p.A.	Paolo Accorti	Sales Representative	Via Monte Bianco 34	Torino	\N	10100	Italy	011-4988260	011-4988261
FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez 	Sales Manager	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal	(1) 354-2534	(1) 354-2535
GALED	Galeria del gastronomo	Eduardo Saavedra	Marketing Manager	Rambla de Cataluña, 23	Barcelona	\N	08022	Spain	(93) 203 4560	(93) 203 4561
GODOS	Godos Cocina Tipica	Jose Pedro Freyre	Sales Manager	C/ Romero, 33	Sevilla	\N	41101	Spain	(95) 555 82 82	\N
GOURL	Gourmet Lanchonetes	Andre Fonseca	Sales Associate	Av. Brasil, 442	Campinas	SP	04876-786	Brazil	(11) 555-9482	\N
GREAL	Great Lakes Food Market	Howard Snyder	Marketing Manager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	\N
GROSR	GROSELLA-Restaurante	Manuel Pereira	Owner	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
HANAR	Hanari Carnes	Mario Pontes	Accounting Manager	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil	(21) 555-0091	(21) 555-8765
HILAA	HILARIÓN-Abastos	Carlos Hernández	Sales Representative	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristobal	Táchira	5022	Venezuela	(5) 555-1340	(5) 555-1948
HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Sales Representative	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Sales Associate	8 Johnstown Road	Cork	Co. Cork	\N	Ireland	2967 542	2967 3333
ISLAT	Island Trading	Helen Bennett	Marketing Manager	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK	(198) 555-8888	\N
LACOR	La corne d'abondance	Daniel Tonini	Sales Representative	67, avenue de l'Europe	Versailles	\N	78000	France	30.59.84.10	30.59.85.11
LAMAI	La maison d'Asie	Annette Roulet	Sales Manager	1 rue Alsace-Lorraine	Toulouse	\N	31000	France	61.77.61.10	61.77.61.11
LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketing Assistant	1900 Oak St.	Vancouver	BC	V3F 2K1	Canada	(604) 555-3392	(604) 555-7293
LAZYK	Lazy K Kountry Store	John Steel	Marketing Manager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
LEHMS	Lehmanns Marktstand	Renate Messner	Sales Representative	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany	069-0245984	069-0245874
LETSS	Let's Stop N Shop	Jaime Yorres	Owner	87 Polk St.\nSuite 5	San Francisco	CA	94117	USA	(415) 555-5938	\N
LILAS	LILA-Supermercado	Carlos González	Accounting Manager	Carrera 52 con Ave. Bolivar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
LINOD	LINO-Delicateses	Felipe Izquierdo	Owner	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
LONEP	Lonesome Pine Restaurant	Fran Wilson	Sales Manager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketing Manager	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy	035-640230	035-640231
MAISD	Maison Dewey	Catherine Dewey	Sales Agent	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium	(02) 201 24 67	(02) 201 24 68
MEREP	Mère Paillarde	Jean Fresnière	Marketing Assistant	43 rue St. Laurent	Montreal	Quebec	H1J 1C3	Canada	(514) 555-8054	(514) 555-8055
MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketing Assistant	Heerstr. 22	Leipzig	\N	04179	Germany	0342-023176	\N
NORTS	North/South	Simon Crowther	Sales Associate	South House 300 Queensbridge	London	\N	SW7 1RZ	UK	(171) 555-7733	(171) 555-2530
OCEAN	Oceano Atlántico Ltda.	Yvonne Moncada	Sales Agent	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina	(1) 135-5333	(1) 135-5535
OLDWO	Old World Delicatessen	Rene Phillips	Sales Representative	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
PARIS	Paris specialites	Marie Bertrand	Owner	265, boulevard Charonne	Paris	\N	75012	France	(1) 42.34.22.66	(1) 42.34.22.77
PERIC	Pericles Comidas clásicas	Guillermo Fernández	Sales Representative	Calle Dr. Jorge Cash 321	Mexico D.F.	\N	05033	Mexico	(5) 552-3745	(5) 545-3745
PICCO	Piccolo und mehr	Georg Pipps	Sales Manager	Geislweg 14	Salzburg	\N	5020	Austria	6562-9722	6562-9723
PRINI	Princesa Isabel Vinhos	Isabel de Castro	Sales Representative	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal	(1) 356-5634	\N
QUEDE	Que Delicia	Bernardo Batista	Accounting Manager	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil	(21) 555-4252	(21) 555-4545
QUEEN	Queen Cozinha	Lúcia Carvalho	Marketing Assistant	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil	(11) 555-1189	\N
QUICK	QUICK-Stop	Horst Kloss	Accounting Manager	Taucherstraße 10	Cunewalde	\N	01307	Germany	0372-035188	\N
RANCH	Rancho grande	Sergio Gutierrez	Sales Representative	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina	(1) 123-5555	(1) 123-5556
RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Assistant Sales Representative	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
REGGC	Reggiani Caseifici	Maurizio Moroni	Sales Associate	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy	0522-556721	0522-556722
RICAR	Ricardo Adocicados	Janete Limeira	Assistant Sales Agent	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil	(21) 555-3412	\N
RICSU	Richter Supermarkt	Michael Holz	Sales Manager	Grenzacherweg 237	Genève	\N	1203	Switzerland	0897-034214	\N
ROMEY	Romero y tomillo	Alejandra Camino	Accounting Manager	Gran Via, 1	Madrid	\N	28001	Spain	(91) 745 6200	(91) 745 6210
SANTG	Sante Gourmet	Jonas Bergulfsen	Owner	Erling Skakkes gate 78	Stavern	\N	4110	Norway	07-98 92 35	07-98 92 47
SAVEA	Save-a-lot Markets	Jose Pavarotti	Sales Representative	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	\N
SEVES	Seven Seas Imports	Hari Kumar	Sales Manager	90 Wadhurst Rd.	London	\N	OX15 4NB	UK	(171) 555-1717	(171) 555-5646
SIMOB	Simons bistro	Jytte Petersen	Owner	Vinbæltet 34	København	\N	1734	Denmark	31 12 34 56	31 13 35 57
SPECD	Specialites du monde	Dominique Perrier	Marketing Manager	25, rue Lauriston	Paris	\N	75016	France	(1) 47.55.60.10	(1) 47.55.60.20
SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Sales Manager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
SUPRD	Suprêmes delices	Pascale Cartrain	Accounting Manager	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium	(071) 23 67 22 20	(071) 23 67 22 21
THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way\nSuite 2	Portland	OR	97201	USA	(503) 555-3612	\N
THECR	The Cracker Box	Liu Wong	Marketing Assistant	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
TORTU	Tortuga Restaurante	Miguel Angel Paolino	Owner	Avda. Azteca 123	Mexico D.F.	\N	05033	Mexico	(5) 555-2933	\N
TRADH	Tradição Hipermercados	Anabela Domingues	Sales Representative	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil	(11) 555-2167	(11) 555-2168
TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Sales Associate	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
VAFFE	Vaffeljernet	Palle Ibsen	Sales Manager	Smagslaet 45	Århus	\N	8200	Denmark	86 21 32 43	86 22 33 44
VICTE	Victuailles en stock	Mary Saveley	Sales Agent	2, rue du Commerce	Lyon	\N	69004	France	78.32.54.86	78.32.54.87
VINET	Vins et alcools Chevalier	Paul Henriot	Accounting Manager	59 rue de l'Abbaye	Reims	\N	51100	France	26.47.15.10	26.47.15.11
WANDK	Die Wandernde Kuh	Rita Muller	Sales Representative	Adenauerallee 900	Stuttgart	\N	70563	Germany	0711-020361	0711-035428
WARTH	Wartian Herkku	Pirkko Koskitalo	Accounting Manager	Torikatu 38	Oulu	\N	90110	Finland	981-443655	981-443655
WELLI	Wellington Importadora	Paula Parente	Sales Manager	Rua do Mercado, 12	Resende	SP	08737-363	Brazil	(14) 555-8122	\N
WHITC	White Clover Markets	Karl Jablonski	Owner	305 - 14th Ave. S.\nSuite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
WILMK	Wilman Kala	Matti Karttunen	Owner/Marketing Assistant	Keskuskatu 45	Helsinki	\N	21240	Finland	90-224 8858	90-224 8858
WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Owner	ul. Filtrowa 68	Warszawa	\N	01-012	Poland	(26) 642-7012	(26) 642-7012
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto) FROM stdin;
1	Davolio	Nancy	Sales Representative	Ms.	1968-12-08 	1992-05-01 	507 - 20th Ave. E.\nApt. 2A	Seattle	WA	98122	USA	(206) 555-9857	5467	EmpID1.bmp	Education includes a BA in psychology from Colorado State University.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.	2
2	Fuller	Andrew	Vice President, Sales	Dr.	1952-02-19 	1992-08-14 	908 W. Capital Way	Tacoma	WA	98401	USA	(206) 555-9482	3457	EmpID2.bmp	Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.	\N
3	Leverling	Janet	Sales Representative	Ms.	1963-08-30 	1992-04-01 	722 Moss Bay Blvd.	Kirkland	WA	98033	USA	(206) 555-3412	3355	EmpID3.bmp	Janet has a BS degree in chemistry from Boston College).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate and was promoted to sales representative.	2
4	Peacock	Margaret	Sales Representative	Mrs.	1958-09-19 	1993-05-03 	4110 Old Redmond Rd.	Redmond	WA	98052	USA	(206) 555-8122	5176	EmpID4.bmp	Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.	2
5	Buchanan	Steven	Sales Manager	Mr.	1955-03-04 	1993-10-17 	14 Garrett Hill	London	\N	SW1 8JR	UK	(71) 555-4848	3453	EmpID5.bmp	Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree.  Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.	2
6	Suyama	Michael	Sales Representative	Mr.	1963-07-02 	1993-10-17 	Coventry House\nMiner Rd.	London	\N	EC2 7JR	UK	(71) 555-7773	428	EmpID6.bmp	Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.	5
7	King	Robert	Sales Representative	Mr.	1960-05-29 	1994-01-02 	Edgeham Hollow\nWinchester Way	London	\N	RG1 9SP	UK	(71) 555-5598	465	EmpID7.bmp	Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company.  After completing a course entitled Selling in Europe, he was transferred to the London office.	5
8	Callahan	Laura	Inside Sales Coordinator	Ms.	1958-01-09 	1994-03-05 	4726 - 11th Ave. N.E.	Seattle	WA	98105	USA	(206) 555-1189	2344	EmpID8.bmp	Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.	2
9	Dodsworth	Anne	Sales Representative	Ms.	1969-07-02 	1994-11-15 	7 Houndstooth Rd.	London	\N	WG2 7LT	UK	(71) 555-4444	452	EmpID9.bmp	Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.	5
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY orderdetails (orderid, productid, unitprice, quantity, discount) FROM stdin;
10248	11	14	12	0
10248	42	10	10	0
10248	72	35	5	0
10249	14	19	9	0
10249	51	42	40	0
10250	41	8	10	0
10250	51	42	35	0.15000001
10250	65	17	15	0.15000001
10251	22	17	6	0.050000001
10251	57	16	15	0.050000001
10251	65	17	20	0
10252	20	65	40	0.050000001
10252	33	2	25	0.050000001
10252	60	27	40	0
10253	31	10	20	0
10253	39	14	42	0
10253	49	16	40	0
10254	24	4	15	0.15000001
10254	55	19	21	0.15000001
10254	74	8	21	0
10255	2	15	20	0
10255	16	14	35	0
10255	36	15	25	0
10255	59	44	30	0
10256	53	26	15	0
10256	77	10	12	0
10257	27	35	25	0
10257	39	14	6	0
10257	77	10	15	0
10258	2	15	50	0.2
10258	5	17	65	0.2
10258	32	26	6	0.2
10259	21	8	10	0
10259	37	21	1	0
10260	41	8	16	0.25
10260	57	16	50	0
10260	62	39	15	0.25
10260	70	12	21	0.25
10261	21	8	20	0
10261	35	14	20	0
10262	5	17	12	0.2
10262	7	24	15	0
10262	56	30	2	0
10263	16	14	60	0.25
10263	24	4	28	0
10263	30	21	60	0.25
10263	74	8	36	0.25
10264	2	15	35	0
10264	41	8	25	0.15000001
10265	17	31	30	0
10265	70	12	20	0
10266	12	30	12	0.050000001
10267	40	15	50	0
10267	59	44	70	0.15000001
10267	76	14	15	0.15000001
10268	29	99	10	0
10268	72	28	4	0
10269	33	2	60	0.050000001
10269	72	28	20	0.050000001
10270	36	15	30	0
10270	43	37	25	0
10271	33	2	24	0
10272	20	65	6	0
10272	31	10	40	0
10272	72	28	24	0
10273	10	25	24	0.050000001
10273	31	10	15	0.050000001
10273	33	2	20	0
10273	40	15	60	0.050000001
10273	76	14	33	0.050000001
10274	71	17	20	0
10274	72	28	7	0
10275	24	4	12	0.050000001
10275	59	44	6	0.050000001
10276	10	25	15	0
10276	13	5	10	0
10277	28	36	20	0
10277	62	39	12	0
10278	44	16	16	0
10278	59	44	15	0
10278	63	35	8	0
10278	73	12	25	0
10279	17	31	15	0.25
10280	24	4	12	0
10280	55	19	20	0
10280	75	6	30	0
10281	19	7	1	0
10281	24	4	6	0
10281	35	14	4	0
10282	30	21	6	0
10282	57	16	2	0
10283	15	12	20	0
10283	19	7	18	0
10283	60	27	35	0
10283	72	28	3	0
10284	27	35	15	0.25
10284	44	16	21	0
10284	60	27	20	0.25
10284	67	11	5	0.25
10285	1	14	45	0.2
10285	40	15	40	0.2
10285	53	26	36	0.2
10286	35	14	100	0
10286	62	39	40	0
10287	16	14	40	0.15000001
10287	34	11	20	0
10287	46	10	15	0.15000001
10288	54	6	10	0.1
10288	68	10	3	0.1
10289	3	8	30	0
10289	64	27	9	0
10290	5	17	20	0
10290	29	99	15	0
10290	49	16	15	0
10290	77	10	10	0
10291	13	5	20	0.1
10291	44	16	24	0.1
10291	51	42	2	0.1
10292	20	65	20	0
10293	18	50	12	0
10293	24	4	10	0
10293	63	35	5	0
10293	75	6	6	0
10294	1	14	18	0
10294	17	31	15	0
10294	43	37	15	0
10294	60	27	21	0
10294	75	6	6	0
10295	56	30	4	0
10296	11	17	12	0
10296	16	14	30	0
10296	69	29	15	0
10297	39	14	60	0
10297	72	28	20	0
10298	2	15	40	0
10298	36	15	40	0.25
10298	59	44	30	0.25
10298	62	39	15	0
10299	19	7	15	0
10299	70	12	20	0
10300	66	14	30	0
10300	68	10	20	0
10301	40	15	10	0
10301	56	30	20	0
10302	17	31	40	0
10302	28	36	28	0
10302	43	37	12	0
10303	40	15	40	0.1
10303	65	17	30	0.1
10303	68	10	15	0.1
10304	49	16	30	0
10304	59	44	10	0
10304	71	17	2	0
10305	18	50	25	0.1
10305	29	99	25	0.1
10305	39	14	30	0.1
10306	30	21	10	0
10306	53	26	10	0
10306	54	6	5	0
10307	62	39	10	0
10307	68	10	3	0
10308	69	29	1	0
10308	70	12	5	0
10309	4	18	20	0
10309	6	20	30	0
10309	42	11	2	0
10309	43	37	20	0
10309	71	17	3	0
10310	16	14	10	0
10310	62	39	5	0
10311	42	11	6	0
10311	69	29	7	0
10312	28	36	4	0
10312	43	37	24	0
10312	53	26	20	0
10312	75	6	10	0
10313	36	15	12	0
10314	32	26	40	0.1
10314	58	11	30	0.1
10314	62	39	25	0.1
10315	34	11	14	0
10315	70	12	30	0
10316	41	8	10	0
10316	62	39	70	0
10317	1	14	20	0
10318	41	8	20	0
10318	76	14	6	0
10319	17	31	8	0
10319	28	36	14	0
10319	76	14	30	0
10320	71	17	30	0
10321	35	14	10	0
10322	52	6	20	0
10323	15	12	5	0
10323	25	11	4	0
10323	39	14	4	0
10324	16	14	21	0.15000001
10324	35	14	70	0.15000001
10324	46	10	30	0
10324	59	44	40	0.15000001
10324	63	35	80	0.15000001
10325	6	20	6	0
10325	13	5	12	0
10325	14	19	9	0
10325	31	10	4	0
10325	72	28	40	0
10326	4	18	24	0
10326	57	16	16	0
10326	75	6	50	0
10327	2	15	25	0.2
10327	11	17	50	0.2
10327	30	21	35	0.2
10327	58	11	30	0.2
10328	59	44	9	0
10328	65	17	40	0
10328	68	10	10	0
10329	19	7	10	0.050000001
10329	30	21	8	0.050000001
10329	38	211	20	0.050000001
10329	56	30	12	0.050000001
10330	26	25	50	0.15000001
10330	72	28	25	0.15000001
10331	54	6	15	0
10332	18	50	40	0.2
10332	42	11	10	0.2
10332	47	8	16	0.2
10333	14	19	10	0
10333	21	8	10	0.1
10333	71	17	40	0.1
10334	52	6	8	0
10334	68	10	10	0
10335	2	15	7	0.2
10335	31	10	25	0.2
10335	32	26	6	0.2
10335	51	42	48	0.2
10336	4	18	18	0.1
10337	23	7	40	0
10337	26	25	24	0
10337	36	15	20	0
10337	37	21	28	0
10337	72	28	25	0
10338	17	31	20	0
10338	30	21	15	0
10339	4	18	10	0
10339	17	31	70	0.050000001
10339	62	39	28	0
10340	18	50	20	0.050000001
10340	41	8	12	0.050000001
10340	43	37	40	0.050000001
10341	33	2	8	0
10341	59	44	9	0.15000001
10342	2	15	24	0.2
10342	31	10	56	0.2
10342	36	15	40	0.2
10342	55	19	40	0.2
10343	64	27	50	0
10343	68	10	4	0.050000001
10343	76	14	15	0
10344	4	18	35	0
10344	8	32	70	0.25
10345	8	32	70	0
10345	19	7	80	0
10345	42	11	9	0
10346	17	31	36	0.1
10346	56	30	20	0
10347	25	11	10	0
10347	39	14	50	0.15000001
10347	40	15	4	0
10347	75	6	6	0.15000001
10348	1	14	15	0.15000001
10348	23	7	25	0
10349	54	6	24	0
10350	50	13	15	0.1
10350	69	29	18	0.1
10351	38	211	20	0.050000001
10351	41	8	13	0
10351	44	16	77	0.050000001
10351	65	17	10	0.050000001
10352	24	4	10	0
10352	54	6	20	0.15000001
10353	11	17	12	0.2
10353	38	211	50	0.2
10354	1	14	12	0
10354	29	99	4	0
10355	24	4	25	0
10355	57	16	25	0
10356	31	10	30	0
10356	55	19	12	0
10356	69	29	20	0
10357	10	25	30	0.2
10357	26	25	16	0
10357	60	27	8	0.2
10358	24	4	10	0.050000001
10358	34	11	10	0.050000001
10358	36	15	20	0.050000001
10359	16	14	56	0.050000001
10359	31	10	70	0.050000001
10359	60	27	80	0.050000001
10360	28	36	30	0
10360	29	99	35	0
10360	38	211	10	0
10360	49	16	35	0
10360	54	6	28	0
10361	39	14	54	0.1
10361	60	27	55	0.1
10362	25	11	50	0
10362	51	42	20	0
10362	54	6	24	0
10363	31	10	20	0
10363	75	6	12	0
10363	76	14	12	0
10364	69	29	30	0
10364	71	17	5	0
10365	11	17	24	0
10366	65	17	5	0
10366	77	10	5	0
10367	34	11	36	0
10367	54	6	18	0
10367	65	17	15	0
10367	77	10	7	0
10368	21	8	5	0.1
10368	28	36	13	0.1
10368	57	16	25	0
10368	64	27	35	0.1
10369	29	99	20	0
10369	56	30	18	0.25
10370	1	14	15	0.15000001
10370	64	27	30	0
10370	74	8	20	0.15000001
10371	36	15	6	0.2
10372	20	65	12	0.25
10372	38	211	40	0.25
10372	60	27	70	0.25
10372	72	28	42	0.25
10373	58	11	80	0.2
10373	71	17	50	0.2
10374	31	10	30	0
10374	58	11	15	0
10375	14	19	15	0
10375	54	6	10	0
10376	31	10	42	0.050000001
10377	28	36	20	0.15000001
10377	39	14	20	0.15000001
10378	71	17	6	0
10379	41	8	8	0.1
10379	63	35	16	0.1
10379	65	17	20	0.1
10380	30	21	18	0.1
10380	53	26	20	0.1
10380	60	27	6	0.1
10380	70	12	30	0
10381	74	8	14	0
10382	5	17	32	0
10382	18	50	9	0
10382	29	99	14	0
10382	33	2	60	0
10382	74	8	50	0
10383	13	5	20	0
10383	50	13	15	0
10383	56	30	20	0
10384	20	65	28	0
10384	60	27	15	0
10385	7	24	10	0.2
10385	60	27	20	0.2
10385	68	10	8	0.2
10386	24	4	15	0
10386	34	11	10	0
10387	24	4	15	0
10387	28	36	6	0
10387	59	44	12	0
10387	71	17	15	0
10388	45	8	15	0.2
10388	52	6	20	0.2
10388	53	26	40	0
10389	10	25	16	0
10389	55	19	15	0
10389	62	39	20	0
10389	70	12	30	0
10390	31	10	60	0.1
10390	35	14	40	0.1
10390	46	10	45	0
10390	72	28	24	0.1
10391	13	5	18	0
10392	69	29	50	0
10393	2	15	25	0.25
10393	14	19	42	0.25
10393	25	11	7	0.25
10393	26	25	70	0.25
10393	31	10	32	0
10394	13	5	10	0
10394	62	39	10	0
10395	46	10	28	0.1
10395	53	26	70	0.1
10395	69	29	8	0
10396	23	7	40	0
10396	71	17	60	0
10396	72	28	21	0
10397	21	8	10	0.15000001
10397	51	42	18	0.15000001
10398	35	14	30	0
10398	55	19	120	0.1
10399	68	10	60	0
10399	71	17	30	0
10399	76	14	35	0
10399	77	10	14	0
10400	29	99	21	0
10400	35	14	35	0
10400	49	16	30	0
10401	30	21	18	0
10401	56	30	70	0
10401	65	17	20	0
10401	71	17	60	0
10402	23	7	60	0
10402	63	35	65	0
10403	16	14	21	0.15000001
10403	48	10	70	0.15000001
10404	26	25	30	0.050000001
10404	42	11	40	0.050000001
10404	49	16	30	0.050000001
10405	3	8	50	0
10406	1	14	10	0
10406	21	8	30	0.1
10406	28	36	42	0.1
10406	36	15	5	0.1
10406	40	15	2	0.1
10407	11	17	30	0
10407	69	29	15	0
10407	71	17	15	0
10408	37	21	10	0
10408	54	6	6	0
10408	62	39	35	0
10409	14	19	12	0
10409	21	8	12	0
10410	33	2	49	0
10410	59	44	16	0
10411	41	8	25	0.2
10411	44	16	40	0.2
10411	59	44	9	0.2
10412	14	19	20	0.1
10413	1	14	24	0
10413	62	39	40	0
10413	76	14	14	0
10414	19	7	18	0.050000001
10414	33	2	50	0
10415	17	31	2	0
10415	33	2	20	0
10416	19	7	20	0
10416	53	26	10	0
10416	57	16	20	0
10417	38	211	50	0
10417	46	10	2	0.25
10417	68	10	36	0.25
10417	77	10	35	0
10418	2	15	60	0
10418	47	8	55	0
10418	61	23	16	0
10418	74	8	15	0
10419	60	27	60	0.050000001
10419	69	29	20	0.050000001
10420	9	78	20	0.1
10420	13	5	2	0.1
10420	70	12	8	0.1
10420	73	12	20	0.1
10421	19	7	4	0.15000001
10421	26	25	30	0
10421	53	26	15	0.15000001
10421	77	10	10	0.15000001
10422	26	25	2	0
10423	31	10	14	0
10423	59	44	20	0
10424	35	14	60	0.2
10424	38	211	49	0.2
10424	68	10	30	0.2
10425	55	19	10	0.25
10425	76	14	20	0.25
10426	56	30	5	0
10426	64	27	7	0
10427	14	19	35	0
10428	46	10	20	0
10429	50	13	40	0
10429	63	35	35	0.25
10430	17	31	45	0.2
10430	21	8	50	0
10430	56	30	30	0
10430	59	44	70	0.2
10431	17	31	50	0.25
10431	40	15	50	0.25
10431	47	8	30	0.25
10432	26	25	10	0
10432	54	6	40	0
10433	56	30	28	0
10434	11	17	6	0
10434	76	14	18	0.15000001
10435	2	15	10	0
10435	22	17	12	0
10435	72	28	10	0
10436	46	10	5	0
10436	56	30	40	0.1
10436	64	27	30	0.1
10436	75	6	24	0.1
10437	53	26	15	0
10438	19	7	15	0.2
10438	34	11	20	0.2
10438	57	16	15	0.2
10439	12	30	15	0
10439	16	14	16	0
10439	64	27	6	0
10439	74	8	30	0
10440	2	15	45	0.15000001
10440	16	14	49	0.15000001
10440	29	99	24	0.15000001
10440	61	23	90	0.15000001
10441	27	35	50	0
10442	11	17	30	0
10442	54	6	80	0
10442	66	14	60	0
10443	11	17	6	0.2
10443	28	36	12	0
10444	17	31	10	0
10444	26	25	15	0
10444	35	14	8	0
10444	41	8	30	0
10445	39	14	6	0
10445	54	6	15	0
10446	19	7	12	0.1
10446	24	4	20	0.1
10446	31	10	3	0.1
10446	52	6	15	0.1
10447	19	7	40	0
10447	65	17	35	0
10447	71	17	2	0
10448	26	25	6	0
10448	40	15	20	0
10449	10	25	14	0
10449	52	6	20	0
10449	62	39	35	0
10450	10	25	20	0.2
10450	54	6	6	0.2
10451	55	19	120	0.1
10451	64	27	35	0.1
10451	65	17	28	0.1
10451	77	10	55	0.1
10452	28	36	15	0
10452	44	16	100	0.050000001
10453	48	10	15	0.1
10453	70	12	25	0.1
10454	16	14	20	0.2
10454	33	2	20	0.2
10454	46	10	10	0.2
10455	39	14	20	0
10455	53	26	50	0
10455	61	23	25	0
10455	71	17	30	0
10456	21	8	40	0.15000001
10456	49	16	21	0.15000001
10457	59	44	36	0
10458	26	25	30	0
10458	28	36	30	0
10458	43	37	20	0
10458	56	30	15	0
10458	71	17	50	0
10459	7	24	16	0.050000001
10459	46	10	20	0.050000001
10459	72	28	40	0
10460	68	10	21	0.25
10460	75	6	4	0.25
10461	21	8	40	0.25
10461	30	21	28	0.25
10461	55	19	60	0.25
10462	13	5	1	0
10462	23	7	21	0
10463	19	7	21	0
10463	42	11	50	0
10464	4	18	16	0.2
10464	43	37	3	0
10464	56	30	30	0.2
10464	60	27	20	0
10465	24	4	25	0
10465	29	99	18	0.1
10465	40	15	20	0
10465	45	8	30	0.1
10465	50	13	25	0
10466	11	17	10	0
10466	46	10	5	0
10467	24	4	28	0
10467	25	11	12	0
10468	30	21	8	0
10468	43	37	15	0
10469	2	15	40	0.15000001
10469	16	14	35	0.15000001
10469	44	16	2	0.15000001
10470	18	50	30	0
10470	23	7	15	0
10470	64	27	8	0
10471	7	24	30	0
10471	56	30	20	0
10472	24	4	80	0.050000001
10472	51	42	18	0
10473	33	2	12	0
10473	71	17	12	0
10474	14	19	12	0
10474	28	36	18	0
10474	40	15	21	0
10474	75	6	10	0
10475	31	10	35	0.15000001
10475	66	14	60	0.15000001
10475	76	14	42	0.15000001
10476	55	19	2	0.050000001
10476	70	12	12	0
10477	1	14	15	0
10477	21	8	21	0.25
10477	39	14	20	0.25
10478	10	25	20	0.050000001
10479	38	211	30	0
10479	53	26	28	0
10479	59	44	60	0
10479	64	27	30	0
10480	47	8	30	0
10480	59	44	12	0
10481	49	16	24	0
10481	60	27	40	0
10482	40	15	10	0
10483	34	11	35	0.050000001
10483	77	10	30	0.050000001
10484	21	8	14	0
10484	40	15	10	0
10484	51	42	3	0
10485	2	15	20	0.1
10485	3	8	20	0.1
10485	55	19	30	0.1
10485	70	12	60	0.1
10486	11	17	5	0
10486	51	42	25	0
10486	74	8	16	0
10487	19	7	5	0
10487	26	25	30	0
10487	54	6	24	0.25
10488	59	44	30	0
10488	73	12	20	0.2
10489	11	17	15	0.25
10489	16	14	18	0
10490	59	44	60	0
10490	68	10	30	0
10490	75	6	36	0
10491	44	16	15	0.15000001
10491	77	10	7	0.15000001
10492	25	11	60	0.050000001
10492	42	11	20	0.050000001
10493	65	17	15	0.1
10493	66	14	10	0.1
10493	69	29	10	0.1
10494	56	30	30	0
10495	23	7	10	0
10495	41	8	20	0
10495	77	10	5	0
10496	31	10	20	0.050000001
10497	56	30	14	0
10497	72	28	25	0
10497	77	10	25	0
10498	24	4	14	0
10498	40	18	5	0
10498	42	14	30	0
10499	28	46	20	0
10499	49	20	25	0
10500	15	16	12	0.050000001
10500	28	46	8	0.050000001
10501	54	7	20	0
10502	45	10	21	0
10502	53	33	6	0
10502	67	14	30	0
10503	14	23	70	0
10503	65	21	20	0
10504	2	19	12	0
10504	21	10	12	0
10504	53	33	10	0
10504	61	28	25	0
10505	62	49	3	0
10506	25	14	18	0.1
10506	70	15	14	0.1
10507	43	46	15	0.15000001
10507	48	13	15	0.15000001
10508	13	6	10	0
10508	39	18	10	0
10509	28	46	3	0
10510	29	124	36	0
10510	75	8	36	0.1
10511	4	22	50	0.15000001
10511	7	30	50	0.15000001
10511	8	40	10	0.15000001
10512	24	4	10	0.15000001
10512	46	12	9	0.15000001
10512	47	10	6	0.15000001
10512	60	34	12	0.15000001
10513	21	10	40	0.2
10513	32	32	50	0.2
10513	61	28	15	0.2
10514	20	81	39	0
10514	28	46	35	0
10514	56	38	70	0
10514	65	21	39	0
10514	75	8	50	0
10515	9	97	16	0.15000001
10515	16	17	50	0
10515	27	44	120	0
10515	33	2	16	0.15000001
10515	60	34	84	0.15000001
10516	18	62	25	0.1
10516	41	10	80	0.1
10516	42	14	20	0
10517	52	7	6	0
10517	59	55	4	0
10517	70	15	6	0
10518	24	4	5	0
10518	38	264	15	0
10518	44	19	9	0
10519	10	31	16	0.050000001
10519	56	38	40	0
10519	60	34	10	0.050000001
10520	24	4	8	0
10520	53	33	5	0
10521	35	18	3	0
10521	41	10	10	0
10521	68	12	6	0
10522	1	18	40	0.2
10522	8	40	24	0
10522	30	26	20	0.2
10522	40	18	25	0.2
10523	17	39	25	0.1
10523	20	81	15	0.1
10523	37	26	18	0.1
10523	41	10	6	0.1
10524	10	31	2	0
10524	30	26	10	0
10524	43	46	60	0
10524	54	7	15	0
10525	36	19	30	0
10525	40	18	15	0.1
10526	1	18	8	0.15000001
10526	13	6	10	0
10526	56	38	30	0.15000001
10527	4	22	50	0.1
10527	36	19	30	0.1
10528	11	21	3	0
10528	33	2	8	0.2
10528	72	35	9	0
10529	55	24	14	0
10529	68	12	20	0
10529	69	36	10	0
10530	17	39	40	0
10530	43	46	25	0
10530	61	28	20	0
10530	76	18	50	0
10531	59	55	2	0
10532	30	26	15	0
10532	66	17	24	0
10533	4	22	50	0.050000001
10533	72	35	24	0
10533	73	15	24	0.050000001
10534	30	26	10	0
10534	40	18	10	0.2
10534	54	7	10	0.2
10535	11	21	50	0.1
10535	40	18	10	0.1
10535	57	20	5	0.1
10535	59	55	15	0.1
10536	12	38	15	0.25
10536	31	12	20	0
10536	33	2	30	0
10536	60	34	35	0.25
10537	31	12	30	0
10537	51	53	6	0
10537	58	13	20	0
10537	72	35	21	0
10537	73	15	9	0
10538	70	15	7	0
10538	72	35	1	0
10539	13	6	8	0
10539	21	10	15	0
10539	33	2	15	0
10539	49	20	6	0
10540	3	10	60	0
10540	26	31	40	0
10540	38	264	30	0
10540	68	12	35	0
10541	24	4	35	0.1
10541	38	264	4	0.1
10541	65	21	36	0.1
10541	71	22	9	0.1
10542	11	21	15	0.050000001
10542	54	7	24	0.050000001
10543	12	38	30	0.15000001
10543	23	9	70	0.15000001
10544	28	46	7	0
10544	67	14	7	0
10545	11	21	10	0
10546	7	30	10	0
10546	35	18	30	0
10546	62	49	40	0
10547	32	32	24	0.15000001
10547	36	19	60	0
10548	34	14	10	0.25
10548	41	10	14	0
10549	31	12	55	0.15000001
10549	45	10	100	0.15000001
10549	51	53	48	0.15000001
10550	17	39	8	0.1
10550	19	9	10	0
10550	21	10	6	0.1
10550	61	28	10	0.1
10551	16	17	40	0.15000001
10551	35	18	20	0.15000001
10551	44	19	40	0
10552	69	36	18	0
10552	75	8	30	0
10553	11	21	15	0
10553	16	17	14	0
10553	22	21	24	0
10553	31	12	30	0
10553	35	18	6	0
10554	16	17	30	0.050000001
10554	23	9	20	0.050000001
10554	62	49	20	0.050000001
10554	77	13	10	0.050000001
10555	14	23	30	0.2
10555	19	9	35	0.2
10555	24	4	18	0.2
10555	51	53	20	0.2
10555	56	38	40	0.2
10556	72	35	24	0
10557	64	33	30	0
10557	75	8	20	0
10558	47	10	25	0
10558	51	53	20	0
10558	52	7	30	0
10558	53	33	18	0
10558	73	15	3	0
10559	41	10	12	0.050000001
10559	55	24	18	0.050000001
10560	30	26	20	0
10560	62	49	15	0.25
10561	44	19	10	0
10561	51	53	50	0
10562	33	2	20	0.1
10562	62	49	10	0.1
10563	36	19	25	0
10563	52	7	70	0
10564	17	39	16	0.050000001
10564	31	12	6	0.050000001
10564	55	24	25	0.050000001
10565	24	4	25	0.1
10565	64	33	18	0.1
10566	11	21	35	0.15000001
10566	18	62	18	0.15000001
10566	76	18	10	0
10567	31	12	60	0.2
10567	51	53	3	0
10567	59	55	40	0.2
10568	10	31	5	0
10569	31	12	35	0.2
10569	76	18	30	0
10570	11	21	15	0.050000001
10570	56	38	60	0.050000001
10571	14	23	11	0.15000001
10571	42	14	28	0.15000001
10572	16	17	12	0.1
10572	32	32	10	0.1
10572	40	18	50	0
10572	75	8	15	0.1
10573	17	39	18	0
10573	34	14	40	0
10573	53	33	25	0
10574	33	2	14	0
10574	40	18	2	0
10574	62	49	10	0
10574	64	33	6	0
10575	59	55	12	0
10575	63	44	6	0
10575	72	35	30	0
10575	76	18	10	0
10576	1	18	10	0
10576	31	12	20	0
10576	44	19	21	0
10577	39	18	10	0
10577	75	8	20	0
10577	77	13	18	0
10578	35	18	20	0
10578	57	20	6	0
10579	15	16	10	0
10579	75	8	21	0
10580	14	23	15	0.050000001
10580	41	10	9	0.050000001
10580	65	21	30	0.050000001
10581	75	8	50	0.2
10582	57	20	4	0
10582	76	18	14	0
10583	29	124	10	0
10583	60	34	24	0.15000001
10583	69	36	10	0.15000001
10584	31	12	50	0.050000001
10585	47	10	15	0
10586	52	7	4	0.15000001
10587	26	31	6	0
10587	35	18	20	0
10587	77	13	20	0
10588	18	62	40	0.2
10588	42	14	100	0.2
10589	35	18	4	0
10590	1	18	20	0
10590	77	13	60	0.050000001
10591	3	10	14	0
10591	7	30	10	0
10591	54	7	50	0
10592	15	16	25	0.050000001
10592	26	31	5	0.050000001
10593	20	81	21	0.2
10593	69	36	20	0.2
10593	76	18	4	0.2
10594	52	7	24	0
10594	58	13	30	0
10595	35	18	30	0.25
10595	61	28	120	0.25
10595	69	36	65	0.25
10596	56	38	5	0.2
10596	63	44	24	0.2
10596	75	8	30	0.2
10597	24	4	35	0.2
10597	57	20	20	0
10597	65	21	12	0.2
10598	27	44	50	0
10598	71	22	9	0
10599	62	49	10	0
10600	54	7	4	0
10600	73	15	30	0
10601	13	6	60	0
10601	59	55	35	0
10602	77	13	5	0.25
10603	22	21	48	0
10603	49	20	25	0.050000001
10604	48	13	6	0.1
10604	76	18	10	0.1
10605	16	17	30	0.050000001
10605	59	55	20	0.050000001
10605	60	34	70	0.050000001
10605	71	22	15	0.050000001
10606	4	22	20	0.2
10606	55	24	20	0.2
10606	62	49	10	0.2
10607	7	30	45	0
10607	17	39	100	0
10607	33	2	14	0
10607	40	18	42	0
10607	72	35	12	0
10608	56	38	28	0
10609	1	18	3	0
10609	10	31	10	0
10609	21	10	6	0
10610	36	19	21	0.25
10611	1	18	6	0
10611	2	19	10	0
10611	60	34	15	0
10612	10	31	70	0
10612	36	19	55	0
10612	49	20	18	0
10612	60	34	40	0
10612	76	18	80	0
10613	13	6	8	0.1
10613	75	8	40	0
10614	11	21	14	0
10614	21	10	8	0
10614	39	18	5	0
10615	55	24	5	0
10616	38	264	15	0.050000001
10616	56	38	14	0
10616	70	15	15	0.050000001
10616	71	22	15	0.050000001
10617	59	55	30	0.15000001
10618	6	25	70	0
10618	56	38	20	0
10618	68	12	15	0
10619	21	10	42	0
10619	22	21	40	0
10620	24	4	5	0
10620	52	7	5	0
10621	19	9	5	0
10621	23	9	10	0
10621	70	15	20	0
10621	71	22	15	0
10622	2	19	20	0
10622	68	12	18	0.2
10623	14	23	21	0
10623	19	9	15	0.1
10623	21	10	25	0.1
10623	24	4	3	0
10623	35	18	30	0.1
10624	28	46	10	0
10624	29	124	6	0
10624	44	19	10	0
10625	14	23	3	0
10625	42	14	5	0
10625	60	34	10	0
10626	53	33	12	0
10626	60	34	20	0
10626	71	22	20	0
10627	62	49	15	0
10627	73	15	35	0.15000001
10628	1	18	25	0
10629	29	124	20	0
10629	64	33	9	0
10630	55	24	12	0.050000001
10630	76	18	35	0
10631	75	8	8	0.1
10632	2	19	30	0.050000001
10632	33	2	20	0.050000001
10633	12	38	36	0.15000001
10633	13	6	13	0.15000001
10633	26	31	35	0.15000001
10633	62	49	80	0.15000001
10634	7	30	35	0
10634	18	62	50	0
10634	51	53	15	0
10634	75	8	2	0
10635	4	22	10	0.1
10635	5	21	15	0.1
10635	22	21	40	0
10636	4	22	25	0
10636	58	13	6	0
10637	11	21	10	0
10637	50	16	25	0.050000001
10637	56	38	60	0.050000001
10638	45	10	20	0
10638	65	21	21	0
10638	72	35	60	0
10639	18	62	8	0
10640	69	36	20	0.25
10640	70	15	15	0.25
10641	2	19	50	0
10641	40	18	60	0
10642	21	10	30	0.2
10642	61	28	20	0.2
10643	28	46	15	0.25
10643	39	18	21	0.25
10643	46	12	2	0.25
10644	18	62	4	0.1
10644	43	46	20	0
10644	46	12	21	0.1
10645	18	62	20	0
10645	36	19	15	0
10646	1	18	15	0.25
10646	10	31	18	0.25
10646	71	22	30	0.25
10646	77	13	35	0.25
10647	19	9	30	0
10647	39	18	20	0
10648	22	21	15	0
10648	24	4	15	0.15000001
10649	28	46	20	0
10649	72	35	15	0
10650	30	26	30	0
10650	53	33	25	0.050000001
10650	54	7	30	0
10651	19	9	12	0.25
10651	22	21	20	0.25
10652	30	26	2	0.25
10652	42	14	20	0
10653	16	17	30	0.1
10653	60	34	20	0.1
10654	4	22	12	0.1
10654	39	18	20	0.1
10654	54	7	6	0.1
10655	41	10	20	0.2
10656	14	23	3	0.1
10656	44	19	28	0.1
10656	47	10	6	0.1
10657	15	16	50	0
10657	41	10	24	0
10657	46	12	45	0
10657	47	10	10	0
10657	56	38	45	0
10657	60	34	30	0
10658	21	10	60	0
10658	40	18	70	0.050000001
10658	60	34	55	0.050000001
10658	77	13	70	0.050000001
10659	31	12	20	0.050000001
10659	40	18	24	0.050000001
10659	70	15	40	0.050000001
10660	20	81	21	0
10661	39	18	3	0.2
10661	58	13	49	0.2
10662	68	12	10	0
10663	40	18	30	0.050000001
10663	42	14	30	0.050000001
10663	51	53	20	0.050000001
10664	10	31	24	0.15000001
10664	56	38	12	0.15000001
10664	65	21	15	0.15000001
10665	51	53	20	0
10665	59	55	1	0
10665	76	18	10	0
10666	29	124	36	0
10666	65	21	10	0
10667	69	36	45	0.2
10667	71	22	14	0.2
10668	31	12	8	0.1
10668	55	24	4	0.1
10668	64	33	15	0.1
10669	36	19	30	0
10670	23	9	32	0
10670	46	12	60	0
10670	67	14	25	0
10670	73	15	50	0
10670	75	8	25	0
10671	16	17	10	0
10671	62	49	10	0
10671	65	21	12	0
10672	38	264	15	0.1
10672	71	22	12	0
10673	16	17	3	0
10673	42	14	6	0
10673	43	46	6	0
10674	23	9	5	0
10675	14	23	30	0
10675	53	33	10	0
10675	58	13	30	0
10676	10	31	2	0
10676	19	9	7	0
10676	44	19	21	0
10677	26	31	30	0.15000001
10677	33	2	8	0.15000001
10678	12	38	100	0
10678	33	2	30	0
10678	41	10	120	0
10678	54	7	30	0
10679	59	55	12	0
10680	16	17	50	0.25
10680	31	12	20	0.25
10680	42	14	40	0.25
10681	19	9	30	0.1
10681	21	10	12	0.1
10681	64	33	28	0
10682	33	2	30	0
10682	66	17	4	0
10682	75	8	30	0
10683	52	7	9	0
10684	40	18	20	0
10684	47	10	40	0
10684	60	34	30	0
10685	10	31	20	0
10685	41	10	4	0
10685	47	10	15	0
10686	17	39	30	0.2
10686	26	31	15	0
10687	9	97	50	0.25
10687	29	124	10	0
10687	36	19	6	0.25
10688	10	31	18	0.1
10688	28	46	60	0.1
10688	34	14	14	0
10689	1	18	35	0.25
10690	56	38	20	0.25
10690	77	13	30	0.25
10691	1	18	30	0
10691	29	124	40	0
10691	43	46	40	0
10691	44	19	24	0
10691	62	49	48	0
10692	63	44	20	0
10693	9	97	6	0
10693	54	7	60	0.15000001
10693	69	36	30	0.15000001
10693	73	15	15	0.15000001
10694	7	30	90	0
10694	59	55	25	0
10694	70	15	50	0
10695	8	40	10	0
10695	12	38	4	0
10695	24	4	20	0
10696	17	39	20	0
10696	46	12	18	0
10697	19	9	7	0.25
10697	35	18	9	0.25
10697	58	13	30	0.25
10697	70	15	30	0.25
10698	11	21	15	0
10698	17	39	8	0.050000001
10698	29	124	12	0.050000001
10698	65	21	65	0.050000001
10698	70	15	8	0.050000001
10699	47	10	12	0
10700	1	18	5	0.2
10700	34	14	12	0.2
10700	68	12	40	0.2
10700	71	22	60	0.2
10701	59	55	42	0.15000001
10701	71	22	20	0.15000001
10701	76	18	35	0.15000001
10702	3	10	6	0
10702	76	18	15	0
10703	2	19	5	0
10703	59	55	35	0
10703	73	15	35	0
10704	4	22	6	0
10704	24	4	35	0
10704	48	13	24	0
10705	31	12	20	0
10705	32	32	4	0
10706	16	17	20	0
10706	43	46	24	0
10706	59	55	8	0
10707	55	24	21	0
10707	57	20	40	0
10707	70	15	28	0.15000001
10708	5	21	4	0
10708	36	19	5	0
10709	8	40	40	0
10709	51	53	28	0
10709	60	34	10	0
10710	19	9	5	0
10710	47	10	5	0
10711	19	9	12	0
10711	41	10	42	0
10711	53	33	120	0
10712	53	33	3	0.050000001
10712	56	38	30	0
10713	10	31	18	0
10713	26	31	30	0
10713	45	10	110	0
10713	46	12	24	0
10714	2	19	30	0.25
10714	17	39	27	0.25
10714	47	10	50	0.25
10714	56	38	18	0.25
10714	58	13	12	0.25
10715	10	31	21	0
10715	71	22	30	0
10716	21	10	5	0
10716	51	53	7	0
10716	61	28	10	0
10717	21	10	32	0.050000001
10717	54	7	15	0
10717	69	36	25	0.050000001
10718	12	38	36	0
10718	16	17	20	0
10718	36	19	40	0
10718	62	49	20	0
10719	18	62	12	0.25
10719	30	26	3	0.25
10719	54	7	40	0.25
10720	35	18	21	0
10720	71	22	8	0
10721	44	19	50	0.050000001
10722	2	19	3	0
10722	31	12	50	0
10722	68	12	45	0
10722	75	8	42	0
10723	26	31	15	0
10724	10	31	16	0
10724	61	28	5	0
10725	41	10	12	0
10725	52	7	4	0
10725	55	24	6	0
10726	4	22	25	0
10726	11	21	5	0
10727	17	39	20	0.050000001
10727	56	38	10	0.050000001
10727	59	55	10	0.050000001
10728	30	26	15	0
10728	40	18	6	0
10728	55	24	12	0
10728	60	34	15	0
10729	1	18	50	0
10729	21	10	30	0
10729	50	16	40	0
10730	16	17	15	0.050000001
10730	31	12	3	0.050000001
10730	65	21	10	0.050000001
10731	21	10	40	0.050000001
10731	51	53	30	0.050000001
10732	76	18	20	0
10733	14	23	16	0
10733	28	46	20	0
10733	52	7	25	0
10734	6	25	30	0
10734	30	26	15	0
10734	76	18	20	0
10735	61	28	20	0.1
10735	77	13	2	0.1
10736	65	21	40	0
10736	75	8	20	0
10737	13	6	4	0
10737	41	10	12	0
10738	16	17	3	0
10739	36	19	6	0
10739	52	7	18	0
10740	28	46	5	0.2
10740	35	18	35	0.2
10740	45	10	40	0.2
10740	56	38	14	0.2
10741	2	19	15	0.2
10742	3	10	20	0
10742	60	34	50	0
10742	72	35	35	0
10743	46	12	28	0.050000001
10744	40	18	50	0.2
10745	18	62	24	0
10745	44	19	16	0
10745	59	55	45	0
10745	72	35	7	0
10746	13	6	6	0
10746	42	14	28	0
10746	62	49	9	0
10746	69	36	40	0
10747	31	12	8	0
10747	41	10	35	0
10747	63	44	9	0
10747	69	36	30	0
10748	23	9	44	0
10748	40	18	40	0
10748	56	38	28	0
10749	56	38	15	0
10749	59	55	6	0
10749	76	18	10	0
10750	14	23	5	0.15000001
10750	45	10	40	0.15000001
10750	59	55	25	0.15000001
10751	26	31	12	0.1
10751	30	26	30	0
10751	50	16	20	0.1
10751	73	15	15	0
10752	1	18	8	0
10752	69	36	3	0
10753	45	10	4	0
10753	74	10	5	0
10754	40	18	3	0
10755	47	10	30	0.25
10755	56	38	30	0.25
10755	57	20	14	0.25
10755	69	36	25	0.25
10756	18	62	21	0.2
10756	36	19	20	0.2
10756	68	12	6	0.2
10756	69	36	20	0.2
10757	34	14	30	0
10757	59	55	7	0
10757	62	49	30	0
10757	64	33	24	0
10758	26	31	20	0
10758	52	7	60	0
10758	70	15	40	0
10759	32	32	10	0
10760	25	14	12	0.25
10760	27	44	40	0
10760	43	46	30	0.25
10761	25	14	35	0.25
10761	75	8	18	0
10762	39	18	16	0
10762	47	10	30	0
10762	51	53	28	0
10762	56	38	60	0
10763	21	10	40	0
10763	22	21	6	0
10763	24	4	20	0
10764	3	10	20	0.1
10764	39	18	130	0.1
10765	65	21	80	0.1
10766	2	19	40	0
10766	7	30	35	0
10766	68	12	40	0
10767	42	14	2	0
10768	22	21	4	0
10768	31	12	50	0
10768	60	34	15	0
10768	71	22	12	0
10769	41	10	30	0.050000001
10769	52	7	15	0.050000001
10769	61	28	20	0
10769	62	49	15	0
10770	11	21	15	0.25
10771	71	22	16	0
10772	29	124	18	0
10772	59	55	25	0
10773	17	39	33	0
10773	31	12	70	0.2
10773	75	8	7	0.2
10774	31	12	2	0.25
10774	66	17	50	0
10775	10	31	6	0
10775	67	14	3	0
10776	31	12	16	0.050000001
10776	42	14	12	0.050000001
10776	45	10	27	0.050000001
10776	51	53	120	0.050000001
10777	42	14	20	0.2
10778	41	10	10	0
10779	16	17	20	0
10779	62	49	20	0
10780	70	15	35	0
10780	77	13	15	0
10781	54	7	3	0.2
10781	56	38	20	0.2
10781	74	10	35	0
10782	31	12	1	0
10783	31	12	10	0
10783	38	264	5	0
10784	36	19	30	0
10784	39	18	2	0.15000001
10784	72	35	30	0.15000001
10785	10	31	10	0
10785	75	8	10	0
10786	8	40	30	0.2
10786	30	26	15	0.2
10786	75	8	42	0.2
10787	2	19	15	0.050000001
10787	29	124	20	0.050000001
10788	19	9	50	0.050000001
10788	75	8	40	0.050000001
10789	18	62	30	0
10789	35	18	15	0
10789	63	44	30	0
10789	68	12	18	0
10790	7	30	3	0.15000001
10790	56	38	20	0.15000001
10791	29	124	14	0.050000001
10791	41	10	20	0.050000001
10792	2	19	10	0
10792	54	7	3	0
10792	68	12	15	0
10793	41	10	14	0
10793	52	7	8	0
10794	14	23	15	0.2
10794	54	7	6	0.2
10795	16	17	65	0
10795	17	39	35	0.25
10796	26	31	21	0.2
10796	44	19	10	0
10796	64	33	35	0.2
10796	69	36	24	0.2
10797	11	21	20	0
10798	62	49	2	0
10798	72	35	10	0
10799	13	6	20	0.15000001
10799	24	4	20	0.15000001
10799	59	55	25	0
10800	11	21	50	0.1
10800	51	53	10	0.1
10800	54	7	7	0.1
10801	17	39	40	0.25
10801	29	124	20	0.25
10802	30	26	25	0.25
10802	51	53	30	0.25
10802	55	24	60	0.25
10802	62	49	5	0.25
10803	19	9	24	0.050000001
10803	25	14	15	0.050000001
10803	59	55	15	0.050000001
10804	10	31	36	0
10804	28	46	24	0
10804	49	20	4	0.15000001
10805	34	14	10	0
10805	38	264	10	0
10806	2	19	20	0.25
10806	65	21	2	0
10806	74	10	15	0.25
10807	40	18	1	0
10808	56	38	20	0.15000001
10808	76	18	50	0.15000001
10809	52	7	20	0
10810	13	6	7	0
10810	25	14	5	0
10810	70	15	5	0
10811	19	9	15	0
10811	23	9	18	0
10811	40	18	30	0
10812	31	12	16	0.1
10812	72	35	40	0.1
10812	77	13	20	0
10813	2	19	12	0.2
10813	46	12	35	0
10814	41	10	20	0
10814	43	46	20	0.15000001
10814	48	13	8	0.15000001
10814	61	28	30	0.15000001
10815	33	2	16	0
10816	38	264	30	0.050000001
10816	62	49	20	0.050000001
10817	26	31	40	0.15000001
10817	38	264	30	0
10817	40	18	60	0.15000001
10817	62	49	25	0.15000001
10818	32	32	20	0
10818	41	10	20	0
10819	43	46	7	0
10819	75	8	20	0
10820	56	38	30	0
10821	35	18	20	0
10821	51	53	6	0
10822	62	49	3	0
10822	70	15	6	0
10823	11	21	20	0.1
10823	57	20	15	0
10823	59	55	40	0.1
10823	77	13	15	0.1
10824	41	10	12	0
10824	70	15	9	0
10825	26	31	12	0
10825	53	33	20	0
10826	31	12	35	0
10826	57	20	15	0
10827	10	31	15	0
10827	39	18	21	0
10828	20	81	5	0
10828	38	264	2	0
10829	2	19	10	0
10829	8	40	20	0
10829	13	6	10	0
10829	60	34	21	0
10830	6	25	6	0
10830	39	18	28	0
10830	60	34	30	0
10830	68	12	24	0
10831	19	9	2	0
10831	35	18	8	0
10831	38	264	8	0
10831	43	46	9	0
10832	13	6	3	0.2
10832	25	14	10	0.2
10832	44	19	16	0.2
10832	64	33	3	0
10833	7	30	20	0.1
10833	31	12	9	0.1
10833	53	33	9	0.1
10834	29	124	8	0.050000001
10834	30	26	20	0.050000001
10835	59	55	15	0
10835	77	13	2	0.2
10836	22	21	52	0
10836	35	18	6	0
10836	57	20	24	0
10836	60	34	60	0
10836	64	33	30	0
10837	13	6	6	0
10837	40	18	25	0
10837	47	10	40	0.25
10837	76	18	21	0.25
10838	1	18	4	0.25
10838	18	62	25	0.25
10838	36	19	50	0.25
10839	58	13	30	0.1
10839	72	35	15	0.1
10840	25	14	6	0.2
10840	39	18	10	0.2
10841	10	31	16	0
10841	56	38	30	0
10841	59	55	50	0
10841	77	13	15	0
10842	11	21	15	0
10842	43	46	5	0
10842	68	12	20	0
10842	70	15	12	0
10843	51	53	4	0.25
10844	22	21	35	0
10845	23	9	70	0.1
10845	35	18	25	0.1
10845	42	14	42	0.1
10845	58	13	60	0.1
10845	64	33	48	0
10846	4	22	21	0
10846	70	15	30	0
10846	74	10	20	0
10847	1	18	80	0.2
10847	19	9	12	0.2
10847	37	26	60	0.2
10847	45	10	36	0.2
10847	60	34	45	0.2
10847	71	22	55	0.2
10848	5	21	30	0
10848	9	97	3	0
10849	3	10	49	0
10849	26	31	18	0.15000001
10850	25	14	20	0.15000001
10850	33	2	4	0.15000001
10850	70	15	30	0.15000001
10851	2	19	5	0.050000001
10851	25	14	10	0.050000001
10851	57	20	10	0.050000001
10851	59	55	42	0.050000001
10852	2	19	15	0
10852	17	39	6	0
10852	62	49	50	0
10853	18	62	10	0
10854	10	31	100	0.15000001
10854	13	6	65	0.15000001
10855	16	17	50	0
10855	31	12	14	0
10855	56	38	24	0
10855	65	21	15	0.15000001
10856	2	19	20	0
10856	42	14	20	0
10857	3	10	30	0
10857	26	31	35	0.25
10857	29	124	10	0.25
10858	7	30	5	0
10858	27	44	10	0
10858	70	15	4	0
10859	24	4	40	0.25
10859	54	7	35	0.25
10859	64	33	30	0.25
10860	51	53	3	0
10860	76	18	20	0
10861	17	39	42	0
10861	18	62	20	0
10861	21	10	40	0
10861	33	2	35	0
10861	62	49	3	0
10862	11	21	25	0
10862	52	7	8	0
10863	1	18	20	0.15000001
10863	58	13	12	0.15000001
10864	35	18	4	0
10864	67	14	15	0
10865	38	264	60	0.050000001
10865	39	18	80	0.050000001
10866	2	19	21	0.25
10866	24	4	6	0.25
10866	30	26	40	0.25
10867	53	33	3	0
10868	26	31	20	0
10868	35	18	30	0
10868	49	20	42	0.1
10869	1	18	40	0
10869	11	21	10	0
10869	23	9	50	0
10869	68	12	20	0
10870	35	18	3	0
10870	51	53	2	0
10871	6	25	50	0.050000001
10871	16	17	12	0.050000001
10871	17	39	16	0.050000001
10872	55	24	10	0.050000001
10872	62	49	20	0.050000001
10872	64	33	15	0.050000001
10872	65	21	21	0.050000001
10873	21	10	20	0
10873	28	46	3	0
10874	10	31	10	0
10875	19	9	25	0
10875	47	10	21	0.1
10875	49	20	15	0
10876	46	12	21	0
10876	64	33	20	0
10877	16	17	30	0.25
10877	18	62	25	0
10878	20	81	20	0.050000001
10879	40	18	12	0
10879	65	21	10	0
10879	76	18	10	0
10880	23	9	30	0.2
10880	61	28	30	0.2
10880	70	15	50	0.2
10881	73	15	10	0
10882	42	14	25	0
10882	49	20	20	0.15000001
10882	54	7	32	0.15000001
10883	24	4	8	0
10884	21	10	40	0.050000001
10884	56	38	21	0.050000001
10884	65	21	12	0.050000001
10885	2	19	20	0
10885	24	4	12	0
10885	70	15	30	0
10885	77	13	25	0
10886	10	31	70	0
10886	31	12	35	0
10886	77	13	40	0
10887	25	14	5	0
10888	2	19	20	0
10888	68	12	18	0
10889	11	21	40	0
10889	38	264	40	0
10890	17	39	15	0
10890	34	14	10	0
10890	41	10	14	0
10891	30	26	15	0.050000001
10892	59	55	40	0.050000001
10893	8	40	30	0
10893	24	4	10	0
10893	29	124	24	0
10893	30	26	35	0
10893	36	19	20	0
10894	13	6	28	0.050000001
10894	69	36	50	0.050000001
10894	75	8	120	0.050000001
10895	24	4	110	0
10895	39	18	45	0
10895	40	18	91	0
10895	60	34	100	0
10896	45	10	15	0
10896	56	38	16	0
10897	29	124	80	0
10897	30	26	36	0
10898	13	6	5	0
10899	39	18	8	0.15000001
10900	70	15	3	0.25
10901	41	10	30	0
10901	71	22	30	0
10902	55	24	30	0.15000001
10902	62	49	6	0.15000001
10903	13	6	40	0
10903	65	21	21	0
10903	68	12	20	0
10904	58	13	15	0
10904	62	49	35	0
10905	1	18	20	0.050000001
10906	61	28	15	0
10907	75	8	14	0
10908	7	30	20	0.050000001
10908	52	7	14	0.050000001
10909	7	30	12	0
10909	16	17	15	0
10909	41	10	5	0
10910	19	9	12	0
10910	49	20	10	0
10910	61	28	5	0
10911	1	18	10	0
10911	17	39	12	0
10911	67	14	15	0
10912	11	21	40	0.25
10912	29	124	60	0.25
10913	4	22	30	0.25
10913	33	2	40	0.25
10913	58	13	15	0
10914	71	22	25	0
10915	17	39	10	0
10915	33	2	30	0
10915	54	7	10	0
10916	16	17	6	0
10916	32	32	6	0
10916	57	20	20	0
10917	30	26	1	0
10917	60	34	10	0
10918	1	18	60	0.25
10918	60	34	25	0.25
10919	16	17	24	0
10919	25	14	24	0
10919	40	18	20	0
10920	50	16	24	0
10921	35	18	10	0
10921	63	44	40	0
10922	17	39	15	0
10922	24	4	35	0
10923	42	14	10	0.2
10923	43	46	10	0.2
10923	67	14	24	0.2
10924	10	31	20	0.1
10924	28	46	30	0.1
10924	75	8	6	0
10925	36	19	25	0.15000001
10925	52	7	12	0.15000001
10926	11	21	2	0
10926	13	6	10	0
10926	19	9	7	0
10926	72	35	10	0
10927	20	81	5	0
10927	52	7	5	0
10927	76	18	20	0
10928	47	10	5	0
10928	76	18	5	0
10929	21	10	60	0
10929	75	8	49	0
10929	77	13	15	0
10930	21	10	36	0
10930	27	44	25	0
10930	55	24	25	0.2
10930	58	13	30	0.2
10931	13	6	42	0.15000001
10931	57	20	30	0
10932	16	17	30	0.1
10932	62	49	14	0.1
10932	72	35	16	0
10932	75	8	20	0.1
10933	53	33	2	0
10933	61	28	30	0
10934	6	25	20	0
10935	1	18	21	0
10935	18	62	4	0.25
10935	23	9	8	0.25
10936	36	19	30	0.2
10937	28	46	8	0
10937	34	14	20	0
10938	13	6	20	0.25
10938	43	46	24	0.25
10938	60	34	49	0.25
10938	71	22	35	0.25
10939	2	19	10	0.15000001
10939	67	14	40	0.15000001
10940	7	30	8	0
10940	13	6	20	0
10941	31	12	44	0.25
10941	62	49	30	0.25
10941	68	12	80	0.25
10941	72	35	50	0
10942	49	20	28	0
10943	13	6	15	0
10943	22	21	21	0
10943	46	12	15	0
10944	11	21	5	0.25
10944	44	19	18	0.25
10944	56	38	18	0
10945	13	6	20	0
10945	31	12	10	0
10946	10	31	25	0
10946	24	4	25	0
10946	77	13	40	0
10947	59	55	4	0
10948	50	16	9	0
10948	51	53	40	0
10948	55	24	4	0
10949	6	25	12	0
10949	10	31	30	0
10949	17	39	6	0
10949	62	49	60	0
10950	4	22	5	0
10951	33	2	15	0.050000001
10951	41	10	6	0.050000001
10951	75	8	50	0.050000001
10952	6	25	16	0.050000001
10952	28	46	2	0
10953	20	81	50	0.050000001
10953	31	12	50	0.050000001
10954	16	17	28	0.15000001
10954	31	12	25	0.15000001
10954	45	10	30	0
10954	60	34	24	0.15000001
10955	75	8	12	0.2
10956	21	10	12	0
10956	47	10	14	0
10956	51	53	8	0
10957	30	26	30	0
10957	35	18	40	0
10957	64	33	8	0
10958	5	21	20	0
10958	7	30	6	0
10958	72	35	5	0
10959	75	8	20	0.15000001
10960	24	4	10	0.25
10960	41	10	24	0
10961	52	7	6	0.050000001
10961	76	18	60	0
10962	7	30	45	0
10962	13	6	77	0
10962	53	33	20	0
10962	69	36	9	0
10962	76	18	44	0
10963	60	34	2	0.15000001
10964	18	62	6	0
10964	38	264	5	0
10964	69	36	10	0
10965	51	53	16	0
10966	37	26	8	0
10966	56	38	12	0.15000001
10966	62	49	12	0.15000001
10967	19	9	12	0
10967	49	20	40	0
10968	12	38	30	0
10968	24	4	30	0
10968	64	33	4	0
10969	46	12	9	0
10970	52	7	40	0.2
10971	29	124	14	0
10972	17	39	6	0
10972	33	2	7	0
10973	26	31	5	0
10973	41	10	6	0
10973	75	8	10	0
10974	63	44	10	0
10975	8	40	16	0
10975	75	8	10	0
10976	28	46	20	0
10977	39	18	30	0
10977	47	10	30	0
10977	51	53	10	0
10977	63	44	20	0
10978	8	40	20	0.15000001
10978	21	10	40	0.15000001
10978	40	18	10	0
10978	44	19	6	0.15000001
10979	7	30	18	0
10979	12	38	20	0
10979	24	4	80	0
10979	27	44	30	0
10979	31	12	24	0
10979	63	44	35	0
10980	75	8	40	0.2
10981	38	264	60	0
10982	7	30	20	0
10982	43	46	9	0
10983	13	6	84	0.15000001
10983	57	20	15	0
10984	16	17	55	0
10984	24	4	20	0
10984	36	19	40	0
10985	16	17	36	0.1
10985	18	62	8	0.1
10985	32	32	35	0.1
10986	11	21	30	0
10986	20	81	15	0
10986	76	18	10	0
10986	77	13	15	0
10987	7	30	60	0
10987	43	46	6	0
10987	72	35	20	0
10988	7	30	60	0
10988	62	49	40	0.1
10989	6	25	40	0
10989	11	21	15	0
10989	41	10	4	0
10990	21	10	65	0
10990	34	14	60	0.15000001
10990	55	24	65	0.15000001
10990	61	28	66	0.15000001
10991	2	19	50	0.2
10991	70	15	20	0.2
10991	76	18	90	0.2
10992	72	35	2	0
10993	29	124	50	0.25
10993	41	10	35	0.25
10994	59	55	18	0.050000001
10995	51	53	20	0
10995	60	34	4	0
10996	42	14	40	0
10997	32	32	50	0
10997	46	12	20	0.25
10997	52	7	20	0.25
10998	24	4	12	0
10998	61	28	7	0
10998	74	10	20	0
10998	75	8	30	0
10999	41	10	20	0.050000001
10999	51	53	15	0.050000001
10999	77	13	21	0.050000001
11000	4	22	25	0.25
11000	24	4	30	0.25
11000	77	13	30	0
11001	7	30	60	0
11001	22	21	25	0
11001	46	12	25	0
11001	55	24	6	0
11002	13	6	56	0
11002	35	18	15	0.15000001
11002	42	14	24	0.15000001
11002	55	24	40	0
11003	1	18	4	0
11003	40	18	10	0
11003	52	7	10	0
11004	26	31	6	0
11004	76	18	6	0
11005	1	18	2	0
11005	59	55	10	0
11006	1	18	8	0
11006	29	124	2	0.25
11007	8	40	30	0
11007	29	124	10	0
11007	42	14	14	0
11008	28	46	70	0.050000001
11008	34	14	90	0.050000001
11008	71	22	21	0
11009	24	4	12	0
11009	36	19	18	0.25
11009	60	34	9	0
11010	7	30	20	0
11010	24	4	10	0
11011	58	13	40	0.050000001
11011	71	22	20	0
11012	19	9	50	0.050000001
11012	60	34	36	0.050000001
11012	71	22	60	0.050000001
11013	23	9	10	0
11013	42	14	4	0
11013	45	10	20	0
11013	68	12	2	0
11014	41	10	28	0.1
11015	30	26	15	0
11015	77	13	18	0
11016	31	12	15	0
11016	36	19	16	0
11017	3	10	25	0
11017	59	55	110	0
11017	70	15	30	0
11018	12	38	20	0
11018	18	62	10	0
11018	56	38	5	0
11019	46	12	3	0
11019	49	20	2	0
11020	10	31	24	0.15000001
11021	2	19	11	0.25
11021	20	81	15	0
11021	26	31	63	0
11021	51	53	44	0.25
11021	72	35	35	0
11022	19	9	35	0
11022	69	36	30	0
11023	7	30	4	0
11023	43	46	30	0
11024	26	31	12	0
11024	33	2	30	0
11024	65	21	21	0
11024	71	22	50	0
11025	1	18	10	0.1
11025	13	6	20	0.1
11026	18	62	8	0
11026	51	53	10	0
11027	24	4	30	0.25
11027	62	49	21	0.25
11028	55	24	35	0
11028	59	55	24	0
11029	56	38	20	0
11029	63	44	12	0
11030	2	19	100	0.25
11030	5	21	70	0
11030	29	124	60	0.25
11030	59	55	100	0.25
11031	1	18	45	0
11031	13	6	80	0
11031	24	4	21	0
11031	64	33	20	0
11031	71	22	16	0
11032	36	19	35	0
11032	38	264	25	0
11032	59	55	30	0
11033	53	33	70	0.1
11033	69	36	36	0.1
11034	21	10	15	0.1
11034	44	19	12	0
11034	61	28	6	0
11035	1	18	10	0
11035	35	18	60	0
11035	42	14	30	0
11035	54	7	10	0
11036	13	6	7	0
11036	59	55	30	0
11037	70	15	4	0
11038	40	18	5	0.2
11038	52	7	2	0
11038	71	22	30	0
11039	28	46	20	0
11039	35	18	24	0
11039	49	20	60	0
11039	57	20	28	0
11040	21	10	20	0
11041	2	19	30	0.2
11041	63	44	30	0
11042	44	19	15	0
11042	61	28	4	0
11043	11	21	10	0
11044	62	49	12	0
11045	33	2	15	0
11045	51	53	24	0
11046	12	38	20	0.050000001
11046	32	32	15	0.050000001
11046	35	18	18	0.050000001
11047	1	18	25	0.25
11047	5	21	30	0.25
11048	68	12	42	0
11049	2	19	10	0.2
11049	12	38	4	0.2
11050	76	18	50	0.1
11051	24	4	10	0.2
11052	43	46	30	0.2
11052	61	28	10	0.2
11053	18	62	35	0.2
11053	32	32	20	0
11053	64	33	25	0.2
11054	33	2	10	0
11054	67	14	20	0
11055	24	4	15	0
11055	25	14	15	0
11055	51	53	20	0
11055	57	20	20	0
11056	7	30	40	0
11056	55	24	35	0
11056	60	34	50	0
11057	70	15	3	0
11058	21	10	3	0
11058	60	34	21	0
11058	61	28	4	0
11059	13	6	30	0
11059	17	39	12	0
11059	60	34	35	0
11060	60	34	4	0
11060	77	13	10	0
11061	60	34	15	0
11062	53	33	10	0.2
11062	70	15	12	0.2
11063	34	14	30	0
11063	40	18	40	0.1
11063	41	10	30	0.1
11064	17	39	77	0.1
11064	41	10	12	0
11064	53	33	25	0.1
11064	55	24	4	0.1
11064	68	12	55	0
11065	30	26	4	0.25
11065	54	7	20	0.25
11066	16	17	3	0
11066	19	9	42	0
11066	34	14	35	0
11067	41	10	9	0
11068	28	46	8	0.15000001
11068	43	46	36	0.15000001
11068	77	13	28	0.15000001
11069	39	18	20	0
11070	1	18	40	0.15000001
11070	2	19	20	0.15000001
11070	16	17	30	0.15000001
11070	31	12	20	0
11071	7	30	15	0.050000001
11071	13	6	10	0.050000001
11072	2	19	8	0
11072	41	10	40	0
11072	50	16	22	0
11072	64	33	130	0
11073	11	21	10	0
11073	24	4	20	0
11074	16	17	14	0.050000001
11075	2	19	10	0.15000001
11075	46	12	30	0.15000001
11075	76	18	2	0.15000001
11076	6	25	20	0.25
11076	14	23	20	0.25
11076	19	9	10	0.25
11077	2	19	24	0.2
11077	3	10	4	0
11077	4	22	1	0
11077	6	25	1	0.02
11077	7	30	1	0.050000001
11077	8	40	2	0.1
11077	10	31	1	0
11077	12	38	2	0.050000001
11077	13	6	4	0
11077	14	23	1	0.029999999
11077	16	17	2	0.029999999
11077	20	81	1	0.039999999
11077	23	9	2	0
11077	32	32	1	0
11077	39	18	2	0.050000001
11077	41	10	3	0
11077	46	12	3	0.02
11077	52	7	2	0
11077	55	24	2	0
11077	60	34	2	0.059999999
11077	64	33	2	0.029999999
11077	66	17	1	0
11077	73	15	2	0.0099999998
11077	75	8	4	0
11077	77	13	2	0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) FROM stdin;
10248	WILMK	5	1996-07-04 	1996-08-01 	1996-07-16 	3	32	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10249	TRADH	6	1996-07-05 	1996-08-16 	1996-07-10 	1	12	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10250	HANAR	4	1996-07-08 	1996-08-05 	1996-07-12 	2	66	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10251	VICTE	3	1996-07-08 	1996-08-05 	1996-07-15 	1	41	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10252	SUPRD	4	1996-07-09 	1996-08-06 	1996-07-11 	2	51	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10253	HANAR	3	1996-07-10 	1996-07-24 	1996-07-16 	2	58	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10254	CHOPS	5	1996-07-11 	1996-08-08 	1996-07-23 	2	23	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10255	RICSU	9	1996-07-12 	1996-08-09 	1996-07-15 	3	148	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10256	WELLI	3	1996-07-15 	1996-08-12 	1996-07-17 	2	14	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10257	HILAA	4	1996-07-16 	1996-08-13 	1996-07-22 	3	82	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10258	ERNSH	1	1996-07-17 	1996-08-14 	1996-07-23 	1	141	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10259	CENTC	4	1996-07-18 	1996-08-15 	1996-07-25 	3	3	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	\N	05022	Mexico
10260	OLDWO	4	1996-07-19 	1996-08-16 	1996-07-29 	1	55	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10261	QUEDE	4	1996-07-19 	1996-08-16 	1996-07-30 	2	3	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10262	RATTC	8	1996-07-22 	1996-08-19 	1996-07-25 	3	48	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10263	ERNSH	9	1996-07-23 	1996-08-20 	1996-07-31 	3	146	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10264	FOLKO	6	1996-07-24 	1996-08-21 	1996-08-23 	3	4	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10265	BLONP	2	1996-07-25 	1996-08-22 	1996-08-12 	1	55	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10266	WARTH	3	1996-07-26 	1996-09-06 	1996-07-31 	3	26	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10267	FRANK	4	1996-07-29 	1996-08-26 	1996-08-06 	1	209	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10268	GROSR	8	1996-07-30 	1996-08-27 	1996-08-02 	3	66	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10269	WHITC	5	1996-07-31 	1996-08-14 	1996-08-09 	1	5	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10270	WARTH	1	1996-08-01 	1996-08-29 	1996-08-02 	1	137	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10271	SPLIR	6	1996-08-01 	1996-08-29 	1996-08-30 	2	5	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10272	RATTC	6	1996-08-02 	1996-08-30 	1996-08-06 	2	98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10273	QUICK	3	1996-08-05 	1996-09-02 	1996-08-12 	3	76	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10274	VINET	6	1996-08-06 	1996-09-03 	1996-08-16 	1	6	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10275	MAGAA	1	1996-08-07 	1996-09-04 	1996-08-09 	1	27	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10276	TORTU	8	1996-08-08 	1996-08-22 	1996-08-14 	3	14	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10277	MORGK	2	1996-08-09 	1996-09-06 	1996-08-13 	3	126	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10278	BERGS	8	1996-08-12 	1996-09-09 	1996-08-16 	2	93	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10279	LEHMS	8	1996-08-13 	1996-09-10 	1996-08-16 	2	26	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10280	BERGS	2	1996-08-14 	1996-09-11 	1996-09-12 	1	9	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10281	ROMEY	4	1996-08-14 	1996-08-28 	1996-08-21 	1	3	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10282	ROMEY	4	1996-08-15 	1996-09-12 	1996-08-21 	1	13	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10283	LILAS	3	1996-08-16 	1996-09-13 	1996-08-23 	3	85	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10284	LEHMS	4	1996-08-19 	1996-09-16 	1996-08-27 	1	77	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10285	QUICK	1	1996-08-20 	1996-09-17 	1996-08-26 	2	77	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10286	QUICK	8	1996-08-21 	1996-09-18 	1996-08-30 	3	229	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10287	RICAR	8	1996-08-22 	1996-09-19 	1996-08-28 	3	13	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10288	REGGC	4	1996-08-23 	1996-09-20 	1996-09-03 	1	7	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10289	BSBEV	7	1996-08-26 	1996-09-23 	1996-08-28 	3	23	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10290	COMMI	8	1996-08-27 	1996-09-24 	1996-09-03 	1	80	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brazil
10291	QUEDE	6	1996-08-27 	1996-09-24 	1996-09-04 	2	6	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10292	TRADH	1	1996-08-28 	1996-09-25 	1996-09-02 	2	1	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10293	TORTU	1	1996-08-29 	1996-09-26 	1996-09-11 	3	21	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10294	RATTC	4	1996-08-30 	1996-09-27 	1996-09-05 	2	147	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10295	VINET	2	1996-09-02 	1996-09-30 	1996-09-10 	2	1	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10296	LILAS	6	1996-09-03 	1996-10-01 	1996-09-11 	1	0	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10297	BLONP	5	1996-09-04 	1996-10-16 	1996-09-10 	2	6	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10298	HUNGO	6	1996-09-05 	1996-10-03 	1996-09-11 	2	168	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10299	RICAR	4	1996-09-06 	1996-10-04 	1996-09-13 	2	30	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10300	MAGAA	2	1996-09-09 	1996-10-07 	1996-09-18 	2	18	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10301	WANDK	8	1996-09-09 	1996-10-07 	1996-09-17 	2	45	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10302	SUPRD	4	1996-09-10 	1996-10-08 	1996-10-09 	2	6	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10303	GODOS	7	1996-09-11 	1996-10-09 	1996-09-18 	2	108	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10304	TORTU	1	1996-09-12 	1996-10-10 	1996-09-17 	2	64	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10305	OLDWO	8	1996-09-13 	1996-10-11 	1996-10-09 	3	258	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10306	ROMEY	1	1996-09-16 	1996-10-14 	1996-09-23 	3	8	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10307	LONEP	2	1996-09-17 	1996-10-15 	1996-09-25 	2	1	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10308	ANATR	7	1996-09-18 	1996-10-16 	1996-09-24 	3	2	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10309	HUNGO	3	1996-09-19 	1996-10-17 	1996-10-23 	1	47	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10310	THEBI	8	1996-09-20 	1996-10-18 	1996-09-27 	2	18	The Big Cheese	89 Jefferson Way\nSuite 2	Portland	OR	97201	USA
10311	DUMON	1	1996-09-20 	1996-10-04 	1996-09-26 	3	25	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10312	WANDK	2	1996-09-23 	1996-10-21 	1996-10-03 	2	40	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10313	QUICK	2	1996-09-24 	1996-10-22 	1996-10-04 	2	2	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10314	RATTC	1	1996-09-25 	1996-10-23 	1996-10-04 	2	74	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10315	ISLAT	4	1996-09-26 	1996-10-24 	1996-10-03 	2	42	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10316	RATTC	1	1996-09-27 	1996-10-25 	1996-10-08 	3	150	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10317	LONEP	6	1996-09-30 	1996-10-28 	1996-10-10 	1	13	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10318	ISLAT	8	1996-10-01 	1996-10-29 	1996-10-04 	2	5	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10319	TORTU	7	1996-10-02 	1996-10-30 	1996-10-11 	3	64	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10320	WARTH	5	1996-10-03 	1996-10-17 	1996-10-18 	3	35	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10321	ISLAT	3	1996-10-03 	1996-10-31 	1996-10-11 	2	3	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10322	PERIC	7	1996-10-04 	1996-11-01 	1996-10-23 	3	0	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10323	KOENE	4	1996-10-07 	1996-11-04 	1996-10-14 	1	5	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10324	SAVEA	9	1996-10-08 	1996-11-05 	1996-10-10 	1	214	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10325	KOENE	1	1996-10-09 	1996-10-23 	1996-10-14 	3	65	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10326	BOLID	4	1996-10-10 	1996-11-07 	1996-10-14 	2	78	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10327	FOLKO	2	1996-10-11 	1996-11-08 	1996-10-14 	1	63	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10328	FURIB	4	1996-10-14 	1996-11-11 	1996-10-17 	3	87	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10329	SPLIR	4	1996-10-15 	1996-11-26 	1996-10-23 	2	192	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10330	LILAS	3	1996-10-16 	1996-11-13 	1996-10-28 	1	13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10331	BONAP	9	1996-10-16 	1996-11-27 	1996-10-21 	1	10	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10332	MEREP	3	1996-10-17 	1996-11-28 	1996-10-21 	2	53	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10333	WARTH	5	1996-10-18 	1996-11-15 	1996-10-25 	3	1	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10334	VICTE	8	1996-10-21 	1996-11-18 	1996-10-28 	2	9	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10335	HUNGO	7	1996-10-22 	1996-11-19 	1996-10-24 	2	42	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10336	PRINI	7	1996-10-23 	1996-11-20 	1996-10-25 	2	16	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10337	FRANK	4	1996-10-24 	1996-11-21 	1996-10-29 	3	108	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10338	OLDWO	4	1996-10-25 	1996-11-22 	1996-10-29 	3	84	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10339	MEREP	2	1996-10-28 	1996-11-25 	1996-11-04 	2	16	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10340	BONAP	1	1996-10-29 	1996-11-26 	1996-11-08 	3	166	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10341	SIMOB	7	1996-10-29 	1996-11-26 	1996-11-05 	3	27	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10342	FRANK	4	1996-10-30 	1996-11-13 	1996-11-04 	2	55	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10343	LEHMS	4	1996-10-31 	1996-11-28 	1996-11-06 	1	110	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10344	WHITC	4	1996-11-01 	1996-11-29 	1996-11-05 	2	23	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10345	QUICK	2	1996-11-04 	1996-12-02 	1996-11-11 	2	249	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10346	RATTC	3	1996-11-05 	1996-12-17 	1996-11-08 	3	142	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10347	FAMIA	4	1996-11-06 	1996-12-04 	1996-11-08 	3	3	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10348	WANDK	4	1996-11-07 	1996-12-05 	1996-11-15 	2	1	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10349	SPLIR	7	1996-11-08 	1996-12-06 	1996-11-15 	1	9	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10350	LAMAI	6	1996-11-11 	1996-12-09 	1996-12-03 	2	64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10351	ERNSH	1	1996-11-11 	1996-12-09 	1996-11-20 	1	162	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10352	FURIB	3	1996-11-12 	1996-11-26 	1996-11-18 	3	1	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10353	PICCO	7	1996-11-13 	1996-12-11 	1996-11-25 	3	361	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10354	PERIC	8	1996-11-14 	1996-12-12 	1996-11-20 	3	54	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10355	AROUT	6	1996-11-15 	1996-12-13 	1996-11-20 	1	42	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10356	WANDK	6	1996-11-18 	1996-12-16 	1996-11-27 	2	37	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10357	LILAS	1	1996-11-19 	1996-12-17 	1996-12-02 	3	35	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10358	LAMAI	5	1996-11-20 	1996-12-18 	1996-11-27 	1	20	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10359	SEVES	5	1996-11-21 	1996-12-19 	1996-11-26 	3	288	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10360	BLONP	4	1996-11-22 	1996-12-20 	1996-12-02 	3	132	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10361	QUICK	1	1996-11-22 	1996-12-20 	1996-12-03 	2	183	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10362	BONAP	3	1996-11-25 	1996-12-23 	1996-11-28 	1	96	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10363	DRACD	4	1996-11-26 	1996-12-24 	1996-12-04 	3	31	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10364	EASTC	1	1996-11-26 	1997-01-07 	1996-12-04 	1	72	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10365	ANTON	3	1996-11-27 	1996-12-25 	1996-12-02 	2	22	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10366	GALED	8	1996-11-28 	1997-01-09 	1996-12-30 	2	10	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10367	VAFFE	7	1996-11-28 	1996-12-26 	1996-12-02 	3	14	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10368	ERNSH	2	1996-11-29 	1996-12-27 	1996-12-02 	2	102	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10369	SPLIR	8	1996-12-02 	1996-12-30 	1996-12-09 	2	196	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10370	CHOPS	6	1996-12-03 	1996-12-31 	1996-12-27 	2	1	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10371	LAMAI	1	1996-12-03 	1996-12-31 	1996-12-24 	1	0	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10372	QUEEN	5	1996-12-04 	1997-01-01 	1996-12-09 	2	891	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10373	HUNGO	4	1996-12-05 	1997-01-02 	1996-12-11 	3	124	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10374	WOLZA	1	1996-12-05 	1997-01-02 	1996-12-09 	3	4	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10375	HUNGC	3	1996-12-06 	1997-01-03 	1996-12-09 	2	20	Hungry Coyote Import Store	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA
10376	MEREP	1	1996-12-09 	1997-01-06 	1996-12-13 	2	20	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10377	SEVES	1	1996-12-09 	1997-01-06 	1996-12-13 	3	22	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10378	FOLKO	5	1996-12-10 	1997-01-07 	1996-12-19 	3	5	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10379	QUEDE	2	1996-12-11 	1997-01-08 	1996-12-13 	1	45	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10380	HUNGO	8	1996-12-12 	1997-01-09 	1997-01-16 	3	35	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10381	LILAS	3	1996-12-12 	1997-01-09 	1996-12-13 	3	8	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10382	ERNSH	4	1996-12-13 	1997-01-10 	1996-12-16 	1	95	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10383	AROUT	8	1996-12-16 	1997-01-13 	1996-12-18 	3	34	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10384	BERGS	3	1996-12-16 	1997-01-13 	1996-12-20 	3	169	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10385	SPLIR	1	1996-12-17 	1997-01-14 	1996-12-23 	2	31	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10386	FAMIA	9	1996-12-18 	1997-01-01 	1996-12-25 	3	14	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10387	SANTG	1	1996-12-18 	1997-01-15 	1996-12-20 	2	94	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10388	SEVES	2	1996-12-19 	1997-01-16 	1996-12-20 	1	35	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10389	BOTTM	4	1996-12-20 	1997-01-17 	1996-12-24 	2	47	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10390	ERNSH	6	1996-12-23 	1997-01-20 	1996-12-26 	1	126	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10391	DRACD	3	1996-12-23 	1997-01-20 	1996-12-31 	3	5	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10392	PICCO	2	1996-12-24 	1997-01-21 	1997-01-01 	3	122	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10393	SAVEA	1	1996-12-25 	1997-01-22 	1997-01-03 	3	127	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10394	HUNGC	1	1996-12-25 	1997-01-22 	1997-01-03 	3	30	Hungry Coyote Import Store	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA
10395	HILAA	6	1996-12-26 	1997-01-23 	1997-01-03 	1	184	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10396	FRANK	1	1996-12-27 	1997-01-10 	1997-01-06 	3	135	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10397	PRINI	5	1996-12-27 	1997-01-24 	1997-01-02 	1	60	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10398	SAVEA	2	1996-12-30 	1997-01-27 	1997-01-09 	3	89	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10399	VAFFE	8	1996-12-31 	1997-01-14 	1997-01-08 	3	27	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10400	EASTC	1	1997-01-01 	1997-01-29 	1997-01-16 	3	84	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10401	RATTC	1	1997-01-01 	1997-01-29 	1997-01-10 	1	13	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10402	ERNSH	8	1997-01-02 	1997-02-13 	1997-01-10 	2	68	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10403	ERNSH	4	1997-01-03 	1997-01-31 	1997-01-09 	3	74	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10404	MAGAA	2	1997-01-03 	1997-01-31 	1997-01-08 	1	156	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10405	LINOD	1	1997-01-06 	1997-02-03 	1997-01-22 	1	35	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10406	QUEEN	7	1997-01-07 	1997-02-18 	1997-01-13 	1	108	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10407	OTTIK	2	1997-01-07 	1997-02-04 	1997-01-30 	2	91	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10408	FOLIG	8	1997-01-08 	1997-02-05 	1997-01-14 	1	11	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10409	OCEAN	3	1997-01-09 	1997-02-06 	1997-01-14 	1	30	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina
10410	BOTTM	3	1997-01-10 	1997-02-07 	1997-01-15 	3	2	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10411	BOTTM	9	1997-01-10 	1997-02-07 	1997-01-21 	3	24	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10412	WARTH	8	1997-01-13 	1997-02-10 	1997-01-15 	2	4	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10413	LAMAI	3	1997-01-14 	1997-02-11 	1997-01-16 	2	96	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10414	FAMIA	2	1997-01-14 	1997-02-11 	1997-01-17 	3	21	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10415	HUNGC	3	1997-01-15 	1997-02-12 	1997-01-24 	1	0	Hungry Coyote Import Store	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA
10416	WARTH	8	1997-01-16 	1997-02-13 	1997-01-27 	3	23	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10417	SIMOB	4	1997-01-16 	1997-02-13 	1997-01-28 	3	70	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10418	QUICK	4	1997-01-17 	1997-02-14 	1997-01-24 	1	18	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10419	RICSU	4	1997-01-20 	1997-02-17 	1997-01-30 	2	137	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10420	WELLI	3	1997-01-21 	1997-02-18 	1997-01-27 	1	44	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10421	QUEDE	8	1997-01-21 	1997-03-04 	1997-01-27 	1	99	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10422	FRANS	2	1997-01-22 	1997-02-19 	1997-01-31 	1	3	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10423	GOURL	6	1997-01-23 	1997-02-06 	1997-02-24 	3	24	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10424	MEREP	7	1997-01-23 	1997-02-20 	1997-01-27 	2	371	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10425	LAMAI	6	1997-01-24 	1997-02-21 	1997-02-14 	2	8	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10426	GALED	4	1997-01-27 	1997-02-24 	1997-02-06 	1	19	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10427	PICCO	4	1997-01-27 	1997-02-24 	1997-03-03 	2	31	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10428	REGGC	7	1997-01-28 	1997-02-25 	1997-02-04 	1	11	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10429	HUNGO	3	1997-01-29 	1997-03-12 	1997-02-07 	2	57	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10430	ERNSH	4	1997-01-30 	1997-02-13 	1997-02-03 	1	459	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10431	BOTTM	4	1997-01-30 	1997-02-13 	1997-02-07 	2	44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10432	SPLIR	3	1997-01-31 	1997-02-14 	1997-02-07 	2	4	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10433	PRINI	3	1997-02-03 	1997-03-03 	1997-03-04 	3	74	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10434	FOLKO	3	1997-02-03 	1997-03-03 	1997-02-13 	2	18	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10435	CONSH	8	1997-02-04 	1997-03-18 	1997-02-07 	2	9	Consolidated Holdings	Berkeley Gardens\n12  Brewery 	London	\N	WX1 6LT	UK
10436	BLONP	3	1997-02-05 	1997-03-05 	1997-02-11 	2	157	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10437	WARTH	8	1997-02-05 	1997-03-05 	1997-02-12 	1	20	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10438	TOMSP	3	1997-02-06 	1997-03-06 	1997-02-14 	2	8	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10439	MEREP	6	1997-02-07 	1997-03-07 	1997-02-10 	3	4	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10440	SAVEA	4	1997-02-10 	1997-03-10 	1997-02-28 	2	87	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10441	OLDWO	3	1997-02-10 	1997-03-24 	1997-03-14 	2	73	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10442	ERNSH	3	1997-02-11 	1997-03-11 	1997-02-18 	2	48	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10443	REGGC	8	1997-02-12 	1997-03-12 	1997-02-14 	1	14	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10444	BERGS	3	1997-02-12 	1997-03-12 	1997-02-21 	3	4	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10445	BERGS	3	1997-02-13 	1997-03-13 	1997-02-20 	1	9	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10446	TOMSP	6	1997-02-14 	1997-03-14 	1997-02-19 	1	15	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10447	RICAR	4	1997-02-14 	1997-03-14 	1997-03-07 	2	69	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10448	RANCH	4	1997-02-17 	1997-03-17 	1997-02-24 	2	39	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10449	BLONP	3	1997-02-18 	1997-03-18 	1997-02-27 	2	53	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10450	VICTE	8	1997-02-19 	1997-03-19 	1997-03-11 	2	7	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10451	QUICK	4	1997-02-19 	1997-03-05 	1997-03-12 	3	189	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10452	SAVEA	8	1997-02-20 	1997-03-20 	1997-02-26 	1	140	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10453	AROUT	1	1997-02-21 	1997-03-21 	1997-02-26 	2	25	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10454	LAMAI	4	1997-02-21 	1997-03-21 	1997-02-25 	3	3	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10455	WARTH	8	1997-02-24 	1997-04-07 	1997-03-03 	2	180	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10456	KOENE	8	1997-02-25 	1997-04-08 	1997-02-28 	2	8	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10457	KOENE	2	1997-02-25 	1997-03-25 	1997-03-03 	1	12	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10458	SUPRD	7	1997-02-26 	1997-03-26 	1997-03-04 	3	147	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10459	VICTE	4	1997-02-27 	1997-03-27 	1997-02-28 	2	25	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10460	FOLKO	8	1997-02-28 	1997-03-28 	1997-03-03 	1	16	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10461	LILAS	1	1997-02-28 	1997-03-28 	1997-03-05 	3	149	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10462	CONSH	2	1997-03-03 	1997-03-31 	1997-03-18 	1	6	Consolidated Holdings	Berkeley Gardens\n12  Brewery 	London	\N	WX1 6LT	UK
10463	SUPRD	5	1997-03-04 	1997-04-01 	1997-03-06 	3	15	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10464	FURIB	4	1997-03-04 	1997-04-01 	1997-03-14 	2	89	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10465	VAFFE	1	1997-03-05 	1997-04-02 	1997-03-14 	3	145	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10466	COMMI	4	1997-03-06 	1997-04-03 	1997-03-13 	1	12	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brazil
10467	MAGAA	8	1997-03-06 	1997-04-03 	1997-03-11 	2	5	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10468	KOENE	3	1997-03-07 	1997-04-04 	1997-03-12 	3	44	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10469	WHITC	1	1997-03-10 	1997-04-07 	1997-03-14 	1	60	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10470	BONAP	4	1997-03-11 	1997-04-08 	1997-03-14 	2	65	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10471	BSBEV	2	1997-03-11 	1997-04-08 	1997-03-18 	3	46	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10472	SEVES	8	1997-03-12 	1997-04-09 	1997-03-19 	1	4	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10473	ISLAT	1	1997-03-13 	1997-03-27 	1997-03-21 	3	16	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10474	PERIC	5	1997-03-13 	1997-04-10 	1997-03-21 	2	83	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10475	SUPRD	9	1997-03-14 	1997-04-11 	1997-04-04 	1	69	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10476	HILAA	8	1997-03-17 	1997-04-14 	1997-03-24 	3	4	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10477	PRINI	5	1997-03-17 	1997-04-14 	1997-03-25 	2	13	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10478	VICTE	2	1997-03-18 	1997-04-01 	1997-03-26 	3	5	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10479	RATTC	3	1997-03-19 	1997-04-16 	1997-03-21 	3	709	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10480	FOLIG	6	1997-03-20 	1997-04-17 	1997-03-24 	2	1	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10481	RICAR	8	1997-03-20 	1997-04-17 	1997-03-25 	2	64	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10482	LAZYK	1	1997-03-21 	1997-04-18 	1997-04-10 	3	7	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10483	WHITC	7	1997-03-24 	1997-04-21 	1997-04-25 	2	15	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10484	BSBEV	3	1997-03-24 	1997-04-21 	1997-04-01 	3	7	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10485	LINOD	4	1997-03-25 	1997-04-08 	1997-03-31 	2	64	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10486	HILAA	1	1997-03-26 	1997-04-23 	1997-04-02 	2	31	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10487	QUEEN	2	1997-03-26 	1997-04-23 	1997-03-28 	2	71	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10488	FRANK	8	1997-03-27 	1997-04-24 	1997-04-02 	2	5	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10489	PICCO	6	1997-03-28 	1997-04-25 	1997-04-09 	2	5	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10490	HILAA	7	1997-03-31 	1997-04-28 	1997-04-03 	2	210	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10491	FURIB	8	1997-03-31 	1997-04-28 	1997-04-08 	3	17	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10492	BOTTM	3	1997-04-01 	1997-04-29 	1997-04-11 	1	63	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10493	LAMAI	4	1997-04-02 	1997-04-30 	1997-04-10 	3	11	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10494	COMMI	4	1997-04-02 	1997-04-30 	1997-04-09 	2	66	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brazil
10495	LAUGB	3	1997-04-03 	1997-05-01 	1997-04-11 	3	5	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10496	TRADH	7	1997-04-04 	1997-05-02 	1997-04-07 	2	47	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10497	LEHMS	7	1997-04-04 	1997-05-02 	1997-04-07 	1	36	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10498	HILAA	8	1997-04-07 	1997-05-05 	1997-04-11 	2	30	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10499	LILAS	4	1997-04-08 	1997-05-06 	1997-04-16 	2	102	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10500	LAMAI	6	1997-04-09 	1997-05-07 	1997-04-17 	1	43	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10501	BLAUS	9	1997-04-09 	1997-05-07 	1997-04-16 	3	9	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10502	PERIC	2	1997-04-10 	1997-05-08 	1997-04-29 	1	69	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10503	HUNGO	6	1997-04-11 	1997-05-09 	1997-04-16 	2	17	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10504	WHITC	4	1997-04-11 	1997-05-09 	1997-04-18 	3	59	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10505	MEREP	3	1997-04-14 	1997-05-12 	1997-04-21 	3	7	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10506	KOENE	9	1997-04-15 	1997-05-13 	1997-05-02 	2	21	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10507	ANTON	7	1997-04-15 	1997-05-13 	1997-04-22 	1	47	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10508	OTTIK	1	1997-04-16 	1997-05-14 	1997-05-13 	2	5	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10509	BLAUS	4	1997-04-17 	1997-05-15 	1997-04-29 	1	0	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10510	SAVEA	6	1997-04-18 	1997-05-16 	1997-04-28 	3	368	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10511	BONAP	4	1997-04-18 	1997-05-16 	1997-04-21 	3	351	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10512	FAMIA	7	1997-04-21 	1997-05-19 	1997-04-24 	2	4	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10513	WANDK	7	1997-04-22 	1997-06-03 	1997-04-28 	1	106	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10514	ERNSH	3	1997-04-22 	1997-05-20 	1997-05-16 	2	790	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10515	QUICK	2	1997-04-23 	1997-05-07 	1997-05-23 	1	204	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10516	HUNGO	2	1997-04-24 	1997-05-22 	1997-05-01 	3	63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10517	NORTS	3	1997-04-24 	1997-05-22 	1997-04-29 	3	32	North/South	South House\n300 Queensbridge	London	\N	SW7 1RZ	UK
10518	TORTU	4	1997-04-25 	1997-05-09 	1997-05-05 	2	218	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10519	CHOPS	6	1997-04-28 	1997-05-26 	1997-05-01 	3	92	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10520	SANTG	7	1997-04-29 	1997-05-27 	1997-05-01 	1	13	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10521	CACTU	8	1997-04-29 	1997-05-27 	1997-05-02 	2	17	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10522	LEHMS	4	1997-04-30 	1997-05-28 	1997-05-06 	1	45	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10523	SEVES	7	1997-05-01 	1997-05-29 	1997-05-30 	2	78	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10524	BERGS	1	1997-05-01 	1997-05-29 	1997-05-07 	2	245	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10525	BONAP	1	1997-05-02 	1997-05-30 	1997-05-23 	2	11	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10526	WARTH	4	1997-05-05 	1997-06-02 	1997-05-15 	2	59	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10527	QUICK	7	1997-05-05 	1997-06-02 	1997-05-07 	1	42	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10528	GREAL	6	1997-05-06 	1997-05-20 	1997-05-09 	2	3	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10529	MAISD	5	1997-05-07 	1997-06-04 	1997-05-09 	2	67	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10530	PICCO	3	1997-05-08 	1997-06-05 	1997-05-12 	2	339	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10531	OCEAN	7	1997-05-08 	1997-06-05 	1997-05-19 	1	8	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina
10532	EASTC	7	1997-05-09 	1997-06-06 	1997-05-12 	3	74	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10533	FOLKO	8	1997-05-12 	1997-06-09 	1997-05-22 	1	188	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10534	LEHMS	8	1997-05-12 	1997-06-09 	1997-05-14 	2	28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10535	ANTON	4	1997-05-13 	1997-06-10 	1997-05-21 	1	16	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10536	LEHMS	3	1997-05-14 	1997-06-11 	1997-06-06 	2	59	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10537	RICSU	1	1997-05-14 	1997-05-28 	1997-05-19 	1	79	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10538	BSBEV	9	1997-05-15 	1997-06-12 	1997-05-16 	3	5	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10539	BSBEV	6	1997-05-16 	1997-06-13 	1997-05-23 	3	12	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10540	QUICK	3	1997-05-19 	1997-06-16 	1997-06-13 	3	1008	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10541	HANAR	2	1997-05-19 	1997-06-16 	1997-05-29 	1	69	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10542	KOENE	1	1997-05-20 	1997-06-17 	1997-05-26 	3	11	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10543	LILAS	8	1997-05-21 	1997-06-18 	1997-05-23 	2	48	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10544	LONEP	4	1997-05-21 	1997-06-18 	1997-05-30 	1	25	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10545	LAZYK	8	1997-05-22 	1997-06-19 	1997-06-26 	2	12	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10546	VICTE	1	1997-05-23 	1997-06-20 	1997-05-27 	3	195	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10547	SEVES	3	1997-05-23 	1997-06-20 	1997-06-02 	2	178	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10548	TOMSP	3	1997-05-26 	1997-06-23 	1997-06-02 	2	1	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10549	QUICK	5	1997-05-27 	1997-06-10 	1997-05-30 	1	171	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10550	GODOS	7	1997-05-28 	1997-06-25 	1997-06-06 	3	4	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10551	FURIB	4	1997-05-28 	1997-07-09 	1997-06-06 	3	73	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10552	HILAA	2	1997-05-29 	1997-06-26 	1997-06-05 	1	83	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10553	WARTH	2	1997-05-30 	1997-06-27 	1997-06-03 	2	149	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10554	OTTIK	4	1997-05-30 	1997-06-27 	1997-06-05 	3	121	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10555	SAVEA	6	1997-06-02 	1997-06-30 	1997-06-04 	3	252	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10556	SIMOB	2	1997-06-03 	1997-07-15 	1997-06-13 	1	10	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10557	LEHMS	9	1997-06-03 	1997-06-17 	1997-06-06 	2	97	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10558	AROUT	1	1997-06-04 	1997-07-02 	1997-06-10 	2	73	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10559	BLONP	6	1997-06-05 	1997-07-03 	1997-06-13 	1	8	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10560	FRANK	8	1997-06-06 	1997-07-04 	1997-06-09 	1	37	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10561	FOLKO	2	1997-06-06 	1997-07-04 	1997-06-09 	2	242	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10562	REGGC	1	1997-06-09 	1997-07-07 	1997-06-12 	1	23	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10563	RICAR	2	1997-06-10 	1997-07-22 	1997-06-24 	2	60	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10564	RATTC	4	1997-06-10 	1997-07-08 	1997-06-16 	3	14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10565	MEREP	8	1997-06-11 	1997-07-09 	1997-06-18 	2	7	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10566	BLONP	9	1997-06-12 	1997-07-10 	1997-06-18 	1	88	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10567	HUNGO	1	1997-06-12 	1997-07-10 	1997-06-17 	1	34	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10568	GALED	3	1997-06-13 	1997-07-11 	1997-07-09 	3	7	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10569	RATTC	5	1997-06-16 	1997-07-14 	1997-07-11 	1	59	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10570	MEREP	3	1997-06-17 	1997-07-15 	1997-06-19 	3	189	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10571	ERNSH	8	1997-06-17 	1997-07-29 	1997-07-04 	3	26	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10572	BERGS	3	1997-06-18 	1997-07-16 	1997-06-25 	2	116	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10573	ANTON	7	1997-06-19 	1997-07-17 	1997-06-20 	3	85	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10574	TRAIH	4	1997-06-19 	1997-07-17 	1997-06-30 	2	38	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10575	MORGK	5	1997-06-20 	1997-07-04 	1997-06-30 	1	127	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10576	TORTU	3	1997-06-23 	1997-07-07 	1997-06-30 	3	19	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10577	TRAIH	9	1997-06-23 	1997-08-04 	1997-06-30 	2	25	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10578	BSBEV	4	1997-06-24 	1997-07-22 	1997-07-25 	3	30	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10579	LETSS	1	1997-06-25 	1997-07-23 	1997-07-04 	2	14	Let's Stop N Shop	87 Polk St.\nSuite 5	San Francisco	CA	94117	USA
10580	OTTIK	4	1997-06-26 	1997-07-24 	1997-07-01 	3	76	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10581	FAMIA	3	1997-06-26 	1997-07-24 	1997-07-02 	1	3	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10582	BLAUS	3	1997-06-27 	1997-07-25 	1997-07-14 	2	28	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10583	WARTH	2	1997-06-30 	1997-07-28 	1997-07-04 	2	7	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10584	BLONP	4	1997-06-30 	1997-07-28 	1997-07-04 	1	59	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10585	WELLI	7	1997-07-01 	1997-07-29 	1997-07-10 	1	13	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10586	REGGC	9	1997-07-02 	1997-07-30 	1997-07-09 	1	0	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10587	QUEDE	1	1997-07-02 	1997-07-30 	1997-07-09 	1	63	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10588	QUICK	2	1997-07-03 	1997-07-31 	1997-07-10 	3	195	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10589	GREAL	8	1997-07-04 	1997-08-01 	1997-07-14 	2	4	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10590	MEREP	4	1997-07-07 	1997-08-04 	1997-07-14 	3	45	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10591	VAFFE	1	1997-07-07 	1997-07-21 	1997-07-16 	1	56	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10592	LEHMS	3	1997-07-08 	1997-08-05 	1997-07-16 	1	32	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10593	LEHMS	7	1997-07-09 	1997-08-06 	1997-08-13 	2	174	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10594	OLDWO	3	1997-07-09 	1997-08-06 	1997-07-16 	2	5	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10595	ERNSH	2	1997-07-10 	1997-08-07 	1997-07-14 	1	97	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10596	WHITC	8	1997-07-11 	1997-08-08 	1997-08-12 	1	16	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10597	PICCO	7	1997-07-11 	1997-08-08 	1997-07-18 	3	35	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10598	RATTC	1	1997-07-14 	1997-08-11 	1997-07-18 	3	44	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10599	BSBEV	6	1997-07-15 	1997-08-26 	1997-07-21 	3	30	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10600	HUNGC	4	1997-07-16 	1997-08-13 	1997-07-21 	1	45	Hungry Coyote Import Store	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA
10601	HILAA	7	1997-07-16 	1997-08-27 	1997-07-22 	1	58	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10602	VAFFE	8	1997-07-17 	1997-08-14 	1997-07-22 	2	3	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10603	SAVEA	8	1997-07-18 	1997-08-15 	1997-08-08 	2	49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10604	FURIB	1	1997-07-18 	1997-08-15 	1997-07-29 	1	7	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10605	MEREP	1	1997-07-21 	1997-08-18 	1997-07-29 	2	379	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10606	TRADH	4	1997-07-22 	1997-08-19 	1997-07-31 	3	79	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10607	SAVEA	5	1997-07-22 	1997-08-19 	1997-07-25 	1	200	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10608	TOMSP	4	1997-07-23 	1997-08-20 	1997-08-01 	2	28	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10609	DUMON	7	1997-07-24 	1997-08-21 	1997-07-30 	2	2	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10610	LAMAI	8	1997-07-25 	1997-08-22 	1997-08-06 	1	27	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10611	WOLZA	6	1997-07-25 	1997-08-22 	1997-08-01 	2	81	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10612	SAVEA	1	1997-07-28 	1997-08-25 	1997-08-01 	2	544	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10613	HILAA	4	1997-07-29 	1997-08-26 	1997-08-01 	2	8	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10614	BLAUS	8	1997-07-29 	1997-08-26 	1997-08-01 	3	2	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10615	WILMK	2	1997-07-30 	1997-08-27 	1997-08-06 	3	1	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10616	GREAL	1	1997-07-31 	1997-08-28 	1997-08-05 	2	117	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10617	GREAL	4	1997-07-31 	1997-08-28 	1997-08-04 	2	19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10618	MEREP	1	1997-08-01 	1997-09-12 	1997-08-08 	1	155	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10619	MEREP	3	1997-08-04 	1997-09-01 	1997-08-07 	3	91	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10620	LAUGB	2	1997-08-05 	1997-09-02 	1997-08-14 	3	1	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10621	ISLAT	4	1997-08-05 	1997-09-02 	1997-08-11 	2	24	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10622	RICAR	4	1997-08-06 	1997-09-03 	1997-08-11 	3	51	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10623	FRANK	8	1997-08-07 	1997-09-04 	1997-08-12 	2	97	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10624	THECR	4	1997-08-07 	1997-09-04 	1997-08-19 	2	95	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10625	ANATR	3	1997-08-08 	1997-09-05 	1997-08-14 	1	44	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10626	BERGS	1	1997-08-11 	1997-09-08 	1997-08-20 	2	139	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10627	SAVEA	8	1997-08-11 	1997-09-22 	1997-08-21 	3	107	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10628	BLONP	4	1997-08-12 	1997-09-09 	1997-08-20 	3	30	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10629	GODOS	4	1997-08-12 	1997-09-09 	1997-08-20 	3	85	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10630	KOENE	1	1997-08-13 	1997-09-10 	1997-08-19 	2	32	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10631	LAMAI	8	1997-08-14 	1997-09-11 	1997-08-15 	1	1	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10632	WANDK	8	1997-08-14 	1997-09-11 	1997-08-19 	1	41	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10633	ERNSH	7	1997-08-15 	1997-09-12 	1997-08-18 	3	478	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10634	FOLIG	4	1997-08-15 	1997-09-12 	1997-08-21 	3	487	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10635	MAGAA	8	1997-08-18 	1997-09-15 	1997-08-21 	3	47	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10636	WARTH	4	1997-08-19 	1997-09-16 	1997-08-26 	1	1	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10637	QUEEN	6	1997-08-19 	1997-09-16 	1997-08-26 	1	201	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10638	LINOD	3	1997-08-20 	1997-09-17 	1997-09-01 	1	158	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10639	SANTG	7	1997-08-20 	1997-09-17 	1997-08-27 	3	39	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10640	WANDK	4	1997-08-21 	1997-09-18 	1997-08-28 	1	24	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10641	HILAA	4	1997-08-22 	1997-09-19 	1997-08-26 	2	180	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10642	SIMOB	7	1997-08-22 	1997-09-19 	1997-09-05 	3	42	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10643	ALFKI	6	1997-08-25 	1997-09-22 	1997-09-02 	1	29	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10644	WELLI	3	1997-08-25 	1997-09-22 	1997-09-01 	2	0	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10645	HANAR	4	1997-08-26 	1997-09-23 	1997-09-02 	1	12	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10646	HUNGO	9	1997-08-27 	1997-10-08 	1997-09-03 	3	142	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10647	QUEDE	4	1997-08-27 	1997-09-10 	1997-09-03 	2	46	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10648	RICAR	5	1997-08-28 	1997-10-09 	1997-09-09 	2	14	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10649	MAISD	5	1997-08-28 	1997-09-25 	1997-08-29 	3	6	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10650	FAMIA	5	1997-08-29 	1997-09-26 	1997-09-03 	3	177	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10651	WANDK	8	1997-09-01 	1997-09-29 	1997-09-11 	2	21	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10652	GOURL	4	1997-09-01 	1997-09-29 	1997-09-08 	2	7	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10653	FRANK	1	1997-09-02 	1997-09-30 	1997-09-19 	1	93	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10654	BERGS	5	1997-09-02 	1997-09-30 	1997-09-11 	1	55	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10655	REGGC	1	1997-09-03 	1997-10-01 	1997-09-11 	2	4	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10656	GREAL	6	1997-09-04 	1997-10-02 	1997-09-10 	1	57	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10657	SAVEA	2	1997-09-04 	1997-10-02 	1997-09-15 	2	353	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10658	QUICK	4	1997-09-05 	1997-10-03 	1997-09-08 	1	364	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10659	QUEEN	7	1997-09-05 	1997-10-03 	1997-09-10 	2	106	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10660	HUNGC	8	1997-09-08 	1997-10-06 	1997-10-15 	1	111	Hungry Coyote Import Store	City Center Plaza\n516 Main St.	Elgin	OR	97827	USA
10661	HUNGO	7	1997-09-09 	1997-10-07 	1997-09-15 	3	18	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10662	LONEP	3	1997-09-09 	1997-10-07 	1997-09-18 	2	1	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10663	BONAP	2	1997-09-10 	1997-09-24 	1997-10-03 	2	113	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10664	FURIB	1	1997-09-10 	1997-10-08 	1997-09-19 	3	1	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10665	LONEP	1	1997-09-11 	1997-10-09 	1997-09-17 	2	26	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10666	RICSU	7	1997-09-12 	1997-10-10 	1997-09-22 	2	232	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10667	ERNSH	7	1997-09-12 	1997-10-10 	1997-09-19 	1	78	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10668	WANDK	1	1997-09-15 	1997-10-13 	1997-09-23 	2	47	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
10669	SIMOB	2	1997-09-15 	1997-10-13 	1997-09-22 	1	24	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10670	FRANK	4	1997-09-16 	1997-10-14 	1997-09-18 	1	203	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10671	FRANR	1	1997-09-17 	1997-10-15 	1997-09-24 	1	30	France restauration	54, rue Royale	Nantes	\N	44000	France
10672	BERGS	9	1997-09-17 	1997-10-01 	1997-09-26 	2	96	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10673	WILMK	2	1997-09-18 	1997-10-16 	1997-09-19 	1	23	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10674	ISLAT	4	1997-09-18 	1997-10-16 	1997-09-30 	2	1	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10675	FRANK	5	1997-09-19 	1997-10-17 	1997-09-23 	2	32	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10676	TORTU	2	1997-09-22 	1997-10-20 	1997-09-29 	2	2	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10677	ANTON	1	1997-09-22 	1997-10-20 	1997-09-26 	3	4	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10678	SAVEA	7	1997-09-23 	1997-10-21 	1997-10-16 	3	389	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10679	BLONP	8	1997-09-23 	1997-10-21 	1997-09-30 	3	28	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10680	OLDWO	1	1997-09-24 	1997-10-22 	1997-09-26 	1	27	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10681	GREAL	3	1997-09-25 	1997-10-23 	1997-09-30 	3	76	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10682	ANTON	3	1997-09-25 	1997-10-23 	1997-10-01 	2	36	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10683	DUMON	2	1997-09-26 	1997-10-24 	1997-10-01 	1	4	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10684	OTTIK	3	1997-09-26 	1997-10-24 	1997-09-30 	1	146	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10685	GOURL	4	1997-09-29 	1997-10-13 	1997-10-03 	2	34	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10686	PICCO	2	1997-09-30 	1997-10-28 	1997-10-08 	1	96	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10687	HUNGO	9	1997-09-30 	1997-10-28 	1997-10-30 	2	296	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10688	VAFFE	4	1997-10-01 	1997-10-15 	1997-10-07 	2	299	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10689	BERGS	1	1997-10-01 	1997-10-29 	1997-10-07 	2	13	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10690	HANAR	1	1997-10-02 	1997-10-30 	1997-10-03 	1	16	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10691	QUICK	2	1997-10-03 	1997-11-14 	1997-10-22 	2	810	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10692	ALFKI	4	1997-10-03 	1997-10-31 	1997-10-13 	2	61	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10693	WHITC	3	1997-10-06 	1997-10-20 	1997-10-10 	3	139	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10694	QUICK	8	1997-10-06 	1997-11-03 	1997-10-09 	3	398	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10695	WILMK	7	1997-10-07 	1997-11-18 	1997-10-14 	1	17	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10696	WHITC	8	1997-10-08 	1997-11-19 	1997-10-14 	3	103	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10697	LINOD	3	1997-10-08 	1997-11-05 	1997-10-14 	1	46	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10698	ERNSH	4	1997-10-09 	1997-11-06 	1997-10-17 	1	272	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10699	MORGK	3	1997-10-09 	1997-11-06 	1997-10-13 	3	1	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10700	SAVEA	3	1997-10-10 	1997-11-07 	1997-10-16 	1	65	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10701	HUNGO	6	1997-10-13 	1997-10-27 	1997-10-15 	3	220	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10702	ALFKI	4	1997-10-13 	1997-11-24 	1997-10-21 	1	24	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10703	FOLKO	6	1997-10-14 	1997-11-11 	1997-10-20 	2	152	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10704	QUEEN	6	1997-10-14 	1997-11-11 	1997-11-07 	1	5	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10705	HILAA	9	1997-10-15 	1997-11-12 	1997-11-18 	2	4	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10706	OLDWO	8	1997-10-16 	1997-11-13 	1997-10-21 	3	136	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10707	AROUT	4	1997-10-16 	1997-10-30 	1997-10-23 	3	22	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10708	THEBI	6	1997-10-17 	1997-11-28 	1997-11-05 	2	3	The Big Cheese	89 Jefferson Way\nSuite 2	Portland	OR	97201	USA
10709	GOURL	1	1997-10-17 	1997-11-14 	1997-11-20 	3	211	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10710	FRANS	1	1997-10-20 	1997-11-17 	1997-10-23 	1	5	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10711	SAVEA	5	1997-10-21 	1997-12-02 	1997-10-29 	2	52	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10712	HUNGO	3	1997-10-21 	1997-11-18 	1997-10-31 	1	90	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10713	SAVEA	1	1997-10-22 	1997-11-19 	1997-10-24 	1	167	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10714	SAVEA	5	1997-10-22 	1997-11-19 	1997-10-27 	3	24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10715	BONAP	3	1997-10-23 	1997-11-06 	1997-10-29 	1	63	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10716	RANCH	4	1997-10-24 	1997-11-21 	1997-10-27 	2	23	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10717	FRANK	1	1997-10-24 	1997-11-21 	1997-10-29 	2	59	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10718	KOENE	1	1997-10-27 	1997-11-24 	1997-10-29 	3	171	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10719	LETSS	8	1997-10-27 	1997-11-24 	1997-11-05 	2	51	Let's Stop N Shop	87 Polk St.\nSuite 5	San Francisco	CA	94117	USA
10720	QUEDE	8	1997-10-28 	1997-11-11 	1997-11-05 	2	10	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10721	QUICK	5	1997-10-29 	1997-11-26 	1997-10-31 	3	49	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10722	SAVEA	8	1997-10-29 	1997-12-10 	1997-11-04 	1	75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10723	WHITC	3	1997-10-30 	1997-11-27 	1997-11-25 	1	22	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10724	MEREP	8	1997-10-30 	1997-12-11 	1997-11-05 	2	58	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
10725	FAMIA	4	1997-10-31 	1997-11-28 	1997-11-05 	3	11	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brazil
10726	EASTC	4	1997-11-03 	1997-11-17 	1997-12-05 	1	17	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10727	REGGC	2	1997-11-03 	1997-12-01 	1997-12-05 	1	90	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10728	QUEEN	4	1997-11-04 	1997-12-02 	1997-11-11 	2	58	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10729	LINOD	8	1997-11-04 	1997-12-16 	1997-11-14 	3	141	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10730	BONAP	5	1997-11-05 	1997-12-03 	1997-11-14 	1	20	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10731	CHOPS	7	1997-11-06 	1997-12-04 	1997-11-14 	1	97	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10732	BONAP	3	1997-11-06 	1997-12-04 	1997-11-07 	1	17	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10733	BERGS	1	1997-11-07 	1997-12-05 	1997-11-10 	3	110	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10734	GOURL	2	1997-11-07 	1997-12-05 	1997-11-12 	3	2	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10735	LETSS	6	1997-11-10 	1997-12-08 	1997-11-21 	2	46	Let's Stop N Shop	87 Polk St.\nSuite 5	San Francisco	CA	94117	USA
10736	HUNGO	9	1997-11-11 	1997-12-09 	1997-11-21 	2	44	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10737	VINET	2	1997-11-11 	1997-12-09 	1997-11-18 	2	8	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10738	SPECD	2	1997-11-12 	1997-12-10 	1997-11-18 	1	3	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10739	VINET	3	1997-11-12 	1997-12-10 	1997-11-17 	3	11	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	France
10740	WHITC	4	1997-11-13 	1997-12-11 	1997-11-25 	2	82	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10741	AROUT	4	1997-11-14 	1997-11-28 	1997-11-18 	3	11	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10742	BOTTM	3	1997-11-14 	1997-12-12 	1997-11-18 	3	244	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10743	AROUT	1	1997-11-17 	1997-12-15 	1997-11-21 	2	24	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10744	VAFFE	6	1997-11-17 	1997-12-15 	1997-11-24 	1	69	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10745	QUICK	9	1997-11-18 	1997-12-16 	1997-11-27 	1	4	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10746	CHOPS	1	1997-11-19 	1997-12-17 	1997-11-21 	3	31	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10747	PICCO	6	1997-11-19 	1997-12-17 	1997-11-26 	1	117	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10748	SAVEA	3	1997-11-20 	1997-12-18 	1997-11-28 	1	233	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10749	ISLAT	4	1997-11-20 	1997-12-18 	1997-12-19 	2	62	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10750	WARTH	9	1997-11-21 	1997-12-19 	1997-11-24 	1	79	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10751	RICSU	3	1997-11-24 	1997-12-22 	1997-12-03 	3	131	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10752	NORTS	2	1997-11-24 	1997-12-22 	1997-11-28 	3	1	North/South	South House\n300 Queensbridge	London	\N	SW7 1RZ	UK
10753	FRANS	3	1997-11-25 	1997-12-23 	1997-11-27 	1	8	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10754	MAGAA	6	1997-11-25 	1997-12-23 	1997-11-27 	3	2	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10755	BONAP	4	1997-11-26 	1997-12-24 	1997-11-28 	2	17	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10756	SPLIR	8	1997-11-27 	1997-12-25 	1997-12-02 	2	73	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10757	SAVEA	6	1997-11-27 	1997-12-25 	1997-12-15 	1	8	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10758	RICSU	3	1997-11-28 	1997-12-26 	1997-12-04 	3	138	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10759	ANATR	3	1997-11-28 	1997-12-26 	1997-12-12 	3	12	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10760	MAISD	4	1997-12-01 	1997-12-29 	1997-12-10 	1	156	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10761	RATTC	5	1997-12-02 	1997-12-30 	1997-12-08 	2	19	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10762	FOLKO	3	1997-12-02 	1997-12-30 	1997-12-09 	1	329	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10763	FOLIG	3	1997-12-03 	1997-12-31 	1997-12-08 	3	37	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10764	ERNSH	6	1997-12-03 	1997-12-31 	1997-12-08 	3	145	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10765	QUICK	3	1997-12-04 	1998-01-01 	1997-12-09 	3	43	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10766	OTTIK	4	1997-12-05 	1998-01-02 	1997-12-09 	1	158	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10767	SUPRD	4	1997-12-05 	1998-01-02 	1997-12-15 	3	2	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10768	AROUT	3	1997-12-08 	1998-01-05 	1997-12-15 	2	146	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10769	VAFFE	3	1997-12-08 	1998-01-05 	1997-12-12 	1	65	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10770	HANAR	8	1997-12-09 	1998-01-06 	1997-12-17 	3	5	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10771	ERNSH	9	1997-12-10 	1998-01-07 	1998-01-02 	2	11	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10772	LEHMS	3	1997-12-10 	1998-01-07 	1997-12-19 	2	91	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10773	ERNSH	1	1997-12-11 	1998-01-08 	1997-12-16 	3	96	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10774	FOLKO	4	1997-12-11 	1997-12-25 	1997-12-12 	1	48	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10775	THECR	7	1997-12-12 	1998-01-09 	1997-12-26 	1	20	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10776	ERNSH	1	1997-12-15 	1998-01-12 	1997-12-18 	3	352	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10777	GOURL	7	1997-12-15 	1997-12-29 	1998-01-21 	2	3	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10778	BERGS	3	1997-12-16 	1998-01-13 	1997-12-24 	1	7	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10779	MORGK	3	1997-12-16 	1998-01-13 	1998-01-14 	2	58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10780	LILAS	2	1997-12-16 	1997-12-30 	1997-12-25 	1	42	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10781	WARTH	2	1997-12-17 	1998-01-14 	1997-12-19 	3	73	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
10782	CACTU	9	1997-12-17 	1998-01-14 	1997-12-22 	3	1	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10783	HANAR	4	1997-12-18 	1998-01-15 	1997-12-19 	2	125	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10784	MAGAA	4	1997-12-18 	1998-01-15 	1997-12-22 	3	70	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10785	GROSR	1	1997-12-18 	1998-01-15 	1997-12-24 	3	2	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10786	QUEEN	8	1997-12-19 	1998-01-16 	1997-12-23 	1	111	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10787	LAMAI	2	1997-12-19 	1998-01-02 	1997-12-26 	1	250	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10788	QUICK	1	1997-12-22 	1998-01-19 	1998-01-19 	2	43	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10789	FOLIG	1	1997-12-22 	1998-01-19 	1997-12-31 	2	101	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	France
10790	GOURL	6	1997-12-22 	1998-01-19 	1997-12-26 	1	28	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10791	FRANK	6	1997-12-23 	1998-01-20 	1998-01-01 	2	17	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10792	WOLZA	1	1997-12-23 	1998-01-20 	1997-12-31 	3	24	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10793	AROUT	3	1997-12-24 	1998-01-21 	1998-01-08 	3	5	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10794	QUEDE	6	1997-12-24 	1998-01-21 	1998-01-02 	1	21	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10795	ERNSH	8	1997-12-24 	1998-01-21 	1998-01-20 	2	127	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10796	HILAA	3	1997-12-25 	1998-01-22 	1998-01-14 	1	27	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10797	DRACD	7	1997-12-25 	1998-01-22 	1998-01-05 	2	33	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10798	ISLAT	2	1997-12-26 	1998-01-23 	1998-01-05 	1	2	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10799	KOENE	9	1997-12-26 	1998-02-06 	1998-01-05 	3	31	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10800	SEVES	1	1997-12-26 	1998-01-23 	1998-01-05 	3	137	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10801	BOLID	4	1997-12-29 	1998-01-26 	1997-12-31 	2	97	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10802	SIMOB	4	1997-12-29 	1998-01-26 	1998-01-02 	2	257	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
10803	WELLI	4	1997-12-30 	1998-01-27 	1998-01-06 	1	55	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10804	SEVES	6	1997-12-30 	1998-01-27 	1998-01-07 	2	27	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10805	THEBI	2	1997-12-30 	1998-01-27 	1998-01-09 	3	237	The Big Cheese	89 Jefferson Way\nSuite 2	Portland	OR	97201	USA
10806	VICTE	3	1997-12-31 	1998-01-28 	1998-01-05 	2	22	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10807	FRANS	4	1997-12-31 	1998-01-28 	1998-01-30 	1	1	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
10808	PRINI	2	1998-01-01 	1998-01-29 	1998-01-09 	3	46	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10809	WELLI	7	1998-01-01 	1998-01-29 	1998-01-07 	1	5	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10810	LAUGB	2	1998-01-01 	1998-01-29 	1998-01-07 	3	4	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10811	LINOD	8	1998-01-02 	1998-01-30 	1998-01-08 	1	31	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10812	REGGC	5	1998-01-02 	1998-01-30 	1998-01-12 	1	60	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10813	RICAR	1	1998-01-05 	1998-02-02 	1998-01-09 	1	47	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10814	VICTE	3	1998-01-05 	1998-02-02 	1998-01-14 	3	131	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10815	SAVEA	2	1998-01-05 	1998-02-02 	1998-01-14 	3	15	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10816	GREAL	4	1998-01-06 	1998-02-03 	1998-02-04 	2	720	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10817	KOENE	3	1998-01-06 	1998-01-20 	1998-01-13 	2	306	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10818	MAGAA	7	1998-01-07 	1998-02-04 	1998-01-12 	3	65	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10819	CACTU	2	1998-01-07 	1998-02-04 	1998-01-16 	3	20	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10820	RATTC	3	1998-01-07 	1998-02-04 	1998-01-13 	2	38	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10821	SPLIR	1	1998-01-08 	1998-02-05 	1998-01-15 	1	37	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10822	TRAIH	6	1998-01-08 	1998-02-05 	1998-01-16 	3	7	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10823	LILAS	5	1998-01-09 	1998-02-06 	1998-01-13 	2	164	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10824	FOLKO	8	1998-01-09 	1998-02-06 	1998-01-30 	1	1	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10825	DRACD	1	1998-01-09 	1998-02-06 	1998-01-14 	1	79	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
10826	BLONP	6	1998-01-12 	1998-02-09 	1998-02-06 	1	7	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	France
10827	BONAP	1	1998-01-12 	1998-01-26 	1998-02-06 	2	64	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10828	RANCH	9	1998-01-13 	1998-01-27 	1998-02-04 	1	91	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10829	ISLAT	9	1998-01-13 	1998-02-10 	1998-01-23 	1	155	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10830	TRADH	4	1998-01-13 	1998-02-24 	1998-01-21 	2	82	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10831	SANTG	3	1998-01-14 	1998-02-11 	1998-01-23 	2	72	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10832	LAMAI	2	1998-01-14 	1998-02-11 	1998-01-19 	2	43	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10833	OTTIK	6	1998-01-15 	1998-02-12 	1998-01-23 	2	71	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
10834	TRADH	1	1998-01-15 	1998-02-12 	1998-01-19 	3	30	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10835	ALFKI	1	1998-01-15 	1998-02-12 	1998-01-21 	3	70	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10836	ERNSH	7	1998-01-16 	1998-02-13 	1998-01-21 	1	412	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10837	BERGS	9	1998-01-16 	1998-02-13 	1998-01-23 	3	13	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10838	LINOD	3	1998-01-19 	1998-02-16 	1998-01-23 	3	59	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10839	TRADH	3	1998-01-19 	1998-02-16 	1998-01-22 	3	35	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brazil
10840	LINOD	4	1998-01-19 	1998-03-02 	1998-02-16 	2	3	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10841	SUPRD	5	1998-01-20 	1998-02-17 	1998-01-29 	2	424	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10842	TORTU	1	1998-01-20 	1998-02-17 	1998-01-29 	3	54	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10843	VICTE	4	1998-01-21 	1998-02-18 	1998-01-26 	2	9	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10844	PICCO	8	1998-01-21 	1998-02-18 	1998-01-26 	2	25	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
10845	QUICK	8	1998-01-21 	1998-02-04 	1998-01-30 	1	213	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10846	SUPRD	2	1998-01-22 	1998-03-05 	1998-01-23 	3	56	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10847	SAVEA	4	1998-01-22 	1998-02-05 	1998-02-10 	3	488	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10848	CONSH	7	1998-01-23 	1998-02-20 	1998-01-29 	2	38	Consolidated Holdings	Berkeley Gardens\n12  Brewery 	London	\N	WX1 6LT	UK
10849	KOENE	9	1998-01-23 	1998-02-20 	1998-01-30 	2	1	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10850	VICTE	1	1998-01-23 	1998-03-06 	1998-01-30 	1	49	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	France
10851	RICAR	5	1998-01-26 	1998-02-23 	1998-02-02 	1	161	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10852	RATTC	8	1998-01-26 	1998-02-09 	1998-01-30 	1	174	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10853	BLAUS	9	1998-01-27 	1998-02-24 	1998-02-03 	2	54	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10854	ERNSH	3	1998-01-27 	1998-02-24 	1998-02-05 	2	100	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10855	OLDWO	3	1998-01-27 	1998-02-24 	1998-02-04 	1	171	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10856	ANTON	3	1998-01-28 	1998-02-25 	1998-02-10 	2	58	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexico
10857	BERGS	8	1998-01-28 	1998-02-25 	1998-02-06 	2	189	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10858	LACOR	2	1998-01-29 	1998-02-26 	1998-02-03 	1	53	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10859	FRANK	1	1998-01-29 	1998-02-26 	1998-02-02 	2	76	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10860	FRANR	3	1998-01-29 	1998-02-26 	1998-02-04 	3	19	France restauration	54, rue Royale	Nantes	\N	44000	France
10861	WHITC	4	1998-01-30 	1998-02-27 	1998-02-17 	2	15	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10862	LEHMS	8	1998-01-30 	1998-03-13 	1998-02-02 	2	53	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10863	HILAA	4	1998-02-02 	1998-03-02 	1998-02-17 	2	30	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10864	AROUT	4	1998-02-02 	1998-03-02 	1998-02-09 	2	3	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10865	QUICK	2	1998-02-02 	1998-02-16 	1998-02-12 	1	348	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10866	BERGS	5	1998-02-03 	1998-03-03 	1998-02-12 	1	109	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10867	LONEP	6	1998-02-03 	1998-03-17 	1998-02-11 	1	2	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10868	QUEEN	7	1998-02-04 	1998-03-04 	1998-02-23 	2	191	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10869	SEVES	5	1998-02-04 	1998-03-04 	1998-02-09 	1	143	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	UK
10870	WOLZA	5	1998-02-04 	1998-03-04 	1998-02-13 	3	12	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10871	BONAP	9	1998-02-05 	1998-03-05 	1998-02-10 	2	112	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10872	GODOS	5	1998-02-05 	1998-03-05 	1998-02-09 	2	175	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10873	WILMK	4	1998-02-06 	1998-03-06 	1998-02-09 	1	1	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10874	GODOS	5	1998-02-06 	1998-03-06 	1998-02-11 	2	20	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10875	BERGS	4	1998-02-06 	1998-03-06 	1998-03-03 	2	32	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10876	BONAP	7	1998-02-09 	1998-03-09 	1998-02-12 	3	60	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10877	RICAR	1	1998-02-09 	1998-03-09 	1998-02-19 	1	38	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
10878	QUICK	4	1998-02-10 	1998-03-10 	1998-02-12 	1	47	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10879	WILMK	3	1998-02-10 	1998-03-10 	1998-02-12 	3	8	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10880	FOLKO	7	1998-02-10 	1998-03-24 	1998-02-18 	1	88	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10881	CACTU	4	1998-02-11 	1998-03-11 	1998-02-18 	1	3	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10882	SAVEA	4	1998-02-11 	1998-03-11 	1998-02-20 	3	23	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10883	LONEP	8	1998-02-12 	1998-03-12 	1998-02-20 	3	1	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10884	LETSS	4	1998-02-12 	1998-03-12 	1998-02-13 	2	91	Let's Stop N Shop	87 Polk St.\nSuite 5	San Francisco	CA	94117	USA
10885	SUPRD	6	1998-02-12 	1998-03-12 	1998-02-18 	3	6	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10886	HANAR	1	1998-02-13 	1998-03-13 	1998-03-02 	1	5	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10887	GALED	8	1998-02-13 	1998-03-13 	1998-02-16 	3	1	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10888	GODOS	1	1998-02-16 	1998-03-16 	1998-02-23 	2	52	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10889	RATTC	9	1998-02-16 	1998-03-16 	1998-02-23 	3	281	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10890	DUMON	7	1998-02-16 	1998-03-16 	1998-02-18 	1	33	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	France
10891	LEHMS	7	1998-02-17 	1998-03-17 	1998-02-19 	2	20	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10892	MAISD	4	1998-02-17 	1998-03-17 	1998-02-19 	2	120	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10893	KOENE	9	1998-02-18 	1998-03-18 	1998-02-20 	2	78	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
10894	SAVEA	1	1998-02-18 	1998-03-18 	1998-02-20 	1	116	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10895	ERNSH	3	1998-02-18 	1998-03-18 	1998-02-23 	1	163	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10896	MAISD	7	1998-02-19 	1998-03-19 	1998-02-27 	3	32	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10897	HUNGO	3	1998-02-19 	1998-03-19 	1998-02-25 	2	604	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10898	OCEAN	4	1998-02-20 	1998-03-20 	1998-03-06 	2	1	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina
10899	LILAS	5	1998-02-20 	1998-03-20 	1998-02-26 	3	1	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10900	WELLI	1	1998-02-20 	1998-03-20 	1998-03-04 	2	2	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10901	HILAA	4	1998-02-23 	1998-03-23 	1998-02-26 	1	62	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10902	FOLKO	1	1998-02-23 	1998-03-23 	1998-03-03 	1	44	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10903	HANAR	3	1998-02-24 	1998-03-24 	1998-03-04 	3	37	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10904	WHITC	3	1998-02-24 	1998-03-24 	1998-02-27 	3	163	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10905	WELLI	9	1998-02-24 	1998-03-24 	1998-03-06 	2	14	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10906	WOLZA	4	1998-02-25 	1998-03-11 	1998-03-03 	3	26	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10907	SPECD	6	1998-02-25 	1998-03-25 	1998-02-27 	3	9	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10908	REGGC	4	1998-02-26 	1998-03-26 	1998-03-06 	2	33	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10909	SANTG	1	1998-02-26 	1998-03-26 	1998-03-10 	2	53	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
10910	WILMK	1	1998-02-26 	1998-03-26 	1998-03-04 	3	38	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
10911	GODOS	3	1998-02-26 	1998-03-26 	1998-03-05 	1	38	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10912	HUNGO	2	1998-02-26 	1998-03-26 	1998-03-18 	2	581	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10913	QUEEN	4	1998-02-26 	1998-03-26 	1998-03-04 	1	33	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10914	QUEEN	6	1998-02-27 	1998-03-27 	1998-03-02 	1	21	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10915	TORTU	2	1998-02-27 	1998-03-27 	1998-03-02 	2	4	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
10916	RANCH	1	1998-02-27 	1998-03-27 	1998-03-09 	2	64	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
10917	ROMEY	4	1998-03-02 	1998-03-30 	1998-03-11 	2	8	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
10918	BOTTM	3	1998-03-02 	1998-03-30 	1998-03-11 	3	49	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10919	LINOD	2	1998-03-02 	1998-03-30 	1998-03-04 	2	20	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10920	AROUT	4	1998-03-03 	1998-03-31 	1998-03-09 	2	30	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10921	VAFFE	1	1998-03-03 	1998-04-14 	1998-03-09 	1	176	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10922	HANAR	5	1998-03-03 	1998-03-31 	1998-03-05 	3	63	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10923	LAMAI	7	1998-03-03 	1998-04-14 	1998-03-13 	3	68	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
10924	BERGS	3	1998-03-04 	1998-04-01 	1998-04-08 	2	152	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Sweden
10925	HANAR	3	1998-03-04 	1998-04-01 	1998-03-13 	1	2	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10926	ANATR	4	1998-03-04 	1998-04-01 	1998-03-11 	3	40	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexico
10927	LACOR	4	1998-03-05 	1998-04-02 	1998-04-08 	1	20	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10928	GALED	1	1998-03-05 	1998-04-02 	1998-03-18 	1	1	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spain
10929	FRANK	6	1998-03-05 	1998-04-02 	1998-03-12 	1	34	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
10930	SUPRD	4	1998-03-06 	1998-04-17 	1998-03-18 	3	16	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
10931	RICSU	4	1998-03-06 	1998-03-20 	1998-03-19 	2	14	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10932	BONAP	8	1998-03-06 	1998-04-03 	1998-03-24 	1	135	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10933	ISLAT	6	1998-03-06 	1998-04-03 	1998-03-16 	3	54	Island Trading	Garden House\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10934	LEHMS	3	1998-03-09 	1998-04-06 	1998-03-12 	3	32	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
10935	WELLI	4	1998-03-09 	1998-04-06 	1998-03-18 	3	48	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
10936	GREAL	3	1998-03-09 	1998-04-06 	1998-03-18 	2	34	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10937	CACTU	7	1998-03-10 	1998-03-24 	1998-03-13 	3	32	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
10938	QUICK	3	1998-03-10 	1998-04-07 	1998-03-16 	2	32	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10939	MAGAA	2	1998-03-10 	1998-04-07 	1998-03-13 	2	76	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10940	BONAP	8	1998-03-11 	1998-04-08 	1998-03-23 	3	20	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
10941	SAVEA	7	1998-03-11 	1998-04-08 	1998-03-20 	2	401	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10942	REGGC	9	1998-03-11 	1998-04-08 	1998-03-18 	3	18	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
10943	BSBEV	4	1998-03-11 	1998-04-08 	1998-03-19 	2	2	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10944	BOTTM	6	1998-03-12 	1998-03-26 	1998-03-13 	3	53	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10945	MORGK	4	1998-03-12 	1998-04-09 	1998-03-18 	1	10	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Germany
10946	VAFFE	1	1998-03-12 	1998-04-09 	1998-03-19 	2	27	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10947	BSBEV	3	1998-03-13 	1998-04-10 	1998-03-16 	2	3	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
10948	GODOS	3	1998-03-13 	1998-04-10 	1998-03-19 	3	23	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
10949	BOTTM	2	1998-03-13 	1998-04-10 	1998-03-17 	3	74	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10950	MAGAA	1	1998-03-16 	1998-04-13 	1998-03-23 	2	2	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italy
10951	RICSU	9	1998-03-16 	1998-04-27 	1998-04-07 	2	31	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
10952	ALFKI	1	1998-03-16 	1998-04-27 	1998-03-24 	1	40	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
10953	AROUT	9	1998-03-16 	1998-03-30 	1998-03-25 	2	24	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
10954	LINOD	5	1998-03-17 	1998-04-28 	1998-03-20 	1	28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10955	FOLKO	8	1998-03-17 	1998-04-14 	1998-03-20 	2	3	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10956	BLAUS	6	1998-03-17 	1998-04-28 	1998-03-20 	2	45	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
10957	HILAA	8	1998-03-18 	1998-04-15 	1998-03-27 	3	105	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10958	OCEAN	7	1998-03-18 	1998-04-15 	1998-03-27 	2	50	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina
10959	GOURL	6	1998-03-18 	1998-04-29 	1998-03-23 	2	5	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
10960	HILAA	3	1998-03-19 	1998-04-02 	1998-04-08 	1	2	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10961	QUEEN	8	1998-03-19 	1998-04-16 	1998-03-30 	1	104	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
10962	QUICK	8	1998-03-19 	1998-04-16 	1998-03-23 	2	276	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10963	FURIB	9	1998-03-19 	1998-04-16 	1998-03-26 	3	3	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10964	SPECD	3	1998-03-20 	1998-04-17 	1998-03-24 	2	87	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
10965	OLDWO	6	1998-03-20 	1998-04-17 	1998-03-30 	3	144	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10966	CHOPS	4	1998-03-20 	1998-04-17 	1998-04-08 	1	27	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
10967	TOMSP	2	1998-03-23 	1998-04-20 	1998-04-02 	2	62	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Germany
10968	ERNSH	1	1998-03-23 	1998-04-20 	1998-04-01 	3	75	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10969	COMMI	1	1998-03-23 	1998-04-20 	1998-03-30 	2	0	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brazil
10970	BOLID	9	1998-03-24 	1998-04-07 	1998-04-24 	1	16	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spain
10971	FRANR	2	1998-03-24 	1998-04-21 	1998-04-02 	2	122	France restauration	54, rue Royale	Nantes	\N	44000	France
10972	LACOR	4	1998-03-24 	1998-04-21 	1998-03-26 	2	0	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10973	LACOR	6	1998-03-24 	1998-04-21 	1998-03-27 	2	15	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	France
10974	SPLIR	3	1998-03-25 	1998-04-08 	1998-04-03 	3	13	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10975	BOTTM	1	1998-03-25 	1998-04-22 	1998-03-27 	3	32	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10976	HILAA	1	1998-03-25 	1998-05-06 	1998-04-03 	1	38	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10977	FOLKO	8	1998-03-26 	1998-04-23 	1998-04-10 	3	208	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10978	MAISD	9	1998-03-26 	1998-04-23 	1998-04-23 	2	33	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
10979	ERNSH	8	1998-03-26 	1998-04-23 	1998-03-31 	2	353	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10980	FOLKO	4	1998-03-27 	1998-05-08 	1998-04-17 	1	1	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10981	HANAR	1	1998-03-27 	1998-04-24 	1998-04-02 	2	193	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10982	BOTTM	2	1998-03-27 	1998-04-24 	1998-04-08 	1	14	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10983	SAVEA	2	1998-03-27	1998-04-24 	1998-04-06 	2	658	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10984	SAVEA	1	1998-03-30 	1998-04-27 	1998-04-03 	3	211	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10985	HUNGO	2	1998-03-30 	1998-04-27 	1998-04-02 	1	92	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
10986	OCEAN	8	1998-03-30 	1998-04-27 	1998-04-21 	2	218	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\nPiso 20-A	Buenos Aires	\N	1010	Argentina
10987	EASTC	8	1998-03-31 	1998-04-28 	1998-04-06 	1	185	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
10988	RATTC	3	1998-03-31 	1998-04-28 	1998-04-10 	2	61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10989	QUEDE	2	1998-03-31 	1998-04-28 	1998-04-02 	1	35	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brazil
10990	ERNSH	2	1998-04-01 	1998-05-13 	1998-04-07 	3	118	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
10991	QUICK	1	1998-04-01 	1998-04-29 	1998-04-07 	1	39	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10992	THEBI	1	1998-04-01 	1998-04-29 	1998-04-03 	3	4	The Big Cheese	89 Jefferson Way\nSuite 2	Portland	OR	97201	USA
10993	FOLKO	7	1998-04-01 	1998-04-29 	1998-04-10 	3	9	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
10994	VAFFE	2	1998-04-02 	1998-04-16 	1998-04-09 	3	66	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Denmark
10995	PERIC	1	1998-04-02 	1998-04-30 	1998-04-06 	3	46	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
10996	QUICK	4	1998-04-02 	1998-04-30 	1998-04-10 	2	1	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
10997	LILAS	8	1998-04-03 	1998-05-15 	1998-04-13 	2	74	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10998	WOLZA	8	1998-04-03 	1998-04-17 	1998-04-17 	2	20	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
10999	OTTIK	6	1998-04-03 	1998-05-01 	1998-04-10 	2	96	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
11000	RATTC	2	1998-04-06 	1998-05-04 	1998-04-14 	3	55	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
11001	FOLKO	2	1998-04-06 	1998-05-04 	1998-04-14 	2	197	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
11002	SAVEA	4	1998-04-06 	1998-05-04 	1998-04-16 	1	141	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11003	THECR	3	1998-04-06 	1998-05-04 	1998-04-08 	3	15	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
11004	MAISD	3	1998-04-07 	1998-05-05 	1998-04-20 	1	45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgium
11005	WILMK	2	1998-04-07 	1998-05-05 	1998-04-10 	1	1	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finland
11006	GREAL	3	1998-04-07 	1998-05-05 	1998-04-15 	2	25	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11007	PRINI	8	1998-04-08 	1998-05-06 	1998-04-13 	2	202	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
11008	ERNSH	7	1998-04-08 	1998-05-06 	\N	3	79	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11009	GODOS	2	1998-04-08 	1998-05-06 	1998-04-10 	1	59	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
11010	REGGC	2	1998-04-09 	1998-05-07 	1998-04-21 	2	29	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
11011	ALFKI	3	1998-04-09 	1998-05-07 	1998-04-13 	1	1	Alfreds Futterkiste	Obere Str. 57	Berlin	\N	12209	Germany
11012	FRANK	1	1998-04-09 	1998-04-23 	1998-04-17 	3	243	Frankenversand	Berliner Platz 43	München	\N	80805	Germany
11013	ROMEY	2	1998-04-09 	1998-05-07 	1998-04-10 	1	33	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spain
11014	LINOD	2	1998-04-10 	1998-05-08 	1998-04-15 	3	24	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11015	SANTG	2	1998-04-10 	1998-04-24 	1998-04-20 	2	5	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norway
11016	AROUT	9	1998-04-10 	1998-05-08 	1998-04-13 	2	34	Around the Horn	Brook Farm\nStratford St. Mary	Colchester	Essex	CO7 6JX	UK
11017	ERNSH	9	1998-04-13 	1998-05-11 	1998-04-20 	2	754	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11018	LONEP	4	1998-04-13 	1998-05-11 	1998-04-16 	2	12	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
11019	RANCH	6	1998-04-13 	1998-05-11 	\N	3	3	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentina
11020	OTTIK	2	1998-04-14 	1998-05-12 	1998-04-16 	2	43	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Germany
11021	QUICK	3	1998-04-14 	1998-05-12 	1998-04-21 	1	297	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Germany
11022	HANAR	9	1998-04-14 	1998-05-12 	1998-05-04 	2	6	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
11023	BSBEV	1	1998-04-14 	1998-04-28 	1998-04-24 	2	124	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	UK
11024	EASTC	4	1998-04-15 	1998-05-13 	1998-04-20 	1	74	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11025	WARTH	6	1998-04-15 	1998-05-13 	1998-04-24 	3	29	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finland
11026	FRANS	4	1998-04-15 	1998-05-13 	1998-04-28 	1	47	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
11027	BOTTM	1	1998-04-16 	1998-05-14 	1998-04-20 	1	53	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11028	KOENE	2	1998-04-16 	1998-05-14 	1998-04-22 	1	30	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Germany
11029	CHOPS	4	1998-04-16 	1998-05-14 	1998-04-27 	1	48	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
11030	SAVEA	7	1998-04-17 	1998-05-15 	1998-04-27 	2	831	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11031	SAVEA	6	1998-04-17 	1998-05-15 	1998-04-24 	2	227	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11032	WHITC	2	1998-04-17 	1998-05-15 	1998-04-23 	3	606	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11033	RICSU	7	1998-04-17 	1998-05-15 	1998-04-23 	3	85	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
11034	OLDWO	8	1998-04-20 	1998-06-01 	1998-04-27 	1	40	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
11035	SUPRD	2	1998-04-20 	1998-05-18 	1998-04-24 	2	0	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
11036	DRACD	8	1998-04-20 	1998-05-18 	1998-04-22 	3	149	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
11037	GODOS	7	1998-04-21 	1998-05-19 	1998-04-27 	1	3	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spain
11038	SUPRD	1	1998-04-21 	1998-05-19 	1998-04-30 	2	30	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgium
11039	LINOD	1	1998-04-21 	1998-05-19 	\N	2	65	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11040	GREAL	4	1998-04-22 	1998-05-20 	\N	3	19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11041	CHOPS	3	1998-04-22 	1998-05-20 	1998-04-28 	2	48	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Switzerland
11042	COMMI	2	1998-04-22 	1998-05-06 	1998-05-01 	1	30	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brazil
11043	SPECD	5	1998-04-22 	1998-05-20 	1998-04-29 	2	9	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	France
11044	WOLZA	4	1998-04-23 	1998-05-21 	1998-05-01 	1	9	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Poland
11045	BOTTM	6	1998-04-23 	1998-05-21 	\N	2	71	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11046	WANDK	8	1998-04-23 	1998-05-21 	1998-04-24 	2	72	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Germany
11047	EASTC	7	1998-04-24 	1998-05-22 	1998-05-01 	3	47	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11048	BOTTM	7	1998-04-24 	1998-05-22 	1998-04-30 	3	24	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11049	GOURL	3	1998-04-24 	1998-05-22 	1998-05-04 	1	8	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brazil
11050	FOLKO	8	1998-04-27 	1998-05-25 	1998-05-05 	2	59	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Sweden
11051	LAMAI	7	1998-04-27 	1998-05-25 	\N	3	3	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	France
11052	HANAR	3	1998-04-27 	1998-05-25 	1998-05-01 	1	67	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
11053	PICCO	2	1998-04-27 	1998-05-25 	1998-04-29 	2	53	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Austria
11054	CACTU	8	1998-04-28 	1998-05-26 	\N	1	0	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentina
11055	HILAA	7	1998-04-28 	1998-05-26 	1998-05-05 	2	121	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
11056	EASTC	8	1998-04-28 	1998-05-12 	1998-05-01 	2	279	Eastern Connection	35 King George	London	\N	WX3 6FW	UK
11057	NORTS	3	1998-04-29 	1998-05-27 	1998-05-01 	3	4	North/South	South House\n300 Queensbridge	London	\N	SW7 1RZ	UK
11058	BLAUS	9	1998-04-29 	1998-05-27 	\N	3	31	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Germany
11059	RICAR	2	1998-04-29 	1998-06-10 	\N	2	86	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brazil
11060	FRANS	2	1998-04-30 	1998-05-28 	1998-05-04 	2	11	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italy
11061	GREAL	4	1998-04-30 	1998-06-11 	\N	3	14	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11062	REGGC	4	1998-04-30 	1998-05-28 	\N	2	30	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italy
11063	HUNGO	3	1998-04-30 	1998-05-28 	1998-05-06 	2	82	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Ireland
11064	SAVEA	1	1998-05-01 	1998-05-29 	1998-05-04 	1	30	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11065	LILAS	8	1998-05-01 	1998-05-29 	\N	1	13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11066	WHITC	7	1998-05-01 	1998-05-29 	1998-05-04 	2	45	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11067	DRACD	1	1998-05-04 	1998-05-18 	1998-05-06 	2	8	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Germany
11068	QUEEN	8	1998-05-04 	1998-06-01 	\N	2	82	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brazil
11069	TORTU	1	1998-05-04 	1998-06-01 	1998-05-06 	2	16	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexico
11070	LEHMS	2	1998-05-05 	1998-06-02 	\N	1	136	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Germany
11071	LILAS	1	1998-05-05 	1998-06-02 	\N	1	1	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11072	ERNSH	4	1998-05-05 	1998-06-02 	\N	2	259	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Austria
11073	PERIC	2	1998-05-05 	1998-06-02 	\N	2	25	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexico
11074	SIMOB	7	1998-05-06 	1998-06-03 	\N	2	18	Simons bistro	Vinbæltet 34	København	\N	1734	Denmark
11075	RICSU	8	1998-05-06 	1998-06-03 	\N	2	6	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Switzerland
11076	BONAP	4	1998-05-06 	1998-06-03 	\N	2	38	Bon app'	12, rue des Bouchers	Marseille	\N	13008	France
11077	RATTC	1	1998-05-06 	1998-06-03 	\N	2	9	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) FROM stdin;
1	Chai	1	1	10 boxes x 20 bags	18	39	0	10	0
2	Chang	1	1	24 - 12 oz bottles	19	17	40	25	0
3	Aniseed Syrup	1	2	12 - 550 ml bottles	10	13	70	25	0
4	Chef Anton's Cajun Seasoning	2	2	48 - 6 oz jars	22	53	0	0	0
5	Chef Anton's Gumbo Mix	2	2	36 boxes	21	0	0	0	1
6	Grandma's Boysenberry Spread	3	2	12 - 8 oz jars	25	120	0	25	0
7	Uncle Bob's Organic Dried Pears	3	7	12 - 1 lb pkgs.	30	15	0	10	0
8	Northwoods Cranberry Sauce	3	2	12 - 12 oz jars	40	6	0	0	0
9	Mishi Kobe Niku	4	6	18 - 500 g pkgs.	97	29	0	0	1
10	Ikura	4	8	12 - 200 ml jars	31	31	0	0	0
11	Queso Cabrales	5	4	1 kg pkg.	21	22	30	30	0
12	Queso Manchego La Pastora	5	4	10 - 500 g pkgs.	38	86	0	0	0
13	Konbu	6	8	2 kg box	6	24	0	5	0
14	Tofu	6	7	40 - 100 g pkgs.	23	35	0	0	0
15	Genen Shouyu	6	2	24 - 250 ml bottles	16	39	0	5	0
16	Pavlova	7	3	32 - 500 g boxes	17	29	0	10	0
17	Alice Mutton	7	6	20 - 1 kg tins	39	0	0	0	1
18	Carnarvon Tigers	7	8	16 kg pkg.	62	42	0	0	0
19	Teatime Chocolate Biscuits	8	3	10 boxes x 12 pieces	9	25	0	5	0
20	Sir Rodney's Marmalade	8	3	30 gift boxes	81	40	0	0	0
21	Sir Rodney's Scones	8	3	24 pkgs. x 4 pieces	10	3	40	5	0
22	Gustaf's Knäckebröd	9	5	24 - 500 g pkgs.	21	104	0	25	0
23	Tunnbröd	9	5	12 - 250 g pkgs.	9	61	0	25	0
24	Guaraná Fantástica	10	1	12 - 355 ml cans	4	20	0	0	1
25	NuNuCa Nuß-Nougat-Creme	11	3	20 - 450 g glasses	14	76	0	30	0
26	Gumbär Gummibärchen	11	3	100 - 250 g bags	31	15	0	0	0
27	Schoggi Schokolade	11	3	100 - 100 g pieces	44	49	0	30	0
28	Rössle Sauerkraut	12	7	25 - 825 g cans	46	26	0	0	1
29	Thüringer Rostbratwurst	12	6	50 bags x 30 sausgs.	124	0	0	0	1
30	Nord-Ost Matjeshering	13	8	10 - 200 g glasses	26	10	0	15	0
31	Gorgonzola Telino	14	4	12 - 100 g pkgs	12	0	70	20	0
32	Mascarpone Fabioli	14	4	24 - 200 g pkgs.	32	9	40	25	0
33	Geitost	15	4	500 g	2	112	0	20	0
34	Sasquatch Ale	16	1	24 - 12 oz bottles	14	111	0	15	0
35	Steeleye Stout	16	1	24 - 12 oz bottles	18	20	0	15	0
36	Inlagd Sill	17	8	24 - 250 g  jars	19	112	0	20	0
37	Gravad lax	17	8	12 - 500 g pkgs.	26	11	50	25	0
38	Côte de Blaye	18	1	12 - 75 cl bottles	264	17	0	15	0
39	Chartreuse verte	18	1	750 cc per bottle	18	69	0	5	0
40	Boston Crab Meat	19	8	24 - 4 oz tins	18	123	0	30	0
41	Jack's New England Clam Chowder	19	8	12 - 12 oz cans	10	85	0	10	0
42	Singaporean Hokkien Fried Mee	20	5	32 - 1 kg pkgs.	14	26	0	0	1
43	Ipoh Coffee	20	1	16 - 500 g tins	46	17	10	25	0
44	Gula Malacca	20	2	20 - 2 kg bags	19	27	0	15	0
45	Røgede sild	21	8	1k pkg.	10	5	70	15	0
46	Spegesild	21	8	4 - 450 g glasses	12	95	0	0	0
47	Zaanse koeken	22	3	10 - 4 oz boxes	10	36	0	0	0
48	Chocolade	22	3	10 pkgs.	13	15	70	25	0
49	Maxilaku	23	3	24 - 50 g pkgs.	20	10	60	15	0
50	Valkoinen suklaa	23	3	12 - 100 g bars	16	65	0	30	0
51	Manjimup Dried Apples	24	7	50 - 300 g pkgs.	53	20	0	10	0
52	Filo Mix	24	5	16 - 2 kg boxes	7	38	0	25	0
53	Perth Pasties	24	6	48 pieces	33	0	0	0	1
54	Tourtière	25	6	16 pies	7	21	0	10	0
55	Pâté chinois	25	6	24 boxes x 2 pies	24	115	0	20	0
56	Gnocchi di nonna Alice	26	5	24 - 250 g pkgs.	38	21	10	30	0
57	Ravioli Angelo	26	5	24 - 250 g pkgs.	20	36	0	20	0
58	Escargots de Bourgogne	27	8	24 pieces	13	62	0	20	0
59	Raclette Courdavault	28	4	5 kg pkg.	55	79	0	0	0
60	Camembert Pierrot	28	4	15 - 300 g rounds	34	19	0	0	0
61	Sirop d'érable	29	2	24 - 500 ml bottles	28	113	0	25	0
62	Tarte au sucre	29	3	48 pies	49	17	0	0	0
63	Vegie-spread	7	2	15 - 625 g jars	44	24	0	5	0
64	Wimmers gute Semmelknödel	12	5	20 bags x 4 pieces	33	22	80	30	0
65	Louisiana Fiery Hot Pepper Sauce	2	2	32 - 8 oz bottles	21	76	0	0	0
66	Louisiana Hot Spiced Okra	2	2	24 - 8 oz jars	17	4	100	20	0
67	Laughing Lumberjack Lager	16	1	24 - 12 oz bottles	14	52	0	10	0
68	Scottish Longbreads	8	3	10 boxes x 8 pieces	12	6	10	15	0
69	Gudbrandsdalsost	15	4	10 kg pkg.	36	26	0	15	0
70	Outback Lager	7	1	24 - 355 ml bottles	15	15	10	30	0
71	Fløtemysost	15	4	10 - 500 g pkgs.	22	26	0	0	0
72	Mozzarella di Giovanni	14	4	24 - 200 g pkgs.	35	14	0	0	0
73	Röd Kaviar	17	8	24 - 150 g jars	15	101	0	5	0
74	Longlife Tofu	4	7	5 kg pkg.	10	4	20	5	0
75	Rhönbräu Klosterbier	12	1	24 - 0.5 l bottles	8	125	0	25	0
76	Lakkalikööri	23	1	500 ml 	18	57	0	20	0
77	Original Frankfurter grüne Soße	12	2	12 boxes	13	32	0	15	0
\.


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY shippers (shipperid, companyname, phone) FROM stdin;
1	Speedy Express	(503) 555-9831
2	United Package	(503) 555-3199
3	Federal Shipping	(503) 555-9931
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: mjm
--

COPY suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) FROM stdin;
1	Exotic Liquids	Charlotte Cooper	Purchasing Manager	49 Gilbert St.	London	\N	EC1 4SD	UK	(171) 555-2222	\N	\N
2	New Orleans Cajun Delights	Shelley Burke	Order Administrator	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	\N	\N
3	Grandma Kelly's Homestead	Regina Murphy	Sales Representative	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	\N
4	Tokyo Traders	Yoshi Nagase	Marketing Manager	9-8 Sekimai\nMusashino-shi	Tokyo	\N	100	Japan	(03) 3555-5011	\N	\N
5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra 	Export Administrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spain	(98) 598 76 54	\N	\N
6	Mayumi's	Mayumi Ohno	Marketing Representative	92 Setsuko\nChuo-ku	Osaka	\N	545	Japan	(06) 431-7877	\N	Mayumi's (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
7	Pavlova, Ltd.	Ian Devling	Marketing Manager	74 Rose St.\nMoonie Ponds	Melbourne	Victoria	3058	Australia	(03) 444-2343	(03) 444-6588	\N
8	Specialty Biscuits, Ltd.	Peter Wilson	Sales Representative	29 King's Way	Manchester	\N	M14 GSD	UK	(161) 555-4448	\N	\N
9	PB Knäckebröd AB	Lars Peterson	Sales Agent	Kaloadagatan 13	Göteborg	\N	S-345 67	Sweden	031-987 65 43	031-987 65 91	\N
10	Refrescos Americanas LTDA	Carlos Diaz	Marketing Manager	Av. das Americanas 12.890	São Paulo	\N	5442	Brazil	(11) 555 4640	\N	\N
11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Sales Manager	Tiergartenstraße 5	Berlin	\N	10785	Germany	(010) 9984510	\N	\N
12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	International Marketing Mgr.	Bogenallee 51	Frankfurt	\N	60439	Germany	(069) 992755	\N	Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Coordinator Foreign Markets	Frahmredder 112a	Cuxhaven	\N	27478	Germany	(04721) 8713	(04721) 8714	\N
14	Formaggi Fortini s.r.l.	Elio Rossi	Sales Representative	Viale Dante, 75	Ravenna	\N	48100	Italy	(0544) 60323	(0544) 60603	\N
15	Norske Meierier	Beate Vileid	Marketing Manager	Hatlevegen 5	Sandvika	\N	1320	Norway	(0)2-953010	\N	\N
16	Bigfoot Breweries	Cheryl Saylor	Regional Account Rep.	3400 - 8th Avenue\nSuite 210	Bend	OR	97101	USA	(503) 555-9931	\N	\N
17	Svensk Sjöföda AB	Michael Björn	Sales Representative	Brovallavägen 231	Stockholm	\N	S-123 45	Sweden	08-123 45 67	\N	\N
18	Aux joyeux ecclésiastiques	Guylène Nodier	Sales Manager	203, Rue des Francs-Bourgeois	Paris	\N	75004	France	(1) 03.83.00.68	(1) 03.83.00.62	\N
19	New England Seafood Cannery	Robb Merchant	Wholesale Account Agent	Order Processing Dept.\n2100 Paul Revere Blvd.	Boston	MA	02134	USA	(617) 555-3267	(617) 555-3389	\N
20	Leka Trading	Chandra Leka	Owner	471 Serangoon Loop, Suite #402	Singapore	\N	0512	Singapore	555-8787	\N	\N
21	Lyngbysild	Niels Petersen	Sales Manager	Lyngbysild\nFiskebakken 10	Lyngby	\N	2800	Denmark	43844108	43844115	\N
22	Zaanse Snoepfabriek	Dirk Luchte	Accounting Manager	Verkoop\nRijnweg 22	Zaandam	\N	9999 ZZ	Netherlands	(12345) 1212	(12345) 1210	\N
23	Karkki Oy	Anne Heikkonen	Product Manager	Valtakatu 12	Lappeenranta	\N	53120	Finland	(953) 10956	\N	\N
24	G'day, Mate	Wendy Mackenzie	Sales Representative	170 Prince Edward Parade\nHunter's Hill	Sydney	NSW	2042	Australia	(02) 555-5914	(02) 555-4873	G'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
25	Ma Maison	Jean-Guy Lauzon	Marketing Manager	2960 Rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-9022	\N	\N
26	Pasta Buttini s.r.l.	Giovanni Giudici	Order Administrator	Via dei Gelsomini, 153	Salerno	\N	84100	Italy	(089) 6547665	(089) 6547667	\N
27	Escargots Nouveaux	Marie Delamare	Sales Manager	22, rue H. Voiron	Montceau	\N	71300	France	85.57.00.07	\N	\N
28	Gai pâturage	Eliane Noz	Sales Representative	Bat. B\n3, rue des Alpes	Annecy	\N	74000	France	38.76.98.06	38.76.98.58	\N
29	Forêts d'érables	Chantal Goulet	Accounting Manager	148 rue Chasseur	Ste-Hyacinthe	Québec	J2S 7S8	Canada	(514) 555-2955	(514) 555-2921	\N
\.


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- Name: orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (orderid, productid);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (shipperid);


--
-- Name: suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: mjm; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


CREATE INDEX cust1 ON customers(customerid);
CREATE INDEX cust2 ON customers(companyname);
CREATE INDEX emp1 ON employees(employeeid);
CREATE INDEX od1 ON orderdetails(orderid);
CREATE INDEX od2 ON orderdetails(productid);
CREATE INDEX ord1 ON orders(orderid);
CREATE INDEX ord2 ON orders(customerid);
CREATE INDEX ord3 ON orders(employeeid);
CREATE INDEX ord4 ON orders(requireddate);
CREATE INDEX ord5 ON orders(orderdate);
CREATE INDEX ord6 ON orders(shippeddate);  
CREATE INDEX prod1 ON products(productid);
CREATE INDEX prod2 ON  products(productname);
CREATE INDEX prod3 ON products(supplierid);
CREATE INDEX sup1 ON suppliers(supplierid);
CREATE INDEX sup2 ON suppliers(companyname);