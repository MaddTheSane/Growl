FasdUAS 1.101.10   ��   ��    k             l      �� ��   NH
New Item Alert


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."



Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever items are added to the attached folder.  The script will display an alert 
containing the number of items added
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     h  ��  k    _       O        k           l   �� ��      get the name of the folder      ��  r        l   
 ��  n    
   !   1    
��
�� 
pnam ! o    ���� 0 this_folder  ��    l      "�� " o      ���� 0 folder_name  ��  ��    m     # #�null     ߀��  "
Finder.app��@� �0��Ȑ 7���p��ݰ ]00   )       (�� ��ݐ �MACS   alis    r  Macintosh HD               �N�.H+    "
Finder.app                                                       3��n�H        ����  	                CoreServices    �N�      �n�8      "      3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     $ % $ l   ������  ��   %  & ' & r     ( ) ( n    * + * I    �� ,���� 0 alias_to_url alias_to_URL ,  -�� - o    ���� 0 this_folder  ��  ��   +  f     ) o      ���� 0 folder_icon   '  . / . l   ������  ��   /  0 1 0 r     2 3 2 l    4�� 4 n     5 6 5 m    ��
�� 
nmbr 6 n    7 8 7 2   ��
�� 
cobj 8 l    9�� 9 o    ���� 0 added_items  ��  ��   3 l      :�� : o      ���� 0 
item_count  ��   1  ; < ; Z    6 = >�� ? = ?   " @ A @ l     B�� B o     ���� 0 
item_count  ��   A m     !����  > k   % , C C  D E D r   % ( F G F m   % & H H  s    G o      ���� 0 	plurality   E  I�� I r   ) , J K J m   ) * L L 
 have    K o      ���� 0 	have_verb  ��  ��   ? k   / 6 M M  N O N r   / 2 P Q P m   / 0 R R       Q o      ���� 0 	plurality   O  S�� S r   3 6 T U T m   3 4 V V 	 has    U o      ���� 0 	have_verb  ��   <  W X W l  7 7������  ��   X  Y Z Y r   7 @ [ \ [ b   7 > ] ^ ] b   7 < _ ` _ b   7 : a b a m   7 8 c c  New File    b o   8 9���� 0 	plurality   ` m   : ; d d 
  in     ^ l  < = e�� e o   < =���� 0 folder_name  ��   \ o      ���� 0 thetitle theTitle Z  f g f r   A P h i h b   A N j k j b   A L l m l b   A J n o n b   A H p q p b   A F r s r l  A D t�� t c   A D u v u l  A B w�� w o   A B���� 0 
item_count  ��   v m   B C��
�� 
ctxt��   s m   D E x x   item    q o   F G���� 0 	plurality   o m   H I y y       m o   J K���� 0 	have_verb   k m   L M z z   been added.    i o      ���� 0 thetext theText g  { | { l  Q Q������  ��   |  } ~ } I   Q ]�� ���� 0 growlnotify GrowlNotify   � � � o   R S���� 0 thetitle theTitle �  � � � o   S T���� 0 thetext theText �  � � � m   T U � �  icon of file    �  � � � o   U V���� 0 folder_icon   �  ��� � m   V W��
�� boovfals��  ��   ~  ��� � l  ^ ^������  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  � � � i     � � � I      �� ����� 0 growlnotify GrowlNotify �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  � � � o      ���� 0 	imagetype 	imageType �  � � � o      ����  0 imagespecifier imageSpecifier �  ��� � o      ���� 
0 sticky  ��  ��   � k     � � �  � � � O     � � � r     � � � l 	   ��� � l    ��� � I   �� ���
�� .corecnte****       **** � l    ��� � 6    � � � 2   ��
�� 
pcap � l    ��� � =    � � � 1   	 ��
�� 
pnam � l 	   ��� � m     � �  GrowlHelperApp   ��  ��  ��  ��  ��  ��   � o      ���� 0 growlrunning GrowlRunning � m      � ��null     ߀��  "System Events.app���� 7��ހ���� ]0(   )       (�� ��ޠ �sevs   alis    �  Macintosh HD               �N�.H+    "System Events.app                                                \e�n�
        ����  	                CoreServices    �N�      �n��      "      :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   ������  ��   �  � � � Z    � � ��� � � @     � � � o    ���� 0 growlrunning GrowlRunning � m    ����  � k    g � �  � � � r    + � � � b    ) � � � b    ' � � � b    % � � � b    # � � � b    ! � � � l 	   ��� � m     � �  notify with title "   ��   � o     ���� 0 thetitle theTitle � m   ! " � �  "     � l 	 # $ ��� � m   # $ � �  description "   ��   � o   % &���� 0 thetext theText � m   ' ( � �  "    � o      ���� 0 notifycommand notifyCommand �  � � � l  , ,������  ��   �  � � � Z   , K � ����� � F   , 7 � � � >   , / � � � o   , -���� 0 	imagetype 	imageType � m   - . � �       � >   2 5 � � � o   2 3����  0 imagespecifier imageSpecifier � m   3 4 � �       � r   : G � � � b   : E � � � b   : C � � � b   : A � � � b   : ? � � � b   : = � � � o   : ;���� 0 notifycommand notifyCommand � l 	 ; < ��� � m   ; < � �      ��   � o   = >���� 0 	imagetype 	imageType � m   ? @ � �   "    � o   A B����  0 imagespecifier imageSpecifier � m   C D � �  "    � o      ���� 0 notifycommand notifyCommand��  ��   �  � � � l  L L������  ��   �  � � � l  L L�� ���   � * $ work around AppleScript's potential    �  � � � l  L L�� ���   � ' ! "Where is GrowlHelperApp" dialog    �  � � � r   L Q � � � m   L O � �  GrowlHelperApp    � o      ���� 
