FasdUAS 1.101.10   ��   ��    k             l      �� ��   		
* This script requires Growl. You can download Growl here: http://growl.info
* Once you have installed Growl, you can save this script as an application,
* remember to check the "Stays Open" option before saving.
* Then double-click the new application and enjoy.
*
* Comments and ideas to arminb@mac.com
* Sorry, If I made the code looks dirty, This is the
* first time I learn and write applescript
* Modified by Piti Ongmongkolkul May 5
* -- fix aim where some user does not have display picture and caused the program not to show notification
* -- display picture is now available for jabber --> you need to add it manually via address book
* just right click the name and get info
* -- fix(again) bug where the program sends every username to this growl.(Reported by benjamindaines)
* -- when aim buddy went away. It displays name(away) followed by status message 
* Modified by Piti Ongmongkolku May 4
* -- as pointed out by ben on growl forum
* this program cause ichat to reopen
* -- case the program tell iChat while it's closed caused it to reopen 
* -- fix: add semaphores
* -- also add semaphores for growl
* Modified by Piti Ongmongkolkul May 3 05
* -- correct behavior for aim account
* --display account name
* --display picture weeeeee
* -- huge code overhaul
* Modified by Piti Ongmongkolkul May 2 05
* -- put try and on error on every module
* 	to catch "connection error" when shutdown(hopefully)(I hate racing problem :( )
* -- fix show-everybody-bug when the program is
* 	launched after ichat or when the user log off and log in again
* 	by adding a variable userWasOnline variable and isJustOnline() module which will 
* 	touch userWasOnline variable and return true iff user was not online and just become online
* Modified by Piti Ongmongkolkul May 1 05 again
* --ignore work around method. Who cares when someone goes offline
* --fix bug when the user log off and log on again and send
* 	unknown status to growl.
* Modified by Piti Ongmongkolkul May 1 05
* --change theName from name to status id
* 	to account for msn messenger display name
* 	(use jabber msn transport)
* --workaround  (blank) went offline bug
* 	this happened because when the user is offline
* 	the status is set to blank. work around was done
* 	by using name instead of status in the case where
* 	the user went offline 
       	  l     ������  ��   	  
  
 j     �� �� 0 idletime idleTime  m     ����       l          j    �� �� 0 waitidletime waitIdleTime  m    ���� 	  ) #wait until the list is fully loaded         j    �� �� &0 jabberservicename jabberServiceName  m        Jabber         j   	 �� ��  0 aimservicename aimServiceName  m   	 
   	 AIM         j    �� �� "0 aimserviceindex aimServiceIndex  m    ����       j    �� �� (0 jabberserviceindex jabberServiceIndex  m    ����      !   l       " # " j    �� $�� 0 	delaytime 	delayTime $ J     % %  & ' & m    ����   '  (�� ( m    ����  ��   # 2 ,delay when found that  user is not available    !  ) * ) j    �� +�� 0 lastlist lastList + J     , ,  - . - J    ����   .  /�� / J    ����  ��   *  0 1 0 j     %�� 2�� 0 	wasonline 	wasOnline 2 J     $ 3 3  4 5 4 m     !��
�� boovfals 5  6�� 6 m   ! "��
�� boovfals��   1  7 8 7 j   & (�� 9�� &0 alreadyregistered alreadyRegistered 9 m   & '��
�� boovfals 8  : ; : j   ) /�� <�� 0 newline   < I  ) .�� =��
�� .sysontocTEXT       shor = m   ) *���� 
��   ;  > ? > l     ������  ��   ?  @ A @ i   0 3 B C B I     ������
�� .aevtoappnull  �   � ****��  ��   C Q     @ D E F D k    2 G G  H I H Z    + J K���� J n    L M L I    ��������  0 isichatrunning isIChatRunning��  ��   M  f     K O    ' N O N k    & P P  Q R Q l    �� S��   S  activate    R  T U T r     V W V n    X Y X I    �������� 0 getlist getList��  ��   Y  f     W o      ���� 0 lastlist lastList U  Z [ Z n     \ ] \ I     �������� "0 jabberjustlogin jabberJustLogIn��  ��   ]  f     [  ^�� ^ n  ! & _ ` _ I   " &�������� 0 aimjustlogin aimJustLogin��  ��   `  f   ! "��   O m     a a�null     ߀��  d	iChat.app����    �!@�����  x@@   )       ��(� l����@efez!  alis    H  Macintosh HD               ����H+    d	iChat.app                                                        k����s        ����  	                Applications    ���/      ��ϳ      d  #Macintosh HD:Applications:iChat.app    	 i C h a t . a p p    M a c i n t o s h   H D  Applications/iChat.app  / ��  ��  ��   I  b�� b L   , 2 c c o   , 1���� 0 waitidletime waitIdleTime��   E R      ������
�� .ascrerr ****      � ****��  ��   F L   : @ d d o   : ?���� 0 waitidletime waitIdleTime A  e f e l     ������  ��   f  g h g i   4 7 i j i I     ������
�� .miscidlenmbr    ��� null��  ��   j Q     t k l m k k    Y n n  o p o l    �� q��   q  register to growl    p  r s r Z    F t u�� v t H    	 w w o    ���� &0 alreadyregistered alreadyRegistered u Z    B x y�� z x n    { | { I    ��������  0 isgrowlrunning isGrowlRunning��  ��   |  f     y k    = } }  ~  ~ O    5 � � � k    4 � �  � � � r     � � � m     � �  iChat    � o      ���� 0 appname appName �  � � � l    �� ���   � O Iset defaultNotifs to {"iChat Aim Status"}
				set notifs to defaultNotifs    �  � � � r    " � � � J      � �  � � � m     � �  iChat Aim Status    �  ��� � m     � �  iChat Jabber Status   ��   � o      ���� 0 defaultnotifs defaultNotifs �  � � � r   # & � � � o   # $���� 0 defaultnotifs defaultNotifs � o      ���� 
