FasdUAS 1.101.10   ��   ��    k             l      �� ��   XR
Download alert for use with YazSoft's Speed Download 2.


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."


Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever a download item is added to the attached folder
or if the download has finished. 
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     �  ��  k    �       r        m        .incomplete     o      ���� 0 	extension        r        n    
    1    
��
�� 
leng  o    ���� 0 	extension    o      ���� 0 ext_len         r     ! " ! J    ����   " o      ���� 0 started_items      # $ # r     % & % J    ����   & o      ���� 0 finished_items   $  ' ( ' O    W ) * ) X    V +�� , + k   + Q - -  . / . r   + 0 0 1 0 l  + . 2�� 2 n   + . 3 4 3 1   , .��
�� 
pnam 4 o   + ,���� 0 thefile theFile��   1 o      ���� 0 	file_name   /  5�� 5 Z   1 Q 6 7�� 8 6 D   1 4 9 : 9 o   1 2���� 0 	file_name   : o   2 3���� 0 	extension   7 r   7 J ; < ; l  7 G =�� = e   7 G > > n   7 G ? @ ? 7  8 F�� A B
�� 
ctxt A m   < >����  B l  ? E C�� C \   ? E D E D l  @ C F�� F n   @ C G H G 1   A C��
�� 
leng H o   @ A���� 0 	file_name  ��   E o   C D���� 0 ext_len  ��   @ o   7 8���� 0 	file_name  ��   < n       I J I  ;   H I J o   G H���� 0 started_items  ��   8 r   M Q K L K o   M N���� 0 	file_name   L n       M N M  ;   O P N o   N O���� 0 finished_items  ��  �� 0 thefile theFile , o    ���� 0 added_items   * m     O O�null     ߀��  "
Finder.app��@� �0��Ȑ 7���p��ݰ ]00   )       (�� ��ݐ �MACS   alis    r  Macintosh HD               �N�.H+    "
Finder.app                                                       3��n�H        ����  	                CoreServices    �N�      �n�8      "      3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   (  P Q P r   X ] R S R o   X Y��
�� 
ret  S n      T U T 1   Z \��
�� 
txdl U 1   Y Z��
�� 
ascr Q  V W V r   ^ c X Y X c   ^ a Z [ Z o   ^ _���� 0 started_items   [ m   _ `��
�� 
TEXT Y o      ���� 0 started_names   W  \ ] \ r   d i ^ _ ^ c   d g ` a ` o   d e���� 0 finished_items   a m   e f��
�� 
TEXT _ o      ���� 0 finished_names   ]  b c b r   j o d e d m   j k f f       e n      g h g 1   l n��
�� 
txdl h 1   k l��
�� 
ascr c  i j i r   p x k l k n  p v m n m I   q v�� o���� 0 alias_to_url alias_to_URL o  p�� p o   q r���� 0 this_folder  ��  ��   n  f   p q l o      ���� 0 folder_icon   j  q r q l  y y������  ��   r  s t s r   y � u v u l  y ~ w�� w n   y ~ x y x m   | ~��
�� 
nmbr y n  y | z { z 2  z |��
�� 
cobj { l  y z |�� | o   y z���� 0 started_items  ��  ��   v l      }�� } o      ���� 0 
item_count  ��   t  ~  ~ Z   � � � ����� � ?  � � � � � o   � ����� 0 
item_count   � m   � �����   � k   � � � �  � � � Z   � � � ��� � � ?  � � � � � l  � � ��� � o   � ����� 0 
item_count  ��   � m   � �����  � r   � � � � � m   � � � �  Started downloads    � o      ���� 	0 title  ��   � r   � � � � � m   � � � �  Started download    � o      ���� 	0 title   �  ��� � I   � ��� ����� 0 growlnotify GrowlNotify �  � � � o   � ����� 	0 title   �  � � � o   � ����� 0 started_names   �  � � � o   � ����� 0 folder_icon   �  ��� � m   � ���
�� boovfals��  ��  ��  ��  ��     � � � l  � �������  ��   �  � � � r   � � � � � l  � � ��� � n   � � � � � m   � ���
�� 
nmbr � n  � � � � � 2  � ���
�� 
cobj � l  � � ��� � o   � ����� 0 finished_items  ��  ��   � l      ��� � o      ���� 0 
item_count  ��   �  ��� � Z   � � � ����� � ?  � � � � � o   � ����� 0 
item_count   � m   � �����   � k   � � � �  � � � Z   � � � ��� � � ?  � � � � � l  � � ��� � o   � ����� 0 
item_count  ��   � m   � �����  � r   � � � � � m   � � � �  Finished downloads    � o      ���� 	0 title  ��   � r   � � � � � m   � � � �  Finished download    � o      ���� 	0 title   �  ��� � I   � ��� ����� 0 growlnotify GrowlNotify �  � � � o   � ����� 	0 title   �  � � � o   � ����� 0 finished_names   �  � � � o   � ����� 0 folder_icon   �  ��� � m   � ���
�� boovfals��  ��  ��  ��  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  � � � i     � � � I      �� ����� 0 growlnotify GrowlNotify �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  � � � o      ����  0 imagespecifier imageSpecifier �  ��� � o      ���� 0 issticky isSticky��  ��   � k     H � �  � � � O     � � � r     � � � l 	   ��� � l    ��� � I   �� ���
�� .corecnte****       **** � l    ��� � 6    � � � 2   �
� 
pcap � l    ��~ � =    � � � 1   	 �}
�} 
pnam � l 
   ��| � m     � �  GrowlHelperApp   �|  �~  ��  ��  ��  ��   � o      �{�{ 0 growlrunning GrowlRunning � m      � ��null     ߀��  "System Events.app���� 7��ހ���� ]0(   )       (�� ��ޠ �sevs   alis    �  Macintosh HD               �N�.H+    "System Events.app                                                \e�n�
        ����  	                CoreServices    �N�      �n��      "      :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   �z�y�z  �y   �  ��x � Z    H � ��w � � @     � � � o    �v�v 0 growlrunning GrowlRunning � m    �u�u  � O    0 � � � I  " /�t�s �
�t .notifygrnull��� ��� null�s   � �r � �
�r 
titl � o   $ %�q�q 0 thetitle theTitle � �p � �
�p 
desc � o   & '�o�o 0 thetext theText � �n � �
�n 
ifil � o   ( )�m�m  0 imagespecifier imageSpecifier � �l ��k
�l 
stck � o   * +�j�j 0 issticky isSticky�k   � m     � �Znull     ߀�� ��GrowlHelperApp.app��� 7��Ӱ� �0 ]08   )       (�� ���� �GRRR   alis    �  Macintosh HD               �N�.H+   ��GrowlHelperApp.app                                              ������        ����  	                	Resources     �N�      ��ݞ     �� �� �� W T� T�  \�  fMacintosh HD:Users:ingmar:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  YUsers/ingmar/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app   /    ��  �w   � I  3 H�i � �
�i .sysodlogaskr        TEXT � b   3 : � � � b   3 8 � � � b   3 6   o   3 4�h�h 0 thetitle theTitle o   4 5�g
�g 
ret  � o   6 7�f
�f 
ret  � o   8 9�e�e 0 thetext theText � �d
�d 
btns J   ; > �c m   ; <  OK   �c   �b�a
�b 
dflt m   A B�`�` �a  �x   � 	 l     �_�^�_  �^  	 

 l     �]�]   / ) translate a file alias to a file:/// URL     i     I      �\�[�\ 0 alias_to_url alias_to_URL �Z o      �Y�Y 0 	this_file  �Z  �[   k     R  r      c      n      1    �X
�X 
psxp o     �W�W 0 	this_file   m    �V
�V 
ctxt o      �U�U 0 	this_file    r     m    	    /    n     !"! 1   
 �T
�T 
txdl" 1   	 
�S
�S 
ascr #$# r    %&% n    '(' 2    �R
�R 
citm( o    �Q�Q 0 	this_file  & l     )�P) o      �O�O 0 path_segments  �P  $ *+* Y    ;,�N-.�M, k   " 6// 010 r   " (232 n   " &454 4   # &�L6
�L 
cobj6 o   $ %�K�K 0 i  5 l  " #7�J7 o   " #�I�I 0 path_segments  �J  3 o      �H�H 0 this_segment  1 8�G8 r   ) 69:9 l 	 ) 1;�F; n  ) 1<=< I   * 1�E>�D�E 0 encode_text  > ?@? o   * +�C�C 0 this_segment  @ ABA m   + ,�B
�B boovtrueB C�AC m   , -�@
�@ boovfals�A  �D  =  f   ) *�F  : n      DED 4   2 5�?F
�? 
cobjF o   3 4�>�> 0 i  E l  1 2G�=G o   1 2�<�< 0 path_segments  �=  �G  �N 0 i  - m    �;�; . l   H�:H I   �9I�8
�9 .corecnte****       ****I l   J�7J o    �6�6 0 path_segments  �7  �8  �:  �M  + KLK r   < AMNM m   < =OO  /   N n     PQP 1   > @�5
�5 
txdlQ 1   = >�4
�4 
ascrL RSR r   B GTUT c   B EVWV l  B CX�3X o   B C�2�2 0 path_segments  �3  W m   C D�1
�1 
TEXTU o      �0�0 0 	this_file  S YZY r   H M[\[ m   H I]]      \ n     ^_^ 1   J L�/
�/ 
txdl_ 1   I J�.
�. 
ascrZ `�-` L   N Raa b   N Qbcb m   N Odd  file://   c o   O P�,�, 0 	this_file  �-   efe l     �+�*�+  �*  f ghg i    iji I      �)k�(�) 0 encode_text  k l�'l o      �&�& 0 	this_text  �'  �(  j k     :mm non r     pqp l 	   r�%r m     ss . (abcdefghijklmnopqrstuvwxyz0123456789.-_:   �%  q l     t�$t o      �#�# 0 acceptable_characters  �$  o uvu r    wxw m    yy      x l     z�"z o      �!�! 0 encoded_text  �"  v {|{ X    7}� ~} Z    2��� E   ��� l   ��� o    �� 0 acceptable_characters  �  � o    �� 0 	this_char  � r    #��� l   !��� b    !��� l   ��� o    �� 0 encoded_text  �  � o     �� 0 	this_char  �  � l     ��� o      �� 0 encoded_text  �  �  � r   & 2��� c   & 0��� l  & .��� b   & .��� l  & '��� o   & '�� 0 encoded_text  �  � l 	 ' -��� I   ' -���� 0 encode_char  � ��� o   ( )�� 0 	this_char  �  �  �  �  � m   . /�
� 
TEXT� l     ��� o      �� 0 encoded_text  �  �  0 	this_char  ~ o    �
�
 0 	this_text  | ��	� L   8 :�� l  8 9��� o   8 9�� 0 encoded_text  �  �	  h ��� l     ���  �  � ��� i    ��� I      ���� 0 encode_char  � ��� o      � �  0 	this_char  �  �  � k     K�� ��� r     ��� l    ���� l    ���� I    �����
�� .sysoctonshor       TEXT� o     ���� 0 	this_char  ��  ��  ��  � l     ���� o      ���� 0 	ascii_num 	ASCII_num��  � ��� r     ��� l 	  ���� J    �� ��� m    	��  0   � ��� m   	 
��  1   � ��� m   
 ��  2   � ��� m    ��  3   � ��� m    ��  4   � ��� m    ��  5   � ��� m    ��  6   � ��� l 	  ���� m    ��  7   ��  � ��� m    ��  8   � ��� m    ��  9   � ��� m    ��  A   � ��� m    ��  B   � ��� m    ��  C   � ��� m    ��  D   � ��� l 	  ���� m    ��  E   ��  � ���� m    ��  F   ��  ��  � l     ���� o      ���� 0 hex_list  ��  � ��� r   ! /��� n   ! -��� 4   " -���
�� 
cobj� l  % ,���� [   % ,��� l  % *���� _   % *��� o   % &���� 0 	ascii_num 	ASCII_num� m   & )���� ��  � m   * +���� ��  � l  ! "���� o   ! "���� 0 hex_list  ��  � o      ���� 0 x  � ��� r   0 >��� n   0 <��� 4   1 <���
�� 
cobj� l  4 ;���� [   4 ;��� l  4 9���� `   4 9��� o   4 5���� 0 	ascii_num 	ASCII_num� m   5 8���� ��  � m   9 :���� ��  � l  0 1���� o   0 1���� 0 hex_list  ��  � o      ���� 0 y  � ���� L   ? K   c   ? J l  ? F�� b   ? F b   ? D m   ? B  %    o   B C���� 0 x   o   D E���� 0 y  ��   m   F I��
�� 
TEXT��  �       ��	
��  	 ����������
�� .facofget****      � ****�� 0 growlnotify GrowlNotify�� 0 alias_to_url alias_to_URL�� 0 encode_text  �� 0 encode_char  
 �� ������
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��   ���������������������������� 0 this_folder  �� 0 added_items  �� 0 	extension  �� 0 ext_len  �� 0 started_items  �� 0 finished_items  �� 0 thefile theFile�� 0 	file_name  �� 0 started_names  �� 0 finished_names  �� 0 folder_icon  �� 0 
item_count  �� 	0 title    �� O������������������ f���� � ����� � �����
�� 
leng
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pnam
�� 
ctxt
�� 
ret 
�� 
ascr
�� 
txdl
�� 
TEXT�� 0 alias_to_url alias_to_URL
�� 
nmbr�� �� 0 growlnotify GrowlNotify��  ��  �� � ��E�O��,E�OjvE�OjvE�O� = :�[��l kh ��,E�O�� �[�\[Zk\Z��,�2E�6FY ��6F[OY��UO���,FO��&E�O��&E�O���,FO)�k+ E�O��-�,E�O�j "�k �E�Y a E�O*���fa + Y hO��-�,E�O�j $�k 
a E�Y a E�O*���fa + Y hW X  h �� ��������� 0 growlnotify GrowlNotify�� ����   ���������� 0 thetitle theTitle�� 0 thetext theText��  0 imagespecifier imageSpecifier�� 0 issticky isSticky��   ������������ 0 thetitle theTitle�� 0 thetext theText��  0 imagespecifier imageSpecifier�� 0 issticky isSticky�� 0 growlrunning GrowlRunning  ����� ��� �����������������������
�� 
pcap  
�� 
pnam
�� .corecnte****       ****
�� 
titl
�� 
desc
�� 
ifil
�� 
stck�� 
�� .notifygrnull��� ��� null
�� 
ret 
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT�� I� *�-�[�,\Z�81j E�UO�k � *����� UY ��%�%�%��kva ka   ���������� 0 alias_to_url alias_to_URL�� ����   ���� 0 	this_file  ��   ���������� 0 	this_file  �� 0 path_segments  �� 0 i  �� 0 this_segment   ���� ������������O��]d
�� 
psxp
�� 
ctxt
�� 
ascr
�� 
txdl
�� 
citm
�� .corecnte****       ****
�� 
cobj�� 0 encode_text  
�� 
TEXT�� S��,�&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O���,FO��&E�O���,FO�% ��j������� 0 encode_text  �� �~�~   �}�} 0 	this_text  ��   �|�{�z�y�| 0 	this_text  �{ 0 acceptable_characters  �z 0 encoded_text  �y 0 	this_char   sy�x�w�v�u�t
�x 
kocl
�w 
cobj
�v .corecnte****       ****�u 0 encode_char  
�t 
TEXT� ;�E�O�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O� �s��r�q�p�s 0 encode_char  �r �o�o   �n�n 0 	this_char  �q   �m�l�k�j�i�m 0 	this_char  �l 0 	ascii_num 	ASCII_num�k 0 hex_list  �j 0 x  �i 0 y   �h�����������������g�f�e
�h .sysoctonshor       TEXT�g 
�f 
cobj
�e 
TEXT�p L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a & ascr  ��ޭ