0 gha GHA �  ��� � O  R g � � � I  [ f�� ���
�� .sysodsct****        scpt � b   [ b � � � b   [ ` � � � l 	 [ \ ��� � o   [ \���� 0 notifycommand notifyCommand��   � m   \ _    sticky     � o   ` a���� 
0 sticky  ��   � 4   R X��
�� 
capp o   V W���� 
0 gha GHA��  ��   � I  j ���
�� .sysodlogaskr        TEXT b   j u b   j s b   j o	 o   j k���� 0 thetitle theTitle	 o   k n��
�� 
ret  o   o r�
� 
ret  o   s t�~�~ 0 thetext theText �}

�} 
btns
 J   x } �| m   x {  OK   �|   �{�z
�{ 
dflt m   � ��y�y �z   � �x l  � ��w�v�w  �v  �x   �  l     �u�t�u  �t    l     �s�s   / ) translate a file alias to a file:/// URL     i     I      �r�q�r 0 alias_to_url alias_to_URL �p o      �o�o 0 	this_file  �p  �q   k     R  r       c     !"! n     #$# 1    �n
�n 
psxp$ o     �m�m 0 	this_file  " m    �l
�l 
ctxt  o      �k�k 0 	this_file   %&% r    '(' m    	))  /   ( n     *+* 1   
 �j
�j 
txdl+ 1   	 
�i
�i 
ascr& ,-, r    ./. n    010 2    �h
�h 
citm1 o    �g�g 0 	this_file  / l     2�f2 o      �e�e 0 path_segments  �f  - 343 Y    ;5�d67�c5 k   " 688 9:9 r   " (;<; n   " &=>= 4   # &�b?
�b 
cobj? o   $ %�a�a 0 i  > l  " #@�`@ o   " #�_�_ 0 path_segments  �`  < o      �^�^ 0 this_segment  : A�]A r   ) 6BCB l 	 ) 1D�\D n  ) 1EFE I   * 1�[G�Z�[ 0 encode_text  G HIH o   * +�Y�Y 0 this_segment  I JKJ m   + ,�X
�X boovtrueK L�WL m   , -�V
�V boovfals�W  �Z  F  f   ) *�\  C n      MNM 4   2 5�UO
�U 
cobjO o   3 4�T�T 0 i  N l  1 2P�SP o   1 2�R�R 0 path_segments  �S  �]  �d 0 i  6 m    �Q�Q 7 l   Q�PQ I   �OR�N
�O .corecnte****       ****R l   S�MS o    �L�L 0 path_segments  �M  �N  �P  �c  4 TUT r   < AVWV m   < =XX  /   W n     YZY 1   > @�K
�K 
txdlZ 1   = >�J
�J 
ascrU [\[ r   B G]^] c   B E_`_ l  B Ca�Ia o   B C�H�H 0 path_segments  �I  ` m   C D�G
�G 
TEXT^ o      �F�F 0 	this_file  \ bcb r   H Mded m   H Iff      e n     ghg 1   J L�E
�E 
txdlh 1   I J�D
�D 
ascrc i�Ci L   N Rjj b   N Qklk m   N Omm  file://   l o   O P�B�B 0 	this_file  �C   non l     �A�@�A  �@  o pqp i    rsr I      �?t�>�? 0 encode_text  t uvu o      �=�= 0 	this_text  v wxw o      �<�< 0 encode_url_a encode_URL_Ax y�;y o      �:�: 0 encode_url_b encode_URL_B�;  �>  s k     fzz {|{ r     }~} l 	   �9 m     �� * $abcdefghijklmnopqrstuvwxyz0123456789   �9  ~ l     ��8� o      �7�7 0 standard_characters  �8  | ��� r    ��� m    ��  $+!'/?;&@=#%><{}[]"~`^\|*   � l     ��6� o      �5�5 0 url_a_chars URL_A_chars�6  � ��� r    ��� m    	�� 
 .-_:   � l     ��4� o      �3�3 0 url_b_chars URL_B_chars�4  � ��� r    ��� l   ��2� o    �1�1 0 standard_characters  �2  � l     ��0� o      �/�/ 0 acceptable_characters  �0  � ��� Z   ���.�-� =   ��� o    �,�, 0 encode_url_a encode_URL_A� m    �+