0 notifs   �  ��� � I  ' 4���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � m   ) * � �  iChat    � �� � �
�� 
anot � o   + ,���� 
0 notifs   � �� � �
�� 
dnot � o   - .���� 
0 notifs   � �� ���
�� 
iapp � m   / 0 � �  iChat   ��  ��   � m     � �2null     ߀�� 
}9GrowlHelperApp.app!@�����@  �x@X   )       ��(� l����peGRRR   alis    �  Macintosh HD               ����H+   
}9GrowlHelperApp.app                                              
}[�p{H        ����  	                	Resources     ���/      �p��     
}9 
}5 
}4 ��    YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��     ��� � r   6 = � � � m   6 7��
�� boovtrue � o      ���� &0 alreadyregistered alreadyRegistered��  ��   z L   @ B����  ��   v l   E E�� ���   �  
do nothing    s  � � � l   G G�� ���   �  do Aim    �  � � � n  G L � � � I   H L�������� 0 mainaim mainAim��  ��   �  f   G H �  � � � l   M M�� ���   �  	do Jabber    �  � � � n  M R � � � I   N R�������� 0 
mainjabber 
mainJabber��  ��   �  f   M N �  � � � l   S S�� ���   �  check jabber    �  ��� � L   S Y � � o   S X���� 0 idletime idleTime��   l R      ������
�� .ascrerr ****      � ****��  ��   m k   a t � �  � � � r   a m � � � J   a g � �  � � � J   a c����   �  ��� � J   c e����  ��   � o      ���� 0 lastlist lastList �  ��� � L   n t � � o   n s���� 0 idletime idleTime��   h  � � � l     ������  ��   �  � � � i   8 ; � � � I      �������� 0 mainaim mainAim��  ��   � k     � � �  � � � l      �� ���   �  	check aim    �  ��� � Q     � � � � � Z    � � ��� � � n    � � � I    ��������  0 isichatrunning isIChatRunning��  ��   �  f     � k    � � �  � � � r     � � � n    � � � I    �������� 0 aimjustlogin aimJustLogin��  ��   �  f     � o      ���� *0 aimaccountjustlogin aimAccountJustLogin �  � � � r     � � � n    � � � I    ��~�}� *0 getavailableaimlist getAvailableAimList�~  �}   �  f     � o      �|�|  0 currentaimlist currentAimList �  � � � r    " � � � n     � � � I     �{�z�y�{  0 getlastaimlist getLastAimList�z  �y   �  f     � o      �x�x 0 lastaimlist lastAimList �  � � � l  # #�w�v�w  �v   �  � � � l   # #�u ��u   �  send aim    �  � � � Z   # � � ��t � � ?   # / � � � n  # - � � � I   $ -�s ��r�s 0 getdelaytime getDelayTime �  ��q � o   $ )�p�p "0 aimserviceindex aimServiceIndex�q  �r   �  f   # $ � m   - .�o�o   � n  2 < � � � I   3 <�n ��m�n &0 decreasedelaytime decreaseDelayTime �  �l  o   3 8�k�k "0 aimserviceindex aimServiceIndex�l  �m   �  f   2 3�t   � Z   ? ��j o   ? @�i�i *0 aimaccountjustlogin aimAccountJustLogin l   C C�h�h    
do nothing   �j   k   G �  X   G m�g	 Z   W h
�f�e
 H   W [ E  W Z o   W X�d�d 0 lastaimlist lastAimList o   X Y�c�c 0 x   n  ^ d I   _ d�b�a�b 00 aimnotifywithaccountid aimNotifyWithAccountID �` o   _ `�_�_ 0 x  �`  �a    f   ^ _�f  �e  �g 0 x  	 o   J K�^�^  0 currentaimlist currentAimList  l  n n�]�\�]  �\   �[ X   n ��Z Z   ~ ��Y�X H   ~ � E  ~ � o   ~ �W�W  0 currentaimlist currentAimList o    ��V�V 0 x   n  � � I   � ��U�T�U 00 aimnotifywithaccountid aimNotifyWithAccountID  �S  o   � ��R�R 0 x  �S  �T    f   � ��Y  �X  �Z 0 x   o   q r�Q�Q 0 lastaimlist lastAimList�[   � !"! l   � ��P#�P  # J Dif modified make sure it conforms with 
				aimIndex and jabberIndex   " $�O$ r   � �%&% o   � ��N�N  0 currentaimlist currentAimList& n      '(' 4   � ��M)
�M 
cobj) o   � ��L�L "0 aimserviceindex aimServiceIndex( o   � ��K�K 0 lastlist lastList�O  ��   � r   � �*+* J   � �,, -.- J   � ��J�J  . /�I/ J   � ��H�H  �I  + o      �G�G 0 lastlist lastList � R      �F�E�D
�F .ascrerr ****      � ****�E  �D   � k   � �00 121 r   � �343 J   � ��C�C  4 n      565 4   � ��B7
�B 
cobj7 o   � ��A�A "0 aimserviceindex aimServiceIndex6 o   � ��@�@ 0 lastlist lastList2 8�?8 L   � ��>�>  �?  ��   � 9:9 l      �=;�=  ; ( "check jabber and send notification   : <=< i   < ?>?> I      �<�;�:�< 0 
mainjabber 
mainJabber�;  �:  ? Q     �@AB@ Z    �CD�9EC n   FGF I    �8�7�6�8  0 isichatrunning isIChatRunning�7  �6  G  f    D k    �HH IJI r    KLK n   MNM I    �5�4�3�5 "0 jabberjustlogin jabberJustLogIn�4  �3  N  f    L o      �2�2 00 jabberaccountjustlogin jabberAccountJustLoginJ OPO r    QRQ n   STS I    �1�0�/�1 00 getavailablejabberlist getAvailableJabberList�0  �/  T  f    R o      �.�. &0 currentjabberlist currentJabberListP UVU r    "WXW n    YZY I     �-�,�+�- &0 getlastjabberlist getLastJabberList�,  �+  Z  f    X o      �*�*  0 lastjabberlist lastJabberListV [\[ l   # #�)]�)  ]  send all notification   \ ^_^ l   # #�(`�(  `  send jabber   _ aba Z   # �cd�'ec ?   # /fgf n  # -hih I   $ -�&j�%�& 0 getdelaytime getDelayTimej k�$k o   $ )�#�# (0 jabberserviceindex jabberServiceIndex�$  �%  i  f   # $g m   - .�"�"  d n  2 <lml I   3 <�!n� �! &0 decreasedelaytime decreaseDelayTimen o�o o   3 8�� (0 jabberserviceindex jabberServiceIndex�  �   m  f   2 3�'  e Z   ? �pq�rp o   ? @�� 00 jabberaccountjustlogin jabberAccountJustLoginq l   C C�s�  s  
do nothing   �  r k   G �tt uvu X   G mw�xw Z   W hyz��y H   W [{{ E  W Z|}| o   W X��  0 lastjabberlist lastJabberList} o   X Y�� 0 x  z n  ^ d~~ I   _ d���� 60 jabbernotifywithaccountid jabberNotifyWithAccountID� ��� o   _ `�� 0 x  �  �    f   ^ _�  �  � 0 x  x o   J K�� &0 currentjabberlist currentJabberListv ��� l  n n���  �  � ��� X   n ����� Z   ~ ������ H   ~ ��� E  ~ ���� o   ~ �
�
 &0 currentjabberlist currentJabberList� o    ��	�	 0 x  � n  � ���� I   � ����� 60 jabbernotifywithaccountid jabberNotifyWithAccountID� ��� o   � ��� 0 x  �  �  �  f   � ��  �  � 0 x  � o   q r��  0 lastjabberlist lastJabberList�  b ��� l   � ����  � J Dif modified make sure it conforms with 
				aimIndex and jabberIndex   � ��� r   � ���� o   � ��� &0 currentjabberlist currentJabberList� n      ��� 4   � �� �
�  
cobj� o   � ����� (0 jabberserviceindex jabberServiceIndex� o   � ����� 0 lastlist lastList�  �9  E r   � ���� J   � ��� ��� J   � �����  � ���� J   � �����  ��  � o      ���� 0 lastlist lastListA R      ������
�� .ascrerr ****      � ****��  ��  B L   � �����  = ��� i   @ C��� I      ������� 00 aimnotifywithaccountid aimNotifyWithAccountID� ���� o      ���� 0 theid theID��  ��  � Q    ����� k   ��� ��� l    �����  � 0 *Make sure these conform with registeration   � ��� r    ��� m    ��  iChat   � o      ���� 0 appname appName� ��� r    
��� m    ��  iChat Aim Status   � o      ���� $0 notificationname notificationName� ��� l   ������  ��  � ���� Z   �������� n   ��� I    ��������  0 isgrowlrunning isGrowlRunning��  ��  �  f    � Z   �������� n   ��� I    ��������  0 isichatrunning isIChatRunning��  ��  �  f    � O   ���� Z   �������� l   @���� I   @�����
�� .coredoexbool       obj � l   <���� 6  <��� n    3��� 4  0 3���
�� 
pres� m   1 2���� � l   0���� 6  0��� 4   #���
�� 
icsv� m   ! "���� � =  $ /��� 1   % '��
�� 
ID  � o   ( .����  0 aimservicename aimServiceName��  � =  4 ;��� 1   5 7��
�� 
ID  � o   8 :���� 0 theid theID��  ��  ��  � k   C��� ��� r   C d��� n   C b��� 1   ` b��
�� 
stat� l  C `���� 6 C `��� n   C W��� 4  T W���
�� 
pres� m   U V���� � l  C T���� 6 C T��� 4  C G���
�� 
icsv� m   E F���� � =  H S��� 1   I K��
�� 
ID  � o   L R����  0 aimservicename aimServiceName��  � =  X _��� 1   Y [��
�� 
ID  � o   \ ^���� 0 theid theID��  � o      ���� 0 
thisstatus 
thisStatus� ��� w   e_� a� Z   g_����� =  g j��� o   g h���� 0 
thisstatus 
thisStatus� m   h i��
�� pstaoffl� k   m ��� ��� r   m ���� n   m ���� 1   � ���
�� 
pnam� l  m ����� 6 m ���� n   m ���� 4  ~ ����
�� 
pres� m    ����� � l  m ~ ��  6 m ~ 4  m q��
�� 
icsv m   o p����  =  r } 1   s u��
�� 
ID   o   v |����  0 aimservicename aimServiceName��  � =  � � 1   � ���
�� 
ID   o   � ����� 0 theid theID��  � o      ���� 0 thename theName� �� r   � �	
	 n  � � I   � ������� "0 stringforstatus stringForStatus �� o   � ����� 0 
thisstatus 
thisStatus��  ��    f   � �
 o      ���� 0 	thestatus 	theStatus��  �  l  � ��� =  � � o   � ����� 0 
thisstatus 
thisStatus m   � ���
�� pstaaway��    k   � �  r   � � n   � � 1   � ���
�� 
pnam l  � ��� 6 � � n   � � !  4  � ���"
�� 
pres" m   � ����� ! l  � �#��# 6 � �$%$ 4  � ���&
�� 
icsv& m   � ����� % =  � �'(' 1   � ���
�� 
ID  ( o   � �����  0 aimservicename aimServiceName��   =  � �)*) 1   � ���
�� 
ID  * o   � ����� 0 theid theID��   o      ���� 0 thename theName +��+ r   � �,-, l  � �.��. b   � �/0/ b   � �121 n  � �343 I   � ���5���� "0 stringforstatus stringForStatus5 6��6 o   � ����� 0 
thisstatus 
thisStatus��  ��  4  f   � �2 o   � ����� 0 newline  0 l  � �7��7 n   � �898 1   � ���
�� 
smsg9 l  � �:��: 6 � �;<; n   � �=>= 4  � ���?
�� 
pres? m   � ����� > l  � �@��@ 6 � �ABA 4  � ���C
�� 
icsvC m   � ����� B =  � �DED 1   � ���
�� 
ID  E o   � �����  0 aimservicename aimServiceName��  < =  � �FGF 1   � ���
�� 
ID  G o   � ����� 0 theid theID��  ��  ��  - o      ���� 0 	thestatus 	theStatus��   HIH l  � �J��J =  � �KLK o   � ����� 0 
thisstatus 
thisStatusL m   � ���
�� pstaaval��  I MNM k   �%OO PQP r   �RSR n   �TUT 1  ��
�� 
pnamU l  �V��V 6 �WXW n   �YZY 4 ��[
�� 
pres[ m  ���� Z l  �\��\ 6 �]^] 4  � ���_
�� 
icsv_ m   � ����� ^ =  `a` 1  ��
�� 
ID  a o  
����  0 aimservicename aimServiceName��  X = bcb 1  ��
�� 
ID  c o  ���� 0 theid theID��  S o      ���� 0 thename theNameQ d��d r  %efe n #ghg I  #�i�~� "0 stringforstatus stringForStatusi j�}j o  �|�| 0 
thisstatus 
thisStatus�}  �~  h  f  f o      �{�{ 0 	thestatus 	theStatus��  N klk l (-m�zm = (-non o  ()�y�y 0 
thisstatus 
thisStatuso m  ),�x
�x pstaidle�z  l p�wp k  0Zqq rsr r  0Qtut n  0Ovwv 1  MO�v
�v 
pnamw l 0Mx�ux 60Myzy n  0D{|{ 4 AD�t}
�t 
pres} m  BC�s�s | l 0A~�r~ 60A� 4 04�q�
�q 
icsv� m  23�p�p � = 5@��� 1  68�o
�o 
ID  � o  9?�n�n  0 aimservicename aimServiceName�r  z = EL��� 1  FH�m
�m 
ID  � o  IK�l�l 0 theid theID�u  u o      �k�k 0 thename theNames ��j� r  RZ��� n RX��� I  SX�i��h�i "0 stringforstatus stringForStatus� ��g� o  ST�f�f 0 
thisstatus 
thisStatus�g  �h  �  f  RS� o      �e�e 0 	thestatus 	theStatus�j  �w  � L  ]_�d�d  � ��� l  ``�c��c  �  try using picture   � ��b� Q  `����� Z  c����a�� n ch��� I  dh�`�_�^�`  0 isichatrunning isIChatRunning�_  �^  �  f  cd� k  k��� ��� r  k���� l k���]� n  k���� 1  ���\
�\ 
imaA� l k���[� 6k���� n  k��� 4 |�Z�
�Z 
pres� m  }~�Y�Y � l k|��X� 6k|��� 4 ko�W�
�W 
icsv� m  mn�V�V � = p{��� 1  qs�U
�U 
ID  � o  tz�T�T  0 aimservicename aimServiceName�X  � = ����� 1  ���S
�S 
ID  � o  ���R�R 0 theid theID�[  �]  � l     ��Q� o      �P�P 0 
displaypic 
displayPic�Q  � ��O� O  ����� I ���N�M�
�N .notifygrnull��� ��� null�M  � �L��
�L 
name� o  ���K�K $0 notificationname notificationName� �J��
�J 
titl� o  ���I�I 0 thename theName� �H��
�H 
appl� o  ���G�G 0 appname appName� �F��
�F 
desc� o  ���E�E 0 	thestatus 	theStatus� �D��C
�D 
imag� l ����B� o  ���A�A 0 
displaypic 
displayPic�B  �C  � m  �� ��O  �a  � L  ���@�@  � R      �?�>�=
�? .ascrerr ****      � ****�>  �=  � O  ����� I ���<�;�
�< .notifygrnull��� ��� null�;  � �:��
�: 
name� o  ���9�9 $0 notificationname notificationName� �8��
�8 
titl� o  ���7�7 0 thename theName� �6��
�6 
appl� o  ���5�5 0 appname appName� �4��3
�4 
desc� o  ���2�2 0 	thestatus 	theStatus�3  � m  �� ��b  ��  ��  � m     a��  ��  ��  ��  ��  � R      �1�0�/
�1 .ascrerr ****      � ****�0  �/  � L  ���.�.  � ��� l     �-�,�-  �,  � ��� i   D G��� I      �+��*�+ 60 jabbernotifywithaccountid jabberNotifyWithAccountID� ��)� o      �(�( 0 theid theID�)  �*  � Q    S���� Z   I���'�&� n   ��� I    �%�$�#�%  0 isichatrunning isIChatRunning�$  �#  �  f    � Z   E���"�!� n   ��� I    � ���   0 isgrowlrunning isGrowlRunning�  �  �  f    � k   A�� ��� r    ��� m    ��  iChat   � o      �� 0 appname appName� ��� r    ��� m    ��  iChat Jabber Status   � o      �� $0 notificationname notificationName� ��� r     ��� J    �� ��� o    �� $0 notificationname notificationName�  � o      �� 
0 notifs  � ��� O   !A��� Z   %@����� l  % F��� I  % F���
� .coredoexbool       obj � l  % B��� 6 % B��� n   % 9��� 4  6 9��
� 
pres� m   7 8�� � l  % 6��� 6 % 6��� 4  % )��
� 
icsv� m   ' (�� � =  * 5��� 1   + -�
� 
ID  � o   . 4�� &0 jabberservicename jabberServiceName�  � =  : A� � 1   ; =�

�
 
ID    o   > @�	�	 0 theid theID�  �  �  � k   I<  r   I j n   I h 1   f h�
� 
stat l  I f� 6 I f	
	 n   I ] 4  Z ]�
� 
pres m   [ \��  l  I Z� 6 I Z 4  I M�
� 
icsv m   K L��  =  N Y 1   O Q�
� 
ID   o   R X� �  &0 jabberservicename jabberServiceName�  
 =  ^ e 1   _ a��
�� 
ID   o   b d���� 0 theid theID�   o      ���� 0 
thisstatus 
thisStatus  l  k k������  ��    w   k � a Z   m � =  m p  o   m n���� 0 
thisstatus 
thisStatus  m   n o��
�� pstaoffl k   s u!! "#" l   s s��$��  $ + %set theName to name of the theAccount   # %��% L   s u����  ��   &'& G   x �()( G   x �*+* l  x {,��, =  x {-.- o   x y���� 0 
thisstatus 
thisStatus. m   y z��
�� pstaaway��  + l  ~ �/��/ =  ~ �010 o   ~ ���� 0 
thisstatus 
thisStatus1 m    ���
�� pstaaval��  ) l  � �2��2 =  � �343 o   � ����� 0 
thisstatus 
thisStatus4 m   � ���
�� pstaidle��  ' 5��5 r   � �676 n   � �898 1   � ���
�� 
smsg9 l  � �:��: 6 � �;<; n   � �=>= 4  � ���?
�� 
pres? m   � ����� > l  � �@��@ 6 � �ABA 4  � ���C
�� 
icsvC m   � ����� B =  � �DED 1   � ���
�� 
ID  E o   � ����� &0 jabberservicename jabberServiceName��  < =  � �FGF 1   � ���
�� 
ID  G o   � ����� 0 theid theID��  7 o      ���� 0 thename theName��   L   � �����   HIH r   � �JKJ n  � �LML I   � ���N���� "0 stringforstatus stringForStatusN O��O o   � ����� 0 
thisstatus 
thisStatus��  ��  M  f   � �K o      ���� 0 	thestatus 	theStatusI PQP l   � ���R��  R  deprecrated   Q STS l   � ���U��  U + %set theService to first word of theID   T VWV l   � ���X��  X  try using picture   W Y��Y Q   �<Z[\Z Z   �]^��_] n  � �`a` I   � ���������  0 isichatrunning isIChatRunning��  ��  a  f   � �^ k   �bb cdc r   � �efe l  � �g��g n   � �hih 1   � ���
�� 
imaAi l  � �j��j 6 � �klk n   � �mnm 4  � ���o
�� 
preso m   � ����� n l  � �p��p 6 � �qrq 4  � ���s
�� 
icsvs m   � ����� r =  � �tut 1   � ���
�� 
ID  u o   � ����� &0 jabberservicename jabberServiceName��  l =  � �vwv 1   � ���
�� 
ID  w o   � ����� 0 theid theID��  ��  f l     x��x o      ���� 0 
displaypic 
displayPic��  d y��y O   �z{z I  �����|
�� .notifygrnull��� ��� null��  | ��}~
�� 
name} o   � ����� $0 notificationname notificationName~ ���
�� 
titl o   � ����� 0 thename theName� ����
�� 
appl� o  ���� 0 appname appName� ����
�� 
desc� o  ���� 0 	thestatus 	theStatus� �����
�� 
imag� l 	
���� o  	
���� 0 
displaypic 
displayPic��  ��  { m   � � ���  ��  _ L  ����  [ R      ������
�� .ascrerr ****      � ****��  ��  \ O  <��� I $;�����
�� .notifygrnull��� ��� null��  � ����
�� 
name� o  ()���� $0 notificationname notificationName� ����
�� 
titl� o  ,-���� 0 thename theName� ����
�� 
appl� o  01���� 0 appname appName� �����
�� 
desc� o  45���� 0 	thestatus 	theStatus��  � m  ! ���  �  �  � m   ! " a�  �"  �!  �'  �&  � R      ������
�� .ascrerr ****      � ****��  ��  � L  QS����  � ��� l     ������  ��  � ��� i   H K��� I      ������� "0 stringforstatus stringForStatus� ���� o      ���� 0 s  ��  ��  � Q     =���� w    3� a� Z    3����� =   ��� o    ���� 0 s  � m    ��
�� pstaaway� L    �� m    ��  is away   � ��� =   ��� o    ���� 0 s  � m    ��
�� pstaoffl� ��� L    �� m    ��  went offline   � ��� =   ��� o    ���� 0 s  � m    ��
�� pstaaval� ��� L   ! #�� m   ! "��  is available   � ��� =  & )��� o   & '���� 0 s  � m   ' (��
�� pstaidle� ���� L   , .�� m   , -��  	is idling   ��  � L   1 3�� m   1 2��  status is unknown   � R      ������
�� .ascrerr ****      � ****��  ��  � L   ; =�� m   ; <��      � ��� l     ������  ��  � ��� i   L O��� I      ��������  0 isichatrunning isIChatRunning��  ��  � Q     ���� O    ��� L    �� I   �����
�� .coredoexbool       obj � 4    ���
�� 
prcs� m   	 
��  iChat   ��  � m    ���null     ߀��  "System Events.app�!@<������ngfox@(   )       ��(� l����esevs   alis    �  Macintosh HD               ����H+    "System Events.app                                                `����y        ����  	                CoreServices    ���/      ��ʹ      "      :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L    �� m    ��
�� boovfals� ��� i   P S��� I      ��������  0 isgrowlrunning isGrowlRunning��  ��  � Q     ���� O    ��� L    �� I   ����
�� .coredoexbool       obj � 4    �~�
�~ 
prcs� m   	 
��  GrowlHelperApp   �  � m    �� R      �}�|�{
�} .ascrerr ****      � ****�|  �{  � L    �� m    �z
�z boovfals� ��� i   T W��� I      �y�x�w�y 0 getlist getList�x  �w  � l    ��� L     �� J     �� ��� n    ��� I    �v�u�t�v 00 getavailablejabberlist getAvailableJabberList�u  �t  �  f     � ��s� n   
��� I    
�r�q�p�r *0 getavailableaimlist getAvailableAimList�q  �p  �  f    �s  � ( "make sure this conforms to indices   � ��� i   X [��� I      �o�n�m�o &0 getlastjabberlist getLastJabberList�n  �m  � L     �� n     ��� 4    �l�
�l 
cobj� o    �k�k (0 jabberserviceindex jabberServiceIndex� o     �j�j 0 lastlist lastList� ��� i   \ _��� I      �i�h�g�i  0 getlastaimlist getLastAimList�h  �g  � L     �� n     ��� 4    �f�
�f 
cobj� o    �e�e "0 aimserviceindex aimServiceIndex� o     �d�d 0 lastlist lastList� ��� l     �c�b�c  �b  �    i   ` c I      �a�`�a $0 getavailablelist getAvailableList �_ o      �^�^ 0 servicename serviceName�_  �`   Q     = Z    2	
�]	 n    I    �\�[�Z�\  0 isichatrunning isIChatRunning�[  �Z    f    
 O    , L    + l   *�Y 6  * n      1     �X
�X 
ID   n     2    �W
�W 
pres l   �V 6   4   �U
�U 
icsv m    �T�T  =    1    �S
�S 
ID   o    �R�R 0 servicename serviceName�V   =  ! ( 1   " $�Q
�Q 
stat m   % '�P
�P pstaaval�Y   m     a�]   L   / 2   J   / 1�O�O   R      �N�M�L
�N .ascrerr ****      � ****�M  �L   L   : =!! J   : <�K�K   "#" i   d g$%$ I      �J�I�H�J 00 getavailablejabberlist getAvailableJabberList�I  �H  % L     && n    
'(' I    
�G)�F�G $0 getavailablelist getAvailableList) *�E* o    �D�D &0 jabberservicename jabberServiceName�E  �F  (  f     # +,+ i   h k-.- I      �C�B�A�C *0 getavailableaimlist getAvailableAimList�B  �A  . L     // n    
010 I    
�@2�?�@ $0 getavailablelist getAvailableList2 3�>3 o    �=�=  0 aimservicename aimServiceName�>  �?  1  f     , 454 l     �<�;�<  �;  5 676 i   l o898 I      �:�9�8�: "0 jabberjustlogin jabberJustLogIn�9  �8  9 L     :: n    ;<; I    �7=�6�7 0 isjustlogin isJustLogIn= >?> o    �5�5 &0 jabberservicename jabberServiceName? @�4@ o    �3�3 (0 jabberserviceindex jabberServiceIndex�4  �6  <  f     7 ABA i   p sCDC I      �2�1�0�2 0 aimjustlogin aimJustLogin�1  �0  D L     EE n    FGF I    �/H�.�/ 0 isjustlogin isJustLogInH IJI o    �-�-  0 aimservicename aimServiceNameJ K�,K o    �+�+ "0 aimserviceindex aimServiceIndex�,  �.  G  f     B LML l      �*N�*  N 0 *
	return delayTime for given serviceIndex
   M OPO i   t wQRQ I      �)S�(�) 0 getdelaytime getDelayTimeS T�'T o      �&�& 0 serviceindex serviceIndex�'  �(  R L     
UU n     	VWV 4    �%X
�% 
cobjX o    �$�$ 0 serviceindex serviceIndexW o     �#�# 0 	delaytime 	delayTimeP YZY l      �"[�"  [ > 8
	decrease dealyTime for given serviceIndex by idleTime
   Z \]\ i   x {^_^ I      �!`� �! &0 decreasedelaytime decreaseDelayTime` a�a o      �� 0 serviceindex serviceIndex�  �   _ k     3bb cdc r     efe l    g�g \     hih l    j�j n     klk 4    �m
� 
cobjm o    �� 0 serviceindex serviceIndexl o     �� 0 	delaytime 	delayTime�  i o    �� 0 idletime idleTime�  f n      non 4    �p
� 
cobjp o    �� 0 serviceindex serviceIndexo o    �� 0 	delaytime 	delayTimed q�q Z    3rs��r A    "tut n     vwv 4     �x
� 
cobjx o    �� 0 serviceindex serviceIndexw o    �� 0 	delaytime 	delayTimeu m     !��  s r   % /yzy m   % &��  z n      {|{ 4   + .�}
� 
cobj} o   , -�� 0 serviceindex serviceIndex| o   & +�
�
 0 	delaytime 	delayTime�  �  �  ] ~~ l      �	��	  � � �
	touch wasOnline and return true if not userwasonline and user is now online
	also touch delay if the user is not online then set delay to waitDelaytime
	otherwise don't touch it
    ��� i   | ��� I      ���� 0 isjustlogin isJustLogIn� ��� o      �� 0 servicename serviceName� ��� o      �� 0 serviceindex serviceIndex�  �  � Q     ����� Z    ������ n   ��� I    �� ���  0 isichatrunning isIChatRunning�   ��  �  f    � O    ���� w    �� a� k    ��� ��� r    "��� l    ���� n     ��� 1     ��
�� 
stat� l   ���� 6  ��� 4   ���
�� 
icsv� m    ���� � =   ��� 1    ��
�� 
ID  � o    ���� 0 servicename serviceName��  ��  � o      ���� 0 currentstatus currentStatus� ���� Z   # ������� l  # ,���� n   # ,��� 4   ( +���
�� 
cobj� o   ) *���� 0 serviceindex serviceIndex� o   # (���� 0 	wasonline 	wasOnline��  � k   / U�� ��� Z   / R������ =  / 2��� o   / 0���� 0 currentstatus currentStatus� m   0 1��
�� sstaconn� l   5 5�����  �  
do nothing   ��  � k   9 R�� ��� r   9 C��� m   9 :��
�� boovfals� l     ���� n      ��� 4   ? B���
�� 
cobj� o   @ A���� 0 serviceindex serviceIndex� o   : ?���� 0 	wasonline 	wasOnline��  � ���� r   D R��� o   D I���� 0 waitidletime waitIdleTime� n      ��� 4   N Q���
�� 
cobj� o   O P���� 0 serviceindex serviceIndex� o   I N���� 0 	delaytime 	delayTime��  � ���� L   S U�� m   S T��
�� boovfals��  ��  � Z   X ������� =  X [��� o   X Y���� 0 currentstatus currentStatus� m   Y Z��
�� sstaconn� k   ^ z�� ��� r   ^ h��� m   ^ _��
�� boovtrue� l     ���� n      ��� 4   d g���
�� 
cobj� o   e f���� 0 serviceindex serviceIndex� o   _ d���� 0 	wasonline 	wasOnline��  � ��� r   i w��� o   i n���� 0 waitidletime waitIdleTime� n      ��� 4   s v���
�� 
cobj� o   t u���� 0 serviceindex serviceIndex� o   n s���� 0 	delaytime 	delayTime� ���� L   x z�� m   x y��
�� boovtrue��  ��  � k   } ��� ��� r   } ���� m   } ~��
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   ~ ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  ��  � m     a�  � k   � ��� ��� r   � ���� m   � ���
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   � ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  � R      ������
�� .ascrerr ****      � ****��  ��  � k   � ��� ��� r   � ���� m   � ���
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   � ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  �       !�������  ���������� 	
��  � ���������������������������������������������������������������� 0 idletime idleTime�� 0 waitidletime waitIdleTime�� &0 jabberservicename jabberServiceName��  0 aimservicename aimServiceName�� "0 aimserviceindex aimServiceIndex�� (0 jabberserviceindex jabberServiceIndex�� 0 	delaytime 	delayTime�� 0 lastlist lastList�� 0 	wasonline 	wasOnline�� &0 alreadyregistered alreadyRegistered�� 0 newline  
�� .aevtoappnull  �   � ****
�� .miscidlenmbr    ��� null�� 0 mainaim mainAim�� 0 
mainjabber 
mainJabber�� 00 aimnotifywithaccountid aimNotifyWithAccountID�� 60 jabbernotifywithaccountid jabberNotifyWithAccountID�� "0 stringforstatus stringForStatus��  0 isichatrunning isIChatRunning��  0 isgrowlrunning isGrowlRunning�� 0 getlist getList�� &0 getlastjabberlist getLastJabberList��  0 getlastaimlist getLastAimList�� $0 getavailablelist getAvailableList�� 00 getavailablejabberlist getAvailableJabberList�� *0 getavailableaimlist getAvailableAimList�� "0 jabberjustlogin jabberJustLogIn�� 0 aimjustlogin aimJustLogin�� 0 getdelaytime getDelayTime�� &0 decreasedelaytime decreaseDelayTime�� 0 isjustlogin isJustLogIn�� �� 	�� �� � ����   ������  ��  � ����    ������  ��   ������  ��  � ����   ����
�� boovfals
�� boovfals
�� boovfals�  
     �� C������
