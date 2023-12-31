PGDMP     #                     {            bikes_db    15.3    15.2 3               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    74772    bikes_db    DATABASE     t   CREATE DATABASE bikes_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE bikes_db;
                postgres    false            �            1259    74773    brand    TABLE     �   CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(100),
    country character varying(100),
    company character varying(100),
    image character varying(255)
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    74778    brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.brand_id_seq;
       public          postgres    false    214                       0    0    brand_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;
          public          postgres    false    215            �            1259    74779    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer,
    product_detail_id integer,
    quantity numeric
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    74784    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    216                       0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    217            �            1259    74785    category    TABLE     }   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100),
    image character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    74788    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    218                       0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    219            �            1259    74789    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100),
    brand_id integer,
    category_id integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    74792    product_detail    TABLE     �  CREATE TABLE public.product_detail (
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
       public         heap    postgres    false            �            1259    74797    product_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_detail_id_seq;
       public          postgres    false    221                       0    0    product_detail_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_detail_id_seq OWNED BY public.product_detail.id;
          public          postgres    false    222            �            1259    74798    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    220                       0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    223            �            1259    74799    users    TABLE     ,  CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    74804    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    224                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    225            Z           2604    74805    brand id    DEFAULT     d   ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);
 7   ALTER TABLE public.brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            [           2604    74806    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            \           2604    74807    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ]           2604    74808 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    220            ^           2604    74809    product_detail id    DEFAULT     v   ALTER TABLE ONLY public.product_detail ALTER COLUMN id SET DEFAULT nextval('public.product_detail_id_seq'::regclass);
 @   ALTER TABLE public.product_detail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            _           2604    74810    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �          0    74773    brand 
   TABLE DATA           B   COPY public.brand (id, name, country, company, image) FROM stdin;
    public          postgres    false    214   �8                 0    74779    cart 
   TABLE DATA           H   COPY public.cart (id, user_id, product_detail_id, quantity) FROM stdin;
    public          postgres    false    216   �9                 0    74785    category 
   TABLE DATA           3   COPY public.category (id, name, image) FROM stdin;
    public          postgres    false    218   �9                 0    74789    product 
   TABLE DATA           B   COPY public.product (id, name, brand_id, category_id) FROM stdin;
    public          postgres    false    220   ":                 0    74792    product_detail 
   TABLE DATA           �   COPY public.product_detail (id, name, status, manufactured_year, fuel, color, price, mileage, displacement, city, image, description, product_id) FROM stdin;
    public          postgres    false    221   �:       	          0    74799    users 
   TABLE DATA           `   COPY public.users (id, username, password, phone, fullname, gender, address, email) FROM stdin;
    public          postgres    false    224   ?=                  0    0    brand_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brand_id_seq', 1, false);
          public          postgres    false    215                       0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 1, false);
          public          postgres    false    217                       0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    219                       0    0    product_detail_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_detail_id_seq', 1, false);
          public          postgres    false    222                       0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    223                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    225            a           2606    74812    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    214            c           2606    74814    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    216            e           2606    74816    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    218            i           2606    74818 "   product_detail product_detail_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_pkey;
       public            postgres    false    221            g           2606    74820    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    220            k           2606    74822    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            l           2606    74823     cart cart_product_detail_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_detail_id_fkey FOREIGN KEY (product_detail_id) REFERENCES public.product_detail(id);
 J   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_product_detail_id_fkey;
       public          postgres    false    216    221    3945            m           2606    74828    cart cart_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          postgres    false    216    224    3947            n           2606    74833    product product_brand_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);
 G   ALTER TABLE ONLY public.product DROP CONSTRAINT product_brand_id_fkey;
       public          postgres    false    3937    214    220            o           2606    74838     product product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_category_id_fkey;
       public          postgres    false    3941    218    220            p           2606    74843 -   product_detail product_detail_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_detail
    ADD CONSTRAINT product_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 W   ALTER TABLE ONLY public.product_detail DROP CONSTRAINT product_detail_product_id_fkey;
       public          postgres    false    221    3943    220            �   �   x�e��
�0�ϛ��H��{U��=���j�m7!I���j�x�ٙ��1��J�-�p����#���_a��&p��o<��|x�����*A� k�E�����h#������{�3*;筒.���@�a�.����-RK�U�Z��)����%O6!��
bXw���<6}qf��Rэ�DDo�+c��ui�            x������ � �         u   x�3�HU(I�THOT����L���-N��/I-�+.K�2�?�=Q"����0��8�(O!;(����p��<�������#3�n������\R���6��K�NM��3F��� ��7         �   x�-�K
�@�u�)���7���D$���M#��'�O��zUTk�!�r��3hx2��_���YU��,V��|������&�y�㊕vy����Ǣ?�'�F�p����h�����Iz���H��F&���Y�K���"��O2�         d  x����n�@��㧘H�I�$��E�T5�����b/��n��j�+'ĥBjA(*"q���x�	���ġH�e������sB1���s����qa��X��s.�v,��F�v�`�0tbMG0�D��0�SxHI��J�z���Q��;�	�	�h;����w*�A$4�u˧��x<�
z[xG3�ix�ä�1��ƿ�����n[.��X������#��lW�v��4�nW��8尴���j������	�.a&8���Õ����+t�͂ch�X�*�TCu<S��g)_Mp�Y,�/+.��g��X���T�_������)���č�E�V�)f����B�0��PGEv`Pds�ۛ��p_p�6���y��fTYd���0�y�t���f�� Y�?��H��Ĳ��9g�{��冒!î�ii!G۳|����ח[�E�Iq�5����wh�x�_�����Iy����I�י�,w��a���חr��C�OiEr��H>+�jH��/�d�]���	Ԋɨ�!���y��W��+��:���o������P��jye�7��`H��:�tm�k��6|�0����y�      	   F  x���=O�@���)nE~9�9�Hu������$b�$��b��s�U�J��V*�V�R�.a�{��������sw�����2BYH��ʮ�����8���&�i��W�=˕��V��?�*���Q�V�ݳh؟Ol|��j�$#��V10��0x���H���x�R�c �g���~L�h���%&��V���#<9r8f~����h2*)��,!�Y]�5 Ȫ���0��l�Q�[CD bi���� �F%G���$�Wd�����n�'��3���g?��p�=~�\�T��]�,��z��ֵ�A��U��F��t�Ì�8�P��8f�:�!��S�.xT�RB�d�?]���󌢊1��dl��q�F2>C^]Nk�|�������[��F�pSY�Tx\�����B!�扖��c���t�O���2J�9��&��tdAAJ�y��r)!.?f��p�]��,�Bk��M����?Y�%���u����I����V+��I#`Ʊ#��鋝^�}z&��ï���X��r�v����x������߬�!̯���n�T���Rq     