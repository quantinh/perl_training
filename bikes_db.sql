PGDMP     #                    {            bikes_db    15.3    15.2 3               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32770    bikes_db    DATABASE     t   CREATE DATABASE bikes_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE bikes_db;
                postgres    false            �            1259    32892    brand    TABLE     �   CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(100),
    country character varying(100),
    company character varying(100)
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    32891    brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.brand_id_seq;
       public          postgres    false    217                       0    0    brand_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;
          public          postgres    false    216            �            1259    32960    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer,
    product_detail_id integer,
    quantity numeric
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    32959    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    225                       0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    224            �            1259    32899    category    TABLE     }   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100),
    image character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    32898    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    219                       0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    218            �            1259    32906    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100),
    brand_id integer,
    category_id integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    32946    product_detail    TABLE     �  CREATE TABLE public.product_detail (
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
       public         heap    postgres    false            �            1259    32945    product_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_detail_id_seq;
       public          postgres    false    223                       0    0    product_detail_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_detail_id_seq OWNED BY public.product_detail.id;
          public          postgres    false    222            �            1259    32905    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221                       0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            �            1259    32885    users    TABLE     ,  CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    32884    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            [           2604    32895    brand id    DEFAULT     d   ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);
 7   ALTER TABLE public.brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            _           2604    32963    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            \           2604    32902    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ]           2604    32909 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            ^           2604    32949    product_detail id    DEFAULT     v   ALTER TABLE ONLY public.product_detail ALTER COLUMN id SET DEFAULT nextval('public.product_detail_id_seq'::regclass);
 @   ALTER TABLE public.product_detail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            Z           2604    32888    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    32892    brand 
   TABLE DATA           ;   COPY public.brand (id, name, country, company) FROM stdin;
    public          postgres    false    217   �8       
          0    32960    cart 
   TABLE DATA           H   COPY public.cart (id, user_id, product_detail_id, quantity) FROM stdin;
    public          postgres    false    225   k9                 0    32899    category 
   TABLE DATA           3   COPY public.category (id, name, image) FROM stdin;
    public          postgres    false    219   �9                 0    32906    product 
   TABLE DATA           B   COPY public.product (id, name, brand_id, category_id) FROM stdin;
    public          postgres    false    221   �9                 0    32946    product_detail 
   TABLE DATA           �   COPY public.product_detail (id, name, status, manufactured_year, fuel, color, price, mileage, displacement, city, image, description, product_id) FROM stdin;
    public          postgres    false    223   �:                  0    32885    users 
   TABLE DATA           `   COPY public.users (id, username, password, phone, fullname, gender, address, email) FROM stdin;
    public          postgres    false    215   �;                  0    0    brand_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brand_id_seq', 1, false);
          public          postgres    false    216                       0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 1, false);
          public          postgres    false    224                       0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    218                       0    0    product_detail_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_detail_id_seq', 1, false);
          public          postgres    false    222                       0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    220                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public          postgres    false    214            c           2606    32897    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    217            k           2606    32967    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    225            e           2606    32904    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    219            i           2606    32953 "   product_detail product_detail_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_pkey;
       public            postgres    false    223            g           2606    32911    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            a           2606    32890    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            o           2606    32973     cart cart_product_detail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_detail_id_fkey FOREIGN KEY (product_detail_id) REFERENCES public.product_detail(id);
 J   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_product_detail_id_fkey;
       public          postgres    false    225    223    3945            p           2606    32968    cart cart_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          postgres    false    225    215    3937            l           2606    32912    product product_brand_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);
 G   ALTER TABLE ONLY public.product DROP CONSTRAINT product_brand_id_fkey;
       public          postgres    false    3939    217    221            m           2606    32917     product product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_category_id_fkey;
       public          postgres    false    3941    219    221            n           2606    32954 -   product_detail product_detail_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 W   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_product_id_fkey;
       public          postgres    false    221    3943    223               �   x�e��
�0D�7_����}��V���"���`Cۤ�įWHڍ�9p��5�Zq�3N�b��v�Уf+zu���p�n�"�Y[h���2Y�Lڠ�Z�\��sFZ
|Z)�3R�T���n�fD � ���N�n�h+L/hV������!$HJ=p���a��3B��SQ�      
      x������ � �         b   x�-�;� E���M�n�^-m
Q��u�ywr2fO�-/oU�����m0S0m;�?�[̚(��!W��B�OgsE{��}�pߊ��R�V�*�         �   x��I
A�Y����.^GAAF�G\�K1��K{�F���5#"5�|��Q+�b��&��<�*�m5�A ����=��7q�l���}��M8T�`ȣ�vY�jK�2�'�Zr����[�P_�#"�� �         S  x����j�0���"/PI�G��:���`7�f6�j��n{�i���\$pN~眄�&�8c,��L�R�X�#+U�2G�p�C�M�}���Lw2��Rl����49ݢ�vS�Fj]�|��e�Hz�,p"��LX0�U+	ƃA�F����;S�W2���,ɾȽ�Jz�,bc�~�DS��g�+�AGv�2��}�i�i��H{�|7��h�&���I�]�~���ύR�����}�E�����Q�y��AqQ.Z|����O[]+p�q�:��u�e�����=c\�a%��\�G�Z��o�o��FX�eZH��g�?kbYk�Ǵ��W����          �  x����N�@���S��Hz�i�&6X@*m�L�7m�\��§0�)x1���]�='��_�3*X�	����|���m�͹��#��MJ�m�f���Ȳ�W��t�� ���ݥ����jצ�#���f� 'g�3���>ˀ�Aں�#���D]DK��4�jlg<�Q��\!��J��yBԐtЦ�R��j���6K�#(�i�7�h]�hȀ
T�8��8^��
.!|�BJ%��"V?q�G��;���s�^���~�+4���\���ߵ{;*�����n�(���|�
��:ȇ')X���]^��Ӫ�Sq��b���j���Ӽ{�`��R��z�"Ԝ٠3qǞ���P�R����x��̇��>|L�i� YY�y��j�/����     