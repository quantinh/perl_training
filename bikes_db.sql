PGDMP                         {            bikes_db    15.3    15.2 3               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49303    bikes_db    DATABASE     t   CREATE DATABASE bikes_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE bikes_db;
                postgres    false            �            1259    49304    brand    TABLE     �   CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(100),
    country character varying(100),
    company character varying(100),
    image character varying(255)
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    49309    brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.brand_id_seq;
       public          postgres    false    214                       0    0    brand_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;
          public          postgres    false    215            �            1259    49310    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer,
    product_detail_id integer,
    quantity numeric
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    49315    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    216                       0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    217            �            1259    49316    category    TABLE     }   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100),
    image character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    49319    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    218                       0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    219            �            1259    49320    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100),
    brand_id integer,
    category_id integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    49323    product_detail    TABLE     �  CREATE TABLE public.product_detail (
    id integer NOT NULL,
    name character varying(100),
    status character varying(100),
    manufactured_year numeric,
    fuel character varying(100),
    color character varying(50),
    price numeric,
    mileage numeric,
    displacement character varying(20),
    city character varying(100),
    image character varying(255),
    description text,
    product_id integer
);
 "   DROP TABLE public.product_detail;
       public         heap    postgres    false            �            1259    49328    product_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_detail_id_seq;
       public          postgres    false    221                       0    0    product_detail_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_detail_id_seq OWNED BY public.product_detail.id;
          public          postgres    false    222            �            1259    49329    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    220                       0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    223            �            1259    49330    users    TABLE     ,  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50),
    password character varying(255),
    phone character varying(10),
    fullname character varying(50),
    gender character varying(20),
    address character varying(255),
    email character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    49335    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    224                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    225            Z           2604    49336    brand id    DEFAULT     d   ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);
 7   ALTER TABLE public.brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            [           2604    49337    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            \           2604    49338    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ]           2604    49339 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    220            ^           2604    49340    product_detail id    DEFAULT     v   ALTER TABLE ONLY public.product_detail ALTER COLUMN id SET DEFAULT nextval('public.product_detail_id_seq'::regclass);
 @   ALTER TABLE public.product_detail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            _           2604    49341    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �          0    49304    brand 
   TABLE DATA           B   COPY public.brand (id, name, country, company, image) FROM stdin;
    public          postgres    false    214   �8                 0    49310    cart 
   TABLE DATA           H   COPY public.cart (id, user_id, product_detail_id, quantity) FROM stdin;
    public          postgres    false    216   �9                 0    49316    category 
   TABLE DATA           3   COPY public.category (id, name, image) FROM stdin;
    public          postgres    false    218   �9                 0    49320    product 
   TABLE DATA           B   COPY public.product (id, name, brand_id, category_id) FROM stdin;
    public          postgres    false    220   ":                 0    49323    product_detail 
   TABLE DATA           �   COPY public.product_detail (id, name, status, manufactured_year, fuel, color, price, mileage, displacement, city, image, description, product_id) FROM stdin;
    public          postgres    false    221   �:       	          0    49330    users 
   TABLE DATA           `   COPY public.users (id, username, password, phone, fullname, gender, address, email) FROM stdin;
    public          postgres    false    224   <                  0    0    brand_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brand_id_seq', 1, false);
          public          postgres    false    215                       0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 1, false);
          public          postgres    false    217                       0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    219                       0    0    product_detail_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_detail_id_seq', 1, false);
          public          postgres    false    222                       0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    223                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          postgres    false    225            a           2606    49343    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    214            c           2606    49345    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    216            e           2606    49347    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    218            i           2606    49349 "   product_detail product_detail_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_pkey;
       public            postgres    false    221            g           2606    49351    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    220            k           2606    49353    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            l           2606    49354     cart cart_product_detail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_detail_id_fkey FOREIGN KEY (product_detail_id) REFERENCES public.product_detail(id);
 J   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_product_detail_id_fkey;
       public          postgres    false    216    221    3945            m           2606    49359    cart cart_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          postgres    false    216    224    3947            n           2606    49364    product product_brand_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);
 G   ALTER TABLE ONLY public.product DROP CONSTRAINT product_brand_id_fkey;
       public          postgres    false    3937    214    220            o           2606    49369     product product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_category_id_fkey;
       public          postgres    false    3941    218    220            p           2606    49374 -   product_detail product_detail_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 W   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_product_id_fkey;
       public          postgres    false    221    3943    220            �   �   x�e��
�0�ϛ��H��{U��=���j�m7!I���j�x�ٙ��1��J�-�p����#���_a��&p��o<��|x�����*A� k�E�����h#������{�3*;筒.���@�a�.����-RK�U�Z��)����%O6!��
bXw���<6}qf��Rэ�DDo�+c��ui�            x������ � �         u   x�3�HU(I�THOT����L���-N��/I-�+.K�2�?�=Q"����0��8�(O!;(����p��<�������#3�n������\R���6��K�NM��3F��� ��7         �   x��I
A�Y����.^GAAF�G\�K1��K{�F���5#"5�|��Q+�b��&��<�*�m5�A ����=��7q�l���}��M8T�`ȣ�vY�jK�2�'�Zr����[�P_�#"�� �         B  x���]k�0������C��jo;���Iu_��C�i�k����V��@���9�y��	07Ŗx8�|�k29�� Oz>�.m�i�u�I)!�+���͚���v��jc*�񬫢3�����kcn����~
l��+����_|��?mL���G��27ŵ�쉟hCbA�YS��cp��Dgp)G��>b��uqu��&���oD��)�ĉrՓ�R�����kew����?J��"#~B
(�a�Ȩ�?Tm�RE=>��n���8����^�6�;���|L�σdt^�^`|�t�����.�?3X6��[Þ+�W��@��       	   �  x����r�0�x
��f|���3PbpL⤘�F�/[N�\L��>A}�vۙ.��֝�Gߤ2!�7eխ4��7��׌�s�w��v���*�m�TnPJ;uڰ5����ŕ���[dG[�o#�mf�jߥ�{$YQ�k:F ���h��@�A�jÛt�y)��B�U�yt>M��EԿ1�lC��#"��D����ԕW��vq��@R5�`UGX�:�8ѐ�D98��q�� �.�?
)*!u!�`��19:�O<���i{��k�<����=�.O�&�noO���8tHǍ�鉛��8�{ɰ,KϘT`�ņ�dZm�\�h ]2�t5c���py��StՍ�x���1�͑댍du����o��~�{rD>��ç���s FV0:HCQW�%�s����yM�/34G��rK�������ܮf�=z]PD;��QI)���K���0�?�a�חб�Ϗ�gh���!��y�V���>     