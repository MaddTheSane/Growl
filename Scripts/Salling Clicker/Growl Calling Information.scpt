FasdUAS 1.101.10   ��   ��    k             l      �� ��   ��
	Salling Clicker script to log phone calls to Growl
	� 2004 Robert Leslie
	Inspired by George (Ty) Tempel's first implementation

	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
	
	--Changes to work with growl: Jeremy Rossi
	
       	  j     �� 
�� 0 currentcalls currentCalls 
 J     ����   	     l     ������  ��        i        I      �������� 0 	connected  ��  ��    r         J     ����    o      ���� 0 currentcalls currentCalls      l     ������  ��        i        I      �������� 0 entered_proximity  ��  ��    r         J     ����    o      ���� 0 currentcalls currentCalls      l     ������  ��        i         I      �� !���� "0 phone_call_status_notification   !  "�� " o      ���� 0 
event_info  ��  ��     k     # #  $ % $ r      & ' & m      ( (  Growl Calling Information    ' o      ���� 0 appname appName %  ) * ) r     + , + m     - -  Call Status    , o      ���� $0 notificationname notificationName *  . / . r     0 1 0 J     2 2  3�� 3 o    	���� $0 notificationname notificationName��   1 o      ���� 
0 notifs   /  4 5 4 l   ������  ��   5  6 7 6 O      8 9 8 I   ���� :
�� .registernull��� ��� null��   : �� ; <
�� 
appl ; o    ���� 0 appname appName < �� = >
�� 
anot = o    ���� 
0 notifs   > �� ? @
�� 
dnot ? o    ���� 
0 notifs   @ �� A��
�� 
iapp A m     B B ! Bluetooth File Exchange.app   ��   9 m     C CZnull     ߀�� #^GrowlHelperApp.app�ш   }���п�ր @   )       �"(�Й̿�� nGRRR   alis    �  Macintosh HD               �N�.H+   #^GrowlHelperApp.app                                              #m��4�        ����  	                	Resources     �N�      ��&�     #^ #Z #Y W T� T�  \�  fMacintosh HD:Users:ingmar:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  YUsers/ingmar/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app   /    ��   7  D E D l  ! !������  ��   E  F G F w   ! H I H k   # J J  K L K l  # #�� M��   M @ :- "the_call_status" can have the following keyword values:    L  N O N l  # #�� P��   P D >- alerting/calling/connecting/holding/waiting/active/idle/busy    O  Q R Q r   # & S T S m   # $ U U       T o      ���� 0 call_status   R  V W V r   ' , X Y X n   ' * Z [ Z o   ( *���� 0 the_call_status   [ o   ' (���� 0 
event_info   Y o      ���� 0 event_call_status   W  \ ] \ Z   - � ^ _ `�� ^ =  - 0 a b a o   - .���� 0 event_call_status   b m   . /��
�� CSxxCSal _ r   3 6 c d c m   3 4 e e  alerting    d o      ���� 0 call_status   `  f g f =  9 < h i h o   9 :���� 0 event_call_status   i m   : ;��
�� CSxxCScl g  j k j r   ? D l m l m   ? B n n  calling    m o      ���� 0 call_status   k  o p o =  G L q r q o   G H���� 0 event_call_status   r m   H K��
�� CSxxCSct p  s t s r   O T u v u m   O R w w  
connecting    v o      ���� 0 call_status   t  x y x =  W \ z { z o   W X���� 0 event_call_status   { m   X [��
�� CSxxCShd y  | } | r   _ d ~  ~ m   _ b � �  holding     o      ���� 0 call_status   }  � � � =  g l � � � o   g h���� 0 event_call_status   � m   h k��
�� CSxxCSwt �  � � � r   o t � � � m   o r � �  waiting    � o      ���� 0 call_status   �  � � � =  w | � � � o   w x���� 0 event_call_status   � m   x {��
�� CSxxCSac �  � � � r    � � � � m    � � �  active    � o      ���� 0 call_status   �  � � � =  � � � � � o   � ����� 0 event_call_status   � m   � ���
�� CSxxCSid �  � � � r   � � � � � m   � � � � 
 idle    � o      ���� 0 call_status   �  � � � =  � � � � � o   � ����� 0 event_call_status   � m   � ���
�� CSxxCSbs �  ��� � r   � � � � � m   � � � � 
 busy    � o      ���� 0 call_status  ��  ��   ]  � � � l  � �������  ��   �  � � � l  � ��� ���   � > 8- "the_call_type" can have the following keyword values:    �  � � � l  � ��� ���   � &  - voice/data/fax/alternate voice    �  � � � r   � � � � � m   � � � �       � o      ���� 0 	call_type   �  � � � r   � � � � � n   � � � � � o   � ����� 0 the_call_type   � o   � ����� 0 
event_info   � o      ���� 0 event_call_type   �  � � � Z   � � � � ��� � =  � � � � � o   � ����� 0 event_call_type   � m   � ���
�� CTxxCTvc � r   � � � � � m   � � � �  voice    � o      ���� 0 	call_type   �  � � � =  � � � � � o   � ����� 0 event_call_type   � m   � ���
�� CTxxCTda �  � � � r   � � � � � m   � � � � 
 data    � o      ���� 0 	call_type   �  � � � =  � � � � � o   � ����� 0 event_call_type   � m   � ���
�� CTxxCTfx �  � � � r   � � � � � m   � � � � 	 fax    � o      ���� 0 	call_type   �  � � � =  � � � � � o   � ����� 0 event_call_type   � m   � ���
�� CTxxCTv2 �  ��� � r   � � � � � m   � � � �  alternate voice    � o      ���� 0 	call_type  ��  ��   �  � � � l  � �������  ��   �  � � � l  � ��� ���   � J D- "the_cid" is a numerical identifier represeting the call that this    �  � � � l  � ��� ���   � ; 5- event corresponds to (useful for tracking events in    �  � � � l  � ��� ���   �  - multi-party calls)    �  � � � r   �  � � � n   � � � � � o   � ����� 0 the_cid   � o   � ����� 0 
event_info   � o      ���� 0 event_call_id   �  � � � l ������  ��   �  � � � l �� ���   � 8 2- Additionally the "the_phone_number" string value    �  � � � l �� ���   � ; 5- is sometimes available (at least for "alerting" and    �  � � � l �� ���   �  - "calling")    �  � � � r   � � � m   � �       � o      ���� 0 event_caller_id   �  ��� � Q   � ��� � r  
 �  � n  
 o  ���� 0 the_phone_number   o  
���� 0 
event_info    o      ���� 0 event_caller_id   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   I6null      � �� bSEC Helper.app��Ў�ш���(��؀��4 (  �����    �١��$���PD JSCL  alis    �  Macintosh HD               �N�.H+   bSEC Helper.app                                                  c��{        ����  	                	Resources     �N�      ��[     b b b F"    _Macintosh HD:Library:PreferencePanes:Salling Clicker.prefPane:Contents:Resources:SEC Helper.app     S E C   H e l p e r . a p p    M a c i n t o s h   H D  RLibrary/PreferencePanes/Salling Clicker.prefPane/Contents/Resources/SEC Helper.app  / ��   G �� Z  �� E % J  #		 

 m    alerting    �� m  !  calling   ��   o  #$���� 0 call_status   k  (  Z  (=�� = (- o  ()���� 0 call_status   m  ),  alerting    r  05 m  03  incoming    o      ���� 0 	direction  ��   r  8= m  8;  outgoing    o      ���� 0 	direction    r  >C !  m  >A""      ! o      ���� 0 
thesummary 
theSummary #$# r  DL%&% I  DJ�'�~� 0 formatnumber formatNumber' (�}( o  EF�|�| 0 event_caller_id  �}  �~  & o      �{�{ 0 thelocation theLocation$ )*) r  MU+,+ I  MS�z-�y�z 0 	getperson 	getPerson- .�x. o  NO�w�w 0 event_caller_id  �x  �y  , o      �v�v 0 	theperson 	thePerson* /0/ Z  V�12�u31 = V[454 o  VW�t�t 0 	theperson 	thePerson5 m  WZ�s
�s 
msng2 r  ^e676 b  ^c898 o  ^_�r�r 0 
thesummary 
theSummary9 m  _b::  unknown   7 o      �q�q 0 
thesummary 
theSummary�u  3 w  h�;<; k  l�== >?> r  lu@A@ b  lsBCB o  lm�p�p 0 
thesummary 
theSummaryC n  mrDED 1  nr�o
�o 
pnamE o  mn�n�n 0 	theperson 	thePersonA o      �m�m 0 
thesummary 
theSummary? FGF r  v�HIH b  vJKJ m  vyLL  addressbook://   K n  y~MNM 1  z~�l
�l 
ID  N o  yz�k�k 0 	theperson 	thePersonI o      �j�j 0 theurl theURLG OPO l ���i�h�i  �h  P QRQ r  ��STS I  ���gU�f�g 0 getphone getPhoneU VWV o  ���e�e 0 event_caller_id  W X�dX o  ���c�c 0 	theperson 	thePerson�d  �f  T o      �b�b 0 thephone thePhoneR Y�aY Z  ��Z[�`�_Z > ��\]\ o  ���^�^ 0 thephone thePhone] m  ���]
�] 
msng[ r  ��^_^ b  ��`a` b  ��bcb b  ��ded b  ��fgf o  ���\�\ 0 thelocation theLocationg 1  ���[
�[ 
space m  ��hh  (   c n  ��iji 1  ���Z
�Z 
az18j o  ���Y�Y 0 thephone thePhonea m  ��kk  )   _ o      �X�X 0 thelocation theLocation�`  �_  �a  <�null      � ��  dAddress Book.app ��ш���(��؀��4 P  ����    �١��$���pD adrb  alis    d  Macintosh HD               �N�.H+    dAddress Book.app                                                O̽�3        ����  	                Applications    �N�      ���      d  *Macintosh HD:Applications:Address Book.app  "  A d d r e s s   B o o k . a p p    M a c i n t o s h   H D  Applications/Address Book.app   / ��  0 lml l ���W�V�W  �V  m non r  ��pqp K  ��rr �Ust�U 0 thecid theCIDs o  ���T�T 0 event_call_id  t �Suv�S 0 thetype theTypeu o  ���R�R 0 	call_type  v �Qwx�Q 0 	thenumber 	theNumberw o  ���P�P 0 event_caller_id  x �Oyz�O 0 thedirection theDirectiony o  ���N�N 0 	direction  z �M{|�M 0 	starttime 	startTime{ I ���L�K�J
�L .misccurdldt    ��� null�K  �J  | �I}~�I 0 answeredtime answeredTime} m  ���H
�H 
msng~ �G��G 0 endtime endTime m  ���F
�F 
msng� �E���E 0 	theperson 	thePerson� o  ���D�D 0 
thesummary 
theSummary� �C��B�C 0 thelocation theLocation� o  ���A�A 0 thelocation theLocation�B  q o      �@�@ 0 thecall theCallo ��� s  ����� o  ���?�? 0 thecall theCall� n      ���  :  ��� o  ���>�> 0 currentcalls currentCalls� ��� l ���=�<�=  �<  � ��;� O  ���� I ��:�9�
�: .notifygrnull��� ��� null�9  � �8��
�8 
name� o  ���7�7 $0 notificationname notificationName� �6��
�6 
titl� b  ���� b  ����� o  ���5�5 0 	direction  � 1  ���4
�4 
spac� m  ��� 
 call   � �3��
�3 
appl� o  �2�2 0 appname appName� �1��0
�1 
desc� b  ��� b  ��� o  	�/�/ 0 thelocation theLocation� o  	�.
�. 
ret � o  �-�- 0 
thesummary 
theSummary�0  � m  �� C�;  ��   k  �� ��� r  !��� I  �,��+�, 0 getcallrecord getCallRecord� ��*� o  �)�) 0 event_call_id  �*  �+  � o      �(�( 0 thecall theCall� ��� r  "+��� I "'�'�&�%
�' .misccurdldt    ��� null�&  �%  � o      �$�$ 0 thetime theTime� ��#� Z  ,����"� = ,1��� o  ,-�!�! 0 call_status  � m  -0��  active   � k  4��� ��� Z  4Q��� �� = 4?��� n  4;��� o  7;�� 0 answeredtime answeredTime� o  47�� 0 thecall theCall� m  ;>�
� 
msng� r  BM��� o  BE�� 0 thetime theTime� n      ��� o  HL�� 0 answeredtime answeredTime� o  EH�� 0 thecall theCall�   �  � ��� O  R���� I V����
� .notifygrnull��� ��� null�  � ���
� 
name� o  Z[�� $0 notificationname notificationName� ���
� 
titl� b  ^m��� b  ^i��� n  ^e��� o  ae�� 0 thedirection theDirection� o  ^a�� 0 thecall theCall� 1  eh�
� 
spac� m  il��  answerd   � ���
� 
appl� o  no�� 0 appname appName� ���
� 
desc� b  r���� b  r}��� n  ry��� o  uy�� 0 thelocation theLocation� o  ru�
�
 0 thecall theCall� o  y|�	
�	 
ret � n  }���� o  ���� 0 	theperson 	thePerson� o  }��� 0 thecall theCall�  � m  RS C�  � ��� = ����� o  ���� 0 call_status  � m  ���� 
 idle   � ��� k  ���� ��� r  ����� o  ���� 0 thetime theTime� n      ��� o  ���� 0 endtime endTime� o  ���� 0 thecall theCall� ��� r  ����� I  ����� � 0 englishtime englishTime� ���� \  ����� l ������ n  ����� o  ������ 0 endtime endTime� o  ������ 0 thecall theCall��  � l ������ n  ����� o  ������ 0 answeredtime answeredTime� o  ������ 0 thecall theCall��  ��  �   � o      ���� 0 theduration theDuration� ��� O  ����� I �������
�� .notifygrnull��� ��� null��  � ����
�� 
name� o  ������ $0 notificationname notificationName� ����
�� 
titl� b  ����� b  ��� � n  �� o  ������ 0 thedirection theDirection o  ������ 0 thecall theCall  1  ����
�� 
spac� m  ��  hungup   � ��
�� 
appl o  ������ 0 appname appName ����
�� 
desc b  �� b  ��	
	 b  �� b  �� n  �� o  ������ 0 thelocation theLocation o  ������ 0 thecall theCall o  ����
�� 
ret  m  ��  Time:   
 1  ����
�� 
spac o  ������ 0 theduration theDuration��  � m  �� C� �� I  �������� $0 deletecallrecord deleteCallRecord �� o  ������ 0 event_call_id  ��  ��  ��  �  �"  �#  ��     l     ������  ��    l     ������  ��    l     ����   ( "-tell application "GrowlHelperApp"     l     ����   � �-notify with name notificationName title call_type application name appName description event_caller_id & ":  " & call_status with sticky      l     ��!��  !  	-end tell     "#" l     ������  ��  # $%$ l     ������  ��  % &'& i    ()( I      ��*���� 0 getcallrecord getCallRecord* +��+ o      ���� 0 cid  ��  ��  ) k     2,, -.- X     '/��0/ Z    "12����1 =   343 n    565 o    ���� 0 thecid theCID6 o    ���� 0 acall aCall4 o    ���� 0 cid  2 L    77 o    ���� 0 acall aCall��  ��  �� 0 acall aCall0 o    ���� 0 currentcalls currentCalls. 898 l  ( (������  ��  9 :��: R   ( 2��;��
�� .ascrerr ****      � ****; b   * 1<=< b   * />?> b   * -@A@ m   * +BB   Missing call record for id   A 1   + ,��
�� 
spac? o   - .���� 0 cid  = m   / 0CC  .   ��  ��  ' DED l     ������  ��  E FGF i    HIH I      ��J���� $0 deletecallrecord deleteCallRecordJ K��K o      ���� 0 cid  ��  ��  I k     8LL MNM r     OPO J     ����  P o      ���� 0 newcalls newCallsN QRQ X    0S��TS Z    +UV����U >   WXW n    YZY o    ���� 0 thecid theCIDZ o    ���� 0 acall aCallX o    ���� 0 cid  V s   ! '[\[ n   ! $]^] 1   " $��
�� 
pcnt^ o   ! "���� 0 acall aCall\ n      _`_  ;   % &` o   $ %���� 0 newcalls newCalls��  ��  �� 0 acall aCallT o    ���� 0 currentcalls currentCallsR aba l  1 1������  ��  b c��c r   1 8ded o   1 2���� 0 newcalls newCallse o      ���� 0 currentcalls currentCalls��  G fgf l     ������  ��  g hih i    jkj I      ��l���� 0 logcall logCalll m��m o      ���� 0 thecall theCall��  ��  k k    mnn opo r     qrq m     ss      r o      ���� 0 
thesummary 
theSummaryp tut r    	vwv n    xyx o    ���� 0 thelog theLogy o    ���� 0 thecall theCallw o      ���� 0 thelog theLogu z{z l  
 
������  ��  { |}| Z   
 N~���~ =  
 ��� n   
 ��� o    ���� 0 answeredtime answeredTime� o   
 ���� 0 thecall theCall� m    ��
�� 
msng k    3�� ��� Z    ������� H    �� o    ���� (0 logunansweredcalls logUnansweredCalls� L    ����  ��  ��  � ��� l   ������  ��  � ���� Z    3������ =   #��� n    !��� o    !���� 0 thedirection theDirection� o    ���� 0 thecall theCall� m   ! "��  incoming   � r   & +��� b   & )��� m   & '��  missed   � 1   ' (��
�� 
spac� o      ���� 0 
thesummary 
theSummary��  � r   . 3��� b   . 1��� m   . /��  
unanswered   � 1   / 0��
�� 
spac� o      ���� 0 
thesummary 
theSummary��  ��  � r   6 N��� b   6 L��� b   6 J��� b   6 =��� b   6 ;��� b   6 9��� o   6 7���� 0 thelog theLog� o   7 8��
�� 
ret � m   9 :��  call duration   � 1   ; <��
�� 
spac� l 	 = I���� I   = I������� 0 englishtime englishTime� ���� \   > E��� l  > A���� n   > A��� o   ? A���� 0 endtime endTime� o   > ?���� 0 thecall theCall��  � l  A D���� n   A D��� o   B D���� 0 answeredtime answeredTime� o   A B���� 0 thecall theCall��  ��  ��  ��  � o   J K��
�� 
ret � o      ���� 0 thelog theLog} ��� l  O O��~�  �~  � ��� Z   O ������ =  O T��� n   O R��� o   P R�}�} 0 thetype theType� o   O P�|�| 0 thecall theCall� m   R S�� 	 fax   � r   W ^��� b   W \��� b   W Z��� o   W X�{�{ 0 
thesummary 
theSummary� m   X Y�� 	 fax   � 1   Z [�z
�z 
spac� o      �y�y 0 
thesummary 
theSummary� ��� =  a h��� n   a d��� o   b d�x�x 0 thetype theType� o   a b�w�w 0 thecall theCall� m   d g�� 
 data   � ��v� r   k t��� b   k r��� b   k p��� o   k l�u�u 0 
thesummary 
theSummary� m   l o��  	data call   � 1   p q�t
�t 
spac� o      �s�s 0 
thesummary 
theSummary�v  � r   w ���� b   w ~��� b   w |��� o   w x�r�r 0 
thesummary 
theSummary� m   x {�� 
 call   � 1   | }�q
�q 
spac� o      �p�p 0 
thesummary 
theSummary� ��� l  � ��o�n�o  �n  � ��� Z   � ����m�� =  � ���� n   � ���� o   � ��l�l 0 thedirection theDirection� o   � ��k�k 0 thecall theCall� m   � ���  incoming   � r   � ���� b   � ���� b   � ���� o   � ��j�j 0 
thesummary 
theSummary� m   � ��� 
 from   � 1   � ��i
�i 
spac� o      �h�h 0 
thesummary 
theSummary�m  � r   � ���� b   � ���� b   � ���� o   � ��g�g 0 
thesummary 
theSummary� m   � ���  to   � 1   � ��f
�f 
spac� o      �e�e 0 
thesummary 
theSummary� ��� l  � ��d�c�d  �c  � ��� r   � �   I   � ��b�a�b 0 formatnumber formatNumber �` n   � � o   � ��_�_ 0 	thenumber 	theNumber o   � ��^�^ 0 thecall theCall�`  �a   o      �]�] 0 thelocation theLocation�  r   � �	 I   � ��\
�[�\ 0 	getperson 	getPerson
 �Z n   � � o   � ��Y�Y 0 	thenumber 	theNumber o   � ��X�X 0 thecall theCall�Z  �[  	 o      �W�W 0 	theperson 	thePerson  r   � � m   � ��V
�V 
msng o      �U�U 0 theurl theURL  l  � ��T�S�T  �S    Z   � ��R�Q I   � ��P�O�P 0 shouldnotlog shouldNotLog �N o   � ��M�M 0 	theperson 	thePerson�N  �O   L   � ��L�L  �R  �Q    l  � ��K�J�K  �J    Z   �$�I  =  � �!"! o   � ��H�H 0 	theperson 	thePerson" m   � ��G
�G 
msng r   � �#$# b   � �%&% o   � ��F�F 0 
thesummary 
theSummary& m   � �''  unknown   $ o      �E�E 0 
thesummary 
theSummary�I    w   �$(<( k   �$)) *+* r   � �,-, b   � �./. o   � ��D�D 0 
thesummary 
theSummary/ n   � �010 1   � ��C
�C 
pnam1 o   � ��B�B 0 	theperson 	thePerson- o      �A�A 0 
thesummary 
theSummary+ 232 r   � �454 b   � �676 m   � �88  addressbook://   7 n   � �9:9 1   � ��@
�@ 
ID  : o   � ��?�? 0 	theperson 	thePerson5 o      �>�> 0 theurl theURL3 ;<; l  � ��=�<�=  �<  < =>= r   �?@? I   ��;A�:�; 0 getphone getPhoneA BCB n   � �DED o   � ��9�9 0 	thenumber 	theNumberE o   � ��8�8 0 thecall theCallC F�7F o   � �6�6 0 	theperson 	thePerson�7  �:  @ o      �5�5 0 thephone thePhone> G�4G Z  $HI�3�2H > 
JKJ o  �1�1 0 thephone thePhoneK m  	�0
�0 
msngI r   LML b  NON b  PQP b  RSR b  TUT o  �/�/ 0 thelocation theLocationU 1  �.
�. 
spacS m  VV  (   Q n  WXW 1  �-
�- 
az18X o  �,�, 0 thephone thePhoneO m  YY  )   M o      �+�+ 0 thelocation theLocation�3  �2  �4   Z[Z l %%�*�)�*  �)  [ \�(\ O %m]^] I +l�'�&_
�' .corecrel****      � null�&  _ �%`a
�% 
kocl` m  /2�$
�$ 
wreva �#bc
�# 
inshb n  5<ded  ;  ;<e n 5;fgf I  6;�"h�!�" 0 getcalendar getCalendarh i� i o  67�� $0 logcalendartitle logCalendarTitle�   �!  g  f  56c �j�
� 
prdtj K  ?fkk �lm
� 
wr11l n BHnon I  CH�p�� 0 
capitalize  p q�q o  CD�� 0 
thesummary 
theSummary�  �  o  f  BCm �rs
� 
wr14r o  KL�� 0 thelocation theLocations �tu
� 
wr1st n  OTvwv o  PT�� 0 	starttime 	startTimew o  OP�� 0 thecall theCallu �xy
� 
wr5sx n  WZz{z o  XZ�� 0 endtime endTime{ o  WX�� 0 thecall theCally �|}
� 
wr16| o  ]^�� 0 theurl theURL} �~�
� 
wr12~ o  ab�� 0 thelog theLog�  �  ^ m  %(�null     ߀��  diCal.app̿�����Ў�ш   }���0���� (   )       �"(�Й̿��`�wrbt  alis    D  Macintosh HD               �N�.H+    diCal.app                                                        I��В        ����  	                Applications    �N�      ��      d  "Macintosh HD:Applications:iCal.app    i C a l . a p p    M a c i n t o s h   H D  Applications/iCal.app   / ��  �(  i ��� l     �
�	�
  �	  � ��� i    ��� I      ���� 0 getcalendar getCalendar� ��� o      �� 0 thetitle theTitle�  �  � O     1��� k    0�� ��� e    �� 6   ��� 2   �
� 
wres� =   ��� m   	 �
� 
wr02� o    �� 0 thetitle theTitle� ��� Z    0��� �� ?    ��� n    ��� 1    ��
�� 
leng� 1    ��
�� 
rslt� m    ����  � L     �� n    ��� 4   ���
�� 
cobj� m    ���� � 1    ��
�� 
rslt�   � L   # 0�� I  # /�����
�� .corecrel****      � null��  � ����
�� 
kocl� m   % &��
�� 
wres� �����
�� 
prdt� K   ' +�� �����
�� 
wr02� o   ( )���� 0 thetitle theTitle��  ��  �  � m     � ��� l     ������  ��  � ��� i     #��� I      ������� 0 	getperson 	getPerson� ���� o      ���� 0 	thenumber 	theNumber��  ��  � k     (�� ��� Q     %����� k    �� ��� O   ��� r    ��� I   �����
�� .seClLUabnull��� ��� obj � o    ���� 0 	thenumber 	theNumber��  � o      ���� 0 theuid theUID� m     I� ���� O   ��� L    �� 5    �����
�� 
azf4� o    ���� 0 theuid theUID
�� kfrmID  � m    <��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� l  & &������  ��  � ���� L   & (�� m   & '��
�� 
msng��  � ��� l     ������  ��  � ��� i   $ '��� I      ������� 0 getphone getPhone� ��� o      ���� 0 	thenumber 	theNumber� ���� o      ���� 0 	theperson 	thePerson��  ��  � k     ]�� ��� r     ��� I     ������� 0 digitsof digitsOf� ���� o    ���� 0 	thenumber 	theNumber��  ��  � o      ���� 0 	thenumber 	theNumber� ��� l  	 	������  ��  � ��� Z   	 -������� F   	 ��� =  	 ��� n   	 ��� 1   
 ��
�� 
leng� o   	 
���� 0 	thenumber 	theNumber� m    ���� � =   ��� n    ��� l 	  ���� 4    ���
�� 
cha � m    ���� ��  � o    ���� 0 	thenumber 	theNumber� m    ��  1   � r    )��� n    '��� 7   '����
�� 
ctxt� m   ! #���� � m   $ &���� � o    ���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ��� l  . .������  ��  � ��� w   . Z�<� X   0 Z����� Z   B U������� E   B L��� n  B J��� I   C J������� 0 digitsof digitsOf� ���� n   C F��� 1   D F��
�� 
az17� o   C D���� 0 aphone aPhone��  ��  �  f   B C� o   J K���� 0 	thenumber 	theNumber� L   O Q�� o   O P���� 0 aphone aPhone��  ��  �� 0 aphone aPhone� n   3 6� � 2  4 6��
�� 
az20  o   3 4���� 0 	theperson 	thePerson�  l  [ [������  ��   �� L   [ ] m   [ \��
�� 
msng��  �  l     ������  ��    i   ( +	
	 I      ������ 0 ismember isMember  o      ���� 0 	theentity 	theEntity �� o      ���� 0 thegroup theGroup��  ��  
 k     6  w     3< X    3�� Z    .���� G    % =     n     1    ��
�� 
pcnt o    ���� 0 agroup aGroup o    ���� 0 thegroup theGroup l 	  #�� I    #������ 0 ismember isMember   o    ���� 0 agroup aGroup  !��! o    ���� 0 thegroup theGroup��  ��  ��   L   ( *"" m   ( )��
�� boovtrue��  ��  �� 0 agroup aGroup n    #$# 2   ��
�� 
azf5$ o    ���� 0 	theentity 	theEntity %&% l  4 4������  ��  & '��' L   4 6(( m   4 5��
�� boovfals��   )*) l     ������  ��  * +,+ i   , /-.- I      ��/���� 0 shouldnotlog shouldNotLog/ 0��0 o      ���� 0 	theperson 	thePerson��  ��  . k     i11 232 Z     45����4 =    676 o     ���� 0 	theperson 	thePerson7 m    ��
�� 
msng5 L    
88 >   	9:9 o    ���� 0 loggroup logGroup: m    ��
�� 
msng��  ��  3 ;<; l   ������  ��  < =>= O    f?@? k    eAA BCB Q    ;DE��D Z    2FG����F F    )HIH >   JKJ o    ���� 0 
nologgroup 
noLogGroupK m    ��
�� 
msngI l 	  'L�L n   'MNM I    '�~O�}�~ 0 ismember isMemberO PQP o    �|�| 0 	theperson 	thePersonQ R�{R 5    #�zS�y
�z 
azf5S o     !�x�x 0 
nologgroup 
noLogGroup
�y kfrmname�{  �}  N  f    �  G L   , .TT m   , -�w
�w boovtrue��  ��  E R      �v�u�t
�v .ascrerr ****      � ****�u  �t  ��  C U�sU Q   < eVW�rV Z   ? \XY�q�pX F   ? SZ[Z >  ? B\]\ o   ? @�o�o 0 loggroup logGroup] m   @ A�n
�n 
msng[ l 	 E Q^�m^ H   E Q__ n  E P`a` I   F P�lb�k�l 0 ismember isMemberb cdc o   F G�j�j 0 	theperson 	thePersond e�ie 5   G L�hf�g
�h 
azf5f o   I J�f�f 0 loggroup logGroup
�g kfrmname�i  �k  a  f   E F�m  Y L   V Xgg m   V W�e
�e boovtrue�q  �p  W R      �d�c�b
�d .ascrerr ****      � ****�c  �b  �r  �s  @ m    <> hih l  g g�a�`�a  �`  i j�_j L   g ikk m   g h�^
�^ boovfals�_  , lml l     �]�\�]  �\  m non i   0 3pqp I      �[r�Z�[ 0 digitsof digitsOfr s�Ys o      �X�X 0 	thestring 	theString�Y  �Z  q k     1tt uvu r     wxw m     yy  
0123456789   x o      �W�W 0 validdigits validDigitsv z{z r    |}| m    ~~      } o      �V�V 0 	newstring 	newString{ � X    .��U�� Z    )���T�S� E   ��� o    �R�R 0 validdigits validDigits� o    �Q�Q 0 adigit aDigit� r     %��� b     #��� o     !�P�P 0 	newstring 	newString� o   ! "�O�O 0 adigit aDigit� o      �N�N 0 	newstring 	newString�T  �S  �U 0 adigit aDigit� n    ��� 2   �M
�M 
cha � o    �L�L 0 	thestring 	theString� ��� l  / /�K�J�K  �J  � ��I� L   / 1�� o   / 0�H�H 0 	newstring 	newString�I  o ��� l     �G�F�G  �F  � ��� i   4 7��� I      �E��D�E 0 formatnumber formatNumber� ��C� o      �B�B 0 	thenumber 	theNumber�C  �D  � k     ��� ��� r     ��� I     �A��@�A 0 digitsof digitsOf� ��?� o    �>�> 0 	thenumber 	theNumber�?  �@  � o      �=�= 0 	thenumber 	theNumber� ��� l  	 	�<�;�<  �;  � ��� Z   	 �����:� =  	 ��� n   	 ��� 1   
 �9
�9 
leng� o   	 
�8�8 0 	thenumber 	theNumber� m    �7�7  � L    �� m    �6
�6 
msng� ��� F    &��� =   ��� n    ��� 1    �5
�5 
leng� o    �4�4 0 	thenumber 	theNumber� m    �3�3 � =   $��� n    "��� l 	  "��2� 4    "�1�
�1 
cha � m     !�0�0 �2  � o    �/�/ 0 	thenumber 	theNumber� m   " #��  1   � ��� L   ) >�� b   ) =��� b   ) ,��� m   ) *��  +1   � 1   * +�.
�. 
spac� l 	 , <��-� I   , <�,��+�, 0 formatnumber formatNumber� ��*� n   - 8��� 7  . 8�)��
�) 
ctxt� m   2 4�(�( � m   5 7�'�' � o   - .�&�& 0 	thenumber 	theNumber�*  �+  �-  � ��� =  A F��� n   A D��� 1   B D�%
�% 
leng� o   A B�$�$ 0 	thenumber 	theNumber� m   D E�#�# 
� ��� L   I h�� b   I g��� b   I V��� l 	 I T��"� l  I T��!� n   I T��� 7  J T� ��
�  
ctxt� m   N P�� � m   Q S�� � o   I J�� 0 	thenumber 	theNumber�!  �"  � 1   T U�
� 
spac� l 	 V f��� I   V f���� 0 formatnumber formatNumber� ��� n   W b��� 7  X b���
� 
ctxt� m   \ ^�� � m   _ a�� 
� o   W X�� 0 	thenumber 	theNumber�  �  �  � ��� =  k p��� n   k n��� 1   l n�
� 
leng� o   k l�� 0 	thenumber 	theNumber� m   n o�� � ��� L   s ��� b   s ���� b   s ���� l 	 s ~��� l  s ~��� n   s ~��� 7  t ~���
� 
ctxt� m   x z�� � m   { }�� � o   s t�
�
 0 	thenumber 	theNumber�  �  � m   ~ ��  -   � l 	 � ���	� l  � ���� n   � ���� 7  � ����
� 
ctxt� m   � ��� � m   � ��� � o   � ��� 0 	thenumber 	theNumber�  �	  �  �:  � ��� l  � ����  �  � ��� L   � �   o   � �� �  0 	thenumber 	theNumber�  �  l     ������  ��    i   8 ; I      ������ 0 englishcount englishCount 	 o      ���� 0 howmany howMany	 
��
 o      ���� 0 
unitstring 
unitString��  ��   k       r     	 c      b      b      o     ���� 0 howmany howMany 1    ��
�� 
spac o    ���� 0 
unitstring 
unitString m    ��
�� 
TEXT o      ���� 0 	thestring 	theString  Z   
 ���� >   
  o   
 ���� 0 howmany howMany m    ����  r     b     o    ���� 0 	thestring 	theString m        s    o      ���� 0 	thestring 	theString��  ��   !"! l   ������  ��  " #��# L    $$ o    ���� 0 	thestring 	theString��   %&% l     ������  ��  & '(' i   < ?)*) I      ��+���� 0 englishtime englishTime+ ,��, o      ���� 0 
numseconds 
numSeconds��  ��  * k     �-- ./. r     010 J     ����  1 o      ���� 0 theelements theElements/ 232 Z    !45����4 @    676 o    ���� 0 
numseconds 
numSeconds7 1    ��
�� 
hour5 k    88 9:9 s    ;<; I    ��=���� 0 englishcount englishCount= >?> _    @A@ o    ���� 0 
numseconds 
numSecondsA 1    ��
�� 
hour? B��B m    CC 
 hour   ��  ��  < n      DED  ;    E o    ���� 0 theelements theElements: F��F r    GHG `    IJI o    ���� 0 
numseconds 
numSecondsJ 1    ��
�� 
hourH o      ���� 0 
numseconds 
numSeconds��  ��  ��  3 KLK l  " "������  ��  L MNM Z   " >OP����O @   " %QRQ o   " #���� 0 
numseconds 
numSecondsR 1   # $��
�� 
min P k   ( :SS TUT s   ( 4VWV I   ( 1��X���� 0 englishcount englishCountX YZY _   ) ,[\[ o   ) *���� 0 
numseconds 
numSeconds\ 1   * +��
�� 
min Z ]��] m   , -^^  minute   ��  ��  W n      _`_  ;   2 3` o   1 2���� 0 theelements theElementsU a��a r   5 :bcb `   5 8ded o   5 6���� 0 
numseconds 
numSecondse 1   6 7��
�� 
min c o      ���� 0 
numseconds 
numSeconds��  ��  ��  N fgf l  ? ?������  ��  g hih Z   ? ]jk����j G   ? Llml ?   ? Bnon o   ? @���� 0 
numseconds 
numSecondso m   @ A����  m =  E Jpqp n   E Hrsr l 	 F Ht��t 1   F H��
�� 
leng��  s o   E F���� 0 theelements theElementsq m   H I����  k s   O Yuvu I   O V��w���� 0 englishcount englishCountw xyx o   P Q���� 0 
numseconds 
numSecondsy z��z m   Q R{{  second   ��  ��  v n      |}|  ;   W X} o   V W���� 0 theelements theElements��  ��  i ~~ l  ^ ^������  ��   ���� Z   ^ ������ =   ^ c��� n   ^ a��� 1   _ a��
�� 
leng� o   ^ _���� 0 theelements theElements� m   a b���� � L   f }�� b   f |��� b   f w��� b   f u��� b   f s��� b   f n��� b   f l��� n   f j��� l 	 g j���� 4   g j���
�� 
cobj� m   h i���� ��  � o   f g���� 0 theelements theElements� m   j k��  ,   � 1   l m��
�� 
spac� n   n r��� l 	 o r���� 4   o r���
�� 
cobj� m   p q���� ��  � o   n o���� 0 theelements theElements� m   s t��  , and   � 1   u v��
�� 
spac� n   w {��� l 	 x {���� 4   x {���
�� 
cobj� m   y z���� ��  � o   w x���� 0 theelements theElements� ��� =   � ���� n   � ���� 1   � ���
�� 
leng� o   � ����� 0 theelements theElements� m   � ����� � ���� L   � ��� b   � ���� b   � ���� b   � ���� b   � ���� n   � ���� l 	 � ����� 4   � ����
�� 
cobj� m   � ����� ��  � o   � ����� 0 theelements theElements� 1   � ���
�� 
spac� m   � ��� 	 and   � 1   � ���
�� 
spac� n   � ���� l 	 � ����� 4   � ����
�� 
cobj� m   � ����� ��  � o   � ����� 0 theelements theElements��  � L   � ��� n   � ���� l 	 � ����� 4   � ����
�� 
cobj� m   � ����� ��  � o   � ����� 0 theelements theElements��  ( ��� l     ������  ��  � ��� i   @ C��� I      ������� 0 
capitalize  � ���� o      ���� 0 	thestring 	theString��  ��  � k     O�� ��� Z     L������� ?     ��� n     ��� 1    ��
�� 
leng� o     ���� 0 	thestring 	theString� m    ����  � k    H�� ��� r    ��� I   �����
�� .sysoctonshor       TEXT� l   ���� n    ��� 4   	 ���
�� 
cha � m   
 �� � o    	�~�~ 0 	thestring 	theString��  ��  � o      �}�} 	0 ascii  � ��� l   �|�{�|  �{  � ��z� Z    H���y�x� F    &��� @    ��� l 	  ��w� o    �v�v 	0 ascii  �w  � l   ��u� I   �t��s
�t .sysoctonshor       TEXT� m    ��  a   �s  �u  � B    $��� l 	  ��r� o    �q�q 	0 ascii  �r  � l   #��p� I   #�o��n
�o .sysoctonshor       TEXT� m    ��  z   �n  �p  � r   ) D��� b   ) B��� l 	 ) :��m� l  ) :��l� I  ) :�k��j
�k .sysontocTEXT       shor� l  ) 6��i� [   ) 6��� \   ) 0��� o   ) *�h�h 	0 ascii  � l  * /��g� I  * /�f��e
�f .sysoctonshor       TEXT� m   * +��  a   �e  �g  � l  0 5��d� I  0 5�c �b
�c .sysoctonshor       TEXT  m   0 1  A   �b  �d  �i  �j  �l  �m  � l  : A�a c   : A n   : ? 1   = ?�`
�` 
rest n   : = 2  ; =�_
�_ 
cha  o   : ;�^�^ 0 	thestring 	theString m   ? @�]
�] 
TEXT�a  � o      �\�\ 0 	thestring 	theString�y  �x  �z  ��  ��  � 	
	 l  M M�[�Z�[  �Z  
 �Y L   M O o   M N�X�X 0 	thestring 	theString�Y  � �W l     �V�U�V  �U  �W       �T�T   �S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�S 0 currentcalls currentCalls�R 0 	connected  �Q 0 entered_proximity  �P "0 phone_call_status_notification  �O 0 getcallrecord getCallRecord�N $0 deletecallrecord deleteCallRecord�M 0 logcall logCall�L 0 getcalendar getCalendar�K 0 	getperson 	getPerson�J 0 getphone getPhone�I 0 ismember isMember�H 0 shouldnotlog shouldNotLog�G 0 digitsof digitsOf�F 0 formatnumber formatNumber�E 0 englishcount englishCount�D 0 englishtime englishTime�C 0 
capitalize   �B�A�B  �A   �@ �?�> !�=�@ 0 	connected  �?  �>     !  �= 	jvEc    �< �;�:"#�9�< 0 entered_proximity  �;  �:  "  #  �9 	jvEc    �8  �7�6$%�5�8 "0 phone_call_status_notification  �7 �4&�4 &  �3�3 0 
event_info  �6  $ �2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �2 0 
event_info  �1 0 appname appName�0 $0 notificationname notificationName�/ 
0 notifs  �. 0 call_status  �- 0 event_call_status  �, 0 	call_type  �+ 0 event_call_type  �* 0 event_call_id  �) 0 event_caller_id  �( 0 	direction  �' 0 
thesummary 
theSummary�& 0 thelocation theLocation�% 0 	theperson 	thePerson�$ 0 theurl theURL�# 0 thephone thePhone�" 0 thecall theCall�! 0 thetime theTime�  0 theduration theDuration% X ( - C���� B�� I U�� e� n� w� �� �� �� �� � ��� �� �� �� �� ��
�	�"���:<�L���h� k������������������������������������������
� 
appl
� 
anot
� 
dnot
� 
iapp� 
� .registernull��� ��� null� 0 the_call_status  
� CSxxCSal
� CSxxCScl
� CSxxCSct
� CSxxCShd
� CSxxCSwt
� CSxxCSac
� CSxxCSid
� CSxxCSbs� 0 the_call_type  
� CTxxCTvc
� CTxxCTda
� CTxxCTfx
� CTxxCTv2� 0 the_cid  �
 0 the_phone_number  �	  �  � 0 formatnumber formatNumber� 0 	getperson 	getPerson
� 
msng
� 
pnam
� 
ID  � 0 getphone getPhone
� 
spac
�  
az18�� 0 thecid theCID�� 0 thetype theType�� 0 	thenumber 	theNumber�� 0 thedirection theDirection�� 0 	starttime 	startTime
�� .misccurdldt    ��� null�� 0 answeredtime answeredTime�� 0 endtime endTime�� 0 	theperson 	thePerson�� 0 thelocation theLocation�� 
�� 
name
�� 
titl
�� 
desc
�� 
ret 
�� .notifygrnull��� ��� null�� 0 getcallrecord getCallRecord�� 0 englishtime englishTime�� $0 deletecallrecord deleteCallRecord�5�E�O�E�O�kvE�O� *������ 	UO�Z�E�O��,E�O��  �E�Y q��  
a E�Y c�a   
a E�Y S�a   
a E�Y C�a   
a E�Y 3�a   
a E�Y #�a   
a E�Y �a   
a E�Y hOa E�O�a ,E�O�a   
a  E�Y 3�a !  
a "E�Y #�a #  
a $E�Y �a %  
a &E�Y hO�a ',E�Oa (E�O �a ),E�W X * +hOa ,a -lv� �a .  
a /E�Y a 0E�Oa 1E�O*�k+ 2E�O*�k+ 3E�O�a 4  �a 5%E�Y Ga 6Z��a 7,%E�Oa 8�a 9,%E�O*��l+ :E�O�a 4 �_ ;%a <%�a =,%a >%E�Y hOa ?�a @�a A�a B�a C*j Da Ea 4a Fa 4a G�a H�a IE^ O] b   5GO� #*a J�a K�_ ;%a L%�a M�_ N%�%� OUY �*�k+ PE^ O*j DE^ O�a Q  [] a E,a 4  ] ] a E,FY hO� 5*a J�a K] a B,_ ;%a R%�a M] a H,_ N%] a G,%� OUY v�a S  m] ] a F,FO*] a F,] a E,k+ TE^ O� 9*a J�a K] a B,_ ;%a U%�a M] a H,_ N%a V%_ ;%] %� OUO*�k+ WY h ��)����'(���� 0 getcallrecord getCallRecord�� ��)�� )  ���� 0 cid  ��  ' ������ 0 cid  �� 0 acall aCall( ��������B��C
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 thecid theCID
�� 
spac�� 3 &b   [��l kh ��,�  �Y h[OY��O)j��%�%�% ��I����*+���� $0 deletecallrecord deleteCallRecord�� ��,�� ,  ���� 0 cid  ��  * �������� 0 cid  �� 0 newcalls newCalls�� 0 acall aCall+ ����������
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 thecid theCID
�� 
pcnt�� 9jvE�O *b   [��l kh ��,� ��,�6GY h[OY��O�Ec    ��k����-.���� 0 logcall logCall�� ��/�� /  ���� 0 thecall theCall��  - 	�������������������� 0 thecall theCall�� 0 
thesummary 
theSummary�� 0 thelog theLog�� (0 logunansweredcalls logUnansweredCalls�� 0 thelocation theLocation�� 0 	theperson 	thePerson�� 0 theurl theURL�� 0 thephone thePhone�� $0 logcalendartitle logCalendarTitle. 4s��������������������������������������'<��8����V��Y���������������������������������� 0 thelog theLog�� 0 answeredtime answeredTime
�� 
msng�� 0 thedirection theDirection
�� 
spac
�� 
ret �� 0 endtime endTime�� 0 englishtime englishTime�� 0 thetype theType�� 0 	thenumber 	theNumber�� 0 formatnumber formatNumber�� 0 	getperson 	getPerson�� 0 shouldnotlog shouldNotLog
�� 
pnam
�� 
ID  �� 0 getphone getPhone
�� 
az18
�� 
kocl
�� 
wrev
�� 
insh�� 0 getcalendar getCalendar
�� 
prdt
�� 
wr11�� 0 
capitalize  
�� 
wr14
�� 
wr1s�� 0 	starttime 	startTime
�� 
wr5s
�� 
wr16
�� 
wr12�� �� 
�� .corecrel****      � null��n�E�O��,E�O��,�  &� hY hO��,�  
��%E�Y ��%E�Y ��%�%�%*��,��,k+ %�%E�O��,�  ��%�%E�Y !��,a   �a %�%E�Y �a %�%E�O��,a   �a %�%E�Y �a %�%E�O*�a ,k+ E�O*�a ,k+ E�O�E�O*�k+  hY hO��  �a %E�Y Ga Z��a ,%E�Oa �a ,%E�O*�a ,�l+ E�O�� ��%a  %�a !,%a "%E�Y hOa # C*a $a %a &)�k+ '6a (a ))�k+ *a +�a ,�a -,a .��,a /�a 0�a 1a 2 3U �������01���� 0 getcalendar getCalendar�� ��2�� 2  ���� 0 thetitle theTitle��  0 ���� 0 thetitle theTitle1 ��3����������������
�� 
wres3  
�� 
wr02
�� 
rslt
�� 
leng
�� 
cobj
�� 
kocl
�� 
prdt�� 
�� .corecrel****      � null�� 2� .*�-�[Z�\Z�81EO��,j ��k/EY *����l� 
U �������45���� 0 	getperson 	getPerson�� ��6�� 6  ���� 0 	thenumber 	theNumber��  4 ������ 0 	thenumber 	theNumber�� 0 theuid theUID5  I��<����������
�� .seClLUabnull��� ��� obj 
�� 
azf4
�� kfrmID  ��  ��  
�� 
msng�� ) � 	�j E�UO� 	*��0EUW X  hO� �������78���� 0 getphone getPhone�� �9� 9  �~�}�~ 0 	thenumber 	theNumber�} 0 	theperson 	thePerson��  7 �|�{�z�| 0 	thenumber 	theNumber�{ 0 	theperson 	thePerson�z 0 aphone aPhone8 �y�x�w�v��u�t<�s�r�q�p�o�n�y 0 digitsof digitsOf
�x 
leng�w 
�v 
cha 
�u 
bool
�t 
ctxt
�s 
az20
�r 
kocl
�q 
cobj
�p .corecnte****       ****
�o 
az17
�n 
msng�� ^*�k+  E�O��,� 	 
��k/� �& �[�\[Zl\Z�2E�Y hO�Z )��-[��l kh )��,k+  � �Y h[OY��O� �m
�l�k:;�j�m 0 ismember isMember�l �i<�i <  �h�g�h 0 	theentity 	theEntity�g 0 thegroup theGroup�k  : �f�e�d�f 0 	theentity 	theEntity�e 0 thegroup theGroup�d 0 agroup aGroup; <�c�b�a�`�_�^�]
�c 
azf5
�b 
kocl
�a 
cobj
�` .corecnte****       ****
�_ 
pcnt�^ 0 ismember isMember
�] 
bool�j 7�Z 0��-[��l kh ��,� 
 *��l+ �& eY h[OY��Of �\.�[�Z=>�Y�\ 0 shouldnotlog shouldNotLog�[ �X?�X ?  �W�W 0 	theperson 	thePerson�Z  = �V�U�T�V 0 	theperson 	thePerson�U 0 loggroup logGroup�T 0 
nologgroup 
noLogGroup> �S<�R�Q�P�O�N�M
�S 
msng
�R 
azf5
�Q kfrmname�P 0 ismember isMember
�O 
bool�N  �M  �Y j��  	��Y hO� T !��	 )�*��0l+ �& eY hW X  hO "��	 )�*��0l+ �& eY hW X  hUOf �Lq�K�J@A�I�L 0 digitsof digitsOf�K �HB�H B  �G�G 0 	thestring 	theString�J  @ �F�E�D�C�F 0 	thestring 	theString�E 0 validdigits validDigits�D 0 	newstring 	newString�C 0 adigit aDigitA y~�B�A�@�?
�B 
cha 
�A 
kocl
�@ 
cobj
�? .corecnte****       ****�I 2�E�O�E�O %��-[��l kh �� 
��%E�Y h[OY��O� �>��=�<CD�;�> 0 formatnumber formatNumber�= �:E�: E  �9�9 0 	thenumber 	theNumber�<  C �8�8 0 	thenumber 	theNumberD �7�6�5�4�3��2��1�0�/�.�-�,��7 0 digitsof digitsOf
�6 
leng
�5 
msng�4 
�3 
cha 
�2 
bool
�1 
spac
�0 
ctxt�/ 0 formatnumber formatNumber�. 
�- �, �; �*�k+  E�O��,j  �Y }��,� 	 
��k/� �& ��%*�[�\[Zl\Z�2k+ 
%Y R��,�  $�[�\[Zk\Zm2�%*�[�\[Z�\Z�2k+ 
%Y (��,�  �[�\[Zk\Zm2�%�[�\[Z�\Z�2%Y hO� �+�*�)FG�(�+ 0 englishcount englishCount�* �'H�' H  �&�%�& 0 howmany howMany�% 0 
unitstring 
unitString�)  F �$�#�"�$ 0 howmany howMany�# 0 
unitstring 
unitString�" 0 	thestring 	theStringG �!�  
�! 
spac
�  
TEXT�( ��%�%�&E�O�k 
��%E�Y hO� �*��IJ�� 0 englishtime englishTime� �K� K  �� 0 
numseconds 
numSeconds�  I ��� 0 
numseconds 
numSeconds� 0 theelements theElementsJ �C��^��{�����
� 
hour� 0 englishcount englishCount
� 
min 
� 
leng
� 
bool
� 
cobj
� 
spac� �jvE�O�� *��"�l+ �6GO��#E�Y hO�� *��"�l+ �6GO��#E�Y hO�j
 	��,j �& *��l+ �6GY hO��,m  ��k/�%�%��l/%�%�%��m/%Y #��,l  ��k/�%�%�%��l/%Y ��k/E ����LM�� 0 
capitalize  � �N� N  �� 0 	thestring 	theString�  L �
�	�
 0 	thestring 	theString�	 	0 ascii  M ����������
� 
leng
� 
cha 
� .sysoctonshor       TEXT
� 
bool
� .sysontocTEXT       shor
� 
rest
� 
TEXT� P��,j E��k/j E�O��j 	 ��j �&  ��j �j j ��-�,�&%E�Y hY hO� ascr  ��ޭ