�+ boovfals� l 	  ��*� r    ��� b    ��� l 	  ��)� l   ��(� o    �'�' 0 acceptable_characters  �(  �)  � l   ��&� o    �%�% 0 url_a_chars URL_A_chars�&  � l     ��$� o      �#�# 0 acceptable_characters  �$  �*  �.  �-  � ��� Z    /���"�!� =    #��� o     !� �  0 encode_url_b encode_URL_B� m   ! "�
� boovfals� l 	 & +��� r   & +��� b   & )��� l 	 & '��� l  & '��� o   & '�� 0 acceptable_characters  �  �  � l  ' (��� o   ' (�� 0 url_b_chars URL_B_chars�  � l     ��� o      �� 0 acceptable_characters  �  �  �"  �!  � ��� r   0 3��� m   0 1��      � l     ��� o      �� 0 encoded_text  �  � ��� X   4 c���� Z   D ^����� E  D G��� l  D E��� o   D E�� 0 acceptable_characters  �  � o   E F�� 0 	this_char  � r   J O��� l  J M��� b   J M��� l  J K��� o   J K�� 0 encoded_text  �  � o   K L�� 0 	this_char  �  � l     ��� o      �
�
 0 encoded_text  �  �  � r   R ^��� c   R \��� l  R Z��	� b   R Z��� l  R S��� o   R S�� 0 encoded_text  �  � l 	 S Y��� I   S Y���� 0 encode_char  � ��� o   T U�� 0 	this_char  �  �  �  �	  � m   Z [�
� 
TEXT� l     �� � o      ���� 0 encoded_text  �   � 0 	this_char  � o   7 8���� 0 	this_text  � ���� L   d f�� l  d e���� o   d e���� 0 encoded_text  ��  ��  q ��� l     ������  ��  � ���� i    ��� I      ������� 0 encode_char  � ���� o      ���� 0 	this_char  ��  ��  � k     K�� ��� r     ��� l    ���� l    ���� I    �����
�� .sysoctonshor       TEXT� o     ���� 0 	this_char  ��  ��  ��  � l     ���� o      ���� 0 	ascii_num 	ASCII_num��  � ��� r     ��� l 	  ���� J    �� ��� m    	��  0   � ��� m   	 
��  1   � ��� m   
 ��  2   � ��� m    ��  3   � ��� m    ��  4   � ��� m    ��  5   �    m      6     l 	  �� m      7   ��    m    		  8    

 m      9     m      A     m      B     m      C     m      D     l 	  �� m      E   ��   �� m      F   ��  ��  � l     �� o      ���� 0 hex_list  ��  �  !  r   ! /"#" n   ! -$%$ 4   " -��&
�� 
cobj& l  % ,'��' [   % ,()( l  % **��* _   % *+,+ o   % &���� 0 	ascii_num 	ASCII_num, m   & )���� ��  ) m   * +���� ��  % l  ! "-��- o   ! "���� 0 hex_list  ��  # o      ���� 0 x  ! ./. r   0 >010 n   0 <232 4   1 <��4
�� 
cobj4 l  4 ;5��5 [   4 ;676 l  4 98��8 `   4 99:9 o   4 5���� 0 	ascii_num 	ASCII_num: m   5 8���� ��  7 m   9 :���� ��  3 l  0 1;��; o   0 1���� 0 hex_list  ��  1 o      ���� 0 y  / <��< L   ? K== c   ? J>?> l  ? F@��@ b   ? FABA b   ? DCDC m   ? BEE  %   D o   B C���� 0 x  B o   D E���� 0 y  ��  ? m   F I��
�� 
TEXT��  ��       ��FGHIJK��  F ����������
�� .facofget****      � ****�� 0 growlnotify GrowlNotify�� 0 alias_to_url alias_to_URL�� 0 encode_text  �� 0 encode_char  G �� ����LM��
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��  L 	�������������������� 0 this_folder  �� 0 added_items  �� 0 folder_name  �� 0 folder_icon  �� 0 
item_count  �� 0 	plurality  �� 0 	have_verb  �� 0 thetitle theTitle�� 0 thetext theTextM  #�������� H L R V c d�� x y z ���������
�� 
pnam�� 0 alias_to_url alias_to_URL
�� 
cobj
�� 
nmbr
�� 
ctxt�� �� 0 growlnotify GrowlNotify��  ��  �� i a� ��,E�UO)�k+ E�O��-�,E�O�k �E�O�E�Y 	�E�O�E�O�%�%�%E�O��&�%�%�%�%�%E�O*���fa + OPW X  hH �� �����NO���� 0 growlnotify GrowlNotify�� ��P�� P  ������������ 0 thetitle theTitle�� 0 thetext theText�� 0 	imagetype 	imageType��  0 imagespecifier imageSpecifier�� 
0 sticky  ��  N ������������������ 0 thetitle theTitle�� 0 thetext theText�� 0 	imagetype 	imageType��  0 imagespecifier imageSpecifier�� 
0 sticky  �� 0 growlrunning GrowlRunning�� 0 notifycommand notifyCommand�� 
0 gha GHAO  ���Q�� ��� � � � � � ��� � � � ��� ������������
�� 
pcapQ  
�� 
pnam
�� .corecnte****       ****
�� 
bool
�� 
capp
�� .sysodsct****        scpt
�� 
ret 
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT�� �� *�-�[�,\Z�81j E�UO�k N�%�%�%�%�%E�O��	 ���& ��%�%�%�%�%E�Y hOa E�O*a �/ �a %�%j UY �_ %_ %�%a a kva ka  OPI ������RS���� 0 alias_to_url alias_to_URL�� ��T�� T  ���� 0 	this_file  ��  R ���������� 0 	this_file  �� 0 path_segments  �� 0 i  �� 0 this_segment  S ����)������������X��fm
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
TEXT�� S��,�&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O���,FO��&E�O���,FO�%J ��s��~UV�}�� 0 encode_text  � �|W�| W  �{�z�y�{ 0 	this_text  �z 0 encode_url_a encode_URL_A�y 0 encode_url_b encode_URL_B�~  U 	�x�w�v�u�t�s�r�q�p�x 0 	this_text  �w 0 encode_url_a encode_URL_A�v 0 encode_url_b encode_URL_B�u 0 standard_characters  �t 0 url_a_chars URL_A_chars�s 0 url_b_chars URL_B_chars�r 0 acceptable_characters  �q 0 encoded_text  �p 0 	this_char  V 	�����o�n�m�l�k
�o 
kocl
�n 
cobj
�m .corecnte****       ****�l 0 encode_char  
�k 
TEXT�} g�E�O�E�O�E�O�E�O�f  
��%E�Y hO�f  
��%E�Y hO�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O�K �j��i�hXY�g�j 0 encode_char  �i �fZ�f Z  �e�e 0 	this_char  �h  X �d�c�b�a�`�d 0 	this_char  �c 0 	ascii_num 	ASCII_num�b 0 hex_list  �a 0 x  �` 0 y  Y �_������	�^�]E�\
�_ .sysoctonshor       TEXT�^ 
�] 
cobj
�\ 
TEXT�g L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a &ascr  ��ޭ