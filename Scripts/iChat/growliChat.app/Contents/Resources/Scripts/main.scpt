FasdUAS 1.101.10   ��   ��    k             l      �� ��   
|
v
* This script requires Growl. You can download Growl here: http://growl.info
* Once you have installed Growl, you can save this script as an application,
* remember to check the "Stays Open" option before saving.
* Then double-click the new application and enjoy.
*
* Comments and ideas to  piti118@hotmail.com
* Sorry, If I made the code looks dirty, This is the
* first time I learn and write applescript
* Modified by Pit Ongmongkolkul May 12 05
* -bug fix another racing problem argument in zip list doesn't have the same length
*Modified by Piti Ongmongkolkul May 11 05
*--add registerations in growl so that user can customize which message to receive
*--add bonjour
*--use merge sort O(n log(n))instead of the old 2n^2 algo
*--complete overhaul code
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
 j     �� �� 0 idletime idleTime  m     ����       l          j    �� �� 0 waitidletime waitIdleTime  m    ����   ) #wait until the list is fully loaded         j    �� �� &0 jabberservicename jabberServiceName  m        Jabber         j   	 �� ��  0 aimservicename aimServiceName  m   	 
   	 AIM         l          j    �� �� (0 bonjourservicename bonjourServiceName  m        Bonjour     % this is "Rendezvous" in Panther        !   j    �� "�� 80 jabbertransportservicename jabberTransportServiceName " m     # #  Jabber    !  $ % $ j    �� &�� (0 jabberserviceindex jabberServiceIndex & m    ����  %  ' ( ' j    �� )�� "0 aimserviceindex aimServiceIndex ) m    ����  (  * + * j    �� ,�� *0 bonjourserviceindex bonjourServiceIndex , m    ����  +  - . - j    �� /�� :0 jabbertransportserviceindex jabberTransPortServiceIndex / m    ����  .  0 1 0 j     �� 2�� 0 onlineindex onlineIndex 2 m    ����  1  3 4 3 j   ! #�� 5�� 0 	awayindex 	awayIndex 5 m   ! "����  4  6 7 6 j   $ &�� 8�� 0 	idleindex 	idleIndex 8 m   $ %����  7  9 : 9 j   ' )�� ;�� 0 idindex idIndex ; m   ' (����  :  < = < l      �� >��   > V Pproperty statusMessageIndex : 3  only for jabber transport performance issue :(     =  ? @ ? j   * ,�� A�� 0 statusindex statusIndex A m   * +����  @  B C B l      �� D��   D % property nameIndex : 4 not used    C  E F E l      �� G��   G  property emptyData : {}    F  H I H l      �� J��   J k edata whre data is {online record, away record, idle record} and each record is {ids},{statusmessages}    I  K L K l      �� M��   M O Inote that status message record is only used for jabber transport account    L  N O N l      �� P��   P � �this code will exploit the fact that each data id is exlusive ie intersection is empty set reduce n in n square :D
 and the algorithm I used to reduce number of comparision for one kind of status I chose it to be
 the offline one    O  Q R Q l       S T S j   - 4�� U�� 0 	delaytime 	delayTime U J   - 3 V V  W X W m   - .����   X  Y Z Y m   . /����   Z  [ \ [ m   / 0����   \  ]�� ] m   0 1����  ��   T 2 ,delay when found that  user is not available    R  ^ _ ^ j   5 B�� `�� 0 lastlist lastList ` J   5 ? a a  b c b J   5 7����   c  d e d J   7 9����   e  f g f J   9 ;����   g  h�� h J   ; =����  ��   _  i j i j   C L�� k�� 0 	wasonline 	wasOnline k J   C I l l  m n m m   C D��
�� boovfals n  o p o m   D E��
�� boovfals p  q r q m   E F��
�� boovfals r  s�� s m   F G��
�� boovfals��   j  t u t j   M Q�� v�� &0 alreadyregistered alreadyRegistered v m   M N��
�� boovfals u  w x w j   R \�� y�� 0 newline   y I  R Y�� z��
�� .sysontocTEXT       shor z m   R U���� 
��   x  { | { j   ] c�� }�� 0 appname appName } m   ] ` ~ ~  iChat    |   �  j   d j�� ��� &0 aimonlineregister aimOnlineRegister � m   d g � �  Aim online status    �  � � � j   k q�� ��� "0 aimawayregister aimAwayRegister � m   k n � �  Aim away status    �  � � � j   r x�� ��� "0 aimidleregister aimIdleRegister � m   r u � �  Aim idle status    �  � � � j   y �� ��� (0 aimofflineregister aimOfflineRegister � m   y | � �  Aim offline status    �  � � � j   � ��� ���  0 allaimregister allAimRegister � J   � � � �  � � � o   � ����� &0 aimonlineregister aimOnlineRegister �  � � � o   � ����� "0 aimawayregister aimAwayRegister �  � � � o   � ����� "0 aimidleregister aimIdleRegister �  ��� � o   � ����� (0 aimofflineregister aimOfflineRegister��   �  � � � j   � ��� ��� ,0 jabberonlineregister jabberOnlineRegister � m   � � � �  Jabber online status    �  � � � j   � ��� ��� (0 jabberawayregister jabberAwayRegister � m   � � � �  Jabber away status    �  � � � j   � ��� ��� (0 jabberidleregister jabberIdleRegister � m   � � � �  Jabber idle status    �  � � � j   � ��� ��� .0 jabberofflineregister jabberOfflineRegister � m   � � � �  Jabber Offline status    �  � � � j   � ��� ��� &0 alljabberregister allJabberRegister � J   � � � �  � � � o   � ����� ,0 jabberonlineregister jabberOnlineRegister �  � � � o   � ����� (0 jabberawayregister jabberAwayRegister �  � � � o   � ����� (0 jabberidleregister jabberIdleRegister �  ��� � o   � ����� .0 jabberofflineregister jabberOfflineRegister��   �  � � � j   � ��� ��� >0 jabbertransportonlineregister jabberTransportOnlineRegister � m   � � � � $ Jabber transport online status    �  � � � j   � ��� ��� :0 jabbertransportawayregister jabberTransportAwayRegister � m   � � � � " Jabber transport away status    �  � � � j   � ��� ��� :0 jabbertransportidleregister jabberTransportIdleRegister � m   � � � � " Jabber transport idle status    �  � � � j   � ��� ��� @0 jabbertransportofflineregister jabberTransportOfflineRegister � m   � � � � % Jabber transport Offline status    �  � � � l       � � � j   � ��� ��� 80 alljabbertransportregister allJabberTransportRegister � l 
 � � ��� � J   � � � �  � � � o   � ����� >0 jabbertransportonlineregister jabberTransportOnlineRegister �  � � � o   � ����� :0 jabbertransportawayregister jabberTransportAwayRegister �  ��� � o   � ����� :0 jabbertransportidleregister jabberTransportIdleRegister��  ��   � ' !, jabberTransportOfflineRegister}    �  � � � j   � ��� ��� .0 bonjouronlineregister bonjourOnlineRegister � b   � � � � � o   � ����� (0 bonjourservicename bonjourServiceName � m   � � � �   online status    �  � � � j   � ��� ��� *0 bonjourawayregister bonjourAwayRegister � b   � � � � � o   � ����� (0 bonjourservicename bonjourServiceName � m   � � � �   away status    �  � � � j   ��� ��� *0 bonjouridleregister bonjourIdleRegister � b   � � � � o   � ����� (0 bonjourservicename bonjourServiceName � m   � � �   idle status    �  � � � j  �� ��� 00 bonjourofflineregister bonjourOfflineRegister � b   � � � o  ���� (0 bonjourservicename bonjourServiceName � m  
 � �  offline status    �  � � � j   �� ��� (0 allbonjourregister allBonjourRegister � J   � �  � � � o  ���� .0 bonjouronlineregister bonjourOnlineRegister �  � � � o  ���� *0 bonjourawayregister bonjourAwayRegister �  � � � o  ���� *0 bonjouridleregister bonjourIdleRegister �  ��� � o  ���� 00 bonjourofflineregister bonjourOfflineRegister��   �  � � � j  !3�� ��� 0 allregister allRegister � b  !0 � � � b  !, � � � b  !( � � � o  !$����  0 allaimregister allAimRegister � o  $'���� &0 alljabberregister allJabberRegister � o  (+���� 80 alljabbertransportregister allJabberTransportRegister � o  ,/���� (0 allbonjourregister allBonjourRegister �  � � � j  4:�� ��� 0 
dummyblank 
dummyBlank � m  47         �  j  ;A���� 0 
appversion 
appVersion m  ;> 	 0.7     j  BH���� 0 ichatversion iChatVersion m  BE 	 0.0    	
	 j  IO���� &0 ichattigerversion iChatTigerVersion m  IL 	 3.0   
  j  PT���� 0 fail   m  PQ����    j  UY���� 0 pass   m  UV����   i  Z] I     ������
�� .aevtoappnull  �   � ****��  ��   Q     � k    x  Z    q���� n     I    ��������  0 isichatrunning isIChatRunning��  ��     f     O    m!"! k    l## $%$ l    ��&��  &  activate   % '(' l   �����  �  ( )*) r    +,+ 1    �~
�~ 
vers, o      �}�} 0 ichatversion iChatVersion* -.- l   �|�{�|  �{  . /�z/ Z    l01�y20 A    $343 o    �x�x 0 ichatversion iChatVersion4 o    #�w�w &0 ichattigerversion iChatTigerVersion1 k   ' L55 676 l   ' '�v8�v  8  Panther   7 9:9 r   ' .;<; m   ' (==  
Rendezvous   < o      �u�u (0 bonjourservicename bonjourServiceName: >?> r   / :@A@ n  / 4BCB I   0 4�t�s�r�t  0 getpantherlist getPantherList�s  �r  C  f   / 0A o      �q�q 0 lastlist lastList? DED n  ; @FGF I   < @�p�o�n�p $0 bonjourjustlogin bonjourJustLogIn�o  �n  G  f   ; <E HIH n  A FJKJ I   B F�m�l�k�m "0 jabberjustlogin jabberJustLogIn�l  �k  K  f   A BI L�jL n  G LMNM I   H L�i�h�g�i 0 aimjustlogin aimJustLogin�h  �g  N  f   G H�j  �y  2 k   O lOO PQP l   O O�fR�f  R  Tiger   Q STS r   O ZUVU n  O TWXW I   P T�e�d�c�e 0 gettigerlist getTigerList�d  �c  X  f   O PV o      �b�b 0 lastlist lastListT YZY n  [ `[\[ I   \ `�a�`�_�a $0 bonjourjustlogin bonjourJustLogIn�`  �_  \  f   [ \Z ]^] n  a f_`_ I   b f�^�]�\�^ "0 jabberjustlogin jabberJustLogIn�]  �\  `  f   a b^ a�[a n  g lbcb I   h l�Z�Y�X�Z 0 aimjustlogin aimJustLogin�Y  �X  c  f   g h�[  �z  " m    dd�null     ߀��  d	iChat.app���@    �!@�����`  E|�8   )       �(� l���֐+fez!  alis    H  Macintosh HD               ����H+    d	iChat.app                                                       z뇾c��        ����  	                Applications    ���/      �d,      d  #Macintosh HD:Applications:iChat.app    	 i C h a t . a p p    M a c i n t o s h   H D  Applications/iChat.app  / ��  ��  ��   e�We L   r xff o   r w�V�V 0 waitidletime waitIdleTime�W   R      �U�T�S
�U .ascrerr ****      � ****�T  �S   L   � �gg o   � ��R�R 0 waitidletime waitIdleTime hih l     �Q�P�Q  �P  i jkj i  ^alml I     �O�N�M
�O .miscidlenmbr    ��� null�N  �M  m Q     jnopn k    Kqq rsr l    �Lt�L  t  register with growl   s uvu Z    (wx�Kyw H    	zz o    �J�J &0 alreadyregistered alreadyRegisteredx Z    ${|�I�H{ =   }~} n   � I    �G�F�E�G &0 registerwithgrowl registerWithGrowl�F  �E  �  f    ~ o    �D�D 0 fail  | L     �� o    �C�C 0 idletime idleTime�I  �H  �K  y l   ' '�B��B  �  
do nothing   v ��� l   ) )�A��A  � v p
		if the program pass this point the variable iChatVersion is already set
		also bonjour stuff is already set
	   � ��� Z   ) D���@�� A   ) 4��� o   ) .�?�? 0 ichatversion iChatVersion� o   . 3�>�> &0 ichattigerversion iChatTigerVersion� k   7 <�� ��� l   7 7�=��=  �  panther   � ��<� n  7 <��� I   8 <�;�:�9�; 0 	dopanther 	doPanther�:  �9  �  f   7 8�<  �@  � k   ? D�� ��� l   ? ?�8��8  �  tiger   � ��7� n  ? D��� I   @ D�6�5�4�6 0 dotiger doTiger�5  �4  �  f   ? @�7  � ��� l  E E�3�2�3  �2  � ��1� L   E K�� o   E J�0�0 0 idletime idleTime�1  o R      �/�.�-
�/ .ascrerr ****      � ****�.  �-  p k   S j�� ��� l   S c��� r   S c��� J   S ]�� ��� J   S U�,�,  � ��� J   U W�+�+  � ��� J   W Y�*�*  � ��)� J   Y [�(�(  �)  � o      �'�' 0 lastlist lastList� - 'make sure this comply with the property   � ��&� L   d j�� o   d i�%�% 0 idletime idleTime�&  k ��� l      �$��$  � � �
	registerWithGrowl()
	check version and register the notif with growl according to the version
	return pass if registeration success
	return fail if registeration fail
   � ��� i  be��� I      �#�"�!�# &0 registerwithgrowl registerWithGrowl�"  �!  � Z    ��� �� n    ��� I    ����  0 isgrowlrunning isGrowlRunning�  �  �  f     � k   �� ��� l    ���  �  check version   � ��� Z    '����� n   ��� I   	 ����  0 isichatrunning isIChatRunning�  �  �  f    	� O    ��� r    ��� 1    �
� 
vers� o      �� 0 ichatversion iChatVersion� m    d�  � L   ! '�� o   ! &�� 0 fail  � ��� Z   (����� A   ( 3��� o   ( -�� 0 ichatversion iChatVersion� o   - 2�� &0 ichattigerversion iChatTigerVersion� k   6 ��� ��� l   6 6���  �  panther   � ��� r   6 =��� m   6 7��  
Rendezvous   � o      �� (0 bonjourservicename bonjourServiceName� ��� r   > K��� b   > E��� o   > C�� (0 bonjourservicename bonjourServiceName� m   C D��   online status   � o      �� .0 bonjouronlineregister bonjourOnlineRegister� ��� r   L Y��� b   L S��� o   L Q�� (0 bonjourservicename bonjourServiceName� m   Q R��   away status   � o      �� *0 bonjourawayregister bonjourAwayRegister� ��� r   Z g��� b   Z a��� o   Z _�
�
 (0 bonjourservicename bonjourServiceName� m   _ `��   idle status   � o      �	�	 *0 bonjouridleregister bonjourIdleRegister� ��� r   h u��� b   h o��� o   h m�� (0 bonjourservicename bonjourServiceName� m   m n��  offline status   � o      �� 00 bonjourofflineregister bonjourOfflineRegister� ��� r   v ���� J   v ��� ��� o   v {�� .0 bonjouronlineregister bonjourOnlineRegister� ��� o   { ��� *0 bonjourawayregister bonjourAwayRegister�    o   � ��� *0 bonjouridleregister bonjourIdleRegister � o   � ��� 00 bonjourofflineregister bonjourOfflineRegister�  � o      �� (0 allbonjourregister allBonjourRegister�  r   � � b   � � o   � �� �   0 allaimregister allAimRegister o   � ����� (0 allbonjourregister allBonjourRegister o      ���� 0 allregister allRegister 	
	 O   � � k   � �  r   � � o   � ����� 0 allregister allRegister o      ���� 0 defaultnotifs defaultNotifs  r   � � o   � ����� 0 defaultnotifs defaultNotifs o      ���� 
0 notifs   �� I  � �����
�� .registernull��� ��� null��   ��
�� 
appl o   � ����� 0 appname appName ��
�� 
anot o   � ����� 
0 notifs   ��
�� 
dnot o   � ����� 
0 notifs   ����
�� 
iapp m   � �  iChat   ��  ��   m   � �  2null     ߀�� K�GrowlHelperApp.app!@����Ԑ  �|�P   )       �(� l�����+GRRR   alis    �  Macintosh HD               ����H+   K�GrowlHelperApp.app                                              K;��B        ����  	                	Resources     ���/      ��ς     K� K� K� C�    YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  
 !"! r   � �#$# m   � ���
�� boovtrue$ o      ���� &0 alreadyregistered alreadyRegistered" %��% L   � �&& o   � ����� 0 pass  ��  �  � k   �'' ()( l   � ���*��  *  tiger   ) +,+ O   �-.- k   � // 010 r   � �232 o   � ����� 0 allregister allRegister3 o      ���� 0 defaultnotifs defaultNotifs1 454 r   � �676 o   � ����� 0 defaultnotifs defaultNotifs7 o      ���� 
0 notifs  5 8��8 I  � ����9
�� .registernull��� ��� null��  9 ��:;
�� 
appl: o   � ����� 0 appname appName; ��<=
�� 
anot< o   � ����� 
0 notifs  = ��>?
�� 
dnot> o   � ����� 
0 notifs  ? ��@��
�� 
iapp@ m   � �AA  iChat   ��  ��  . m   � � , BCB r  	DED m  ��
�� boovtrueE o      ���� &0 alreadyregistered alreadyRegisteredC F��F L  
GG o  
���� 0 pass  ��  �  �   � L  HH o  ���� 0 fail  � IJI l      ��K��  K &  do the main function for panther   J LML i  fiNON I      �������� 0 	dopanther 	doPanther��  ��  O Q     jPQRP k    `SS TUT r    VWV n   XYX I    ��Z���� 0 	sorttuple 	sortTupleZ [��[ n   \]\ I    ��^���� $0 getavailablelist getAvailableList^ _��_ o    
����  0 aimservicename aimServiceName��  ��  ]  f    ��  ��  Y  f    W o      ���� 0 thislist thisListU `a` n   1bcb I    1��d���� 0 
mainnotify 
mainNotifyd efe o    ���� 0 thislist thisListf ghg n    #iji 4    #��k
�� 
cobjk o    "���� "0 aimserviceindex aimServiceIndexj o    ���� 0 lastlist lastListh lml o   # (���� "0 aimserviceindex aimServiceIndexm n��n o   ( -����  0 aimservicename aimServiceName��  ��  c  f    a opo r   2 Cqrq n  2 Asts I   3 A��u���� 0 	sorttuple 	sortTupleu v��v n  3 =wxw I   4 =��y���� $0 getavailablelist getAvailableListy z��z o   4 9���� (0 bonjourservicename bonjourServiceName��  ��  x  f   3 4��  ��  t  f   2 3r o      ���� 0 thislist thisListp {��{ n  D `|}| I   E `��~���� 0 
mainnotify 
mainNotify~ � o   E F���� 0 thislist thisList� ��� n   F R��� 4   K R���
�� 
cobj� o   L Q���� *0 bonjourserviceindex bonjourServiceIndex� o   F K���� 0 lastlist lastList� ��� o   R W���� *0 bonjourserviceindex bonjourServiceIndex� ���� o   W \���� (0 bonjourservicename bonjourServiceName��  ��  }  f   D E��  Q R      ������
�� .ascrerr ****      � ****��  ��  R L   h j����  M ��� l      �����  � $ do the main function for tiger   � ��� i  jm��� I      �������� 0 dotiger doTiger��  ��  � Q     ����� k    ��� ��� l    �����  � ) # set t to (time of (current date))    � ��� r    ��� n   ��� I    ������� 0 	sorttuple 	sortTuple� ���� n   ��� I    ������� $0 getavailablelist getAvailableList� ���� o    
����  0 aimservicename aimServiceName��  ��  �  f    ��  ��  �  f    � o      ���� 0 thislist thisList� ��� n   1��� I    1������� 0 
mainnotify 
mainNotify� ��� o    ���� 0 thislist thisList� ��� n    #��� 4    #���
�� 
cobj� o    "���� "0 aimserviceindex aimServiceIndex� o    ���� 0 lastlist lastList� ��� o   # (���� "0 aimserviceindex aimServiceIndex� ���� o   ( -����  0 aimservicename aimServiceName��  ��  �  f    � ��� r   2 C��� n  2 A��� I   3 A������� 0 	sorttuple 	sortTuple� ���� n  3 =��� I   4 =������� $0 getavailablelist getAvailableList� ���� o   4 9���� (0 bonjourservicename bonjourServiceName��  ��  �  f   3 4��  ��  �  f   2 3� o      ���� 0 thislist thisList� ��� n  D `��� I   E `������� 0 
mainnotify 
mainNotify� ��� o   E F���� 0 thislist thisList� ��� n   F R��� 4   K R���
�� 
cobj� o   L Q���� *0 bonjourserviceindex bonjourServiceIndex� o   F K���� 0 lastlist lastList� ��� o   R W���� *0 bonjourserviceindex bonjourServiceIndex� ���� o   W \���� (0 bonjourservicename bonjourServiceName��  ��  �  f   D E� ��� l   a h��� r   a h��� n  a f��� I   b f�������� 60 gettwojabberavailablelist getTwoJabberAvailableList��  ��  �  f   a b� o      ���� 0 templist tempList�  please see spec   � ��� l   i t��� r   i t��� n  i r��� I   j r���~� 0 	sorttuple 	sortTuple� ��}� n   j n��� 4   k n�|�
�| 
cobj� m   l m�{�{ � o   j k�z�z 0 templist tempList�}  �~  �  f   i j� o      �y�y 0 thislist thisList�  real jabber   � ��� n  u ���� I   v ��x��w�x 0 
mainnotify 
mainNotify� ��� o   v w�v�v 0 thislist thisList� ��� n   w ���� 4   | ��u�
�u 
cobj� o   } ��t�t (0 jabberserviceindex jabberServiceIndex� o   w |�s�s 0 lastlist lastList� ��� o   � ��r�r (0 jabberserviceindex jabberServiceIndex� ��q� o   � ��p�p &0 jabberservicename jabberServiceName�q  �w  �  f   u v� ��� l   � ���� r   � ���� n  � ���� I   � ��o��n�o 0 	sorttuple 	sortTuple� ��m� n   � ���� 4   � ��l�
�l 
cobj� m   � ��k�k � o   � ��j�j 0 templist tempList�m  �n  �  f   � �� o      �i�i 0 thislist thisList�  	transport   � ��� n  � �   I   � ��h�g�h 0 
mainnotify 
mainNotify  o   � ��f�f 0 thislist thisList  n   � � 4   � ��e	
�e 
cobj	 o   � ��d�d :0 jabbertransportserviceindex jabberTransPortServiceIndex o   � ��c�c 0 lastlist lastList 

 o   � ��b�b :0 jabbertransportserviceindex jabberTransPortServiceIndex �a o   � ��`�` 80 jabbertransportservicename jabberTransportServiceName�a  �g    f   � �� �_ l   � ��^�^   m gset total to (time of (current date)) - t --End timing.
	display dialog total as string buttons {"OK"}    �_  � R      �]�\�[
�] .ascrerr ****      � ****�\  �[  � L   � ��Z�Z  �  l      �Y�Y   i c
	compare lists
	send alert for those who change
	and update lastList
	invariant: lists are sorted
     i  nq I      �X�W�X 0 
mainnotify 
mainNotify  o      �V�V 0 newlist newList  o      �U�U 0 oldlist oldList  o      �T�T 0 serviceindex serviceIndex �S o      �R�R 0 servicename serviceName�S  �W   k     �   l      �Q!�Q  !  	check aim     "�P" Q     �#$%# Z    w&'�O(& n   )*) I    �N�M�L�N  0 isichatrunning isIChatRunning�M  �L  *  f    ' k    i++ ,-, r    ./. n   010 I    �K2�J�K 0 isjustlogin isJustLogIn2 343 o    �I�I 0 servicename serviceName4 5�H5 o    �G�G 0 serviceindex serviceIndex�H  �J  1  f    / o      �F�F $0 accountjustlogin accountJustLogin- 676 l   �E�D�E  �D  7 898 l    �C:�C  :  send aim   9 ;<; Z    ^=>�B?= ?    @A@ n   BCB I    �AD�@�A 0 getdelaytime getDelayTimeD E�?E o    �>�> 0 serviceindex serviceIndex�?  �@  C  f    A m    �=�=  > k     4FF GHG n    &IJI I   ! &�<K�;�< &0 decreasedelaytime decreaseDelayTimeK L�:L o   ! "�9�9 0 serviceindex serviceIndex�:  �;  J  f     !H MNM r   ' 1OPO o   ' (�8�8 0 newlist newListP n      QRQ 4   - 0�7S
�7 
cobjS o   . /�6�6 0 serviceindex serviceIndexR o   ( -�5�5 0 lastlist lastListN T�4T L   2 4�3�3  �4  �B  ? Z   7 ^UV�2WU o   7 8�1�1 $0 accountjustlogin accountJustLoginV l   ; ;�0X�0  X  
do nothing   �2  W k   ? ^YY Z[Z l   ? ?�/\�/  \ 8 2display dialog changeList as string buttons {"OK"}   [ ]�.] Z   ? ^^_�-`^ >   ? Faba o   ? @�,�, 0 serviceindex serviceIndexb o   @ E�+�+ :0 jabbertransportserviceindex jabberTransPortServiceIndex_ n  I Rcdc I   J R�*e�)�* 0 doaimnotify doAimNotifye fgf o   J K�(�( 0 newlist newListg hih o   K L�'�' 0 oldlist oldListi jkj o   L M�&�& 0 serviceindex serviceIndexk l�%l o   M N�$�$ 0 servicename serviceName�%  �)  d  f   I J�-  ` n  U ^mnm I   V ^�#o�"�# &0 dotransportnotify doTransportNotifyo pqp o   V W�!�! 0 newlist newListq rsr o   W X� �  0 oldlist oldLists tut o   X Y�� 0 serviceindex serviceIndexu v�v o   Y Z�� 0 servicename serviceName�  �"  n  f   U V�.  < wxw l   _ _�y�  y J Dif modified make sure it conforms with 
				aimIndex and jabberIndex   x z�z r   _ i{|{ o   _ `�� 0 newlist newList| n      }~} 4   e h�
� 
cobj o   f g�� 0 serviceindex serviceIndex~ o   ` e�� 0 lastlist lastList�  �O  ( k   l w�� ��� l   l l���  �  
do nothing   � ��� r   l w��� J   l n��  � n      ��� 4   s v��
� 
cobj� o   t u�� 0 serviceindex serviceIndex� o   n s�� 0 lastlist lastList�  $ R      ���
� .ascrerr ****      � ****�  �  % k    ��� ��� r    ���� J    ���  � n      ��� 4   � ���
� 
cobj� o   � ��� 0 serviceindex serviceIndex� o   � ��
�
 0 lastlist lastList� ��	� L   � ���  �	  �P   ��� l      ���  � � �
	doAimNotify(newList, oldList) (aim style)
	send notification for every one whose status change
	invariant: both lists are sorted
   � ��� i  ru��� I      ���� 0 doaimnotify doAimNotify� ��� o      �� 0 newlist newList� ��� o      �� 0 oldlist oldList� ��� o      �� 0 serviceindex serviceIndex� ��� o      � �  0 servicename serviceName�  �  � k    ��� ��� r     ��� m     ���� � o      ���� 0 newindex newIndex� ��� r    ��� m    ���� � o      ���� 0 oldindex oldIndex� ��� l    �����  �  set toReturn to {}   � ��� r    ��� n    ��� 1   	 ��
�� 
leng� o    	���� 0 newlist newList� o      ���� 0 newlen newLen� ��� r    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 oldlist oldList� o      ���� 0 oldlen oldLen� ��� Z    ������� =    ��� o    ���� 0 newlen newLen� m    ����  � L    �� o    ���� 0 oldlist oldList��  ��  � ��� Z  ! -������� =   ! $��� o   ! "���� 0 oldlen oldLen� m   " #����  � L   ' )�� o   ' (���� 0 newlist newList��  ��  � ��� V   . ���� k   > ��� ��� r   > D��� n   > B��� 4   ? B���
�� 
cobj� o   @ A���� 0 newindex newIndex� o   > ?���� 0 newlist newList� o      ���� 0 newitem newItem� ��� r   E K��� n   E I��� 4   F I���
�� 
cobj� o   G H���� 0 oldindex oldIndex� o   E F���� 0 oldlist oldList� o      ���� 0 olditem oldItem� ��� r   L V��� n   L T��� 4   M T���
�� 
cobj� o   N S���� 0 idindex idIndex� o   L M���� 0 newitem newItem� o      ���� 0 newname newName� ��� r   W a��� n   W _��� 4   X _���
�� 
cobj� o   Y ^���� 0 idindex idIndex� o   W X���� 0 olditem oldItem� o      ���� 0 oldname oldName� ���� Z   b ������ l  b e���� =   b e��� o   b c���� 0 newname newName� o   c d���� 0 oldname oldName��  � k   h ��� ��� r   h r��� n   h p��� 4   i p���
�� 
cobj� o   j o���� 0 statusindex statusIndex� o   h i���� 0 newitem newItem� o      ���� 0 	newstatus 	newStatus� ��� r   s }��� n   s {��� 4   t {���
�� 
cobj� o   u z���� 0 statusindex statusIndex� o   s t���� 0 olditem oldItem� o      ���� 0 	oldstatus  �    Z   ~ ��� l  ~ ��� >   ~ � o   ~ ���� 0 	newstatus 	newStatus o    ����� 0 	oldstatus  ��   k   � � 	
	 l   � �����   ) #copy newItem to the end of toReturn   
 �� I   � ������� 
0 notify    o   � ����� 0 newname newName  o   � ����� 0 	newstatus 	newStatus  o   � ����� 0 servicename serviceName �� o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��   l   � �����    
do nothing     r   � � [   � � o   � ����� 0 newindex newIndex m   � �����  o      ���� 0 newindex newIndex �� r   � � [   � �  o   � ����� 0 oldindex oldIndex  m   � �����  o      ���� 0 oldindex oldIndex��  � !"! A   � �#$# o   � ����� 0 newname newName$ o   � ����� 0 oldname oldName" %��% l  � �&'& k   � �(( )*) w   � �+d+ k   � �,, -.- r   � �/0/ n   � �121 4   � ���3
�� 
cobj3 o   � ����� 0 statusindex statusIndex2 o   � ����� 0 newitem newItem0 o      ���� 0 	newstatus 	newStatus. 4��4 Z   � �56��75 =   � �898 o   � ����� 0 	newstatus 	newStatus9 m   � ���
�� pstaoffl6 l   � ���:��  :  
do nothing   ��  7 k   � �;; <=< l   � ���>��  > ) #copy newItem to the end of toReturn   = ?��? I   � ���@���� 
0 notify  @ ABA o   � ����� 0 newname newNameB CDC o   � ����� 0 	newstatus 	newStatusD EFE o   � ����� 0 servicename serviceNameF G��G o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��  * HIH r   � �JKJ [   � �LML o   � ����� 0 newindex newIndexM m   � ����� K o      ���� 0 newindex newIndexI N��N l  � �������  ��  ��  ' G Ain new but not old make sure this comply with comparison in split   ��  � l  � �OPO k   � �QQ RSR l   � ���T��  T < 6this guy went offline so need to set status to offline   S UVU l  � �������  ��  V WXW w   � �YdY k   � �ZZ [\[ r   � �]^] n   � �_`_ 4   � ���a
�� 
cobja o   � ����� 0 statusindex statusIndex` o   � ����� 0 olditem oldItem^ o      ���� 0 	oldstatus  \ b��b Z   � �cd��ec =   � �fgf o   � ����� 0 	oldstatus  g m   � ���
�� pstaoffld l   � ���h��  h 3 -do nothing: (one of)racing problem solved :D    ��  e k   � �ii jkj l   � ���l��  l 0 *set item statusIndex of oldItem to offline   k mnm l   � ���o��  o ) #copy oldItem to the end of toReturn   n p��p I   � ���q���� 
0 notify  q rsr o   � ����� 0 oldname oldNames tut m   � ���
�� pstaofflu vwv o   � ����� 0 servicename serviceNamew x��x o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��  X y��y r   � �z{z [   � �|}| o   � ����� 0 oldindex oldIndex} m   � ����� { o      ���� 0 oldindex oldIndex��  P  in old but not new   ��  � F   2 =~~ B   2 5��� o   2 3���� 0 newindex newIndex� o   3 4���� 0 newlen newLen B   8 ;��� o   8 9���� 0 oldindex oldIndex� o   9 :���� 0 oldlen oldLen� ���� Z   ������� ?   � ��� o   � ��~�~ 0 newindex newIndex� o   � ��}�} 0 newlen newLen� Z  N���|�� B  ��� o  �{�{ 0 oldindex oldIndex� o  �z�z 0 oldlen oldLen� l 	J��� k  	J�� ��� l  		�y��y  � G Athese guys go offline so we need to change status in the old list   � ��� l  		�x��x  � ? 9set offLine guys to items oldIndex thru oldLen of oldList   � ��w� w  	J�d� Y  J��v���u� k  E�� ��� r  ��� n  ��� 4  �t�
�t 
cobj� o  �s�s 0 i  � o  �r�r 0 oldlist oldList� o      �q�q 0 thisitem thisItem� ��� r  &��� n  $��� 4  $�p�
�p 
cobj� o  #�o�o 0 idindex idIndex� o  �n�n 0 thisitem thisItem� o      �m�m 0 oldname oldName� ��� r  '1��� n  '/��� 4  (/�l�
�l 
cobj� o  ).�k�k 0 statusindex statusIndex� o  '(�j�j 0 thisitem thisItem� o      �i�i 0 	oldstatus  � ��h� Z  2E���g�� =  25��� o  23�f�f 0 	oldstatus  � m  34�e
�e pstaoffl� l  88�d��d  � 3 -do nothing: (one of)racing problem solved :D    �g  � k  <E�� ��� l  <<�c��c  � 0 *set item statusIndex of oldItem to offline   � ��� l  <<�b��b  � * $copy thisItem to the end of toReturn   � ��a� I  <E�`��_�` 
0 notify  � ��� o  =>�^�^ 0 oldname oldName� ��� m  >?�]
�] pstaoffl� ��� o  ?@�\�\ 0 servicename serviceName� ��[� o  @A�Z�Z 0 serviceindex serviceIndex�[  �_  �a  �h  �v 0 i  � o  �Y�Y 0 oldindex oldIndex� o  �X�X 0 oldlen oldLen�u  �w  �  in old but not new   �|  � l  MM�W��W  �  
do nothing   � ��� ?  QT��� o  QR�V�V 0 oldindex oldIndex� o  RS�U�U 0 oldlen oldLen� ��T� Z  W����S�� B  WZ��� o  WX�R�R 0 newindex newIndex� o  XY�Q�Q 0 newlen newLen� w  ]��d� Y  _���P���O� k  i��� ��� r  io��� n  im��� 4  jm�N�
�N 
cobj� o  kl�M�M 0 i  � o  ij�L�L 0 newlist newList� o      �K�K 0 newitem newItem� ��� r  pz��� n  px��� 4  qx�J�
�J 
cobj� o  rw�I�I 0 idindex idIndex� o  pq�H�H 0 newitem newItem� o      �G�G 0 newname newName� ��� r  {���� n  {���� 4  |��F�
�F 
cobj� o  }��E�E 0 statusindex statusIndex� o  {|�D�D 0 newitem newItem� o      �C�C 0 	newstatus 	newStatus� ��B� Z  �����A�� =  ����� o  ���@�@ 0 	newstatus 	newStatus� m  ���?
�? pstaoffl� l  ���>��>  �  
do nothing   �A  � k  ���� ��� l  ���=��=  � ) #copy newItem to the end of toReturn   � ��<� I  ���;��:�; 
0 notify  � ��� o  ���9�9 0 newname newName� ��� o  ���8�8 0 	newstatus 	newStatus�    o  ���7�7 0 servicename serviceName �6 o  ���5�5 0 serviceindex serviceIndex�6  �:  �<  �B  �P 0 i  � o  bc�4�4 0 newindex newIndex� o  cd�3�3 0 newlen newLen�O  �S  � l  ���2�2    
do nothing   �T  �  ��  �  l      �1�1   � �
	doTransportNotify(newList, oldList,serviceIndex, serviceName) (Transport style)
	send notification for every one whose status change
	invariant: both lists are sorted
     i  vy	
	 I      �0�/�0 &0 dotransportnotify doTransportNotify  o      �.�. 0 newlist newList  o      �-�- 0 oldlist oldList  o      �,�, 0 serviceindex serviceIndex �+ o      �*�* 0 servicename serviceName�+  �/  
 k    �  r      m     �)�)  o      �(�( 0 newindex newIndex  r     m    �'�'  o      �&�& 0 oldindex oldIndex  l    �%�%    set toReturn to {}      r    !"! n    #$# 1   	 �$
�$ 
leng$ o    	�#�# 0 newlist newList" o      �"�" 0 newlen newLen  %&% r    '(' n    )*) 1    �!
�! 
leng* o    � �  0 oldlist oldList( o      �� 0 oldlen oldLen& +,+ Z    -.��- =    /0/ o    �� 0 newlen newLen0 m    ��  . L    11 o    �� 0 oldlist oldList�  �  , 232 Z  ! -45��4 =   ! $676 o   ! "�� 0 oldlen oldLen7 m   " #��  5 L   ' )88 o   ' (�� 0 newlist newList�  �  3 9:9 V   . �;<; k   > �== >?> r   > D@A@ n   > BBCB 4   ? B�D
� 
cobjD o   @ A�� 0 newindex newIndexC o   > ?�� 0 newlist newListA o      �� 0 newitem newItem? EFE r   E KGHG n   E IIJI 4   F I�K
� 
cobjK o   G H�� 0 oldindex oldIndexJ o   E F�� 0 oldlist oldListH o      �� 0 olditem oldItemF LML r   L VNON n   L TPQP 4   M T�R
� 
cobjR o   N S�� 0 idindex idIndexQ o   L M�
�
 0 newitem newItemO o      �	�	 0 newname newNameM STS r   W aUVU n   W _WXW 4   X _�Y
� 
cobjY o   Y ^�� 0 idindex idIndexX o   W X�� 0 olditem oldItemV o      �� 0 oldname oldNameT Z�Z Z   b �[\]^[ l  b e_�_ =   b e`a` o   b c�� 0 newname newNamea o   c d�� 0 oldname oldName�  \ k   h �bb cdc r   h refe n   h pghg 4   i p� i
�  
cobji o   j o���� 0 statusindex statusIndexh o   h i���� 0 newitem newItemf o      ���� 0 	newstatus 	newStatusd jkj r   s }lml n   s {non 4   t {��p
�� 
cobjp o   u z���� 0 statusindex statusIndexo o   s t���� 0 olditem oldItemm o      ���� 0 	oldstatus  k qrq l  ~ ~������  ��  r sts Z   ~ �uv��wu l  ~ �x��x >   ~ �yzy o   ~ ���� 0 	newstatus 	newStatusz o    ����� 0 	oldstatus  ��  v k   � �{{ |}| l   � ���~��  ~ ) #copy newItem to the end of toReturn   } � l   � ������  � @ :set newStatusMessage to item statusMessageIndex of newItem   � ��� l   � ������  �if newStatusMessage � "" then
					notifyTransport(newName, newStatus, "", serviceName, serviceIndex)
				else
					set oldStatusMessage to item statusMessageIndex of oldItem
					notifyTransport(newName, newStatus, "", serviceName, serviceIndex)
				end if   � ���� I   � �������� "0 notifytransport notifyTransport� ��� o   � ����� 0 newname newName� ��� o   � ����� 0 	newstatus 	newStatus� ��� m   � ���      � ��� o   � ����� 0 servicename serviceName� ���� o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��  w l   � ������  �  
do nothing   t ��� r   � ���� [   � ���� o   � ����� 0 newindex newIndex� m   � ����� � o      ���� 0 newindex newIndex� ���� r   � ���� [   � ���� o   � ����� 0 oldindex oldIndex� m   � ����� � o      ���� 0 oldindex oldIndex��  ] ��� A   � ���� o   � ����� 0 newname newName� o   � ����� 0 oldname oldName� ���� l  � ���� k   � ��� ��� w   � ��d� k   � ��� ��� r   � ���� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 statusindex statusIndex� o   � ����� 0 newitem newItem� o      ���� 0 	newstatus 	newStatus� ���� Z   � ������� =   � ���� o   � ����� 0 	newstatus 	newStatus� m   � ���
�� pstaoffl� l   � ������  �  
do nothing   ��  � k   � ��� ��� l   � ������  � ) #copy newItem to the end of toReturn   � ��� l   � ������  � � �set newStatusMessage to item statusMessageIndex of newItem
					notifyTransport(newName, newStatus, newStatusMessage, serviceName, serviceIndex)   � ���� I   � �������� "0 notifytransport notifyTransport� ��� o   � ����� 0 newname newName� ��� o   � ����� 0 	newstatus 	newStatus� ��� m   � ���      � ��� o   � ����� 0 servicename serviceName� ���� o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��  � ��� r   � ���� [   � ���� o   � ����� 0 newindex newIndex� m   � ����� � o      ���� 0 newindex newIndex� ���� l  � �������  ��  ��  � G Ain new but not old make sure this comply with comparison in split   ��  ^ l  � ���� k   � ��� ��� l   � ������  � < 6this guy went offline so need to set status to offline   � ��� l  � �������  ��  � ��� w   � ��d� k   � ��� ��� r   � ���� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 statusindex statusIndex� o   � ����� 0 olditem oldItem� o      ���� 0 	oldstatus  � ���� Z   � ������� =   � ���� o   � ����� 0 	oldstatus  � m   � ���
�� pstaoffl� l   � ������  � 3 -do nothing: (one of)racing problem solved :D    ��  � k   � ��� ��� l   � ������  � 0 *set item statusIndex of oldItem to offline   � ��� l   � ������  � ) #copy oldItem to the end of toReturn   � ��� l   � ������  � � �set oldStatusMessage to item statusMessageIndex of oldItem
					notifyTransport(oldName, offline, oldStatusMessage, serviceName, serviceIndex)   � ���� I   � �������� "0 notifytransport notifyTransport� ��� o   � ����� 0 oldname oldName� ��� m   � ���
�� pstaoffl� ��� m   � ���      � ��� o   � ����� 0 servicename serviceName�  ��  o   � ����� 0 serviceindex serviceIndex��  ��  ��  ��  � �� r   � � [   � � o   � ����� 0 oldindex oldIndex m   � �����  o      ���� 0 oldindex oldIndex��  �  in old but not new   �  < F   2 = B   2 5	 o   2 3���� 0 newindex newIndex	 o   3 4���� 0 newlen newLen B   8 ;

 o   8 9���� 0 oldindex oldIndex o   9 :���� 0 oldlen oldLen: �� Z   ��� ?    o   ���� 0 newindex newIndex o  ���� 0 newlen newLen Z  R�� B  	 o  ���� 0 oldindex oldIndex o  ���� 0 oldlen oldLen l N k  N  l  ����   G Athese guys go offline so we need to change status in the old list     l  ����   ? 9set offLine guys to items oldIndex thru oldLen of oldList     ��  w  N!d! Y  N"��#$��" k  I%% &'& r  ()( n  *+* 4  ��,
�� 
cobj, o  ���� 0 i  + o  ���� 0 oldlist oldList) o      ���� 0 thisitem thisItem' -.- r  )/0/ n  '121 4   '��3
�� 
cobj3 o  !&���� 0 idindex idIndex2 o   ���� 0 thisitem thisItem0 o      ���� 0 oldname oldName. 454 r  *4676 n  *2898 4  +2��:
�� 
cobj: o  ,1���� 0 statusindex statusIndex9 o  *+���� 0 thisitem thisItem7 o      ���� 0 	oldstatus  5 ;��; Z  5I<=��>< =  58?@? o  56���� 0 	oldstatus  @ m  67��
�� pstaoffl= l  ;;��A��  A 3 -do nothing: (one of)racing problem solved :D    ��  > k  ?IBB CDC l  ??��E��  E 0 *set item statusIndex of oldItem to offline   D FGF l  ??��H��  H * $copy thisItem to the end of toReturn   G IJI l  ??��K��  K � �set oldStatusMessage to item statusMessageIndex of thisItem
						notifyTransport(oldName, offline, oldStatusMessage, serviceName, serviceIndex)   J L��L I  ?I��M���� "0 notifytransport notifyTransportM NON o  @A���� 0 oldname oldNameO PQP m  AB��
�� pstaofflQ RSR m  BCTT      S UVU o  CD�� 0 servicename serviceNameV W�~W o  DE�}�} 0 serviceindex serviceIndex�~  ��  ��  ��  �� 0 i  # o  �|�| 0 oldindex oldIndex$ o  �{�{ 0 oldlen oldLen��  ��    in old but not new   ��   l  QQ�zX�z  X  
do nothing    YZY ?  UX[\[ o  UV�y�y 0 oldindex oldIndex\ o  VW�x�x 0 oldlen oldLenZ ]�w] Z  [�^_�v`^ B  [^aba o  [\�u�u 0 newindex newIndexb o  \]�t�t 0 newlen newLen_ w  a�cdc Y  c�d�sef�rd k  m�gg hih r  msjkj n  mqlml 4  nq�qn
�q 
cobjn o  op�p�p 0 i  m o  mn�o�o 0 newlist newListk o      �n�n 0 newitem newItemi opo r  t~qrq n  t|sts 4  u|�mu
�m 
cobju o  v{�l�l 0 idindex idIndext o  tu�k�k 0 newitem newItemr o      �j�j 0 newname newNamep vwv r  �xyx n  �z{z 4  ���i|
�i 
cobj| o  ���h�h 0 statusindex statusIndex{ o  ��g�g 0 newitem newItemy o      �f�f 0 	newstatus 	newStatusw }�e} Z  ��~�d�~ =  ����� o  ���c�c 0 	newstatus 	newStatus� m  ���b
�b pstaoffl l  ���a��a  �  
do nothing   �d  � k  ���� ��� l  ���`��`  � ) #copy newItem to the end of toReturn   � ��� l  ���_��_  � � �set newStatusMessage to item statusMessageIndex of newItem
						notifyTransport(newName, newStatus, newStatusMessage, serviceName, serviceIndex)   � ��^� I  ���]��\�] "0 notifytransport notifyTransport� ��� o  ���[�[ 0 newname newName� ��� o  ���Z�Z 0 	newstatus 	newStatus� ��� m  ����      � ��� o  ���Y�Y 0 servicename serviceName� ��X� o  ���W�W 0 serviceindex serviceIndex�X  �\  �^  �e  �s 0 i  e o  fg�V�V 0 newindex newIndexf o  gh�U�U 0 newlen newLen�r  �v  ` l  ���T��T  �  
do nothing   �w  ��  ��   ��� l      �S��S  � ! send notification aim style   � ��� i  z}��� I      �R��Q�R 
0 notify  � ��� o      �P�P 0 thisid thisId� ��� o      �O�O 0 
thisstatus 
thisStatus� ��� o      �N�N 0 servicename serviceName� ��M� o      �L�L 0 serviceindex serviceIndex�M  �Q  � Q    4���� Z   *���K�J� n   ��� I    �I�H�G�I  0 isgrowlrunning isGrowlRunning�H  �G  �  f    � Z   &���F�E� n   ��� I    �D�C�B�D  0 isichatrunning isIChatRunning�C  �B  �  f    � O   "��� k   !�� ��� r    +��� 6  )��� n     ��� 1     �A
�A 
pnam� n    ��� 4   �@�
�@ 
pres� m    �?�? � 4    �>�
�> 
icsv� o    �=�= 0 servicename serviceName� =  ! (��� 1   " $�<
�< 
ID  � o   % '�;�; 0 thisid thisId� o      �:�: 0 thename theName� ��� r   , 4��� n  , 2��� I   - 2�9��8�9 "0 stringforstatus stringForStatus� ��7� o   - .�6�6 0 
thisstatus 
thisStatus�7  �8  �  f   , -� o      �5�5 0 	thestatus 	theStatus� ��� r   5 I��� 6 5 G��� n   5 >��� 1   < >�4
�4 
smsg� n   5 <��� 4  9 <�3�
�3 
pres� m   : ;�2�2 � 4   5 9�1�
�1 
icsv� o   7 8�0�0 0 servicename serviceName� =  ? F��� 1   @ B�/
�/ 
ID  � o   C E�.�. 0 thisid thisId� o      �-�- &0 thisstatusmessage thisStatusMessage� ��� Z   J _���,�+� >   J M��� o   J K�*�* &0 thisstatusmessage thisStatusMessage� m   K L��      � r   P [��� b   P Y��� b   P W��� o   P Q�)�) 0 	thestatus 	theStatus� o   Q V�(�( 0 newline  � o   W X�'�' &0 thisstatusmessage thisStatusMessage� o      �&�& 0 	thestatus 	theStatus�,  �+  � ��� l  ` `�%�$�%  �$  � ��� r   ` i��� n  ` g��� I   a g�#��"�# *0 getnotificationname getNotificationName� ��� o   a b�!�! 0 serviceindex serviceIndex� �� � o   b c�� 0 
thisstatus 
thisStatus�   �"  �  f   ` a� o      �� $0 notificationname notificationName� ��� Q   j!���� Z   m ������ n  m r��� I   n r����  0 isichatrunning isIChatRunning�  �  �  f   m n� k   u ��� ��� r   u ���� l  u � �  n   u � 1   � ��
� 
imaA l  u �� 6 u � n   u | 4  y |�
� 
pres m   z {��  l  u y	�	 4   u y�

� 
icsv
 o   w x�� 0 servicename serviceName�   =  } � 1   ~ ��
� 
ID   o   � ��� 0 thisid thisId�  �  � l     � o      �� 0 
displaypic 
displayPic�  � � O   � � I  � ���

� .notifygrnull��� ��� null�
   �	
�	 
name o   � ��� $0 notificationname notificationName �
� 
titl o   � ��� 0 thename theName �
� 
appl o   � ��� 0 appname appName �
� 
desc o   � ��� 0 	thestatus 	theStatus �� 
� 
imag l  � ��� o   � ����� 0 
displaypic 
displayPic��  �    m   � � �  �  � L   � �����  � R      ������
�� .ascrerr ****      � ****��  ��  � Q   �! Z   � � ��! n  � �"#" I   � ���������  0 isichatrunning isIChatRunning��  ��  #  f   � �  k   � �$$ %&% r   � �'(' l  � �)��) n   � �*+* 1   � ���
�� 
imaA+ l  � �,��, 4   � ���-
�� 
icsv- o   � ����� 0 servicename serviceName��  ��  ( l     .��. o      ���� 0 
displaypic 
displayPic��  & /��/ O   � �010 I  � �����2
�� .notifygrnull��� ��� null��  2 ��34
�� 
name3 o   � ����� $0 notificationname notificationName4 ��56
�� 
titl5 o   � ����� 0 thename theName6 ��78
�� 
appl7 o   � ����� 0 appname appName8 ��9:
�� 
desc9 o   � ����� 0 	thestatus 	theStatus: ��;��
�� 
imag; l  � �<��< o   � ����� 0 
displaypic 
displayPic��  ��  1 m   � � ��  ��  ! L   � �����   R      ������
�� .ascrerr ****      � ****��  ��   Q   �!=>?= O   �@A@ I  �����B
�� .notifygrnull��� ��� null��  B ��CD
�� 
nameC o  ���� $0 notificationname notificationNameD ��EF
�� 
titlE o  ���� 0 thename theNameF ��GH
�� 
applG o  ���� 0 appname appNameH ��I��
�� 
descI o  ���� 0 	thestatus 	theStatus��  A m   � � > R      ������
�� .ascrerr ****      � ****��  ��  ? L  !����  �  � m    d�F  �E  �K  �J  � R      ������
�� .ascrerr ****      � ****��  ��  � L  24����  � JKJ l      ��L��  L * $send notification in transport style   K MNM i  ~�OPO I      ��Q���� "0 notifytransport notifyTransportQ RSR o      ���� 0 thisid thisIdS TUT o      ���� 0 
thisstatus 
thisStatusU VWV o      ���� &0 thisstatusmessage thisStatusMessageW XYX o      ���� 0 servicename serviceNameY Z��Z o      ���� 0 serviceindex serviceIndex��  ��  P Q    [\][ Z   ^_����^ n   `a` I    ��������  0 isgrowlrunning isGrowlRunning��  ��  a  f    _ Z   bc����b n   ded I    ��������  0 isichatrunning isIChatRunning��  ��  e  f    c O    �fgf k    �hh iji Z    #kl����k =    mnm o    ���� 0 
thisstatus 
thisStatusn m    ��
�� pstaoffll L    ����  ��  ��  j opo l  $ $������  ��  p qrq r   $ 8sts 6 $ 6uvu n   $ -wxw 1   + -��
�� 
smsgx l  $ +y��y n   $ +z{z 4  ( +��|
�� 
pres| m   ) *���� { 4   $ (��}
�� 
icsv} o   & '���� 0 servicename serviceName��  v =  . 5~~ 1   / 1��
�� 
ID   o   2 4���� 0 thisid thisIdt o      ���� 0 thename theNamer ��� r   9 A��� n  9 ?��� I   : ?������� "0 stringforstatus stringForStatus� ���� o   : ;���� 0 
thisstatus 
thisStatus��  ��  �  f   9 :� o      ���� 0 	thestatus 	theStatus� ��� r   B K��� n  B I��� I   C I������� *0 getnotificationname getNotificationName� ��� o   C D���� 0 serviceindex serviceIndex� ���� o   D E���� 0 
thisstatus 
thisStatus��  ��  �  f   B C� o      ���� $0 notificationname notificationName� ���� Q   L ����� Z   O ������� n  O T��� I   P T��������  0 isichatrunning isIChatRunning��  ��  �  f   O P� k   W ��� ��� r   W k��� l  W i���� n   W i��� 1   g i��
�� 
imaA� l  W g���� 6 W g��� n   W ^��� 4  [ ^���
�� 
pres� m   \ ]���� � l  W [���� 4   W [���
�� 
icsv� o   Y Z���� 0 servicename serviceName��  � =  _ f��� 1   ` b��
�� 
ID  � o   c e���� 0 thisid thisId��  ��  � l     ���� o      ���� 0 
displaypic 
displayPic��  � ���� O   l ���� I  p ������
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   r s���� $0 notificationname notificationName� ����
�� 
titl� o   t u���� 0 thename theName� ����
�� 
appl� o   v {���� 0 appname appName� ����
�� 
desc� o   ~ �� 0 	thestatus 	theStatus� �~��}
�~ 
imag� l  � ���|� o   � ��{�{ 0 
displaypic 
displayPic�|  �}  � m   l m ��  ��  � L   � ��z�z  � R      �y�x�w
�y .ascrerr ****      � ****�x  �w  � Q   � ����� Z   � ����v�� n  � ���� I   � ��u�t�s�u  0 isichatrunning isIChatRunning�t  �s  �  f   � �� k   � ��� ��� r   � ���� l  � ���r� n   � ���� 1   � ��q
�q 
imaA� l  � ���p� 4   � ��o�
�o 
icsv� o   � ��n�n 0 servicename serviceName�p  �r  � l     ��m� o      �l�l 0 
displaypic 
displayPic�m  � ��k� O   � ���� I  � ��j�i�
�j .notifygrnull��� ��� null�i  � �h��
�h 
name� o   � ��g�g $0 notificationname notificationName� �f��
�f 
titl� o   � ��e�e 0 thename theName� �d��
�d 
appl� o   � ��c�c 0 appname appName� �b��
�b 
desc� o   � ��a�a 0 	thestatus 	theStatus� �`��_
�` 
imag� l  � ���^� o   � ��]�] 0 
displaypic 
displayPic�^  �_  � m   � � �k  �v  � L   � ��\�\  � R      �[�Z�Y
�[ .ascrerr ****      � ****�Z  �Y  � Q   � ����� O   � ���� I  � ��X�W�
�X .notifygrnull��� ��� null�W  � �V��
�V 
name� o   � ��U�U $0 notificationname notificationName� �T��
�T 
titl� o   � ��S�S 0 thename theName� �R��
�R 
appl� o   � ��Q�Q 0 appname appName� �P��O
�P 
desc� o   � ��N�N 0 	thestatus 	theStatus�O  � m   � � � R      �M�L�K
�M .ascrerr ****      � ****�L  �K  � L   � ��J�J  ��  g m    d��  ��  ��  ��  \ R      �I�H�G
�I .ascrerr ****      � ****�H  �G  ] L  �F�F  N ��� l      �E��E  � I C
	return notification name according to serviceName and thisStatus
   � ��� i  ����� I      �D��C�D *0 getnotificationname getNotificationName� ��� o      �B�B 0 serviceindex serviceIndex� ��A� o      �@�@ 0 	thestatus 	theStatus�A  �C  � Z    =���?�� I     �>�=�<�>  0 isichatrunning isIChatRunning�=  �<  � w   8�d� Z   
8����� =   
 ��� o   
 �;�; 0 serviceindex serviceIndex� o    �:�: "0 aimserviceindex aimServiceIndex� Z    R� � =    o    �9�9 0 	thestatus 	theStatus m    �8
�8 pstaaway  L      o    �7�7 "0 aimawayregister aimAwayRegister  =  # &	 o   # $�6�6 0 	thestatus 	theStatus	 m   $ %�5
�5 pstaoffl 

 L   ) / o   ) .�4�4 (0 aimofflineregister aimOfflineRegister  =  2 5 o   2 3�3�3 0 	thestatus 	theStatus m   3 4�2
�2 pstaaval  L   8 > o   8 =�1�1 &0 aimonlineregister aimOnlineRegister  =  A D o   A B�0�0 0 	thestatus 	theStatus l  B C�/ m   B C�.
�. pstaidle�/   �- L   G M o   G L�,�, "0 aimidleregister aimIdleRegister�-   L   P R m   P Q      �  =   U \  o   U V�+�+ 0 serviceindex serviceIndex  o   V [�*�* (0 jabberserviceindex jabberServiceIndex !"! Z   _ �#$%&# =  _ b'(' o   _ `�)�) 0 	thestatus 	theStatus( m   ` a�(
�( pstaaway$ L   e k)) o   e j�'�' (0 jabberawayregister jabberAwayRegister% *+* =  n q,-, o   n o�&�& 0 	thestatus 	theStatus- m   o p�%
�% pstaoffl+ ./. L   t z00 o   t y�$�$ .0 jabberofflineregister jabberOfflineRegister/ 121 =  } �343 o   } ~�#�# 0 	thestatus 	theStatus4 m   ~ �"
�" pstaaval2 565 L   � �77 o   � ��!�! ,0 jabberonlineregister jabberOnlineRegister6 898 =  � �:;: o   � �� �  0 	thestatus 	theStatus; l  � �<�< m   � ��
� pstaidle�  9 =�= L   � �>> o   � ��� (0 jabberidleregister jabberIdleRegister�  & L   � �?? m   � �@@      " ABA =   � �CDC o   � ��� 0 serviceindex serviceIndexD o   � ��� *0 bonjourserviceindex bonjourServiceIndexB EFE Z   � �GHIJG =  � �KLK o   � ��� 0 	thestatus 	theStatusL m   � ��
� pstaawayH L   � �MM o   � ��� *0 bonjourawayregister bonjourAwayRegisterI NON =  � �PQP o   � ��� 0 	thestatus 	theStatusQ m   � ��
� pstaofflO RSR L   � �TT o   � ��� 00 bonjourofflineregister bonjourOfflineRegisterS UVU =  � �WXW o   � ��� 0 	thestatus 	theStatusX m   � ��
� pstaavalV YZY L   � �[[ o   � ��� .0 bonjouronlineregister bonjourOnlineRegisterZ \]\ =  � �^_^ o   � ��� 0 	thestatus 	theStatus_ l  � �`�` m   � ��
� pstaidle�  ] a�a L   � �bb o   � ��� *0 bonjouridleregister bonjourIdleRegister�  J L   � �cc m   � �dd      F efe =   � �ghg o   � ��� 0 serviceindex serviceIndexh o   � ��
�
 :0 jabbertransportserviceindex jabberTransPortServiceIndexf i�	i Z   �3jklmj =  � �non o   � ��� 0 	thestatus 	theStatuso m   � ��
� pstaawayk L   �pp o   � �� :0 jabbertransportawayregister jabberTransportAwayRegisterl qrq = sts o  �� 0 	thestatus 	theStatust m  �
� pstaofflr uvu L  
ww o  
�� @0 jabbertransportofflineregister jabberTransportOfflineRegisterv xyx = z{z o  �� 0 	thestatus 	theStatus{ m  �
� pstaavaly |}| L  ~~ o  � �  >0 jabbertransportonlineregister jabberTransportOnlineRegister} � = "%��� o  "#���� 0 	thestatus 	theStatus� l #$���� m  #$��
�� pstaidle��  � ���� L  (.�� o  (-���� :0 jabbertransportidleregister jabberTransportIdleRegister��  m L  13�� m  12��      �	  � l  68��� L  68�� m  67��      �  
impossible   �?  � L  ;=�� m  ;<��      � ��� l     ������  ��  � ��� i  ����� I      ������� "0 stringforstatus stringForStatus� ���� o      ���� 0 s  ��  ��  � Q     J���� Z    @������ I    ��������  0 isichatrunning isIChatRunning��  ��  � w    ;�d� Z    ;����� =   ��� o    ���� 0 s  � m    ��
�� pstaaway� L    �� m    ��  is away   � ��� =   ��� o    ���� 0 s  � m    ��
�� pstaoffl� ��� L     �� m    ��  went offline   � ��� =  # &��� o   # $���� 0 s  � m   $ %��
�� pstaaval� ��� L   ) +�� m   ) *��  is available   � ��� =  . 1��� o   . /���� 0 s  � m   / 0��
�� pstaidle� ���� L   4 6�� m   4 5��  	is idling   ��  � L   9 ;�� m   9 :��  status is unknown   ��  � L   > @�� m   > ?��  status is unknown   � R      ������
�� .ascrerr ****      � ****��  ��  � L   H J�� m   H I��      � ��� l     ������  ��  � ��� i  ����� I      ��������  0 isichatrunning isIChatRunning��  ��  � Q     ���� O    ��� L    �� I   �����
�� .coredoexbool       obj � 4    ���
�� 
prcs� m   	 
��  iChat   ��  � m    ���null     ߀�� y��System Events.app�!@�����   H:|�(   )       �(� l����P+sevs   alis    �  Macintosh HD               ����H+   y��System Events.app                                               z�c��        ����  	                CoreServices    ���/      �c��     y�� y�h y�g  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L    �� m    ��
�� boovfals� ��� i  ����� I      ��������  0 isgrowlrunning isGrowlRunning��  ��  � Q     ���� O    ��� L    �� I   �����
�� .coredoexbool       obj � 4    ���
�� 
prcs� m   	 
��  GrowlHelperApp   ��  � m    �� R      ������
�� .ascrerr ****      � ****��  ��  � L    �� m    ��
�� boovfals� ��� i  ����� I      ������� &0 isjabbertransport isJabberTransport� ���� 1      ��
�� 
ID  ��  ��  � L     �� l    ���� E     ��� 1     ��
�� 
ID  � m    ��  %   ��  � ��� i  ����� I      �������� 0 gettigerlist getTigerList��  ��  � l    C��� k     C�� ��� r     ��� n    ��� I    �������� 60 gettwojabberavailablelist getTwoJabberAvailableList��  ��  �  f     � o      ���� 0 
tempjabber 
tempJabber� ��� l    ��� r    ��� n    �	 � 4   	 ��	
�� 
cobj	 m   
 ���� 	  o    	���� 0 
tempjabber 
tempJabber� o      ���� 0 
jabberlist 
jabberList� , &read spec for getTwoJabberAvailbleList   � 			 r    			 n    			 4    ��	
�� 
cobj	 m    ���� 	 o    ���� 0 
tempjabber 
tempJabber	 o      ���� *0 jabbertransportlist jabberTransportList	 		��		 L    C	
	
 J    B		 			 n   			 I    ��	���� 0 	sorttuple 	sortTuple	 	��	 o    ���� 0 
jabberlist 
jabberList��  ��  	  f    	 			 n   +			 I    +��	���� 0 	sorttuple 	sortTuple	 	��	 n   '			 I    '��	���� $0 getavailablelist getAvailableList	 	��	 o    #����  0 aimservicename aimServiceName��  ��  	  f    ��  ��  	  f    	 			 n  + :			 I   , :��	 ���� 0 	sorttuple 	sortTuple	  	!��	! n  , 6	"	#	" I   - 6��	$���� $0 getavailablelist getAvailableList	$ 	%��	% o   - 2���� (0 bonjourservicename bonjourServiceName��  ��  	#  f   , -��  ��  	  f   + ,	 	&��	& n  : @	'	(	' I   ; @��	)���� 0 	sorttuple 	sortTuple	) 	*��	* o   ; <���� *0 jabbertransportlist jabberTransportList��  ��  	(  f   : ;��  ��  � ( "make sure this conforms to indices   � 	+	,	+ l     ������  ��  	, 	-	.	- i  ��	/	0	/ I      ��������  0 getpantherlist getPantherList��  ��  	0 k     %	1	1 	2	3	2 l      ��	4��  	4 . (make sure this comply with service index   	3 	5��	5 L     %	6	6 J     $	7	7 	8	9	8 J     ����  	9 	:	;	: n   	<	=	< I    ��	>���� 0 	sorttuple 	sortTuple	> 	?��	? n   	@	A	@ I    ��	B���� $0 getavailablelist getAvailableList	B 	C��	C o    	����  0 aimservicename aimServiceName��  ��  	A  f    ��  ��  	=  f    	; 	D	E	D n    	F	G	F I     ��	H���� 0 	sorttuple 	sortTuple	H 	I��	I n   	J	K	J I    ��	L���� $0 getavailablelist getAvailableList	L 	M��	M o    ���� (0 bonjourservicename bonjourServiceName��  ��  	K  f    ��  ��  	G  f    	E 	N��	N J     "����  ��  ��  	. 	O	P	O l      ��	Q��  	Q n hdeprecated beware when calling this function; it doesn't distinguish between jabber transport and jabber   	P 	R	S	R l      ��	T��  	T  yon getAvailableJabberList()
	return my getAvailableList(jabberServiceName, jabberServiceIndex)
end getAvailableJabberList   	S 	U	V	U l      ��	W��  	W �deprecated don't use
on getAvailableAimList()
	return my getAvailableList(aimServiceName, aimServiceIndex)
end getAvailableAimList
on getAvailableBonjourList()
	return my getAvailableList(bonjourServiceName, aimServiceIndex)
end getAvailableBonjourList   	V 	X	Y	X l      ��	Z��  	Z � �on getLastJabberList()
	return item jabberServiceIndex of lastList
end getLastJabberList
on getLastAimList()
	return item aimServiceIndex of lastList
end getLastAimList   	Y 	[	\	[ l     ������  ��  	\ 	]	^	] l     ������  ��  	^ 	_	`	_ l      ��	a��  	a � �
	getTwoJabberAvailableList() return {jabberList, jabberTransportList}
	where jabberList is list of {id,status} of
	and jabberTransportList is list of {id,status,statusMessage}
   	` 	b	c	b i  ��	d	e	d I      ����~�� 60 gettwojabberavailablelist getTwoJabberAvailableList�  �~  	e Q    �	f	g	h	f k   �	i	i 	j	k	j r    	l	m	l J    �}�}  	m o      �|�| 0 
jabberlist 
jabberList	k 	n	o	n r    	p	q	p J    
�{�{  	q o      �z�z *0 jabbertransportlist jabberTransportList	o 	r	s	r r    	t	u	t J    �y�y  	u o      �x�x $0 jabberstatuslist jabberStatusList	s 	v	w	v r    	x	y	x J    �w�w  	y o      �v�v 60 jabbertransportstatuslist jabberTransportStatusList	w 	z�u	z Z   �	{	|�t	}	{ n   	~		~ I    �s�r�q�s  0 isichatrunning isIChatRunning�r  �q  	  f    	| O   �	�	�	� k   #�	�	� 	�	�	� r   # D	�	�	� n   # B	�	�	� 1   @ B�p
�p 
ID  	� l  # @	��o	� 6 # @	�	�	� l  # -	��n	� n   # -	�	�	� 2   + -�m
�m 
pres	� l  # +	��l	� 4   # +�k	�
�k 
icsv	� o   % *�j�j &0 jabberservicename jabberServiceName�l  �n  	� l  . ?	��i	� F   . ?	�	�	� =  / 6	�	�	� 1   0 2�h
�h 
stat	� m   3 5�g
�g pstaaval	� E   7 >	�	�	� 1   8 :�f
�f 
pnam	� m   ; =	�	�  %   �i  �o  	� o      �e�e 0 	theidlist 	theIdList	� 	�	�	� Y   E g	��d	�	��c	� k   R b	�	� 	�	�	� r   R X	�	�	� n   R V	�	�	� 4   S V�b	�
�b 
cobj	� o   T U�a�a 0 i  	� o   R S�`�` 0 	theidlist 	theIdList	� o      �_�_ 0 thisid thisId	� 	�	�	� s   Y ]	�	�	� m   Y Z�^
�^ pstaaval	� l     	��]	� n      	�	�	�  ;   [ \	� o   Z [�\�\ 60 jabbertransportstatuslist jabberTransportStatusList�]  	� 	��[	� s   ^ b	�	�	� o   ^ _�Z�Z 0 thisid thisId	� l     	��Y	� n      	�	�	�  ;   ` a	� o   _ `�X�X *0 jabbertransportlist jabberTransportList�Y  �[  �d 0 i  	� m   H I�W�W 	� n   I M	�	�	� 1   J L�V
�V 
leng	� o   I J�U�U 0 	theidlist 	theIdList�c  	� 	�	�	� r   h �	�	�	� n   h �	�	�	� 1   � ��T
�T 
ID  	� l  h �	��S	� 6 h �	�	�	� l  h r	��R	� n   h r	�	�	� 2   p r�Q
�Q 
pres	� l  h p	��P	� 4   h p�O	�
�O 
icsv	� o   j o�N�N &0 jabberservicename jabberServiceName�P  �R  	� l  s �	��M	� F   s �	�	�	� =  t {	�	�	� 1   u w�L
�L 
stat	� m   x z�K
�K pstaaway	� E   | �	�	�	� 1   } �J
�J 
pnam	� m   � �	�	�  %   �M  �S  	� o      �I�I 0 	theidlist 	theIdList	� 	�	�	� Y   � �	��H	�	��G	� k   � �	�	� 	�	�	� r   � �	�	�	� n   � �	�	�	� 4   � ��F	�
�F 
cobj	� o   � ��E�E 0 i  	� o   � ��D�D 0 	theidlist 	theIdList	� o      �C�C 0 thisid thisId	� 	�	�	� s   � �	�	�	� m   � ��B
�B pstaaway	� l     	��A	� n      	�	�	�  ;   � �	� o   � ��@�@ 60 jabbertransportstatuslist jabberTransportStatusList�A  	� 	��?	� s   � �	�	�	� o   � ��>�> 0 thisid thisId	� l     	��=	� n      	�	�	�  ;   � �	� o   � ��<�< *0 jabbertransportlist jabberTransportList�=  �?  �H 0 i  	� m   � ��;�; 	� n   � �	�	�	� 1   � ��:
�: 
leng	� o   � ��9�9 0 	theidlist 	theIdList�G  	� 	�	�	� r   � �	�	�	� n   � �	�	�	� 1   � ��8
�8 
ID  	� l  � �	��7	� 6 � �	�	�	� l  � �	��6	� n   � �	�	�	� 2   � ��5
�5 
pres	� l  � �	��4	� 4   � ��3	�
�3 
icsv	� o   � ��2�2 &0 jabberservicename jabberServiceName�4  �6  	� l  � �	��1	� F   � �	�	�	� =  � �	�	�	� 1   � ��0
�0 
stat	� m   � ��/
�/ pstaidle	� E   � �	�	�	� 1   � ��.
�. 
pnam	� m   � �	�	�  %   �1  �7  	� o      �-�- 0 	theidlist 	theIdList	� 	�	�	� Y   � �	��,
 
�+	� k   � �

 


 r   � �


 n   � �


 4   � ��*
	
�* 
cobj
	 o   � ��)�) 0 i  
 o   � ��(�( 0 	theidlist 	theIdList
 o      �'�' 0 thisid thisId
 




 s   � �


 m   � ��&
�& pstaidle
 l     
�%
 n      


  ;   � �
 o   � ��$�$ 60 jabbertransportstatuslist jabberTransportStatusList�%  
 
�#
 s   � �


 o   � ��"�" 0 thisid thisId
 l     
�!
 n      


  ;   � �
 o   � �� �  *0 jabbertransportlist jabberTransportList�!  �#  �, 0 i  
  m   � ��� 
 n   � �


 1   � ��
� 
leng
 o   � ��� 0 	theidlist 	theIdList�+  	� 


 r   �


 n   �


 1  �
� 
ID  
 l  �
�
 6 �
 
!
  l  � �
"�
" n   � �
#
$
# 2   � ��
� 
pres
$ l  � �
%�
% 4   � ��
&
� 
icsv
& o   � ��� &0 jabberservicename jabberServiceName�  �  
! l  �
'�
' F   �
(
)
( =  �
*
+
* 1   ��
� 
stat
+ m  �
� pstaaval
) H  
,
, E  
-
.
- 1  	�
� 
pnam
. m  

/
/  %   �  �  
 o      �� 0 	theidlist 	theIdList
 
0
1
0 Y  9
2�
3
4�
2 k  $4
5
5 
6
7
6 r  $*
8
9
8 n  $(
:
;
: 4  %(�
<
� 
cobj
< o  &'�� 0 i  
; o  $%�� 0 	theidlist 	theIdList
9 o      �� 0 thisid thisId
7 
=
>
= s  +/
?
@
? m  +,�

�
 pstaaval
@ l     
A�	
A n      
B
C
B  ;  -.
C o  ,-�� $0 jabberstatuslist jabberStatusList�	  
> 
D�
D s  04
E
F
E o  01�� 0 thisid thisId
F l     
G�
G n      
H
I
H  ;  23
I o  12�� 0 
jabberlist 
jabberList�  �  � 0 i  
3 m  �� 
4 n  
J
K
J 1  �
� 
leng
K o  �� 0 	theidlist 	theIdList�  
1 
L
M
L r  :^
N
O
N n  :\
P
Q
P 1  Z\� 
�  
ID  
Q l :Z
R��
R 6:Z
S
T
S l :D
U��
U n  :D
V
W
V 2  BD��
�� 
pres
W l :B
X��
X 4  :B��
Y
�� 
icsv
Y o  <A���� &0 jabberservicename jabberServiceName��  ��  
T l EY
Z��
Z F  EY
[
\
[ = FM
]
^
] 1  GI��
�� 
stat
^ m  JL��
�� pstaaway
\ H  NX
_
_ E  NW
`
a
` 1  OQ��
�� 
pnam
a m  RV
b
b  %   ��  ��  
O o      ���� 0 	theidlist 	theIdList
M 
c
d
c Y  _�
e��
f
g��
e k  l|
h
h 
i
j
i r  lr
k
l
k n  lp
m
n
m 4  mp��
o
�� 
cobj
o o  no���� 0 i  
n o  lm���� 0 	theidlist 	theIdList
l o      ���� 0 thisid thisId
j 
p
q
p s  sw
r
s
r m  st��
�� pstaaway
s l     
t��
t n      
u
v
u  ;  uv
v o  tu���� $0 jabberstatuslist jabberStatusList��  
q 
w��
w s  x|
x
y
x o  xy���� 0 thisid thisId
y l     
z��
z n      
{
|
{  ;  z{
| o  yz���� 0 
jabberlist 
jabberList��  ��  �� 0 i  
f m  bc���� 
g n  cg
}
~
} 1  df��
�� 
leng
~ o  cd���� 0 	theidlist 	theIdList��  
d 

�
 r  ��
�
�
� n  ��
�
�
� 1  ����
�� 
ID  
� l ��
���
� 6��
�
�
� l ��
���
� n  ��
�
�
� 2  ����
�� 
pres
� l ��
���
� 4  ����
�
�� 
icsv
� o  ������ &0 jabberservicename jabberServiceName��  ��  
� l ��
���
� F  ��
�
�
� = ��
�
�
� 1  ����
�� 
stat
� m  ����
�� pstaidle
� H  ��
�
� E  ��
�
�
� 1  ����
�� 
pnam
� m  ��
�
�  %   ��  ��  
� o      ���� 0 	theidlist 	theIdList
� 
�
�
� Y  ��
���
�
���
� k  ��
�
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 4  ����
�
�� 
cobj
� o  ������ 0 i  
� o  ������ 0 	theidlist 	theIdList
� o      ���� 0 thisid thisId
� 
�
�
� s  ��
�
�
� m  ����
�� pstaidle
� l     
���
� n      
�
�
�  ;  ��
� o  ������ $0 jabberstatuslist jabberStatusList��  
� 
���
� s  ��
�
�
� o  ������ 0 thisid thisId
� l     
���
� n      
�
�
�  ;  ��
� o  ������ 0 
jabberlist 
jabberList��  ��  �� 0 i  
� m  ������ 
� n  ��
�
�
� 1  ����
�� 
leng
� o  ������ 0 	theidlist 	theIdList��  
� 
���
� L  ��
�
� J  ��
�
� 
�
�
� n ��
�
�
� I  ����
����� 0 zip2list zip2List
� 
�
�
� o  ������ 0 
jabberlist 
jabberList
� 
���
� o  ������ $0 jabberstatuslist jabberStatusList��  ��  
�  f  ��
� 
���
� n ��
�
�
� I  ����
����� 0 zip2list zip2List
� 
�
�
� o  ������ *0 jabbertransportlist jabberTransportList
� 
���
� o  ������ 60 jabbertransportstatuslist jabberTransportStatusList��  ��  
�  f  ����  ��  	� m     d�t  	} L  ��
�
� J  ��
�
� 
�
�
� J  ������  
� 
���
� J  ������  ��  �u  	g R      ������
�� .ascrerr ****      � ****��  ��  	h L  ��
�
� J  ��
�
� 
�
�
� J  ������  
� 
���
� J  ������  ��  	c 
�
�
� l      ��
���  
� J Dget Available List return list of  {id,status} for given serviceName   
� 
�
�
� i  ��
�
�
� I      ��
����� $0 getavailablelist getAvailableList
� 
���
� o      ���� 0 servicename serviceName��  ��  
� Q     �
�
�
�
� k    �
�
� 
�
�
� r    
�
�
� J    ����  
� o      ���� 0 servicelist serviceList
� 
�
�
� r    
�
�
� J    
����  
� o      ���� 0 
statuslist 
statusList
� 
���
� Z    �
�
���
�
� n   
�
�
� I    ��������  0 isichatrunning isIChatRunning��  ��  
�  f    
� O    �
�
�
� k    �
�
� 
�
�
� r    ,
�
�
� n    *
�
�
� 1   ( *��
�� 
ID  
� l   (
���
� 6  (
�
�
� l   
���
� n    
�
�
� 2    ��
�� 
pres
� l   
���
� 4    ��
�
�� 
icsv
� o    ���� 0 servicename serviceName��  ��  
� =    '
�
�
� 1   ! #��
�� 
stat
� m   $ &��
�� pstaaval��  
� o      ����  0 servicelistava serviceListAva
� 
�
�
� Y   - C
���
� ��
� s   : > m   : ;��
�� pstaaval l     �� n        ;   < = o   ; <���� 0 
statuslist 
statusList��  �� 0 i  
� m   0 1����   n   1 5 1   2 4��
�� 
leng o   1 2����  0 servicelistava serviceListAva��  
� 	 r   D W

 n   D U 1   S U��
�� 
ID   l  D S�� 6 D S l  D J�� n   D J 2   H J��
�� 
pres l  D H�� 4   D H��
�� 
icsv o   F G���� 0 servicename serviceName��  ��   l  K R�� =  K R 1   L N��
�� 
stat m   O Q��
�� pstaaway��  ��   o      ���� "0 servicelistaway serviceListAway	  Y   X n���� s   e i m   e f��
�� pstaaway l      ��  n      !"!  ;   g h" o   f g���� 0 
statuslist 
statusList��  �� 0 i   m   [ \����  n   \ `#$# 1   ] _��
�� 
leng$ o   \ ]���� "0 servicelistaway serviceListAway��   %&% r   o �'(' n   o �)*) 1   ~ ���
�� 
ID  * l  o ~+�+ 6 o ~,-, l  o u.�~. n   o u/0/ 2   s u�}
�} 
pres0 l  o s1�|1 4   o s�{2
�{ 
icsv2 o   q r�z�z 0 servicename serviceName�|  �~  - l  v }3�y3 =  v }454 1   w y�x
�x 
stat5 m   z |�w
�w pstaidle�y  �  ( o      �v�v  0 servicelistidl serviceListIdl& 676 Y   � �8�u9:�t8 s   � �;<; m   � ��s
�s pstaidle< l     =�r= n      >?>  ;   � �? o   � ��q�q 0 
statuslist 
statusList�r  �u 0 i  9 m   � ��p�p : n   � �@A@ 1   � ��o
�o 
lengA o   � ��n�n  0 servicelistidl serviceListIdl�t  7 B�mB L   � �CC n  � �DED I   � ��lF�k�l 0 zip2list zip2ListF GHG b   � �IJI b   � �KLK o   � ��j�j  0 servicelistava serviceListAvaL o   � ��i�i "0 servicelistaway serviceListAwayJ o   � ��h�h  0 servicelistidl serviceListIdlH M�gM o   � ��f�f 0 
statuslist 
statusList�g  �k  E  f   � ��m  
� m    d��  
� L   � �NN J   � ��e�e  ��  
� R      �d�c�b
�d .ascrerr ****      � ****�c  �b  
� L   � �OO J   � ��a�a  
� PQP l     �`�_�`  �_  Q RSR i  ��TUT I      �^�]�\�^ "0 jabberjustlogin jabberJustLogIn�]  �\  U L     VV n    WXW I    �[Y�Z�[ 0 isjustlogin isJustLogInY Z[Z o    �Y�Y &0 jabberservicename jabberServiceName[ \�X\ o    �W�W (0 jabberserviceindex jabberServiceIndex�X  �Z  X  f     S ]^] i  ��_`_ I      �V�U�T�V 0 aimjustlogin aimJustLogin�U  �T  ` L     aa n    bcb I    �Sd�R�S 0 isjustlogin isJustLogInd efe o    �Q�Q  0 aimservicename aimServiceNamef g�Pg o    �O�O "0 aimserviceindex aimServiceIndex�P  �R  c  f     ^ hih i  ��jkj I      �N�M�L�N $0 bonjourjustlogin bonjourJustLogIn�M  �L  k L     ll n    mnm I    �Ko�J�K 0 isjustlogin isJustLogIno pqp o    �I�I (0 bonjourservicename bonjourServiceNameq r�Hr o    �G�G *0 bonjourserviceindex bonjourServiceIndex�H  �J  n  f     i sts l      �Fu�F  u 0 *
	return delayTime for given serviceIndex
   t vwv i  ��xyx I      �Ez�D�E 0 getdelaytime getDelayTimez {�C{ o      �B�B 0 serviceindex serviceIndex�C  �D  y L     
|| n     	}~} 4    �A
�A 
cobj o    �@�@ 0 serviceindex serviceIndex~ o     �?�? 0 	delaytime 	delayTimew ��� l      �>��>  � > 8
	decrease dealyTime for given serviceIndex by idleTime
   � ��� i  ����� I      �=��<�= &0 decreasedelaytime decreaseDelayTime� ��;� o      �:�: 0 serviceindex serviceIndex�;  �<  � k     3�� ��� r     ��� l    ��9� \     ��� l    ��8� n     ��� 4    �7�
�7 
cobj� o    �6�6 0 serviceindex serviceIndex� o     �5�5 0 	delaytime 	delayTime�8  � o    �4�4 0 idletime idleTime�9  � n      ��� 4    �3�
�3 
cobj� o    �2�2 0 serviceindex serviceIndex� o    �1�1 0 	delaytime 	delayTime� ��0� Z    3���/�.� A    "��� n     ��� 4     �-�
�- 
cobj� o    �,�, 0 serviceindex serviceIndex� o    �+�+ 0 	delaytime 	delayTime� m     !�*�*  � r   % /��� m   % &�)�)  � n      ��� 4   + .�(�
�( 
cobj� o   , -�'�' 0 serviceindex serviceIndex� o   & +�&�& 0 	delaytime 	delayTime�/  �.  �0  � ��� l      �%��%  � � �on zipAndSort(l1, l2) (*as the name imply :) the argument is supposed to be of the form {id list, status message list}*)
	return my sort(my zipList(l1, l2))
end zipAndSort   � ��� l      �$��$  �c]
	zip list1 and list2 return a list of {x1,x2}'s where x1 is in list1 and x2 is in list2 and so on
	the order in which it zip is the order in which it appear in the list1 and list2
	that is the first element get zipped of list1 with the first element of list2 and so on
	kind of invariant: they have the same length
	it's more like intended purpose
   � ��� i  ����� I      �#��"�# 0 zip2list zip2List� ��� o      �!�! 	0 list1  � �� � o      �� 	0 list2  �   �"  � k     4�� ��� r     ��� J     ��  � o      �� 0 	theresult 	theResult� ��� Q    4���� k    *�� ��� Y    '������ s    "��� J    �� ��� n    ��� 4    ��
� 
cobj� o    �� 0 i  � o    �� 	0 list1  � ��� n    ��� 4    ��
� 
cobj� o    �� 0 i  � o    �� 	0 list2  �  � l     ��� n      ���  ;     !� o     �� 0 	theresult 	theResult�  � 0 i  � m    �� � n    ��� 1    �
� 
leng� o    �� 	0 list1  �  � ��� L   ( *�� o   ( )�� 0 	theresult 	theResult�  � R      ��
�	
� .ascrerr ****      � ****�
  �	  � L   2 4�� o   2 3�� 0 	theresult 	theResult�  � ��� i  ����� I      ���� 0 zip3list zip3List� ��� o      �� 	0 list1  � ��� o      �� 	0 list2  � ��� o      �� 	0 list3  �  �  � k     8�� ��� r     ��� J     ��  � o      � �  0 	theresult 	theResult� ���� Q    8���� k    .�� ��� Y    +�������� s    &��� J    #�� ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 i  � o    ���� 	0 list1  � ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 i  � o    ���� 	0 list2  � ���� n    !��� 4    !���
�� 
cobj� o     ���� 0 i  � o    ���� 	0 list3  ��  � l      ��  n        ;   $ % o   # $���� 0 	theresult 	theResult��  �� 0 i  � m    ���� � n     1    ��
�� 
leng o    ���� 	0 list1  ��  � �� L   , . o   , -���� 0 	theresult 	theResult��  � R      ������
�� .ascrerr ****      � ****��  ��  � L   6 8 o   6 7���� 0 	theresult 	theResult��  � 	 l      ��
��  
 l f sort(list)
	this sort use comparison based on on in split
	The is a recursive function with O(nlog n)   	  i  �� I      ������ 0 	sorttuple 	sortTuple �� o      ���� 0 l  ��  ��   Z     9�� B      n      1    ��
�� 
leng o     ���� 0 l   m    ����  L    
 o    	���� 0 l  ��   k    9  r     n    I    �� ���� 0 
splittuple 
splitTuple  !"! n    #$# 1    ��
�� 
rest$ o    ���� 0 l  " %��% n    &'& 4    ��(
�� 
cobj( m    ���� ' o    ���� 0 l  ��  ��    f     o      ���� 0 splitted   )*) l   ������  ��  * +,+ L    7-- l   6.��. b    6/0/ b    ,121 l   %3��3 n   %454 I    %��6���� 0 	sorttuple 	sortTuple6 7��7 n    !898 4    !��:
�� 
cobj: m     ���� 9 o    ���� 0 splitted  ��  ��  5  f    ��  2 J   % +;; <��< n   % )=>= 4   & )��?
�� 
cobj? m   ' (���� > o   % &���� 0 l  ��  0 l  , 5@��@ n  , 5ABA I   - 5��C���� 0 	sorttuple 	sortTupleC D��D n   - 1EFE 4   . 1��G
�� 
cobjG m   / 0���� F o   - .���� 0 splitted  ��  ��  B  f   , -��  ��  , H��H l   8 8��I��  I ! sortLeft & here & sortRight   ��   JKJ l      ��L��  L.(
	split(list,pivotElement)
	split l p split l in to two parts first part is every element in l that's less than p
	the second part is every thing that's greater(or equal) than p and return {lessList, greatList}
	the comparison is hard coded for efficiency
	invariant: type check or I'll kill you
   K MNM i  ��OPO I      ��Q���� 0 
splittuple 
splitTupleQ RSR o      ���� 0 l  S T��T o      ���� 0 p  ��  ��  P k     @UU VWV r     XYX J     ����  Y o      ���� 0 lesslist lessListW Z[Z r    	\]\ J    ����  ] o      ���� 0 	greatlist 	greatList[ ^_^ Y   
 :`��ab��` k    5cc ded r    fgf n    hih 4    ��j
�� 
cobjj o    ���� 0 i  i o    ���� 0 l  g o      ���� 0 thisitem thisIteme k��k Z    5lm��nl A    'opo l   "q��q n    "rsr 4    "��t
�� 
cobjt m     !���� s o    ���� 0 thisitem thisItem��  p l  " &u��u n   " &vwv 4   # &��x
�� 
cobjx m   $ %���� w o   " #���� 0 p  ��  m l  * .yzy s   * .{|{ o   * +���� 0 thisitem thisItem| l     }��} n      ~~  ;   , - o   + ,���� 0 lesslist lessList��  z ! the comparison goes here :)   ��  n s   1 5��� o   1 2���� 0 thisitem thisItem� l     ���� n      ���  ;   3 4� o   2 3���� 0 	greatlist 	greatList��  ��  �� 0 i  a m    ���� b n    ��� 1    ��
�� 
leng� o    ���� 0 l  ��  _ ���� L   ; @�� J   ; ?�� ��� o   ; <���� 0 lesslist lessList� ���� o   < =���� 0 	greatlist 	greatList��  ��  N ��� l      �����  � � �
	touch wasOnline and return true if not userwasonline and user is now online
	also touch delay if the user is not online then set delay to waitDelaytime
	otherwise don't touch it
   � ���� i  ����� I      ������� 0 isjustlogin isJustLogIn� ��� o      ���� 0 servicename serviceName� ���� o      ���� 0 serviceindex serviceIndex��  ��  � Q     ����� Z    ������� n   ��� I    ��������  0 isichatrunning isIChatRunning��  ��  �  f    � O    ���� w    ��d� k    ��� ��� r    ��� l   ���� n    ��� 1    ��
�� 
stat� 4    ���
�� 
icsv� o    ���� 0 servicename serviceName��  � o      ���� 0 currentstatus currentStatus� ���� Z    ������� l   #���� n    #��� 4    "���
�� 
cobj� o     !���� 0 serviceindex serviceIndex� o    ���� 0 	wasonline 	wasOnline��  � k   & L�� ��� Z   & I������ =  & )��� o   & '�� 0 currentstatus currentStatus� m   ' (�~
�~ sstaconn� l   , ,�}��}  �  
do nothing   ��  � k   0 I�� ��� r   0 :��� m   0 1�|
�| boovfals� l     ��{� n      ��� 4   6 9�z�
�z 
cobj� o   7 8�y�y 0 serviceindex serviceIndex� o   1 6�x�x 0 	wasonline 	wasOnline�{  � ��w� r   ; I��� o   ; @�v�v 0 waitidletime waitIdleTime� n      ��� 4   E H�u�
�u 
cobj� o   F G�t�t 0 serviceindex serviceIndex� o   @ E�s�s 0 	delaytime 	delayTime�w  � ��r� L   J L�� m   J K�q
�q boovfals�r  ��  � Z   O ����p�� =  O R��� o   O P�o�o 0 currentstatus currentStatus� m   P Q�n
�n sstaconn� k   U q�� ��� r   U _��� m   U V�m
�m boovtrue� l     ��l� n      ��� 4   [ ^�k�
�k 
cobj� o   \ ]�j�j 0 serviceindex serviceIndex� o   V [�i�i 0 	wasonline 	wasOnline�l  � ��� r   ` n��� o   ` e�h�h 0 waitidletime waitIdleTime� n      ��� 4   j m�g�
�g 
cobj� o   k l�f�f 0 serviceindex serviceIndex� o   e j�e�e 0 	delaytime 	delayTime� ��d� L   o q�� m   o p�c
�c boovtrue�d  �p  � k   t ��� ��� r   t ~��� m   t u�b
�b boovfals� l     ��a� n      ��� 4   z }�`�
�` 
cobj� o   { |�_�_ 0 serviceindex serviceIndex� o   u z�^�^ 0 	wasonline 	wasOnline�a  � ��]� L    ��� m    ��\
�\ boovfals�]  ��  � m    d��  � k   � ��� ��� r   � ���� m   � ��[
�[ boovfals� l     ��Z� n      ��� 4   � ��Y�
�Y 
cobj� o   � ��X�X 0 serviceindex serviceIndex� o   � ��W�W 0 	wasonline 	wasOnline�Z  � ��V� L   � ��� m   � ��U
�U boovfals�V  � R      �T�S�R
�T .ascrerr ****      � ****�S  �R  � k   � ��� ��� r   � ���� m   � ��Q
�Q boovfals� l     ��P� n         4   � ��O
�O 
cobj o   � ��N�N 0 serviceindex serviceIndex o   � ��M�M 0 	wasonline 	wasOnline�P  � �L L   � � m   � ��K
�K boovfals�L  ��       O�J�I�H    #�G�F�E�D�C�B�A�@�?�>	 ~ � � � �
 � � � � � � � � �=�< !"#$%&'()*+,-./0�J   M�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	��������� �����������������������������������; 0 idletime idleTime�: 0 waitidletime waitIdleTime�9 &0 jabberservicename jabberServiceName�8  0 aimservicename aimServiceName�7 (0 bonjourservicename bonjourServiceName�6 80 jabbertransportservicename jabberTransportServiceName�5 (0 jabberserviceindex jabberServiceIndex�4 "0 aimserviceindex aimServiceIndex�3 *0 bonjourserviceindex bonjourServiceIndex�2 :0 jabbertransportserviceindex jabberTransPortServiceIndex�1 0 onlineindex onlineIndex�0 0 	awayindex 	awayIndex�/ 0 	idleindex 	idleIndex�. 0 idindex idIndex�- 0 statusindex statusIndex�, 0 	delaytime 	delayTime�+ 0 lastlist lastList�* 0 	wasonline 	wasOnline�) &0 alreadyregistered alreadyRegistered�( 0 newline  �' 0 appname appName�& &0 aimonlineregister aimOnlineRegister�% "0 aimawayregister aimAwayRegister�$ "0 aimidleregister aimIdleRegister�# (0 aimofflineregister aimOfflineRegister�"  0 allaimregister allAimRegister�! ,0 jabberonlineregister jabberOnlineRegister�  (0 jabberawayregister jabberAwayRegister� (0 jabberidleregister jabberIdleRegister� .0 jabberofflineregister jabberOfflineRegister� &0 alljabberregister allJabberRegister� >0 jabbertransportonlineregister jabberTransportOnlineRegister� :0 jabbertransportawayregister jabberTransportAwayRegister� :0 jabbertransportidleregister jabberTransportIdleRegister� @0 jabbertransportofflineregister jabberTransportOfflineRegister� 80 alljabbertransportregister allJabberTransportRegister� .0 bonjouronlineregister bonjourOnlineRegister� *0 bonjourawayregister bonjourAwayRegister� *0 bonjouridleregister bonjourIdleRegister� 00 bonjourofflineregister bonjourOfflineRegister� (0 allbonjourregister allBonjourRegister� 0 allregister allRegister� 0 
dummyblank 
dummyBlank� 0 
appversion 
appVersion� 0 ichatversion iChatVersion� &0 ichattigerversion iChatTigerVersion� 0 fail  � 0 pass  
� .aevtoappnull  �   � ****
�
 .miscidlenmbr    ��� null�	 &0 registerwithgrowl registerWithGrowl� 0 	dopanther 	doPanther� 0 dotiger doTiger� 0 
mainnotify 
mainNotify� 0 doaimnotify doAimNotify� &0 dotransportnotify doTransportNotify� 
0 notify  � "0 notifytransport notifyTransport� *0 getnotificationname getNotificationName�  "0 stringforstatus stringForStatus��  0 isichatrunning isIChatRunning��  0 isgrowlrunning isGrowlRunning�� &0 isjabbertransport isJabberTransport�� 0 gettigerlist getTigerList��  0 getpantherlist getPantherList�� 60 gettwojabberavailablelist getTwoJabberAvailableList�� $0 getavailablelist getAvailableList�� "0 jabberjustlogin jabberJustLogIn�� 0 aimjustlogin aimJustLogin�� $0 bonjourjustlogin bonjourJustLogIn�� 0 getdelaytime getDelayTime�� &0 decreasedelaytime decreaseDelayTime�� 0 zip2list zip2List�� 0 zip3list zip3List�� 0 	sorttuple 	sortTuple�� 0 
splittuple 
splitTuple�� 0 isjustlogin isJustLogIn�I �H �G �F �E �D �C �B �A �@ �?  ��1�� 1  ���������� �� �� ��   ��2�� 2  34563 ��7�� 7  8������������������������������8 ��9�� 9  :��: �;; 6 J a b b e r : p i t i 1 1 8 @ 2 e n t w i n e . n e t
�� pstaaval��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  4 ��<�� <  =>?@ABC= ��D�� D  E��E �FF   A I M : A J P e t r u s k a 0 5
�� pstaaway> ��G�� G  H��H �II  A I M : a n g i e n a d i a
�� pstaaval? ��J�� J  K��K �LL  A I M : C h n 2 3 6
�� pstaaval@ ��M�� M  N��N �OO $ A I M : c h u c c h i n c h i l l a
�� pstaavalA ��P�� P  Q��Q �RR  A I M : p i t i 1 1 8
�� pstaavalB ��S�� S  T��T �UU  A I M : p i t i 1 1 8 2
�� pstaavalC ��V�� V  W��W �XX  A I M : s a m n a x
�� pstaaval5 ��Y�� Y  Z������������������������������Z ��[�� [  \��\ �]] , B o n j o u r : p o n g m o n g @ M - o n e
�� pstaaval��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  6 ��^�� $^ $ _`abcdefghijklmnopqrstuvwxyz{|}~���_ ����� �  ���� ��� T J a b b e r : a e k 1 1 8 % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaaval` ����� �  ���� ��� \ J a b b e r : a e r o _ o m e g a % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawaya ����� �  ���� ��� R J a b b e r : a k k a r i t % g m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalb ����� �  ���� ��� X J a b b e r : a n n _ o n g m % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalc ����� �  ���� ��� V J a b b e r : a n n e p i m % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayd ����� �  ���� ��� d J a b b e r : c e l e s t e p h o e n i x % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavale ����� �  ���� ��� \ J a b b e r : c h a n a t i p _ k % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayf ����� �  ���� ��� \ J a b b e r : c h m a g i c i a n % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayg ����� �  ���� ��� V J a b b e r : e n q u i n x % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalh ����� �  ���� ��� P J a b b e r : g a p v o y % g m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavali ����� �  ���� ��� \ J a b b e r : g o l f _ t h i t i % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalj ����� �  ���� ��� T J a b b e r : j p e e r a % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayk ����� �  ���� ��� X J a b b e r : k a k u r u _ k % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayl ����� �  ���� ��� X J a b b e r : k h u n g u r n % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalm ����� �  ���� ��� Z J a b b e r : m a g g i e _ d p % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayn ����� �  ���� ��� Z J a b b e r : n a _ o _ c h a n % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayo ����� �  ���� ��� X J a b b e r : n a c h o m _ y % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayp ����� �  ���� ��� X J a b b e r : n a w a _ y u i % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayq ����� �  ���� ��� X J a b b e r : n o p c y b e r % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayr ����� �  ���� ��� ` J a b b e r : n o t e _ n u m b e r 1 % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaaways ����� �  ���� ��� X J a b b e r : o a t s o n i x % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayt ����� �  ���� ��� R J a b b e r : p a w i d % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalu ����� �  ���� ��� V J a b b e r : p h a k a w a % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayv ����� �  ���� ��� Z J a b b e r : p i t i 1 1 8 _ 2 % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaavalw ����� �  ���� ��� V J a b b e r : p i y a w u t % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayx ����� �  ���� ��� R J a b b e r : q w e z t % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�� pstaawayy ����� �  ��� ��� \ J a b b e r : s e n d t o t a p e % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
� pstaawayz �~��~ �  ��}� ��� V J a b b e r : s u n s e r n % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�} pstaaway{ �|��| �  ��{� ��� \ J a b b e r : s u p a r a t _ c h % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�{ pstaaway| �z��z �  ��y� ��� \ J a b b e r : s u p o r n _ o n g % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�y pstaaval} �x��x �  ��w� ��� ^ J a b b e r : t a n a t o r n 1 1 8 % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�w pstaaval~ �v��v �  ��u� ��� T J a b b e r : t h i t i t % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�u pstaaway �t��t �  ��s� ��� Z J a b b e r : t o n g j a i _ c % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�s pstaaval� �r��r �  ��q� ��� V J a b b e r : t u a n g 2 5 % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�q pstaaway� �p��p �  ��o� ��� V J a b b e r : w i n _ c m u % h o t m a i l . c o m @ m s n . 2 e n t w i n e . n e t
�o pstaaway� �n��n �  ��m� ��� V J a b b e r : y u r a n a n _ h % y a h o o . c o m @ m s n . 2 e n t w i n e . n e t
�m pstaaway �l��l �  �k�j�i�h
�k boovtrue
�j boovtrue
�i boovtrue
�h boovfals
�> boovfals	  
   
 �g��g �   � � � � �f��f �   � � � � �e��e �   � � �  Bonjour online status     Bonjour away status     Bonjour idle status     Bonjouroffline status    �d��d �   �c��c �   � � � � � � � � � � � ���  3 . 0�=  �<  �b�a�`���_
�b .aevtoappnull  �   � ****�a  �`  �  � �^d�]=�\�[�Z�Y�X�W�V�^  0 isichatrunning isIChatRunning
�] 
vers�\  0 getpantherlist getPantherList�[ $0 bonjourjustlogin bonjourJustLogIn�Z "0 jabberjustlogin jabberJustLogIn�Y 0 aimjustlogin aimJustLogin�X 0 gettigerlist getTigerList�W  �V  �_ � z)j+   g� _*�,Ec  ,Ob  ,b  - *�Ec  O)j+ Ec  O)j+ O)j+ O)j+ Y )j+ Ec  O)j+ O)j+ O)j+ UY hOb  W X 	 
b   �Um�T�S���R
�U .miscidlenmbr    ��� null�T  �S  �  � �Q�P�O�N�M�L�Q &0 registerwithgrowl registerWithGrowl�P 0 	dopanther 	doPanther�O 0 dotiger doTiger�N  �M  �L �R k Mb   )j+  b  .  b   Y hY hOb  ,b  - 
)j+ Y )j+ Ob   W X  jvjvjvjv�vEc  Ob    �K��J�I���H�K &0 registerwithgrowl registerWithGrowl�J  �I  � �G�F�G 0 defaultnotifs defaultNotifs�F 
0 notifs  � �E�Dd�C������B �A�@�?�>�=�<A�E  0 isgrowlrunning isGrowlRunning�D  0 isichatrunning isIChatRunning
�C 
vers�B 
�A 
appl
�@ 
anot
�? 
dnot
�> 
iapp�= 
�< .registernull��� ��� null�H)j+  )j+  � *�,Ec  ,UY b  .Ob  ,b  - ��Ec  Ob  �%Ec  $Ob  �%Ec  %Ob  �%Ec  &Ob  �%Ec  'Ob  $b  %b  &b  '�vEc  (Ob  b  (%Ec  )O� !b  )E�O�E�O*�b  �����a  UOeEc  Ob  /Y 7� #b  )E�O�E�O*�b  ����a a  UOeEc  Ob  /Y b  . �;O�:�9���8�; 0 	dopanther 	doPanther�:  �9  � �7�7 0 thislist thisList� �6�5�4�3�2�1�0�6 $0 getavailablelist getAvailableList�5 0 	sorttuple 	sortTuple
�4 
cobj�3 �2 0 
mainnotify 
mainNotify�1  �0  �8 k b))b  k+  k+ E�O)�b  �b  /b  b  �+ O))b  k+  k+ E�O)�b  �b  /b  b  �+ W 	X  h �/��.�-���,�/ 0 dotiger doTiger�.  �-  � �+�*�+ 0 thislist thisList�* 0 templist tempList� �)�(�'�&�%�$�#�"�) $0 getavailablelist getAvailableList�( 0 	sorttuple 	sortTuple
�' 
cobj�& �% 0 
mainnotify 
mainNotify�$ 60 gettwojabberavailablelist getTwoJabberAvailableList�#  �"  �, � �))b  k+  k+ E�O)�b  �b  /b  b  �+ O))b  k+  k+ E�O)�b  �b  /b  b  �+ O)j+ E�O)��k/k+ E�O)�b  �b  /b  b  �+ O)��l/k+ E�O)�b  �b  	/b  	b  �+ OPW 	X  h �!� � ��! 0 
mainnotify 
mainNotify�  ��   ����� 0 newlist newList� 0 oldlist oldList� 0 serviceindex serviceIndex� 0 servicename serviceName�    ������ 0 newlist newList� 0 oldlist oldList� 0 serviceindex serviceIndex� 0 servicename serviceName� $0 accountjustlogin accountJustLogin 
����������
�  0 isichatrunning isIChatRunning� 0 isjustlogin isJustLogIn� 0 getdelaytime getDelayTime� &0 decreasedelaytime decreaseDelayTime
� 
cobj� � 0 doaimnotify doAimNotify� &0 dotransportnotify doTransportNotify�  �
  � � y)j+   c)��l+ E�O)�k+ j )�k+ O�b  �/FOhY )� hY !�b  	 )�����+ Y )�����+ O�b  �/FY jvb  �/FW X  	jvb  �/FOh �	�����	 0 doaimnotify doAimNotify� ��   ����� 0 newlist newList� 0 oldlist oldList� 0 serviceindex serviceIndex� 0 servicename serviceName�   � �������������������������������  0 newlist newList�� 0 oldlist oldList�� 0 serviceindex serviceIndex�� 0 servicename serviceName�� 0 newindex newIndex�� 0 oldindex oldIndex�� 0 newlen newLen�� 0 oldlen oldLen�� 0 newitem newItem�� 0 olditem oldItem�� 0 newname newName�� 0 oldname oldName�� 0 	newstatus 	newStatus�� 0 	oldstatus  �� 0 i  �� 0 thisitem thisItem ����������d��
�� 
leng
�� 
bool
�� 
cobj�� �� 
0 notify  
�� pstaoffl��kE�OkE�O��,E�O��,E�O�j  �Y hO�j  �Y hO �h��	 ���&��/E�O��/E�O��b  /E�O��b  /E�O��  :��b  /E�O��b  /E�O�� *�����+ Y hO�kE�O�kE�Y Y�� -�Z��b  /E�O��  hY *�����+ O�kE�OPY (�Z��b  /E�O��  hY *�棢�+ O�kE�[OY�8O�� P�� F�Z >��kh ��/E�O��b  /E�O��b  /E�O��  hY *�棢�+ [OY��Y hY W�� P�� F�Z >��kh ��/E�O��b  /E�O��b  /E�O��  hY *�����+ [OY��Y hY h ��
�������� &0 dotransportnotify doTransportNotify�� ����   ���������� 0 newlist newList�� 0 oldlist oldList�� 0 serviceindex serviceIndex�� 0 servicename serviceName��   ���������������������������������� 0 newlist newList�� 0 oldlist oldList�� 0 serviceindex serviceIndex�� 0 servicename serviceName�� 0 newindex newIndex�� 0 oldindex oldIndex�� 0 newlen newLen�� 0 oldlen oldLen�� 0 newitem newItem�� 0 olditem oldItem�� 0 newname newName�� 0 oldname oldName�� 0 	newstatus 	newStatus�� 0 	oldstatus  �� 0 i  �� 0 thisitem thisItem �����������d����T�
�� 
leng
�� 
bool
�� 
cobj�� �� "0 notifytransport notifyTransport
�� pstaoffl���kE�OkE�O��,E�O��,E�O�j  �Y hO�j  �Y hO �h��	 ���&��/E�O��/E�O��b  /E�O��b  /E�O��  ;��b  /E�O��b  /E�O�� *��㣢�+ Y hO�kE�O�kE�Y [�� .�Z��b  /E�O��  hY *��裢�+ O�kE�OPY )�Z��b  /E�O��  hY *��飢�+ O�kE�[OY�5O�� Q�� G�Z ?��kh ��/E�O��b  /E�O��b  /E�O��  hY *��꣢�+ [OY��Y hY X�� Q�� G�Z ?��kh ��/E�O��b  /E�O��b  /E�O��  hY *��룢�+ [OY��Y hY h �������	
���� 
0 notify  �� ����   ���������� 0 thisid thisId�� 0 
thisstatus 
thisStatus�� 0 servicename serviceName�� 0 serviceindex serviceIndex��  	 	�������������������� 0 thisid thisId�� 0 
thisstatus 
thisStatus�� 0 servicename serviceName�� 0 serviceindex serviceIndex�� 0 thename theName�� 0 	thestatus 	theStatus�� &0 thisstatusmessage thisStatusMessage�� $0 notificationname notificationName�� 0 
displaypic 
displayPic
 ����d����������������� ����������������������  0 isgrowlrunning isGrowlRunning��  0 isichatrunning isIChatRunning
�� 
icsv
�� 
pres
�� 
pnam  
�� 
ID  �� "0 stringforstatus stringForStatus
�� 
smsg�� *0 getnotificationname getNotificationName
�� 
imaA
�� 
name
�� 
titl
�� 
appl
�� 
desc
�� 
imag�� 

�� .notifygrnull��� ��� null��  ��  �� ��5,)j+   )j+ �*�/�k/�,�[�,\Z�81E�O)�k+ E�O*�/�k/�,�[�,\Z�81E�O�� �b  %�%E�Y hO)��l+ E�O G)j+  :*�/�k/�[�,\Z�81�,E�O� *��a b  a �a �a  UY hW qX   ;)j+  .*�/�,E�O� *��a b  a �a �a  UY hW 0X   !� *��a b  a �a  UW 	X  hUY hY hW 	X  h ��P�������� "0 notifytransport notifyTransport�� ����   ������������ 0 thisid thisId�� 0 
thisstatus 
thisStatus�� &0 thisstatusmessage thisStatusMessage�� 0 servicename serviceName�� 0 serviceindex serviceIndex��   	�������������������� 0 thisid thisId�� 0 
thisstatus 
thisStatus�� &0 thisstatusmessage thisStatusMessage�� 0 servicename serviceName�� 0 serviceindex serviceIndex�� 0 thename theName�� 0 	thestatus 	theStatus�� $0 notificationname notificationName�� 0 
displaypic 
displayPic ����d���������������� ���������������������  0 isgrowlrunning isGrowlRunning��  0 isichatrunning isIChatRunning
�� pstaoffl
�� 
icsv
�� 
pres
�� 
smsg
�� 
ID  �� "0 stringforstatus stringForStatus�� *0 getnotificationname getNotificationName
�� 
imaA
�� 
name
�� 
titl
�� 
appl
�� 
desc
�� 
imag�� 

�� .notifygrnull��� ��� null��  ��  � ��)j+   �)j+  �� ��  hY hO*�/�k/�,�[�,\Z�81E�O)�k+ 	E�O)��l+ 
E�O E)j+  8*�/�k/�[�,\Z�81�,E�O� *����b  a �a �a  UY hW mX   9)j+  ,*�/�,E�O� *����b  a �a �a  UY hW .X   � *����b  a �a  UW 	X  hUY hY hW 	X  h �~��}�|�{�~ *0 getnotificationname getNotificationName�} �z�z   �y�x�y 0 serviceindex serviceIndex�x 0 	thestatus 	theStatus�|   �w�v�w 0 serviceindex serviceIndex�v 0 	thestatus 	theStatus �ud�t�s�r�q@d����u  0 isichatrunning isIChatRunning
�t pstaaway
�s pstaoffl
�r pstaaval
�q pstaidle�{>*j+  5�Z�b    C��  b  Y 1��  b  Y "��  b  Y ��  b  Y �Y �b    C��  b  Y 1��  b  Y "��  b  Y ��  b  Y �Y ��b    C��  b  %Y 1��  b  'Y "��  b  $Y ��  b  &Y �Y O�b  	  C��  b   Y 1��  b  "Y "��  b  Y ��  b  !Y �Y �Y � �p��o�n�m�p "0 stringforstatus stringForStatus�o �l�l   �k�k 0 s  �n   �j�j 0 s   �id�h��g��f��e����d�c��i  0 isichatrunning isIChatRunning
�h pstaaway
�g pstaoffl
�f pstaaval
�e pstaidle�d  �c  �m K B*j+   5�Z��  �Y %��  �Y ��  �Y ��  �Y �Y �W 	X  �  �b��a�`�_�b  0 isichatrunning isIChatRunning�a  �`     ��^��]�\�[
�^ 
prcs
�] .coredoexbool       obj �\  �[  �_  � *��/j UW 	X  f! �Z��Y�X�W�Z  0 isgrowlrunning isGrowlRunning�Y  �X     ��V��U�T�S
�V 
prcs
�U .coredoexbool       obj �T  �S  �W  � *��/j UW 	X  f" �R��Q�P�O�R &0 isjabbertransport isJabberTransport�Q �N�N   �M
�M 
ID  �P   �L
�L 
ID   ��O ��# �K��J�I�H�K 0 gettigerlist getTigerList�J  �I   �G�F�E�G 0 
tempjabber 
tempJabber�F 0 
jabberlist 
jabberList�E *0 jabbertransportlist jabberTransportList �D�C�B�A�@�D 60 gettwojabberavailablelist getTwoJabberAvailableList
�C 
cobj�B 0 	sorttuple 	sortTuple�A $0 getavailablelist getAvailableList�@ �H D)j+  E�O��k/E�O��l/E�O)�k+ ))b  k+ k+ ))b  k+ k+ )�k+ �v$ �?	0�>�= �<�?  0 getpantherlist getPantherList�>  �=      �;�:�9�; $0 getavailablelist getAvailableList�: 0 	sorttuple 	sortTuple�9 �< &jv))b  k+  k+ ))b  k+  k+ jv�v% �8	e�7�6!"�5�8 60 gettwojabberavailablelist getTwoJabberAvailableList�7  �6  ! �4�3�2�1�0�/�.�4 0 
jabberlist 
jabberList�3 *0 jabbertransportlist jabberTransportList�2 $0 jabberstatuslist jabberStatusList�1 60 jabbertransportstatuslist jabberTransportStatusList�0 0 	theidlist 	theIdList�/ 0 i  �. 0 thisid thisId" �-d�,�+�*�)�(	��'�&�%�$	��#	�
/
b
��"�!� �-  0 isichatrunning isIChatRunning
�, 
icsv
�+ 
pres
�* 
stat
�) pstaaval
�( 
pnam
�' 
ID  
�& 
leng
�% 
cobj
�$ pstaaway
�# pstaidle�" 0 zip2list zip2List�!  �   �5��jvE�OjvE�OjvE�OjvE�O)j+  ���*�b  /�-�[[�,\Z�8\[�,\Z�@A1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O*�b  /�-�[[�,\Z�8\[�,\Z�@A1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O*�b  /�-�[[�,\Z�8\[�,\Z�@A1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O*�b  /�-�[[�,\Z�8\[�,\Za @CA1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O*�b  /�-�[[�,\Z�8\[�,\Za @CA1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O*�b  /�-�[[�,\Z�8\[�,\Za @CA1�,E�O !k��,Ekh ��/E�O�6GO��6G[OY��O)��l+ )��l+ lvUY 	jvjvlvW X  jvjvlv& �
���#$�� $0 getavailablelist getAvailableList� �%� %  �� 0 servicename serviceName�  # �������� 0 servicename serviceName� 0 servicelist serviceList� 0 
statuslist 
statusList�  0 servicelistava serviceListAva� 0 i  � "0 servicelistaway serviceListAway�  0 servicelistidl serviceListIdl$ �d��������
�	���  0 isichatrunning isIChatRunning
� 
icsv
� 
pres
� 
stat
� pstaaval
� 
ID  
� 
leng
� pstaaway
�
 pstaidle�	 0 zip2list zip2List�  �  � � �jvE�OjvE�O)j+   �� �*�/�-�[�,\Z�81�,E�O k��,Ekh �6G[OY��O*�/�-�[�,\Z�81�,E�O k��,Ekh �6G[OY��O*�/�-�[�,\Z�81�,E�O k��,Ekh �6G[OY��O)��%�%�l+ UY jvW 
X  jv' �U��&'�� "0 jabberjustlogin jabberJustLogIn�  �  &  ' �� 0 isjustlogin isJustLogIn� )b  b  l+  ( �`� ��()��� 0 aimjustlogin aimJustLogin�   ��  (  ) ���� 0 isjustlogin isJustLogIn�� )b  b  l+  ) ��k����*+���� $0 bonjourjustlogin bonjourJustLogIn��  ��  *  + ���� 0 isjustlogin isJustLogIn�� )b  b  l+  * ��y����,-���� 0 getdelaytime getDelayTime�� ��.�� .  ���� 0 serviceindex serviceIndex��  , ���� 0 serviceindex serviceIndex- ��
�� 
cobj�� b  �/E+ �������/0���� &0 decreasedelaytime decreaseDelayTime�� ��1�� 1  ���� 0 serviceindex serviceIndex��  / ���� 0 serviceindex serviceIndex0 ��
�� 
cobj�� 4b  �/b   b  �/FOb  �/j jb  �/FY h, �������23���� 0 zip2list zip2List�� ��4�� 4  ������ 	0 list1  �� 	0 list2  ��  2 ���������� 	0 list1  �� 	0 list2  �� 0 	theresult 	theResult�� 0 i  3 ��������
�� 
leng
�� 
cobj��  ��  �� 5jvE�O ' k��,Ekh ��/��/lv�6G[OY��O�W 	X  �- �������56���� 0 zip3list zip3List�� ��7�� 7  �������� 	0 list1  �� 	0 list2  �� 	0 list3  ��  5 ������������ 	0 list1  �� 	0 list2  �� 	0 list3  �� 0 	theresult 	theResult�� 0 i  6 ��������
�� 
leng
�� 
cobj��  ��  �� 9jvE�O + "k��,Ekh ��/��/��/mv�6G[OY��O�W 	X  �. ������89���� 0 	sorttuple 	sortTuple�� ��:�� :  ���� 0 l  ��  8 ������ 0 l  �� 0 splitted  9 ����������
�� 
leng
�� 
rest
�� 
cobj�� 0 
splittuple 
splitTuple�� 0 	sorttuple 	sortTuple�� :��,k �Y .)��,��k/l+ E�O)��k/k+ ��k/kv%)��l/k+ %OP/ ��P����;<���� 0 
splittuple 
splitTuple�� ��=�� =  ������ 0 l  �� 0 p  ��  ; �������������� 0 l  �� 0 p  �� 0 lesslist lessList�� 0 	greatlist 	greatList�� 0 i  �� 0 thisitem thisItem< ����
�� 
leng
�� 
cobj�� AjvE�OjvE�O /k��,Ekh ��/E�O��k/��k/ 	��6GY ��6G[OY��O��lv0 �������>?���� 0 isjustlogin isJustLogIn�� ��@�� @  ������ 0 servicename serviceName�� 0 serviceindex serviceIndex��  > �������� 0 servicename serviceName�� 0 serviceindex serviceIndex�� 0 currentstatus currentStatus? ��d��������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
stat
�� 
cobj
�� sstaconn��  ��  �� � �)j+   |� t�Z*�/�,E�Ob  �/E +��  hY fb  �/FOb  b  �/FOfY 4��  !eb  �/FOb  b  �/FOeY fb  �/FOfUY fb  �/FOfW X  fb  �/FOf ascr  ��ޭ