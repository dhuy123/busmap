PGDMP     2    1                |            bus_station    14.10    14.10 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    27307    bus_station    DATABASE     o   CREATE DATABASE bus_station WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE bus_station;
                postgres    false                        3079    27308    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            �           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    28406    bus_station2    TABLE     �   CREATE TABLE public.bus_station2 (
    gid integer,
    osm_id character varying(12),
    code smallint,
    fclass character varying(28),
    name character varying(100),
    geom public.geometry(Point,4326)
);
     DROP TABLE public.bus_station2;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �          0    28406    bus_station2 
   TABLE DATA           M   COPY public.bus_station2 (gid, osm_id, code, fclass, name, geom) FROM stdin;
    public          postgres    false    215   Z       �          0    27625    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    211   �       �   L	  x��XMoT�]�_QK�pT�˪WUc	���B,"E�����Fa�"h$�h4��h�Ah	��Y�eф���$�^�ׄ�/@���m��s�-�#�N�w��l�����o�Oo�\�.ȫ����|�^�'���=��4��;���8M���j�X�`��J����H�P�^�=��n�?Z�]/7#�V��G�a-3�;mD��.g'YNB"���[���V|�K���o&���zyoF.MOɴ����Q���c9hJ#�6�\spM2"�l��d���������øt�>�ǌ�o��'H�������x�:�Jgi����J��R6��ZPՁ:5}��f���̎��=^�X��t�l6%W�ۃ�O�/�$��.y�SM��l�t��.�I@�l�|H��
Q�gǫ���S�ޜ\>����x[�����R��A��/�3�~R�� G�4�m4w�0J禍o��N���dJ�����`z�c��X�8�H�[I��b(MU�!9ޑ�m0�5;��׬��''�Ca��E��32_�G�sZ��R�@�0Jum�h�WHq����0�b�q dS)��@S),�z������Y)��#@�$NM��ضcY�T�%�V`�@�	6��ٶ�_=X�i쎸���1��6TِE���[lb�!єxgl���)S�j�l�<�8�6��cK5�]��섄����d G$@�愁�r���z�d.�ϟ������&j�J��f���E��y�Mf��0�����)�B��8�k��F5,�f���["рƏȕ�g(G*ߍ�}��ME��3ۀh1��7�#�
n�SF�>�$���E�fpNuC��M�! a?���c�C�&�ig��=��Y�Y���bs6�������V1�&I�O��/g���d-��K$���Ep��1�|xL>�#�zQL�28���s������<<.S�l���~}������/��d�LQ2o����g�� �b���9�:y���>�QZf���RVV|��ISV!�N@��ٹ(��b� �ar�ѷϥ��3\���Mǆ�B~���OZe8��i�D���VQҍE.N�Ɵ�z�b����c�!�_�mj��w�a�e��UmѬ��}hȳ9�����▾ŭ�Z�01�Enoֶ�@��#uS���0Q�'+�.���\.��6v��a!He\��G�{�>b�V ���� $A@Ae������I�CUm�\BE�b�l�5�mj�W����<f�YG{y.��w����'�W+gw>�-���\��I���^�B�6��b:����_d�:���O��S�1�d��]�
]t�����J����x�Ï0�����e����ї1��4��Ubݠ�tZ�ȳ���3�"<6t����g�G��Q:zm���XM�hBg��G���k���->m{�ɘ{���}-ފaՒ��F �P�c�쀓��|R����1���hȬ���Ml\��*������!��xX����f	CO���`���g��=�^�*�ۧU���U��=�`���;������ߚ��WMW`�A��ם�z�İո���hc��	z ���U�I�V�NG#&|�f��^D0�7�o��i�d>6$e��D�næ<4�6��>~�bk[a���ͫ�%*µy��+�`�?���W���������M�Z��d��e��������SU�orPQ&ݥ#�&�a��Z�R��7��>�Rr�:�K�*���^��\l��v�$Ʊ�+`/(�Iz�}�}&��H>l����+�~Y�� 4�**���'�axjû����H=D��C|m�D#c7�e�.��#�:����O�j7�dZ���9��+s��}8��4x�"-Q� C��Xz*Qe/&jK��3�̹�M�mf���kS㓧l�X������q�^SԖ�떪k7HX�&��;���jp(}�kX��Z��=�b����}�%��ҫ�ұ�7�U���//�}˷�C��5�Ǫ�<9����)J�E�'v�X�M*��6���a2-��va�|�E��'�r��ryBo�\)�6a���˗v�Y�L,zZ2�Gm-Fo����h��I��U�^W2�'뛸9�Il�k�I�,wy��؏�/'�Y[F7��lA���)�	=����B���Q�q΋��n�/�����3�,���v]����c�� e2=%����"UT`�wݨ�e��1cŘ�������,ɣ�r�w2)s�:��x*�2{�͹���7�s�8�.E�k���5��tA<�{���HlW��l��lc�&�4��NM�'c��� �O����|� ��df�5���l��͇�Ƴ>j���<��4��M�$��눗]¿���E��7      �      x������ � �     