�� .aevtoappnull  �   � ****��  ��     �� a������������  0 isichatrunning isIChatRunning�� 0 getlist getList�� "0 jabberjustlogin jabberJustLogIn�� 0 aimjustlogin aimJustLogin��  ��  �� A 4)j+   !� )j+ Ec  O)j+ O)j+ UY hOb  W X  b   �� j��~�}
�� .miscidlenmbr    ��� null�  �~   �|�{�z�| 0 appname appName�{ 0 defaultnotifs defaultNotifs�z 
0 notifs   �y � � � ��x ��w�v�u ��t�s�r�q�p�o�y  0 isgrowlrunning isGrowlRunning
�x 
appl
�w 
anot
�v 
dnot
�u 
iapp�t 
�s .registernull��� ��� null�r 0 mainaim mainAim�q 0 
mainjabber 
mainJabber�p  �o  �} u [b  	 ;)j+   .� �E�O��lvE�O�E�O*������� UOeEc  	Y hY hO)j+ O)j+ Ob   W X  jvjvlvEc  Ob    �n ��m�l�k�n 0 mainaim mainAim�m  �l   �j�i�h�g�j *0 aimaccountjustlogin aimAccountJustLogin�i  0 currentaimlist currentAimList�h 0 lastaimlist lastAimList�g 0 x   �f�e�d�c�b�a�`�_�^�]�\�[�f  0 isichatrunning isIChatRunning�e 0 aimjustlogin aimJustLogin�d *0 getavailableaimlist getAvailableAimList�c  0 getlastaimlist getLastAimList�b 0 getdelaytime getDelayTime�a &0 decreasedelaytime decreaseDelayTime
�` 
kocl
�_ 
cobj
�^ .corecnte****       ****�] 00 aimnotifywithaccountid aimNotifyWithAccountID�\  �[  �k � �)j+   �)j+ E�O)j+ E�O)j+ E�O)b  k+ j )b  k+ Y W� hY O %�[��l kh �� )�k+ 	Y h[OY��O %�[��l kh �� )�k+ 	Y h[OY��O�b  �b  /FY jvjvlvEc  W X 
 jvb  �b  /FOh �Z?�Y�X �W�Z 0 
mainjabber 
mainJabber�Y  �X   �V�U�T�S�V 00 jabberaccountjustlogin jabberAccountJustLogin�U &0 currentjabberlist currentJabberList�T  0 lastjabberlist lastJabberList�S 0 x    �R�Q�P�O�N�M�L�K�J�I�H�G�R  0 isichatrunning isIChatRunning�Q "0 jabberjustlogin jabberJustLogIn�P 00 getavailablejabberlist getAvailableJabberList�O &0 getlastjabberlist getLastJabberList�N 0 getdelaytime getDelayTime�M &0 decreasedelaytime decreaseDelayTime
�L 
kocl
�K 
cobj
�J .corecnte****       ****�I 60 jabbernotifywithaccountid jabberNotifyWithAccountID�H  �G  �W � �)j+   �)j+ E�O)j+ E�O)j+ E�O)b  k+ j )b  k+ Y W� hY O %�[��l kh �� )�k+ 	Y h[OY��O %�[��l kh �� )�k+ 	Y h[OY��O�b  �b  /FY jvjvlvEc  W 	X 
 h �F��E�D!"�C�F 00 aimnotifywithaccountid aimNotifyWithAccountID�E �B#�B #  �A�A 0 theid theID�D  ! �@�?�>�=�<�;�:�@ 0 theid theID�? 0 appname appName�> $0 notificationname notificationName�= 0 
thisstatus 
thisStatus�< 0 thename theName�; 0 	thestatus 	theStatus�: 0 
displaypic 
displayPic" ���9�8 a�7$�6�5�4�3�2�1�0�/�.�-�,�+ ��*�)�(�'�&�%�$�#�"�!�9  0 isgrowlrunning isGrowlRunning�8  0 isichatrunning isIChatRunning
�7 
icsv$  
�6 
ID  
�5 
pres
�4 .coredoexbool       obj 
�3 
stat
�2 pstaoffl
�1 
pnam�0 "0 stringforstatus stringForStatus
�/ pstaaway
�. 
smsg
�- pstaaval
�, pstaidle
�+ 
imaA
�* 
name
�) 
titl
�( 
appl
�' 
desc
�& 
imag�% 

�$ .notifygrnull��� ��� null�#  �"  �! �C���E�O�E�O)j+ �)j+ ���*�k/�[�,\Zb  81�k/�[�,\Z�81j 	�*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O�Z��  /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y ǣ�  U*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ b  
%*�k/�[�,\Zb  81�k/�[�,\Z�81�,%E�Y n�a   /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y 9�a   /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y hO X)j+  K*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Oa  *a �a �a �a �a �a  UY hW %X  a  *a �a �a �a �a  UY hUY hY hW 	X  h � ���%&��  60 jabbernotifywithaccountid jabberNotifyWithAccountID� �'� '  �� 0 theid theID�  % ��������� 0 theid theID� 0 appname appName� $0 notificationname notificationName� 
0 notifs  � 0 
thisstatus 
thisStatus� 0 thename theName� 0 	thestatus 	theStatus� 0 
displaypic 
displayPic& ���� a�$������
�	����� ����� �������������  0 isichatrunning isIChatRunning�  0 isgrowlrunning isGrowlRunning
� 
icsv
� 
ID  
� 
pres
� .coredoexbool       obj 
� 
stat
� pstaoffl
�
 pstaaway
�	 pstaaval
� 
bool
� pstaidle
� 
smsg� "0 stringforstatus stringForStatus
� 
imaA
� 
name
� 
titl
� 
appl
�  
desc
�� 
imag�� 

�� .notifygrnull��� ��� null��  ��  �� �TK)j+  ?)j+ 3�E�O�E�O�kvE�O�*�k/�[�,\Zb  81�k/�[�,\Z�81j 	 �*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O�Z��  hY @�� 
 �� �&
 �� �& (*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Y hO)�k+ E�O X)j+   K*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Oa  *a �a �a �a �a �a  UY hW %X  a  *a �a �a �a �a  UY hUY hY hW 	X  h �������()���� "0 stringforstatus stringForStatus�� ��*�� *  ���� 0 s  ��  ( ���� 0 s  )  a������������������
�� pstaaway
�� pstaoffl
�� pstaaval
�� pstaidle��  ��  �� > 5�Z��  �Y %��  �Y ��  �Y ��  �Y �W 	X 
 � �������+,����  0 isichatrunning isIChatRunning��  ��  +  , ����������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f �������-.����  0 isgrowlrunning isGrowlRunning��  ��  -  . ����������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f	 �������/0���� 0 getlist getList��  ��  /  0 ������ 00 getavailablejabberlist getAvailableJabberList�� *0 getavailableaimlist getAvailableAimList�� )j+  )j+ lv
 �������12���� &0 getlastjabberlist getLastJabberList��  ��  1  2 ��
�� 
cobj�� b  �b  /E �������34����  0 getlastaimlist getLastAimList��  ��  3  4 ��
�� 
cobj�� b  �b  /E ������56���� $0 getavailablelist getAvailableList�� ��7�� 7  ���� 0 servicename serviceName��  5 ���� 0 servicename serviceName6 
�� a��$��������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
ID  
�� 
pres
�� 
stat
�� pstaaval��  ��  �� > 4)j+   &� *�k/�[�,\Z�81�-�,�[�,\Z�81EUY jvW 
X  	jv ��%����89���� 00 getavailablejabberlist getAvailableJabberList��  ��  8  9 ���� $0 getavailablelist getAvailableList�� )b  k+   ��.����:;���� *0 getavailableaimlist getAvailableAimList��  ��  :  ; ���� $0 getavailablelist getAvailableList�� )b  k+   ��9����<=���� "0 jabberjustlogin jabberJustLogIn��  ��  <  = ���� 0 isjustlogin isJustLogIn�� )b  b  l+   ��D����>?���� 0 aimjustlogin aimJustLogin��  ��  >  ? ���� 0 isjustlogin isJustLogIn�� )b  b  l+   ��R����@A���� 0 getdelaytime getDelayTime�� ��B�� B  ���� 0 serviceindex serviceIndex��  @ ���� 0 serviceindex serviceIndexA ��
�� 
cobj�� b  �/E ��_����CD���� &0 decreasedelaytime decreaseDelayTime�� ��E�� E  ���� 0 serviceindex serviceIndex��  C ���� 0 serviceindex serviceIndexD ��
�� 
cobj�� 4b  �/b   b  �/FOb  �/j jb  �/FY h �������FG���� 0 isjustlogin isJustLogIn�� ��H�� H  ������ 0 servicename serviceName�� 0 serviceindex serviceIndex��  F �������� 0 servicename serviceName�� 0 serviceindex serviceIndex�� 0 currentstatus currentStatusG 
�� a��$��������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
ID  
�� 
stat
�� 
cobj
�� sstaconn��  ��  �� � �)j+   �� }�Z*�k/�[�,\Z�81�,E�Ob  �/E +��  hY fb  �/FOb  b  �/FOfY 4��  !eb  �/FOb  b  �/FOeY fb  �/FOfUY fb  �/FOfW X  	fb  �/FOfascr  ��ޭ